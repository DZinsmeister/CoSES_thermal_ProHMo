// CP: 65001
// SimulationX Version: 4.2.3.69223
within CoSES_Models.HeatGenerator.GeneralModels.Controller;
model HPControl "Heat pump controller"
	input Modelica.Blocks.Interfaces.RealInput TFlow(
		quantity="Thermics.Temp",
		displayUnit="°C") "Flow temperature" annotation(
		Placement(
			transformation(extent={{585,-495},{625,-455}}),
			iconTransformation(extent={{216.7,30},{176.7,70}})),
		Dialog(
			group="Temperature",
			tab="Results 1",
			visible=false));
	GreenCity.Interfaces.Environment.EnvironmentConditions environmentConditions if ASHP "Environment Conditions Connector" annotation(Placement(
		transformation(extent={{-110,40},{-90,60}}),
		iconTransformation(extent={{-210,90},{-190,110}})));
	input Modelica.Blocks.Interfaces.RealInput TReturn(
		quantity="Thermics.Temp",
		displayUnit="°C") "Return temperature" annotation(
		Placement(
			transformation(extent={{585,-550},{625,-510}}),
			iconTransformation(extent={{216.7,-20},{176.7,20}})),
		Dialog(
			group="Temperature",
			tab="Results 1",
			visible=false));
	Modelica.Blocks.Interfaces.RealInput TFlowSource(quantity="Basics.Temp") if not ASHP "Source flow temperature" annotation(
		Placement(
			transformation(
				origin={300,0},
				extent={{-20,-20},{20,20}},
				rotation=180),
			iconTransformation(
				origin={-200,50},
				extent={{20,-20},{-20,20}},
				rotation=-180)),
		Dialog(
			group="Temperature",
			tab="Results 1",
			visible=false));
	Modelica.Blocks.Interfaces.RealInput TReturnSource(quantity="Basics.Temp") if not ASHP "Source return temperature" annotation(
		Placement(
			transformation(extent={{-120,-20},{-80,20}}),
			iconTransformation(extent={{-220,-20},{-180,20}})),
		Dialog(
			group="Temperature",
			tab="Results 1",
			visible=false));
	output Modelica.Blocks.Interfaces.RealOutput qvRef(
		quantity="Thermics.VolumeFlow",
		displayUnit="m³/h") "target volume flow" annotation(
		Placement(
			transformation(extent={{825,-380},{845,-360}}),
			iconTransformation(
				origin={150,-196.7},
				extent={{-10,-10},{10,10}},
				rotation=-90)),
		Dialog(
			group="Volume Flow",
			tab="Results 1",
			visible=false));
	output Modelica.Blocks.Interfaces.RealOutput qvSourceRef(
		quantity="Thermics.VolumeFlow",
		displayUnit="m³/h") "Reference volume flow of source pump" annotation(
		Placement(
			transformation(extent={{825,-355},{845,-335}}),
			iconTransformation(
				origin={100,-196.7},
				extent={{-10,-10},{10,10}},
				rotation=-90)),
		Dialog(
			group="Volume Flow",
			tab="Results 1",
			visible=false));
	protected
		discrete Real tCPStart(quantity="Basics.Time") "Starting time of circulation pump" annotation(Dialog(
			group="Volume Flow",
			tab="Results 1"));
	public
		Real TFlowSet(quantity="Basics.Temp") "Variable" annotation(Dialog(
			group="Volume Flow",
			tab="Results 1",
			visible=false));
		Real TReturnSourceSet(quantity="Basics.Temp") "Variable" annotation(Dialog(
			group="Volume Flow",
			tab="Results 1",
			visible=false));
		input Modelica.Blocks.Interfaces.RealInput ModulationAUXIn(quantity="Basics.RelMagnitude") if ModulationAUXOn "Input signal for relative modulation of auxiliary heater" annotation(
			Placement(
				transformation(extent={{585,-440},{625,-400}}),
				iconTransformation(
					origin={50,200},
					extent={{-20,-20},{20,20}},
					rotation=-90)),
			Dialog(
				group="Modulation",
				tab="Results 1",
				visible=false));
		Modelica.Blocks.Interfaces.RealOutput AuxModulation(quantity="Basics.RelMagnitude") if ModulationAUXOn "Reference relative modulation of auxiliary heater" annotation(
			Placement(
				transformation(extent={{-110,40},{-90,60}}),
				iconTransformation(extent={{186.7,-160},{206.7,-140}})),
			Dialog(
				group="Modulation",
				tab="Results 1",
				visible=false));
		input Modelica.Blocks.Interfaces.RealInput ModulationHPIn(quantity="Basics.RelMagnitude") if ModulationHPOn "Input signal for relative modulation of heat pump" annotation(
			Placement(
				transformation(extent={{585,-390},{625,-350}}),
				iconTransformation(
					origin={0,200},
					extent={{-20,-20},{20,20}},
					rotation=-90)),
			Dialog(
				group="Modulation",
				tab="Results 1",
				visible=false));
		output Modelica.Blocks.Interfaces.RealOutput HPModulation(
			quantity="Basics.RelMagnitude",
			displayUnit="%") if ModulationHPOn "Reference relative modulation of heat pump" annotation(
			Placement(
				transformation(extent={{815,-375},{835,-355}}),
				iconTransformation(
					origin={50,-197},
					extent={{-10,-9.699999999999999},{10,10.3}},
					rotation=-90)),
			Dialog(
				group="Modulation",
				tab="Results 1",
				visible=false));
	protected
		Real ModulationAUX(quantity="Basics.RelMagnitude") "ModulationAUX" annotation(
			HideResult=false,
			Dialog(
				group="Modulation",
				tab="Results 1"));
		Real ModulationHP(quantity="Basics.RelMagnitude") "ModulationHP" annotation(
			HideResult=false,
			Dialog(
				group="Modulation",
				tab="Results 1"));
		discrete Real timeHPStart(
			quantity="Basics.Time",
			displayUnit="s") "Starting time of HP" annotation(Dialog(
			group="Modulation",
			tab="Results 1"));
		discrete Real timeHPEnd(
			quantity="Basics.Time",
			displayUnit="s") "Time when HP switched off" annotation(
			HideResult=false,
			Dialog(
				group="Modulation",
				tab="Results 1"));
		Real tIceStart(quantity="Basics.Time") "Time when deicing started" annotation(
			HideResult=false,
			Dialog(
				group="Modulation",
				tab="Results 1"));
	public
		Modelica.Blocks.Interfaces.BooleanInput HPIn if not ModulationHPOn "External signal for HP input" annotation(
			Placement(
				transformation(extent={{-120,30},{-80,70}}),
				iconTransformation(
					origin={-100,200},
					extent={{-20,-20},{20,20}},
					rotation=-90)),
			Dialog(
				group="I/O",
				tab="Results 1",
				visible=false));
		Modelica.Blocks.Interfaces.BooleanInput AUXIn(quantity="Basics.RelMagnitude") if AuxHeat and not ModulationAUXOn "External signal for auxiliary heater" annotation(
			Placement(
				transformation(
					origin={300,50},
					extent={{-20,-20},{20,20}},
					rotation=180),
				iconTransformation(
					origin={-50,200},
					extent={{-20,-20},{20,20}},
					rotation=270)),
			Dialog(
				group="I/O",
				tab="Results 1",
				visible=false));
		input Modelica.Blocks.Interfaces.BooleanInput EVU(
			fixed=true,
			start=true) "External control input" annotation(
			Placement(
				transformation(extent={{585,-345},{625,-305}}),
				iconTransformation(
					origin={-150,200},
					extent={{-20,-20},{20,20}},
					rotation=-90)),
			Dialog(
				group="I/O",
				tab="Results 1",
				visible=false));
		output Modelica.Blocks.Interfaces.BooleanOutput HPon "Switch-on/off of heat pump" annotation(
			Placement(
				transformation(extent={{825,-430},{845,-410}}),
				iconTransformation(
					origin={-50,-197},
					extent={{-10,-9.699999999999999},{10,10.3}},
					rotation=-90)),
			Dialog(
				group="I/O",
				tab="Results 1",
				visible=false));
		output Modelica.Blocks.Interfaces.BooleanOutput CPon "Switch-on/off of circulation pump" annotation(
			Placement(
				transformation(extent={{825,-465},{845,-445}}),
				iconTransformation(
					origin={-150,-197},
					extent={{-10,-9.699999999999999},{10,10.3}},
					rotation=-90)),
			Dialog(
				group="I/O",
				tab="Results 1",
				visible=false));
		output Modelica.Blocks.Interfaces.BooleanOutput AUXon if AuxHeat "Auxiliary heat switch on/off" annotation(
			Placement(
				transformation(extent={{825,-500},{845,-480}}),
				iconTransformation(
					origin={0,-197},
					extent={{-10,-9.699999999999999},{10,10.3}},
					rotation=-90)),
			Dialog(
				group="I/O",
				tab="Results 1",
				visible=false));
		output Modelica.Blocks.Interfaces.BooleanOutput SPon "Source pump switch on/off" annotation(
			Placement(
				transformation(extent={{825,-535},{845,-515}}),
				iconTransformation(
					origin={-100,-197},
					extent={{-10,-9.699999999999999},{10,10.3}},
					rotation=-90)),
			Dialog(
				group="I/O",
				tab="Results 1",
				visible=false));
		Modelica.Blocks.Interfaces.BooleanOutput DEICINGon if ASHP "Switch on/off de-icing" annotation(
			Placement(
				transformation(
					origin={300,50},
					extent={{-10,-10},{10,10}},
					rotation=180),
				iconTransformation(
					origin={-200,-150},
					extent={{-10,-10},{10,10}},
					rotation=180)),
			Dialog(
				group="I/O",
				tab="Results 1",
				visible=false));
	protected
		Boolean HP "HP state on/off" annotation(Dialog(
			group="I/O",
			tab="Results 1"));
		Boolean AUX(fixed=false) "AUX state on/off" annotation(Dialog(
			group="I/O",
			tab="Results 1"));
		Boolean CP "CP state on/off" annotation(Dialog(
			group="I/O",
			tab="Results 1"));
		Boolean SP "SP state on/off" annotation(Dialog(
			group="I/O",
			tab="Results 1"));
		Boolean DEICING if ASHP "DeIcing state on/off" annotation(
			HideResult=false,
			Dialog(
				group="I/O",
				tab="Results 1"));
	public
		parameter Boolean AuxHeat=false "If true, auxiliary heat power supply, else none" annotation(Dialog(tab="Controller Configuration"));
		parameter Boolean ASHP=false "If true, heat pump is air source heat pumpe" annotation(Dialog(tab="Controller Configuration"));
		parameter Boolean ModulationHPOn=false "Heat pump power output can be modulated" annotation(Dialog(
			group="Systen Configuration",
			tab="Controller Configuration"));
		parameter Real ModHPMin(
			quantity="Basics.RelMagnitude",
			displayUnit="%")=0.5 if ModulationHPOn "Minimum degree of power modulation of heat pump" annotation(Dialog(
			group="Systen Configuration",
			tab="Controller Configuration"));
		parameter Boolean ModulationAUXOn=true if AuxHeat "Heat pump power output can be modulated" annotation(Dialog(
			group="Systen Configuration",
			tab="Controller Configuration"));
		parameter Real tDelayHP(
			quantity="Basics.Time",
			displayUnit="s")=15 "Delay time between circultion pump and HP starting" annotation(Dialog(
			group="Heat Pump",
			tab="Timing Control"));
		parameter Real tHPminOff(
			quantity="Basics.Time",
			displayUnit="s")=30 "Minimum turn-off time of HP" annotation(Dialog(
			group="Heat Pump",
			tab="Timing Control"));
		parameter Real tHPminOn(
			quantity="Basics.Time",
			displayUnit="s")=24 "Minimum turn-on time of HP" annotation(Dialog(
			group="Heat Pump",
			tab="Timing Control"));
		parameter Real tDelayCP(
			quantity="Basics.Time",
			displayUnit="s")=600 "Delay time between shutdown of device and circulation pump" annotation(Dialog(
			group="Circulation Pump",
			tab="Timing Control"));
		parameter Real tDelaySP(
			quantity="Basics.Time",
			displayUnit="s")=60 "Delay time between source pump and Unit starting" annotation(Dialog(
			group="Source Pump",
			tab="Timing Control"));
		parameter Real tDelaySPHP(
			quantity="Basics.Time",
			displayUnit="s")=60 "Delay time between shutdown of heat pump and source pump" annotation(Dialog(
			group="Source Pump",
			tab="Timing Control"));
		parameter Real DeltaT(quantity="Thermics.TempDiff")=5 "Temperature difference between flow and return of heat circuit" annotation(Dialog(tab="Flow Control Heat Circuit"));
		parameter Real TFlowMax(
			quantity="Thermics.Temp",
			displayUnit="°C")=336.15 "Maximum flow temperature" annotation(Dialog(
			group="Boundary Temperatures Circulation Pump",
			tab="Flow Control Heat Circuit"));
		parameter Real TReturnMax(
			quantity="Thermics.Temp",
			displayUnit="°C")=333.15 "Maximum return temperature" annotation(Dialog(
			group="Boundary Temperatures Circulation Pump",
			tab="Flow Control Heat Circuit"));
		parameter Real deltaTFlowRefMax(
			quantity="Thermics.TempDiff",
			displayUnit="K")=1 "Temperature difference (TFlow-TFlowRef) when qvRef=qvMax" annotation(Dialog(
			group="Boundary Temperatures Circulation Pump",
			tab="Flow Control Heat Circuit"));
		parameter Real deltaTFlowRefMin(
			quantity="Thermics.TempDiff",
			displayUnit="K")=-0.5 "Temperature difference (TFlow-TFlowRef) when qvRef=qvMin" annotation(Dialog(
			group="Boundary Temperatures Circulation Pump",
			tab="Flow Control Heat Circuit"));
		parameter Real qvMax(
			quantity="Thermics.VolumeFlow",
			displayUnit="l/min")=0.0006383333333333333 "Maximum volume flow of circulation pump" annotation(Dialog(
			group="Volume Flow Boundaries Circulation Pump",
			tab="Flow Control Heat Circuit"));
		parameter Real qvMin(
			quantity="Thermics.VolumeFlow",
			displayUnit="l/min")=0.0003666666666666667 "Minimum volume flow of circulation pump" annotation(Dialog(
			group="Volume Flow Boundaries Circulation Pump",
			tab="Flow Control Heat Circuit"));
		parameter Real TDeIcing(
			quantity="Thermics.Temp",
			displayUnit="°C")=275.15 if ASHP "Temperature below which deicing will start" annotation(Dialog(tab="De-Icing"));
		parameter Real TDeIcingMin(quantity="Basics.Temp")=263.15 if ASHP "Temperature below which the HP activation will start with deicing" annotation(Dialog(tab="De-Icing"));
		parameter Real tDeIcing(
			quantity="Basics.Time",
			displayUnit="s")=270 if ASHP "Duration of de-icing process" annotation(Dialog(
			group="Timing Control",
			tab="De-Icing"));
		parameter Real tOperationIce(
			quantity="Basics.Time",
			displayUnit="s")=5400 if ASHP "Statistically operation time between two de-icing processes" annotation(Dialog(
			group="Timing Control",
			tab="De-Icing"));
		parameter Real qvSourceASHP(
			quantity="Thermics.VolumeFlow",
			displayUnit="m³/h")=0.9722222222222222 if ASHP "Constant velocity of source pump" annotation(Dialog(tab="Flow Control Source Circuit"));
		parameter Real DeltaTSource(quantity="Thermics.TempDiff")=5 if not ASHP "Temperature difference between flow and return of source circuit" annotation(Dialog(tab="Flow Control Source Circuit"));
		parameter Real TReturnSourceMin(quantity="Basics.Temp")=268.15 if not ASHP "Minimum source return temperature" annotation(Dialog(
			group="Boundary Temperatures Source Pump",
			tab="Flow Control Source Circuit"));
		parameter Real TReturnSourceMax(quantity="Basics.Temp")=293.15 if not ASHP "Maximum source return temperature" annotation(Dialog(
			group="Boundary Temperatures Source Pump",
			tab="Flow Control Source Circuit"));
		parameter Real deltaTReturnSourceRefMax(
			quantity="Thermics.TempDiff",
			displayUnit="K")=-0.5 if not ASHP "Temperature difference (TReturnSource-TReturnSourceRef) when qvSourceRef=qvSourceMax" annotation(Dialog(
			group="Boundary Temperatures Source Pump",
			tab="Flow Control Source Circuit"));
		parameter Real deltaTReturnSourceRefMin(
			quantity="Thermics.TempDiff",
			displayUnit="K")=1 if not ASHP "Temperature difference (TReturnSource-TReturnSourceRef) when qvSourceRef=qvSourceMin" annotation(Dialog(
			group="Boundary Temperatures Source Pump",
			tab="Flow Control Source Circuit"));
		parameter Real qvSourceMax(
			quantity="Thermics.VolumeFlow",
			displayUnit="l/min")=0.0007350000000000001 if not ASHP "Constant velocity of source pump" annotation(Dialog(
			group="Volume Flow Boundaries Source Pump",
			tab="Flow Control Source Circuit"));
		parameter Real qvSourceMin(
			quantity="Thermics.VolumeFlow",
			displayUnit="l/min")=0.0004433333333333334 if not ASHP "Minimum volume flow of circulation pump" annotation(Dialog(
			group="Volume Flow Boundaries Source Pump",
			tab="Flow Control Source Circuit"));
	protected
		model DeIcing "De-icing controller"
			function Count_DEICING
				input Integer Count;
				input Integer Counter;
				output Integer CountMore;
				algorithm
					CountMore:=Count+Counter;
			end Count_DEICING;
			protected
				Real tHeatStart;
				Boolean IceOn;
				Real tIceStart;
				Real tIceEnd;
				Integer CountIceOn;
			public
				Boolean DEICING "Dontrol signal de-icing";
				Boolean HEAT "Control signal heating";
				parameter Real tDeIcing(
					quantity="Basics.Time",
					displayUnit="s")=270 "Duration of de-icing process" annotation(Dialog(
					group="control time periods",
					tab="DE-ICING"));
				parameter Real tOperateIce(
					quantity="Basics.Time",
					displayUnit="s")=5400 "Duration between two de-icing processes" annotation(Dialog(
					group="control time periods",
					tab="DE-ICING"));
				parameter Real tOn(
					quantity="Basics.Time",
					displayUnit="s")=60 "Switch-on time of de-icing process" annotation(Dialog(
					group="control time periods",
					tab="DE-ICING"));
				parameter Real tOff(
					quantity="Basics.Time",
					displayUnit="s")=60 "Switch-off time of de-icing process" annotation(Dialog(
					group="control time periods",
					tab="DE-ICING"));
			initial equation
				CountIceOn = 0;
				tHeatStart = time.start;
				tIceStart = time.start;
				tIceEnd = time.start;
				IceOn = false;
			equation
								when not pre(HEAT) then
									CountIceOn=0;
								elsewhen not pre(IceOn) then
									if time>time.start then
										CountIceOn=Count_DEICING(pre(CountIceOn),1);
									else
										CountIceOn=Count_DEICING(pre(CountIceOn),0);
									end if;
								end when;
						
								when not pre(HEAT) then
									reinit(tHeatStart,time);
								end when;
								if not HEAT then
									der(tHeatStart)=der(time);
								else
									der(tHeatStart)=0;
								end if;
				
								when not pre(IceOn) then
									reinit(tIceStart,time);
								end when;
								if not IceOn then
									der(tIceStart)=der(time);
								else
									der(tIceStart)=0;
								end if;
				
								when pre(IceOn) then
									reinit(tIceEnd,time);
								end when;
								if IceOn then
									der(tIceEnd)=der(time);
								else
									der(tIceEnd)=0;
								end if;
						
								when (((time-tHeatStart) > (tOperateIce/2)) and pre(HEAT) and (not (pre(CountIceOn) > 0))) then
									IceOn=true;
								elsewhen (((time-tIceEnd) > tOperateIce) and pre(HEAT) and (pre(CountIceOn) > 0)) then
									IceOn=true;
								elsewhen ((time-tIceStart) > (tOn+tDeIcing+tOff)) then
									IceOn=false;
								elsewhen (not pre(HEAT)) then
									IceOn=false;
								end when;
							
								DEICING = IceOn;
			annotation(Icon(coordinateSystem(extent={{-100,50},{100,-50}})));
		end DeIcing;
		model CirculationPump "Circulation pump control"
			Boolean HEAT "Heat signal";
			Boolean DEICING(
				start=false,
				fixed=true) "De-icing signal";
			Boolean CP "Switch-on/off of circulation pump";
			Boolean COMP(
				start=false,
				fixed=true) "Switch-on/off of device";
			Real TAmbient "Ambient temperature";
			protected
				Real tEndComp;
				Real tStartIce;
				Boolean CPon;
			public
				parameter Real tCPComp(
					quantity="Basics.Time",
					displayUnit="s")=600 "Follow-up time of circulation pump after Heating Unit operation" annotation(Dialog(
					group="switching and operation time period",
					tab="HEATING"));
				parameter Real tCPIce(
					quantity="Basics.Time",
					displayUnit="s")=100 "Follow-up time of circulation pump while di-icing" annotation(Dialog(
					group="switching and operation time period",
					tab="DE-ICING"));
				parameter Real TBoundIce(
					quantity="Basics.Unitless",
					displayUnit="-")=280.15 "Boundary temperature for active/passive de-icing" annotation(Dialog(
					group="boundary temperature for active/passive de-icing",
					tab="DE-ICING"));
			initial equation
				tEndComp=time.start;
				tStartIce=time.start;
				CPon=HEAT;
			equation
						when pre(COMP) or pre(HEAT) then
							reinit(tEndComp,time);
						end when;
						if COMP or HEAT then
							der(tEndComp)=der(time);
						else
							der(tEndComp)=0;
						end if;
				
						when not pre(DEICING) and (TAmbient >= TBoundIce) then
							reinit(tStartIce,time);
						end when;
						if not DEICING and (TAmbient >= TBoundIce) then
							der(tStartIce)=der(time);
						else
							der(tStartIce)=0;
						end if;
						
						when not pre(HEAT) and (time-tEndComp)>tCPComp then
							CPon=false;
						elsewhen pre(DEICING) and TAmbient>=TBoundIce and (time-tStartIce)>tCPIce then
							CPon=false;
						elsewhen not pre(CPon) and not pre(DEICING) and pre(HEAT) then
							CPon=true;
						end when;
						
						CP=CPon;
			annotation(Icon(coordinateSystem(extent={{-100,50},{100,-50}})));
		end CirculationPump;
		model SourcePump "Source pump control"
			protected
				Real tEndComp;
				Real tStartIce;
				Boolean SPon;
			public
				parameter Real tSP(
					quantity="Basics.Time",
					displayUnit="s")=60 "Follow-up time of source pump after Heating Unit operation" annotation(Dialog(
					group="switching and operation time period",
					tab="HEATING"));
				parameter Real TBoundIce=280.15 "Boundary temperature for active/passive de-icing" annotation(Dialog(
					group="boundary temperature for active/passive de-icing",
					tab="DE-ICING"));
				Boolean HEAT "Heat signal";
				Boolean DEICING(
					start=false,
					fixed=true) "De-icing signal";
				Boolean SP "Switch on/off of source pump";
				Real TAmbient "Ambient temperature";
				Boolean COMP(
					start=false,
					fixed=true) "Heating Unit on/off";
			initial equation
				tEndComp=time.start;
				tStartIce=time.start;
				SPon=HEAT;
			equation
						when pre(COMP) or pre(HEAT) then
							reinit(tEndComp,time);	
						end when;
						if COMP or HEAT then
							der(tEndComp)=der(time);
						else
							der(tEndComp)=0;
						end if;
				
						when not pre(DEICING) and (TAmbient < TBoundIce) then
							reinit(tStartIce,time);
						end when;			
						if not DEICING and (TAmbient < TBoundIce) then
							der(tStartIce)=der(time);
						else
							der(tStartIce)=0;
						end if;				
						
						when pre(HEAT) and not pre(DEICING) then
							SPon=true;
						elsewhen not pre(HEAT) and (time-tEndComp)>tSP then
							SPon=false;
						elsewhen pre(DEICING) and TAmbient<TBoundIce and (time-tStartIce)>tSP then
							SPon=false;
						elsewhen not pre(SPon) and not pre(DEICING) and pre(HEAT) then
							SPon=true;
						end when;
								
						SP=SPon;
			annotation(Icon(coordinateSystem(extent={{-100,50},{100,-50}})));
		end SourcePump;
		model HeatAndPowerUnit "Heat and Power Unit control"
			Boolean HEAT "Heat signal";
			Boolean DEICING(
				start=false,
				fixed=true) "De-icing signal";
			Boolean COMP "Switch-on/off of Heat and Power Unit";
			Boolean SP(
				start=false,
				fixed=true) "Switch-on/off of source pump";
			Boolean CP(
				start=false,
				fixed=true) "Switch-on/off of circulation pump";
			Real TAmbient "Ambient temperature";
			protected
				Real tStartComp;
				Real tEndComp;
				Real tStartCP;
				Real tStartSP;
				Real tStartHeat;
				Boolean COMPon;
			public
				parameter Real tMinOff(
					quantity="Basics.Time",
					displayUnit="s")=24 "Minimum turn-off time" annotation(Dialog(
					group="switching and operation time period",
					tab="HEATING"));
				parameter Real tMinOn(
					quantity="Basics.Time",
					displayUnit="s")=30 "Minimum turn-on time" annotation(Dialog(
					group="switching and operation time period",
					tab="HEATING"));
				parameter Real tCompCP(
					quantity="Basics.Time",
					displayUnit="s")=15 "Delay time compared to circultion pump" annotation(Dialog(
					group="switching and operation time period",
					tab="HEATING"));
				parameter Real tCompSP(
					quantity="Basics.Time",
					displayUnit="s")=60 "Delay time compared to source pump" annotation(Dialog(
					group="switching and operation time period",
					tab="HEATING"));
				parameter Real TBoundIce=280.15 "Boundary temperature for active/passive de-icing" annotation(Dialog(
					group="boundary temperature for active/passive de-icing",
					tab="DE-ICING"));
			initial equation
				if HEAT then
					tStartHeat = time.start-max(tCompCP,tCompSP)-1;				
					tStartCP = time.start-tCompCP-1;
					tStartSP = time.start-tCompSP-1;
					tStartComp = time.start-tMinOn-1;
					tEndComp = time.start;					
				else
					tStartHeat = time.start;				
					tStartCP = time.start;
					tStartSP = time.start;
					tStartComp = time.start;
					tEndComp = time.start-tMinOff-1;					
				end if;
				COMPon = HEAT;
			equation
				when not pre(HEAT) then
					reinit(tStartHeat,time);
				end when;
				if not HEAT then
					der(tStartHeat)=der(time);
				else
					der(tStartHeat)=0;
				end if;
				
				when not pre(CP) then
					reinit(tStartCP,time);
				end when;
				if not CP then
					der(tStartCP)=der(time);
				else
					der(tStartCP)=0;
				end if;
						
				when not pre(SP) then
					reinit(tStartSP,time);
				end when;
				if not SP then
					der(tStartSP)=der(time);
				else
					der(tStartSP)=0;
				end if;
				
				when not pre(COMPon) then	
					reinit(tStartComp,time);
				end when;
				if not COMPon then
					der(tStartComp)=der(time);
				else
					der(tStartComp)=0;
				end if;
				
				when pre(COMPon) then
					reinit(tEndComp,time);
				end when;
				if COMPon then
					der(tEndComp)=der(time);
				else
					der(tEndComp)=0;
				end if;
						when (time-tStartCP)>tCompCP and (time-tStartSP)>tCompSP and pre(HEAT) and (time-tEndComp)>tMinOff and not pre(DEICING) then
							COMPon=true;
						elsewhen (time-tStartComp)>tMinOn and not pre(HEAT) then
							COMPon=false;
						elsewhen pre(DEICING) and TAmbient>=TBoundIce then
							COMPon=false;
						elsewhen not pre(DEICING) then
							COMPon=true;
						end when;
						
						COMP=COMPon;
			annotation(Icon(coordinateSystem(extent={{-100,50},{100,-50}})));
		end HeatAndPowerUnit;
	initial equation
		assert(deltaTFlowRefMax>deltaTFlowRefMin,"qvRef not computable");
		
		if ModulationHPOn then
			HP = (EVU and (ModulationHPIn > 0));
		else
			HP = (EVU and HPIn);
		end if;
		
		if AuxHeat then
			if ModulationAUXOn then
				AUX = (EVU and (ModulationAUXIn > 0));
			else
				AUX = (EVU and AUXIn);
			end if;
		else
			AUX = false;
		end if;
		
		SP = HP;
		CP = HP or AUX;
		
		if HP then
			timeHPStart=time.start-tHPminOn-1;
			timeHPEnd=time.start-tHPminOff-1;
		else
			timeHPStart=time.start;
			timeHPEnd=time.start;
		end if;
		tCPStart = time.start;
		//DeIcing
		tIceStart = time.start;
		DEICING = false;
	equation
		// Input Signals
		if ModulationHPOn then
			ModulationHP = ModulationHPIn;
		elseif HPIn then
			ModulationHP = 1;
		else
			ModulationHP = 0;
		end if;
		
		if AuxHeat then
			if ModulationAUXOn then
				ModulationAUX = ModulationAUXIn;
			elseif AUXIn then
				ModulationAUX = 1;
			else
				ModulationAUX = 0;
			end if;
		else
			ModulationAUX = 0;
		end if;
		
		// CP
		when (((ModulationHP > 0) or (ModulationAUX > 0)) and ((time-timeHPEnd)>tHPminOff) and (TFlow<TFlowMax) and (TReturn<TReturnMax) and EVU) then
			CP = true;
		elsewhen (not (pre(HP)) and ((time - timeHPEnd)>tDelayHP) and not pre(AUX)) then
			CP = false;
		end when;
		
		when pre(CP) then
			tCPStart = time;
		end when;
		
		// HP
		when pre(HP) then
			timeHPStart=time;
		end when;
		
		when not (pre(HP) and pre(AUX)) then
			timeHPEnd = time;
		end when;
		
		if ASHP then
			when (pre(CP) and ((time-timeHPEnd)>tHPminOff) and ((time-tCPStart)>tDelayHP) and (ModulationHP > 0) and (TFlow<TFlowMax) and (TReturn<TReturnMax) and EVU) then
				HP=true;
			elsewhen ((TFlow>TFlowMax) or (TReturn>TReturnMax)) then
				HP=false;
			elsewhen ((not (ModulationHP > 0)) and ((time-timeHPStart) > tHPminOn)) then
				HP=false;
			elsewhen not EVU then
				HP = false;
			end when;
		else 
			when (pre(CP) and ((time-timeHPEnd)>tHPminOff) and ((time-tCPStart)>tDelayHP) and (ModulationHP > 0) and (TFlow<TFlowMax) and (TReturn<TReturnMax) and (TReturnSource<TReturnSourceMax) and (TReturnSource>TReturnSourceMin) and EVU) then
				HP=true;
			elsewhen ((TFlow>TFlowMax) or (TReturn>TReturnMax) or (TReturnSource>TReturnSourceMax) or (TReturnSource<TReturnSourceMin)) then
				HP=false;
			elsewhen ((not (ModulationHP > 0)) and ((time-timeHPStart) > tHPminOn)) then
				HP=false;
			elsewhen not EVU then
				HP = false;
			end when;
		end if;
		
		if HP then
			HPModulation = min(ModulationHP, ModHPMin);
		else
			HPModulation = 0;
		end if;
		
		// DeIcing
		if ASHP then
			when pre(DEICING) then
				tIceStart = time;
			end when;
		
			when (((time - timeHPStart) > tOperationIce) and (environmentConditions.TAmbient < TDeIcing) and ((time - tIceStart) < tDeIcing)) then 
				DEICING = true;
			elsewhen ((environmentConditions.TAmbient < TDeIcingMin) and ((time - tIceStart) < tDeIcing)) then
				DEICING = true;
			elsewhen ((time - tIceStart) > tDeIcing) then
				DEICING = false;
			end when;
			DEICINGon = DEICING;
		else
			DEICING = false;
		end if;
		
		// AUX
		when (pre(CP) and ((time-timeHPEnd)>tHPminOff) and ((time-tCPStart)>tDelayHP) and (ModulationAUX > 0) and (TFlow<TFlowMax) and (TReturn<TReturnMax) and EVU) then
			AUX=true;
		elsewhen ((TFlow>TFlowMax) or (TReturn>TReturnMax)) then
			AUX=false;
		elsewhen (not (ModulationAUX > 0)) then
			AUX=false;
		elsewhen not EVU then
			AUX = false;
		end when;
		
		if AUX then
			AuxModulation = ModulationAUX;
		else
			AuxModulation = 0;
		end if;
		
		// SP
		when (pre(CP) and ((time-tCPStart)>(tDelayHP-tDelaySP) and (ModulationHP > 0))) then
			SP = true;
		elsewhen ((not pre(HP)) and (time - timeHPEnd)>tDelaySPHP) then
			SP = false;
		end when;
		
		// flow control
		TFlowSet = min(TReturn + DeltaT, TFlowMax);
		
		if CP then
			if (HP or AUX) then
				qvRef=max(min((qvMin+(qvMax-qvMin)*(((TFlow-(TFlowSet+deltaTFlowRefMin))/(deltaTFlowRefMax-deltaTFlowRefMin)))),qvMax),qvMin);
			else
				qvRef = qvMin;
			end if;
		else
			qvRef = 0;
		end if;
		
		if ASHP then
			qvSourceRef = qvSourceASHP;
		else
			TReturnSourceSet = TFlowSource - DeltaTSource;
			if SP then
				if HP then
					qvSourceRef=max(min((qvSourceMin+(qvSourceMax-qvSourceMin)*(((TReturnSource-(TReturnSourceSet+deltaTReturnSourceRefMin))/(deltaTReturnSourceRefMax-deltaTReturnSourceRefMin)))),qvSourceMax),qvSourceMin);
				else
					qvSourceRef = qvSourceMin;
				end if;
			else
				qvSourceRef = 0;
			end if;
		end if;
		
		//
		
		HPon=HP;
		CPon=CP;
		SPon=SP;
		if AuxHeat then
			AUXon=AUX;
		end if;
	annotation(
		Icon(
			coordinateSystem(extent={{-200,-200},{200,200}}),
			graphics={
																																																																											Bitmap(
																																																																												imageSource="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
8/Ly8v4HCmRNtd/v47EAAAAASUVORK5CYII=",
																																																																												extent={{-200,-200},{200,200}})}),
		experiment(
			StopTime=1,
			StartTime=0,
			Tolerance=1e-06,
			Interval=0.002,
			__esi_Solver(
				bEffJac=false,
				bSparseMat=false,
				bSplitCodeGen=false,
				typename="CVODE"),
			__esi_MaxInterval="0.002",
			__esi_AbsTolerance="1e-6"));
end HPControl;
