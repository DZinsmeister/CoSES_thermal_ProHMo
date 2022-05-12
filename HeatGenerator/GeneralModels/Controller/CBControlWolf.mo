// CP: 65001
// SimulationX Version: 4.2.3.69223
within CoSES_Models.HeatGenerator.GeneralModels.Controller;
model CBControlWolf "Internal controller of Wolf condensing boiler"
	protected
		model AverageTemperature "Calculation of average ambient temperature"
			GreenCity.Interfaces.Environment.EnvironmentConditions EnvironmentConditions "External Ambient Conditions Connector";
			function arrayChange
				input Real array[:];
				input Real newValue;
				input Integer sizeArray;
				output Real arrayNew[sizeArray];
				protected
					Real saveArray[sizeArray];
				algorithm
					for i in 1:(sizeArray-1) loop
						saveArray[i]:=array[i+1];
					end for;
					saveArray[sizeArray]:=newValue;
					arrayNew:=saveArray;
			end arrayChange;
			function arrayAverage
				input Real array[:];
				input Integer sizeArray;
				output Real average;
				protected
					Real save;
				algorithm
					save:=0;
					for i in 1:sizeArray loop
						save:=save+array[i];
					end for;
					average:=save/sizeArray;
			end arrayAverage;
			protected
				discrete Real ArrayTemperature[SupportPoints];
				discrete Real TimeStep;
			public
				Real TAverage "Average temperature for time period";
				parameter Integer SupportPoints=168 "Number of support points for averaging" annotation(Dialog(
					group="parameter",
					tab="temperature averaging"));
				parameter Integer StepTime(quantity="Basics.Time")=3600 "Time step between each data point" annotation(Dialog(
					group="parameter",
					tab="temperature averaging"));
			initial equation
				TimeStep = time.start;
				for i in 1:SupportPoints loop
					ArrayTemperature[i]=EnvironmentConditions.TAmbientAverageAct;
				end for;
				TAverage=arrayAverage(ArrayTemperature,SupportPoints);
			equation
				when (time-TimeStep > StepTime) then
					TimeStep=time;
					ArrayTemperature=arrayChange(ArrayTemperature,EnvironmentConditions.TAmbient,SupportPoints);
					TAverage=arrayAverage(ArrayTemperature,SupportPoints);
				end when;
			annotation(Icon(coordinateSystem(extent={{-100,50},{100,-50}})));
		end AverageTemperature;
	public
		Modelica.Blocks.Tables.CombiTable1D FlowTemperatureSet(table={{0,0},
				{2,0},
				{10,100}}) "Table look-up in one dimension (matrix/file) with n inputs and n outputs" annotation(Placement(transformation(extent={{55,-35},{75,-15}})));
		Modelica.Blocks.Tables.CombiTable1D PowerSet(table={{0,0},
				{2,0},
				{3,30},
				{9,98},
				{10,100}}) annotation(Placement(transformation(extent={{55,-65},{75,-45}})));
		Modelica.Blocks.Tables.CombiTable1D TableDeltaTFactor(table={{303.15,0.93},
				{313.15,0.87},
				{323.15,0.8},
				{333.15,0.73},
				{343.15,0.7}}) annotation(Placement(transformation(extent={{55,-215},{75,-195}})));
		Real factor "factor" annotation(Dialog(
			group="Temperature",
			tab="Results 1",
			visible=false));
		input Modelica.Blocks.Interfaces.RealInput TFlow(
			quantity="Thermics.Temp",
			displayUnit="°C") "Flow temperature" annotation(
			Placement(
				transformation(extent={{-40,-170},{0,-130}}),
				iconTransformation(extent={{216.7,-70},{176.7,-30}})),
			Dialog(
				group="Temperature",
				tab="Results 1",
				visible=false));
		input Modelica.Blocks.Interfaces.RealInput TReturn(
			quantity="Thermics.Temp",
			displayUnit="°C") "Return temperature" annotation(
			Placement(
				transformation(extent={{-40,-225},{0,-185}}),
				iconTransformation(extent={{216.7,-170},{176.7,-130}})),
			Dialog(
				group="Temperature",
				tab="Results 1",
				visible=false));
		Real TFlowSet(quantity="Basics.Temp") "Set flow temperature" annotation(Dialog(
			group="Temperature",
			tab="Results 1",
			visible=false));
	protected
		Real TFlowControl(
			quantity="Thermics.Temp",
			displayUnit="°C") "Control temperature for flow" annotation(Dialog(
			group="Temperature",
			tab="Results 1"));
	public
		output Modelica.Blocks.Interfaces.RealOutput QRefRelative(
			quantity="Basics.RelMagnitude",
			displayUnit="%") "Relative reference power output" annotation(
			Placement(
				transformation(extent={{200,-10},{220,10}}),
				iconTransformation(
					origin={-100,-196.7},
					extent={{-10,-10},{10,10}},
					rotation=-90)),
			Dialog(
				group="Heating Power",
				tab="Results 1",
				visible=false));
	protected
		Real QRef(quantity="Basics.RelMagnitude") "Set reference power output" annotation(Dialog(
			group="Heating Power",
			tab="Results 1"));
	public
		output Modelica.Blocks.Interfaces.RealOutput qvRef(
			quantity="Thermics.VolumeFlow",
			displayUnit="m³/h") "Reference volume flow" annotation(
			Placement(
				transformation(extent={{200,-55},{220,-35}}),
				iconTransformation(
					origin={50,-196.7},
					extent={{-10,-10},{10,10}},
					rotation=-90)),
			Dialog(
				group="Volume Flow",
				tab="Results 1",
				visible=false));
		Modelica.Blocks.Interfaces.RealInput ControlIn "0-10V Input, power or temperature set point" annotation(
			Placement(
				transformation(extent={{-50,-45},{-10,-5}}),
				iconTransformation(
					origin={0,200},
					extent={{-20,-20},{20,20}},
					rotation=-90)),
			Dialog(
				group="I/O",
				tab="Results 1",
				visible=false));
		output Modelica.Blocks.Interfaces.BooleanOutput CBon "Switch-on/off of CB" annotation(
			Placement(
				transformation(extent={{200,-105},{220,-85}}),
				iconTransformation(extent={{-190,-160},{-210,-140}})),
			Dialog(
				group="I/O",
				tab="Results 1",
				visible=false));
		output Modelica.Blocks.Interfaces.BooleanOutput CPon "Switch-on/off of circulation pump" annotation(
			Placement(
				transformation(extent={{200,-140},{220,-120}}),
				iconTransformation(extent={{-190,-110},{-210,-90}})),
			Dialog(
				group="I/O",
				tab="Results 1",
				visible=false));
	protected
		Boolean CB "CB state on/off" annotation(Dialog(
			group="I/O",
			tab="Results 1"));
		Boolean CP "CP state on/off" annotation(Dialog(
			group="I/O",
			tab="Results 1"));
		discrete Real tCBStart(
			quantity="Basics.Time",
			displayUnit="s") "Starting time of CB" annotation(Dialog(
			group="Timing",
			tab="Results 1"));
		discrete Real tCPStart(
			quantity="Basics.Time",
			displayUnit="s") "Starting time of circulation pump" annotation(Dialog(
			group="Timing",
			tab="Results 1"));
		discrete Real tCBEnd(
			quantity="Basics.Time",
			displayUnit="s") "Shutdown time of CB" annotation(Dialog(
			group="Timing",
			tab="Results 1"));
	public
		parameter Boolean ControlMode=false "If true, flow temperature controlled, else power output is controlled" annotation(Dialog(tab="Controller Configuration"));
		parameter Boolean ConstantDeltaT=false "If true, DeltaT is constant, else dependent on return temperature" annotation(Dialog(tab="Controller Configuration"));
		parameter Real DeltaT(quantity="Thermics.TempDiff")=20 "Temperature difference between flow and return temperature" annotation(Dialog(tab="Controller Configuration"));
		parameter Real TFlowMax(
			quantity="Thermics.Temp",
			displayUnit="°C")=358.15 "Maximum flow temperature" annotation(Dialog(tab="Controller Configuration"));
		parameter Real TReturnMax(quantity="Basics.Temp")=343.15 "Maximum return temperature" annotation(Dialog(tab="Controller Configuration"));
		parameter Real TFlowMin(quantity="Basics.Temp")=293.15 "Minimum flow temperature" annotation(Dialog(tab="Controller Configuration"));
		parameter Real QHeatMaxRelative(
			quantity="Basics.RelMagnitude",
			displayUnit="%")=1 "Maximum relative heat power of CB" annotation(Dialog(
			group="Heat Power Configuration of CB",
			tab="Controller Configuration"));
		parameter Real QHeatMinRelative(
			quantity="Basics.RelMagnitude",
			displayUnit="%")=0.21 "Minimum relative heat power of CB" annotation(Dialog(
			group="Heat Power Configuration of CB",
			tab="Controller Configuration"));
		parameter Real tDelayCB(
			quantity="Basics.Time",
			displayUnit="s")=15 "Delay time between circultion pump and CB starting" annotation(Dialog(
			group="Condensing Boiler",
			tab="Timing Control"));
		parameter Real tCBminOn(
			quantity="Basics.Time",
			displayUnit="s")=60 "Minimum turn-on time of CB" annotation(Dialog(
			group="Condensing Boiler",
			tab="Timing Control"));
		parameter Real tCBminOff(
			quantity="Basics.Time",
			displayUnit="s")=60 "Minimum turn-off time of CB" annotation(Dialog(
			group="Condensing Boiler",
			tab="Timing Control"));
		parameter Real tDelayCP(
			quantity="Basics.Time",
			displayUnit="s")=50 "Delay time between CB and circulation pump shutdown" annotation(Dialog(
			group="Circulation Pump",
			tab="Timing Control"));
		parameter Real deltaTFlowRefMax(quantity="Thermics.TempDiff")=3 "Temperature difference (TFlow-TFlowRef) when qv_target=qvMax" annotation(Dialog(
			group="Boundary Temperatures for Volume Flow Control",
			tab="Volume Flow Control"));
		parameter Real deltaTFlowRefMin(quantity="Thermics.TempDiff")=-10 "Temperature difference (TFlow-TFlowRef) when qv_target=qvMin" annotation(Dialog(
			group="Boundary Temperatures for Volume Flow Control",
			tab="Volume Flow Control"));
		parameter Real qvMin(
			quantity="Thermics.VolumeFlow",
			displayUnit="m³/h")=5e-05 "Minimum volume flow of circulation pump" annotation(Dialog(
			group="Volume Flow Boundaries",
			tab="Volume Flow Control"));
		parameter Real qvMax(
			quantity="Thermics.VolumeFlow",
			displayUnit="m³/h")=0.0003333333333333333 "Maximum volume flow of circulation pump" annotation(Dialog(
			group="Volume Flow Boundaries",
			tab="Volume Flow Control"));
	protected
		__iti_Alias AmbientConditions=EnvironmentConditions;
	initial equation
		CP = ControlIn > 2;
		CB = ControlIn > 2;
		
		if CB then
			tCBStart=time.start-tCBminOn-1;
			tCBEnd=time.start-tCBminOff-1;
		else
			tCBStart=time.start;
			tCBEnd=time.start;
		end if;
		
		if CB then		
			tCPStart=time.start-tDelayCB-1;
		else
			tCPStart=time.start;
		end if;
		
		if not CB then		
		
		else
		
		end if;
	equation
		// enter your equations here
		when pre(CB) then
			tCBStart=time;
		end when;
		
		when not pre(CB) then
			tCBEnd=time;
		end when;
		
		when ((ControlIn >= 2) and ((time-tCBEnd)>tCBminOff)) then //and ((TFlow < (TFlowSet + deltaTFlowRefMin)) or (not ControlMode)) and (TFlow < TFlowMax))  then
			CP=true;
		elsewhen (not pre(CB) and ((time-tCBEnd)>tDelayCP)) then
			CP=false;
		end when;
		
		when pre(CP) then
			tCPStart=time;
		end when;
		
		when (pre(CP) and ((time-tCPStart)>tDelayCB) and ((time-tCBEnd)>tDelayCP) and ((TFlow < (TFlowSet + deltaTFlowRefMin)) or (not ControlMode)) and (TFlow < TFlowMax) and (TReturn < TReturnMax))then
			CB=true;
		elsewhen (((ControlIn < 2) and ((time-tCBStart)>tCBminOn)) or ((TFlow > (TFlowSet + deltaTFlowRefMax) and ControlMode)) or (TFlow > TFlowMax) or (TReturn > TReturnMax)) then
			CB=false;
		end when;
		
		if ConstantDeltaT then
			factor = 1;
		else
			factor = TableDeltaTFactor.y[1];
		end if;
		
		if ControlMode then
			TFlowSet = min(TReturn + DeltaT * factor, TFlowMin + (TFlowMax - TFlowMin) * FlowTemperatureSet.y[1] / 100);
			QRef = 1;
		else
			TFlowSet = min(TReturn + DeltaT * factor, TFlowMax);
			QRef = PowerSet.y[1]/100;
		end if;
			
		if CP then
			if CB then
				qvRef=max(min((qvMin+(qvMax-qvMin)*(((TFlow-(TFlowSet+deltaTFlowRefMin))/(deltaTFlowRefMax-deltaTFlowRefMin)))),qvMax),qvMin);
				QRefRelative = QRef;
			else
				qvRef = qvMin;
				QRefRelative = 0;
			end if;
		else
			qvRef = 0;
			QRefRelative = 0;
		end if;
		
		CBon=CB;
		CPon=CP;
	equation
		connect(ControlIn,FlowTemperatureSet.u[1]) annotation(Line(
			points={{-30,-25},{-25,-25},{48,-25},{53,-25}},
			color={0,0,127},
			thickness=0.0625));
		connect(ControlIn,PowerSet.u[1]) annotation(Line(
			points={{-30,-25},{-25,-25},{48,-25},{48,-55},{53,-55}},
			color={0,0,127},
			thickness=0.0625));
		connect(TableDeltaTFactor.u[1],TReturn) annotation(Line(
			points={{53,-205},{48,-205},{-15,-205},{-20,-205}},
			color={0,0,127},
			thickness=0.0625));
	annotation(
		Icon(
			coordinateSystem(extent={{-200,-200},{200,200}}),
			graphics={
				Bitmap(
					imageSource="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",
					extent={{-200,200},{200,-200}}),
				Text(
					textString="DZ",
					fontSize=16,
					textStyle={
						TextStyle.Bold},
					horizontalAlignment=TextAlignment.Right,
					lineColor={0,128,255},
					extent={{75.3,-137.6},{195.3,-210.9}})}),
		experiment(
			StopTime=1,
			StartTime=0,
			Tolerance=1e-06,
			Interval=0.002,
			__esi_MinInterval="9.999999999999999e-10",
			__esi_MaxInterval="0.002",
			__esi_AbsTolerance="1e-6"));
end CBControlWolf;
