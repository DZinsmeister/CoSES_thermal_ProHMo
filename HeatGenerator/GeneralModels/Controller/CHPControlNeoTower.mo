// CP: 65001
// SimulationX Version: 4.2.3.69223
within CoSES_Models.HeatGenerator.GeneralModels.Controller;
model CHPControlNeoTower "Internal controller of neoTower CHP"
	import GreenCity.GreenBuilding.CombinedHeatAndPowerUnit.Control.*;
	import GreenCity.GreenBuilding.CombinedHeatAndPowerUnit.*;
	import GreenCity.GreenBuilding.*;
	import GreenCity.*;
	input Modelica.Blocks.Interfaces.BooleanInput EVU(
		fixed=true,
		start=true) "External on/off signal" annotation(
		Placement(
			transformation(extent={{585,-345},{625,-305}}),
			iconTransformation(
				origin={0,200},
				extent={{-20,-20},{20,20}},
				rotation=-90)),
		Dialog(
			group="Input Signals",
			tab="Results 1",
			visible=false));
	input Modelica.Blocks.Interfaces.RealInput Modulation(quantity="Basics.RelMagnitude") if Mode "Power modulation of system" annotation(
		Placement(
			transformation(extent={{585,-240},{625,-200}}),
			iconTransformation(
				origin={-50,200},
				extent={{-20,-20},{20,20}},
				rotation=-90)),
		Dialog(
			group="Input Signals",
			tab="Results 1",
			visible=false));
	Modelica.Blocks.Interfaces.BooleanInput ElecVehicleCharge if not Mode "Activates electric vehicle charge mode for 2 hours" annotation(
		Placement(
			transformation(extent={{-120,30},{-80,70}}),
			iconTransformation(
				origin={50,200},
				extent={{-20,-20},{20,20}},
				rotation=-90)),
		Dialog(
			group="Input Signals",
			tab="Results 1",
			visible=false));
	output Modelica.Blocks.Interfaces.BooleanOutput CHPon "Switch-on/off of CHP" annotation(
		Placement(
			transformation(extent={{825,-430},{845,-410}}),
			iconTransformation(extent={{-190,-160},{-210,-140}})),
		Dialog(
			group="Output Signals",
			tab="Results 1",
			visible=false));
	output Modelica.Blocks.Interfaces.BooleanOutput CPon "Switch-on/off of circulation pump" annotation(
		Placement(
			transformation(extent={{825,-465},{845,-445}}),
			iconTransformation(extent={{-190,-110},{-210,-90}})),
		Dialog(
			group="Output Signals",
			tab="Results 1",
			visible=false));
	output Modelica.Blocks.Interfaces.RealOutput qvRef(
		quantity="Thermics.VolumeFlow",
		displayUnit="m³/h") "Reference volume flow" annotation(
		Placement(
			transformation(extent={{825,-380},{845,-360}}),
			iconTransformation(
				origin={100,-196.7},
				extent={{-10,-10},{10,10}},
				rotation=-90)),
		Dialog(
			group="Output Signals",
			tab="Results 1",
			visible=false));
	output Modelica.Blocks.Interfaces.RealOutput ModOut(quantity="Basics.RelMagnitude") "Reference power modulation" annotation(
		Placement(
			transformation(extent={{825,-335},{845,-315}}),
			iconTransformation(
				origin={-50,-196.7},
				extent={{-10,-10},{10,10}},
				rotation=-90)),
		Dialog(
			group="Output Signals",
			tab="Results 1",
			visible=false));
	protected
		Boolean CHP "CHP state on/off" annotation(Dialog(
			group="Output Signals",
			tab="Results 1"));
		Boolean CP "CP state on/off" annotation(Dialog(
			group="Output Signals",
			tab="Results 1"));
	public
		Real SOC(quantity="Basics.RelMagnitude") if not Mode "Storage state of charge" annotation(Dialog(
			group="Temperature",
			tab="Results 1",
			visible=false));
		input Modelica.Blocks.Interfaces.RealInput TSto1(
			quantity="Thermics.Temp",
			displayUnit="°C") if not Mode "Storage temperature at hight 1/4" annotation(
			Placement(
				transformation(extent={{585,-390},{625,-350}}),
				iconTransformation(extent={{216.7,-20},{176.7,20}})),
			Dialog(
				group="Temperature",
				tab="Results 1",
				visible=false));
		input Modelica.Blocks.Interfaces.RealInput TSto2(
			quantity="Thermics.Temp",
			displayUnit="°C") if not Mode "Storage temperature at hight 2/4" annotation(
			Placement(
				transformation(extent={{585,-440},{625,-400}}),
				iconTransformation(extent={{216.7,30},{176.7,70}})),
			Dialog(
				group="Temperature",
				tab="Results 1",
				visible=false));
		Modelica.Blocks.Interfaces.RealInput TSto3(quantity="Basics.Temp") if not Mode "Storage temperature at hight 3/4" annotation(
			Placement(
				transformation(extent={{-120,30},{-80,70}}),
				iconTransformation(extent={{216.7,80},{176.7,120}})),
			Dialog(
				group="Temperature",
				tab="Results 1",
				visible=false));
		Modelica.Blocks.Interfaces.RealInput TSto4(quantity="Basics.Temp") if not Mode "Storage temperature at hight 4/4" annotation(
			Placement(
				transformation(
					origin={300,50},
					extent={{-20,-20},{20,20}},
					rotation=180),
				iconTransformation(
					origin={200,150},
					extent={{-20,-20},{20,20}},
					rotation=180)),
			Dialog(
				group="Temperature",
				tab="Results 1",
				visible=false));
		input Modelica.Blocks.Interfaces.RealInput TFlow(
			quantity="Thermics.Temp",
			displayUnit="°C") "Flow temperature" annotation(
			Placement(
				transformation(extent={{585,-495},{625,-455}}),
				iconTransformation(extent={{216.7,-120},{176.7,-80}})),
			Dialog(
				group="Temperature",
				tab="Results 1",
				visible=false));
		input Modelica.Blocks.Interfaces.RealInput TReturn(
			quantity="Thermics.Temp",
			displayUnit="°C") "Return temperature" annotation(
			Placement(
				transformation(extent={{585,-550},{625,-510}}),
				iconTransformation(extent={{216.7,-170},{176.7,-130}})),
			Dialog(
				group="Temperature",
				tab="Results 1",
				visible=false));
		Real TFlowSet(quantity="Basics.Temp") "Set flow temperature" annotation(Dialog(
			group="Temperature",
			tab="Results 1",
			visible=false));
		Real tDelayCPon(quantity="Basics.Time") "Delay time between CHP and circulation pump shutdown" annotation(Dialog(
			group="Timing",
			tab="Results 1",
			visible=false));
	protected
		discrete Real tCHPStart(
			quantity="Basics.Time",
			displayUnit="s") "Starting time of CHP" annotation(Dialog(
			group="Timing",
			tab="Results 1"));
		discrete Real tCHPEnd(
			quantity="Basics.Time",
			displayUnit="s") "Shutdown time of CHP" annotation(Dialog(
			group="Timing",
			tab="Results 1"));
	public
		parameter Boolean Mode=true "If true, electric led control, else heat led control" annotation(Dialog(tab="Controller Configuration"));
		parameter Real TFlowGen(quantity="Basics.Temp")=353.15 "General flow temperature" annotation(Dialog(
			group="CHP temperatures",
			tab="Controller Configuration"));
		parameter Real DeltaTMin(quantity="Thermics.TempDiff")=20 "Minimum temperature difference between flow and return" annotation(Dialog(
			group="CHP temperatures",
			tab="Controller Configuration"));
		parameter Real TFlowMax(
			quantity="Thermics.Temp",
			displayUnit="°C")=363.15 "Maximum flow temperature" annotation(Dialog(
			group="CHP temperatures",
			tab="Controller Configuration"));
		parameter Real TReturnMax(
			quantity="Thermics.Temp",
			displayUnit="°C")=343.15 "Maximum return temperature" annotation(Dialog(
			group="CHP temperatures",
			tab="Controller Configuration"));
		parameter Real ModMax(quantity="Basics.RelMagnitude")=1 if Mode "Maximum modulation of CHP" annotation(Dialog(
			group="Modulation",
			tab="Controller Configuration"));
		parameter Real ModMin(quantity="Basics.RelMagnitude")=0.55 if Mode "Minimum modulation of CHP" annotation(Dialog(
			group="Modulation",
			tab="Controller Configuration"));
		parameter Real TStoMax(quantity="Basics.Temp")=363.15 if not Mode "Maximum storage temperature" annotation(Dialog(
			group="Storage",
			tab="Controller Configuration"));
		parameter Real SOCmin(quantity="Basics.RelMagnitude")=0.3 if not Mode "Minimum State of Charge, if SOC<SOCmin, CHP starts" annotation(Dialog(
			group="Storage",
			tab="Controller Configuration"));
		parameter Real TStoCharge(quantity="Basics.Temp")=333.15 if not Mode "If TSto4 > TStoCharge: CHP won't switch on" annotation(Dialog(
			group="Storage",
			tab="Controller Configuration"));
		parameter Real tCHPminOn(
			quantity="Basics.Time",
			displayUnit="s")=0 "Minimum turn-on time of CHP" annotation(Dialog(
			group="Timing control - CHP",
			tab="Timing"));
		parameter Real tCHPminOff(
			quantity="Basics.Time",
			displayUnit="s")=0 "Minimum turn-off time of CHP" annotation(Dialog(
			group="Timing control - CHP",
			tab="Timing"));
		parameter Real tCHPCoolDown(quantity="Basics.Time")=14400 "Time, the CHP takes to cool down completely" annotation(Dialog(
			group="Timing control - Circulation Pump",
			tab="Timing"));
		parameter Real tDelayCPonCold(
			quantity="Basics.Time",
			displayUnit="s")=180 "Delay time between circultion pump and CHP starting when the CHP is cold" annotation(Dialog(
			group="Timing control - Circulation Pump",
			tab="Timing"));
		parameter Real tDelayCPonWarm(quantity="Basics.Time")=15 "Delay time between circultion pump and CHP starting when the CHP is warm" annotation(Dialog(
			group="Timing control - Circulation Pump",
			tab="Timing"));
		parameter Real tDelayCPoff(
			quantity="Basics.Time",
			displayUnit="s")=600 "Delay time between CHP and circulation pump shutdown" annotation(Dialog(
			group="Timing control - Circulation Pump",
			tab="Timing"));
		parameter Real tElec(quantity="Basics.Time")=7200 if not Mode "Maximum turn on time for electric vehicle charging" annotation(Dialog(
			group="Timing control - EVehicle",
			tab="Timing"));
		parameter Real deltaTFlowRefMax(
			quantity="Thermics.TempDiff",
			displayUnit="K")=3 "Temperature difference (TFlow-TFlowRef) when qv_ret=qvMax" annotation(Dialog(
			group="Boundary Temperatures for Volume Flow Control",
			tab="Flow control"));
		parameter Real deltaTFlowRefMin(
			quantity="Thermics.TempDiff",
			displayUnit="K")=-10 "Temperature difference (TFlow-TFlowRef) when qv_ret=qvMin" annotation(Dialog(
			group="Boundary Temperatures for Volume Flow Control",
			tab="Flow control"));
		parameter Real qvMax(
			quantity="Thermics.VolumeFlow",
			displayUnit="m³/h")=0.0001166666666666667 "Maximum volume flow of circulation pump" annotation(Dialog(
			group="Volume Flow Boundaries",
			tab="Flow control"));
		parameter Real qvMin(
			quantity="Thermics.VolumeFlow",
			displayUnit="m³/h")=1.666666666666667e-05 "Minimum volume flow of circulation pump" annotation(Dialog(
			group="Volume Flow Boundaries",
			tab="Flow control"));
	protected
		__iti_Alias AmbientConditions=EnvironmentConditions;
	initial equation
		assert(deltaTFlowRefMax>deltaTFlowRefMin,"qvRef not computable");
		
		if Mode then
			CHP = (EVU and (Modulation > ModMin));
			CP  = CHP;
		else
			CHP = (EVU and (TSto4 < TStoCharge));
			CP = CHP;
		end if;
		
		if CHP then
			tCHPStart=time.start-tCHPminOn-1;
			tCHPEnd=time.start-tCHPminOff-1;
		else
			tCHPStart=time.start;
			tCHPEnd=time.start;
		end if;
	equation
		// enter your equations here
		
		when pre(CHP) then
			tCHPStart=time;
		end when;
		
		when not pre(CHP) then
			tCHPEnd=time;
		end when;
		
		if Mode then
			when (((time-tCHPEnd)>tCHPminOff) and (Modulation > 0)) and (TFlow<TFlowMax) and (TReturn<TReturnMax) and EVU then
				CHP=true;
			elsewhen ((TFlow>TFlowMax) or (TReturn>TReturnMax)) then
				CHP=false;
			elsewhen ((not (Modulation > 0)) and ((time-tCHPStart) > tCHPminOn)) then
				CHP=false;
			elsewhen not EVU then
				CHP = false;
			end when;
		else
			SOC = (TSto1 + TSto2 + TSto3 + TSto4) / (4 * TStoMax);
			when (((time-tCHPEnd)>tCHPminOff) and (((SOC < SOCmin) and (TSto4 < TStoCharge) and EVU) or ElecVehicleCharge) and (TFlow<TFlowMax) and (TReturn<TReturnMax)) then
				CHP=true;
			elsewhen ((TFlow>TFlowMax) or (TReturn>TReturnMax)) then
				CHP=false;
			elsewhen (SOC > 1) then
				CHP=false;
			elsewhen not EVU then
				CHP = false;
			elsewhen not ElecVehicleCharge then
				CHP = false;
			end when;
		end if;
		
		if (time-tCHPEnd) > tCHPCoolDown then
			tDelayCPon = tDelayCPonCold;
		else
			tDelayCPon = tDelayCPonWarm;
		end if;
		
		when (((time-tCHPStart)>tDelayCPon) and CHP) then
			CP = true;
		elsewhen (not pre(CHP) and ((time-tCHPEnd)>tDelayCPoff)) then
			CP = false;
		end when;	
		
		TFlowSet = max(TFlowGen, (TReturn + DeltaTMin));
		
		if CP then
			if CHP then	
				qvRef=max(min((qvMin+(qvMax-qvMin)*(((TFlow-(TFlowSet+deltaTFlowRefMin))/(deltaTFlowRefMax-deltaTFlowRefMin)))),qvMax),qvMin);
			else
				qvRef=qvMin;
			end if;
		else
			qvRef=0;
		end if;
			
		if Mode then
			if CHP then
				ModOut = max(ModMin, min(Modulation, ModMax));
			else
				ModOut = 0;
			end if;
		else
			if CHP then
				ModOut = 1;
			else
				ModOut = 0;
			end if;
		end if;	
		
		CHPon=CHP;
		CPon=CP;
	annotation(
		Icon(
			coordinateSystem(extent={{-200,-200},{200,200}}),
			graphics={
																																																																												Bitmap(
																																																																													imageSource="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
gG4fAAAAAElFTkSuQmCC",
																																																																													__esi_transparentColor={255,0,255},
																																																																													extent={{-197,200},{200,-200}}),
																																																																												Text(
																																																																													textString="DZ",
																																																																													fontSize=14,
																																																																													textStyle={
																																																																														TextStyle.Bold},
																																																																													lineColor={0,128,255},
																																																																													extent={{26,-33},{289.3,-303}})}),
		experiment(
			StopTime=1,
			StartTime=0,
			Interval=0.002,
			__esi_MaxInterval="0.002"));
end CHPControlNeoTower;
