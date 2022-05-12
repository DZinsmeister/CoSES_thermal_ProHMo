// CP: 65001
// SimulationX Version: 4.2.3.69223
within CoSES_Models.HeatGenerator.GeneralModels;
model GroundSourceHeatPump "Ground source heat pump without heat source"
	input Modelica.Blocks.Interfaces.RealInput qvRef(
		quantity="Thermics.VolumeFlow",
		displayUnit="m³/h") "Reference volume flow of circulation pump" annotation(
		Placement(
			transformation(
				origin={-50,-5},
				extent={{-20,-20},{20,20}}),
			iconTransformation(
				origin={150,200},
				extent={{-20,-20},{20,20}},
				rotation=-90)),
		Dialog(
			group="Volume Flow",
			tab="Results 1",
			visible=false));
	input Modelica.Blocks.Interfaces.RealInput qvSourceRef(
		quantity="Thermics.VolumeFlow",
		displayUnit="m³/h") "Reference volume flow of source pump" annotation(
		Placement(
			transformation(
				origin={-50,60},
				extent={{-20,-20},{20,20}}),
			iconTransformation(
				origin={100,200},
				extent={{-20,-20},{20,20}},
				rotation=-90)),
		Dialog(
			group="Volume Flow",
			tab="Results 1",
			visible=false));
	GreenCity.Interfaces.Electrical.LV3Phase SPGrid3 if(SourcePhase==3) "3-phase connection of source pump to Grid" annotation(Placement(
		transformation(
			origin={95,-175},
			extent={{-10,-10},{10,10}},
			rotation=-90),
		iconTransformation(
			origin={150,-196.7},
			extent={{-10,-10},{10,10}},
			rotation=-90)));
	GreenCity.Interfaces.Electrical.LV1Phase CPGrid1 if(CPPhase==1) "1-phase connection of circulation pump to Grid" annotation(Placement(
		transformation(extent={{155,-185},{175,-165}}),
		iconTransformation(extent={{90,-206.7},{110,-186.7}})));
	GreenCity.Interfaces.Electrical.LV3Phase CPGrid3 if(CPPhase==3) "3-phase connection of circulation pump to Grid" annotation(Placement(
		transformation(extent={{230,-185},{250,-165}}),
		iconTransformation(extent={{90,-206.7},{110,-186.7}})));
	GreenCity.Interfaces.Electrical.LV3Phase AUXGrid3 if(AuxHeat and(AUXPhase==3)) "3-phase connection of auxiliary heating system to Grid" annotation(Placement(
		transformation(extent={{385,-150},{405,-130}}),
		iconTransformation(extent={{-10,-206.7},{10,-186.7}})));
	GreenCity.Interfaces.Electrical.LV1Phase AUXGrid1 if(AuxHeat and(AUXPhase==1)) "1-phase connection of auxiliary heating system to Grid" annotation(Placement(
		transformation(extent={{305,-150},{325,-130}}),
		iconTransformation(extent={{-10,-206.7},{10,-186.7}})));
	GreenCity.Interfaces.Electrical.LV1Phase SPGrid1 if(SourcePhase==1) "1-phase connection of source pump to Grid" annotation(Placement(
		transformation(extent={{10,-185},{30,-165}}),
		iconTransformation(extent={{140,-206.7},{160,-186.7}})));
	GreenCity.Interfaces.Electrical.LV3Phase COMPGrid3 if CompPhase==3 "3-phase connection of compressor to Grid" annotation(Placement(
		transformation(extent={{-70,-185},{-50,-165}}),
		iconTransformation(extent={{40,-206.7},{60,-186.7}})));
	GreenCity.Interfaces.Electrical.LV1Phase COMPGrid1 if CompPhase==1 "1-phase connection of compressor to Grid" annotation(Placement(
		transformation(extent={{-135,-185},{-115,-165}}),
		iconTransformation(extent={{40,-206.7},{60,-186.7}})));
	GreenCity.Interfaces.Thermal.VolumeFlowIn ReturnHP "Return pipe" annotation(Placement(
		transformation(extent={{-10,-45},{10,-25}}),
		iconTransformation(extent={{186.7,-110},{206.7,-90}})));
	GreenCity.Interfaces.Thermal.VolumeFlowOut FlowHP "flow pipe" annotation(Placement(
		transformation(extent={{-10,-15},{10,5}}),
		iconTransformation(extent={{190,90},{210,110}})));
	GreenCity.Interfaces.Thermal.VolumeFlowIn SourcePipeIn "Return pipe" annotation(Placement(
		transformation(extent={{-10,20},{10,40}}),
		iconTransformation(extent={{-210,90},{-190,110}})));
	GreenCity.Interfaces.Thermal.VolumeFlowOut SourcePipeOut "flow pipe" annotation(Placement(
		transformation(extent={{-10,50},{10,70}}),
		iconTransformation(extent={{-210,-110},{-190,-90}})));
	GreenCity.Interfaces.Thermal.DefineVolumeFlow ToFlow "Specifies a Thermal Volume Flow Connector" annotation(Placement(transformation(extent={{50,-15},{30,5}})));
	GreenCity.Interfaces.Thermal.ExtractVolumeFlow FromReturn annotation(Placement(transformation(extent={{30,-45},{50,-25}})));
	protected
		Real qv(
			quantity="Thermics.VolumeFlow",
			displayUnit="m³/h") "Actual volume flow of circulation pump" annotation(Dialog(
			group="Volume Flow",
			tab="Results 1"));
		Real qvSource(
			quantity="Thermics.VolumeFlow",
			displayUnit="m³/h") "Actual volume flow of source pump" annotation(Dialog(
			group="Volume Flow",
			tab="Results 1"));
	public
		input Modelica.Blocks.Interfaces.BooleanInput HPon "Switch on/off of HP" annotation(
			Placement(
				transformation(extent={{-120,70},{-80,110}}),
				iconTransformation(
					origin={-50,200},
					extent={{-20,-20},{20,20}},
					rotation=-90)),
			Dialog(
				group="I/O",
				tab="Results 1",
				visible=false));
		input Modelica.Blocks.Interfaces.BooleanInput CPon "Switch on/off of circulation pump" annotation(
			Placement(
				transformation(extent={{-120,-25},{-80,15}}),
				iconTransformation(
					origin={-150,200},
					extent={{-20,-20},{20,20}},
					rotation=-90)),
			Dialog(
				group="I/O",
				tab="Results 1",
				visible=false));
		input Modelica.Blocks.Interfaces.BooleanInput AUXon if AuxHeat "Switch on/off of auxiliary heating system" annotation(
			Placement(
				transformation(extent={{-120,-90},{-80,-50}}),
				iconTransformation(
					origin={0,200},
					extent={{-20,-20},{20,20}},
					rotation=-90)),
			Dialog(
				group="I/O",
				tab="Results 1",
				visible=false));
		input Modelica.Blocks.Interfaces.BooleanInput SPon "I/O-switch for source pump" annotation(
			Placement(
				transformation(
					origin={-100,60},
					extent={{-20,-20},{20,20}}),
				iconTransformation(
					origin={-100,200},
					extent={{-20,-20},{20,20}},
					rotation=-90)),
			Dialog(
				group="I/O",
				tab="Results 1",
				visible=false));
		Modelica.Blocks.Interfaces.RealInput HPModulation(quantity="Basics.RelMagnitude") if not ConstantPowerOutput "Reference relative power output of the heat pump" annotation(
			Placement(
				transformation(extent={{-120,30},{-80,70}}),
				iconTransformation(
					origin={50,200},
					extent={{-20,-20},{20,20}},
					rotation=-90)),
			Dialog(
				group="System Control",
				tab="Results 1",
				visible=false));
		Modelica.Blocks.Interfaces.RealInput AuxModulation(quantity="Basics.RelMagnitude") if not ConstantAuxPower "Reference relative power output of the auxiliary heater" annotation(
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
				group="System Control",
				tab="Results 1",
				visible=false));
	protected
		Real MinimumModulation(
			quantity="Basics.RelMagnitude",
			displayUnit="-")=if ConstantPowerOutput then 1.0 else RelModMin "Minimum modulation" annotation(
			HideResult=false,
			Dialog(
				group="System Control",
				tab="Results 1"));
		Real RelativeModulation(quantity="Basics.RelMagnitude") "Current degree of modulation" annotation(
			HideResult=false,
			Dialog(
				group="System Control",
				tab="Results 1"));
		Real RelativeAuxModulation(quantity="Basics.RelMagnitude") "Current degree of modulation" annotation(
			HideResult=false,
			Dialog(
				group="System Control",
				tab="Results 1"));
	public
		output Modelica.Blocks.Interfaces.RealOutput COP "Actual COP of heat pump" annotation(
			Placement(
				transformation(extent={{210,75},{230,95}}),
				iconTransformation(
					origin={-200,150},
					extent={{-10,-10},{10,10}},
					rotation=180)),
			Dialog(
				group="Coefficient of Performance",
				tab="Results 1",
				visible=false));
	protected
		type VoltageEnum = enumeration( 
			LV "Low-Voltage", 
			MV "Medium-Voltage", 
			HV "High-Voltage") "Voltage-Level Enumeration" annotation(initValue=LV);
	public
		GreenCity.Interfaces.Electrical.DefineCurrentAC3 SPGridConnection3(VoltageType=VoltageType) if(SourcePhase==3) annotation(Placement(transformation(
			origin={95,-105},
			extent={{-10,-10},{10,10}},
			rotation=-90)));
		GreenCity.Interfaces.Electrical.DefineCurrentAC3 CPGridConnection3(VoltageType=VoltageType) if(CPPhase==3) annotation(Placement(transformation(
			origin={240,-105},
			extent={{10,-10},{-10,10}},
			rotation=90)));
		GreenCity.Interfaces.Electrical.DefineCurrentAC1 CPGridConnection1 if(CPPhase==1) annotation(Placement(transformation(
			origin={165,-105},
			extent={{10,-10},{-10,10}},
			rotation=90)));
		GreenCity.Interfaces.Electrical.DefineCurrentAC3 AUXGridConnection3(VoltageType=VoltageType) if(AuxHeat and(AUXPhase==3)) annotation(Placement(transformation(
			origin={395,-75},
			extent={{10,-10},{-10,10}},
			rotation=90)));
		GreenCity.Interfaces.Electrical.DefineCurrentAC1 AUXGridConnection1 if(AuxHeat and(AUXPhase==1)) annotation(Placement(transformation(
			origin={315,-75},
			extent={{10,-10},{-10,10}},
			rotation=90)));
		Real TFlow(
			quantity="Thermics.Temp",
			displayUnit="°C") "Flow temperature of HP" annotation(Dialog(
			group="Temperature",
			tab="Results 1",
			visible=false));
		Real TReturn(
			quantity="Thermics.Temp",
			displayUnit="°C") "Return temperature of HP" annotation(Dialog(
			group="Temperature",
			tab="Results 1",
			visible=false));
		Real TFlowSource(
			quantity="Thermics.Temp",
			displayUnit="°C") "Flow temperature of heat source" annotation(Dialog(
			group="Temperature",
			tab="Results 1",
			visible=false));
		Real TReturnSource(quantity="Basics.Temp") "Return temperature of heat source" annotation(Dialog(
			group="Temperature",
			tab="Results 1",
			visible=false));
	protected
		Real QHeatInput(
			quantity="Basics.Power",
			displayUnit="kW") "actual heat power" annotation(Dialog(
			group="Heating Power",
			tab="Results 2"));
	public
		Real QHeatAux(
			quantity="Basics.Power",
			displayUnit="kW") "Actual auxiliary heat power" annotation(Dialog(
			group="Heating Power",
			tab="Results 2",
			visible=false));
		Real QHeat(
			quantity="Basics.Power",
			displayUnit="kW") "Heat output power of HP" annotation(Dialog(
			group="Heating Power",
			tab="Results 2",
			visible=false));
		Real PSP(
			quantity="Basics.Power",
			displayUnit="kW") "Effective power of source pump" annotation(Dialog(
			group="Electrical Power",
			tab="Results 2",
			visible=false));
	protected
		Real SSP(
			quantity="Basics.Power",
			displayUnit="kVA") "Apparent power of source pump" annotation(Dialog(
			group="Electrical Power",
			tab="Results 2"));
	public
		Real PCP(
			quantity="Basics.Power",
			displayUnit="kW") "Effective power of circulation pump" annotation(Dialog(
			group="Electrical Power",
			tab="Results 2",
			visible=false));
	protected
		Real SCP(
			quantity="Basics.Power",
			displayUnit="kVA") "Apparent power of circulation pump" annotation(Dialog(
			group="Electrical Power",
			tab="Results 2"));
	public
		Real PCOMP(
			quantity="Basics.Power",
			displayUnit="kW") "Effective power of compressor" annotation(Dialog(
			group="Electrical Power",
			tab="Results 2",
			visible=false));
	protected
		Real SCOMP(
			quantity="Basics.Power",
			displayUnit="kVA") "Apparent power of compressor" annotation(Dialog(
			group="Electrical Power",
			tab="Results 2"));
	public
		Real PAUX(
			quantity="Basics.Power",
			displayUnit="kW") "Effective electrical power of auxiliary heating system (cos phi = 1)" annotation(Dialog(
			group="Electrical Power",
			tab="Results 2",
			visible=false));
		Real EHeat(
			quantity="Basics.Energy",
			displayUnit="kWh") "Heat output of heat pump" annotation(Dialog(
			group="Energy",
			tab="Results 2",
			visible=false));
		Real ECOMP(
			quantity="Basics.Energy",
			displayUnit="kWh") "Electrical energy demand of compressor" annotation(Dialog(
			group="Energy",
			tab="Results 2",
			visible=false));
		Real ECP(
			quantity="Basics.Energy",
			displayUnit="kWh") "Electrical energy demand of circulation pump" annotation(Dialog(
			group="Energy",
			tab="Results 2",
			visible=false));
		Real ESP(
			quantity="Basics.Energy",
			displayUnit="kWh") "Electrical energy demand of source pump" annotation(Dialog(
			group="Energy",
			tab="Results 2",
			visible=false));
		Real EAUX(
			quantity="Basics.Energy",
			displayUnit="kWh") "Electrical energy demand of auxiliary heating system" annotation(Dialog(
			group="Energy",
			tab="Results 2",
			visible=false));
	protected
		discrete Real StartTime(
			quantity="Basics.Time",
			displayUnit="s") "Starting time of HP" annotation(Dialog(
			group="Timing",
			tab="Results 2"));
		discrete Real StartTimeAux(
			quantity="Basics.Time",
			displayUnit="s") if AuxHeat "Starting time of auxiliary heating system" annotation(Dialog(
			group="Timing",
			tab="Results 2"));
	public
		parameter Boolean ConstantPowerOutput=true "If false: compressor power is modulated, else not" annotation(Dialog(
			group="System Configuration",
			tab="Model Configuration"));
		parameter Real RelModMin(quantity="Basics.RelMagnitude")=0.5 if not ConstantPowerOutput "Minimum degree of compressor power modulation" annotation(Dialog(
			group="System Configuration",
			tab="Model Configuration"));
		GreenCity.Interfaces.Electrical.DefineCurrentAC1 SPGridConnection1 if(SourcePhase==1) annotation(Placement(transformation(
			origin={20,-105},
			extent={{10,-10},{-10,10}},
			rotation=90)));
		GreenCity.Interfaces.Electrical.DefineCurrentAC3 COMPGridConnection3(VoltageType=VoltageType) if CompPhase==3 annotation(Placement(transformation(
			origin={-60,-105},
			extent={{10,-10},{-10,10}},
			rotation=90)));
		GreenCity.Interfaces.Electrical.DefineCurrentAC1 COMPGridConnection1 if CompPhase==1 annotation(Placement(transformation(
			origin={-125,-105},
			extent={{10,-10},{-10,10}},
			rotation=90)));
		Modelica.Blocks.Tables.CombiTable1D PelCP(
			tableOnFile=true,
			tableName=CPTable,
			fileName=HPFile) "Electrical power demand of circulation pump" annotation(Placement(transformation(extent={{85,-15},{105,5}})));
		Modelica.Blocks.Tables.CombiTable1D PelSP(
			tableOnFile=true,
			tableName=SPTable,
			fileName=HPFile) "Electrical power demand of source pump" annotation(Placement(transformation(extent={{85,50},{105,70}})));
		Modelica.Blocks.Tables.CombiTable2D QHeatPump(
			tableOnFile=true,
			tableName=QHeatTable,
			fileName=HPFile) "Heat power output of heat pump" annotation(Placement(transformation(extent={{150,30},{170,50}})));
		Modelica.Blocks.Tables.CombiTable2D COPHeatPump(
			tableOnFile=true,
			tableName=COPTable,
			fileName=HPFile) "COP of heat pump" annotation(Placement(transformation(extent={{150,0},{170,20}})));
		parameter Boolean AuxHeat=true "If true, auxiliary heater is installed" annotation(Dialog(
			group="Auxiliary Electrical Heating Components",
			tab="Model Configuration"));
		parameter Boolean ConstantAuxPower=true if AuxHeat "If false: auxiliary electric heater is modulated, else not" annotation(Dialog(
			group="Auxiliary Electrical Heating Components",
			tab="Model Configuration"));
		parameter Integer AUXPhase=3 if AuxHeat "Phase number auxiliary heating system is connected to" annotation(Dialog(
			group="Auxiliary Electrical Heating Components",
			tab="Model Configuration"));
		parameter Integer CPPhase=1 "Phase number circulation pump is connected to" annotation(Dialog(
			group="Circulation Pump - Configuration",
			tab="Model Configuration"));
		parameter Integer SourcePhase=1 "Phase number of source pump grid connection (ventilator, brine pump)" annotation(Dialog(
			group="Source Pump - Configuration",
			tab="Model Configuration"));
		parameter Integer CompPhase=3 "Phase number of HP-compressor" annotation(Dialog(
			group="Compressor Configuration",
			tab="Model Configuration"));
	protected
		parameter VoltageEnum VoltageType=VoltageEnum.LV "Voltage-Level" annotation(Dialog(
			group="Voltage-Level",
			tab="Model Configuration"));
	public
		parameter String HPFile=classDirectory()+"Data\\Wolf_BWS1_10.txt" "File name for heat pump characteristics" annotation(Dialog(
			group="Heating Power",
			tab="HP - Power Data"));
		parameter String QHeatTable="Q_AW" "Table name for source and flow temperature depending heat power output" annotation(Dialog(
			group="Heating Power",
			tab="HP - Power Data"));
		parameter String COPTable="COP" "Table name for source and flow temperature depending COP of HP" annotation(Dialog(
			group="Heating Power",
			tab="HP - Power Data"));
		parameter Real CosPhiCOMP=0.7 "Power factor of compressor" annotation(Dialog(
			group="Heating Power",
			tab="HP - Power Data"));
		parameter Real AuxHeatPower(
			quantity="Basics.Power",
			displayUnit="kW")=6000 if AuxHeat "Heat power of auxiliary heating system" annotation(Dialog(
			group="Auxiliary Heating Power",
			tab="HP - Power Data"));
		parameter Real TAmbient(
			quantity="Thermics.Temp",
			displayUnit="°C")=291.14999999999998 "Ambient temperature" annotation(Dialog(
			group="Heat Losses",
			tab="HP - Power Data"));
		parameter Real QlossRate(
			quantity="Thermics.HeatCond",
			displayUnit="W/K")=0.2 "Heat loss rate of HP-isolation" annotation(Dialog(
			group="Heat Losses",
			tab="HP - Power Data"));
		parameter Real cpMed(
			quantity="Thermics.SpecHeatCapacity",
			displayUnit="kJ/(kg·K)")=4177 "Specific heat capacity of heating medium" annotation(Dialog(
			group="Medium",
			tab="Heating System"));
		parameter Real rhoMed(
			quantity="Basics.Density",
			displayUnit="kg/m³")=1000 "Density of heating medium" annotation(Dialog(
			group="Medium",
			tab="Heating System"));
		parameter Real TFlowMin(
			quantity="Thermics.Temp",
			displayUnit="°C")=288.14999999999998 "Minimum flow temperature for heat pump" annotation(Dialog(
			group="Boundaries",
			tab="Heating System"));
		parameter Real TFlowMax(
			quantity="Thermics.Temp",
			displayUnit="°C")=336.15 "Maximum flow temperature for heat pump" annotation(Dialog(
			group="Boundaries",
			tab="Heating System"));
		parameter Real VHP(
			quantity="Geometry.Volume",
			displayUnit="l")=0.01 "Heating medium volume of HP" annotation(Dialog(
			group="Dimensions",
			tab="Heating System"));
		parameter String CPTable="P_CP" "Table name for CP-power behavior" annotation(Dialog(
			group="Power Data",
			tab="CP - Dimensions"));
		parameter Real CosPhiCP=0.98 "Power factor of circulation pump" annotation(Dialog(
			group="Power Data",
			tab="CP - Dimensions"));
		parameter Real qvMax(
			quantity="Thermics.VolumeFlow",
			displayUnit="m³/h")=0.0006388888888888888 "Maximum volume flow of CP" annotation(Dialog(
			group="Boundaries",
			tab="CP - Dimensions"));
		parameter Real qvMin(
			quantity="Thermics.VolumeFlow",
			displayUnit="m³/h")=0.0003611111111111111 "Minimum volume flow of CP" annotation(Dialog(
			group="Boundaries",
			tab="CP - Dimensions"));
		parameter Real cpMedSource(quantity="Thermics.SpecHeatCapacity")=3680 "Specific heat capacity of source medium" annotation(Dialog(
			group="Medium",
			tab="Heat Source"));
		parameter Real rhoMedSource(quantity="Basics.Density")=1113.1 "Density of source medium" annotation(Dialog(
			group="Medium",
			tab="Heat Source"));
		parameter Real TSourceMin(
			quantity="Thermics.Temp",
			displayUnit="°C")=268.15 "Minimum source temperature for heat pump" annotation(Dialog(
			group="Boundaries",
			tab="Heat Source"));
		parameter Real TSourceMax(
			quantity="Thermics.Temp",
			displayUnit="°C")=293.15 "Maximum source temperature for heat pump" annotation(Dialog(
			group="Boundaries",
			tab="Heat Source"));
		parameter Real VSource(
			quantity="Geometry.Volume",
			displayUnit="l")=0.003 "Volume of source medium inside of HP" annotation(Dialog(
			group="Dimension",
			tab="Heat Source"));
		parameter String SPTable="P_SP" "Table name for volume flow depending power demand of source pump" annotation(Dialog(
			group="Power Data",
			tab="SP - Dimensions"));
		parameter Real CosPhiSP=0.98 "Power factor of source pump" annotation(Dialog(
			group="Power Data",
			tab="SP - Dimensions"));
		parameter Real qvSourceMax(
			quantity="Thermics.VolumeFlow",
			displayUnit="m³/h")=0.0007361111111111111 "Maximum volume flow of SP" annotation(Dialog(
			group="Boundaries",
			tab="SP - Dimensions"));
		parameter Real qvSourceMin(
			quantity="Thermics.VolumeFlow",
			displayUnit="m³/h")=0.0004444444444444445 "Minimum volume flow of SP" annotation(Dialog(
			group="Boundaries",
			tab="SP - Dimensions"));
		parameter Real tHPStart(
			quantity="Basics.Time",
			displayUnit="s")=90 "Heat power switch-on time period" annotation(Dialog(
			group="Heating Power",
			tab="Dynamics"));
		parameter Real tCP(
			quantity="Basics.Time",
			displayUnit="s")=15 "Operation time delay of circulation pump" annotation(Dialog(
			group="Circulation Pump",
			tab="Dynamics"));
		parameter Real tAUX(
			quantity="Basics.Time",
			displayUnit="s")=15 if AuxHeat "Operation time delay for auxiliary heating system" annotation(Dialog(
			group="Auxiliary Heating System",
			tab="Dynamics"));
		parameter Real tSP(
			quantity="Basics.Time",
			displayUnit="s")=15 "Operation time delay of source pump" annotation(Dialog(
			group="Source Pump",
			tab="Dynamics"));
		GreenCity.Interfaces.Thermal.DefineVolumeFlow ToSource "Specifies a volume flow port" annotation(Placement(transformation(
			origin={40,60},
			extent={{-10,-10},{10,10}},
			rotation=-180)));
		GreenCity.Interfaces.Thermal.ExtractVolumeFlow FromSource "Extracts the characteristics of a Thermal Volume Flow Connector" annotation(Placement(transformation(
			origin={40,30},
			extent={{-10,-10},{10,10}})));
	protected
		__iti_Alias AmbientConditions=EnvironmentConditions;
	initial equation
		if (AuxHeat) then
			assert((AUXPhase==1)or(AUXPhase==3), "AUXPhase must equal 1 or 3");
		end if;
		assert((CPPhase==1)or(CPPhase==3), "CPPhase must equal 1 or 3");
		assert((SourcePhase==1)or(SourcePhase==3), "SourcePhase must equal 1 or 3");
		assert((CompPhase==1)or(CompPhase==3), "CompPhase must equal 1 or 3");
		
		if HPon then	
			TFlow=FromReturn.TMedium;
		else
			TFlow=TAmbient;
		end if;	
		
		TReturnSource = FromSource.TMedium;
		
		if SPon then
			ToSource.qvMedium=max(min(qvSourceRef,qvSourceMax),qvSourceMin);
		else
			ToSource.qvMedium=0;
		end if;
		
		if CPon then			
			ToFlow.qvMedium=max(min((qvRef),qvMax),qvMin);			
		else
			ToFlow.qvMedium=0;
		end if;
		
		EHeat=0;
		ECP=0;
		ECOMP=0;
		ESP=0;
		EAUX=0;
		
		StartTime=time.start;
		
		if AuxHeat then 
			StartTimeAux=time.start;
		end if;
		
		if HPon then
			QHeatInput=QHeatPump.y;
			PCOMP=-QHeatPump.y/(max(COPHeatPump.y,1));
		else
			QHeatInput=0;
			PCOMP=0;
		end if;
		
		if AuxHeat then
			if AUXon then
				QHeatAux=AuxHeatPower;
			else
				QHeatAux=0;
			end if;
		else
			QHeatAux=0;
		end if;
	equation
		// Modulation
		if not ConstantPowerOutput then	
			RelativeModulation=max(HPModulation,MinimumModulation);
		else
			RelativeModulation=1.0;
		end if;
		
		if not ConstantAuxPower then
			RelativeAuxModulation = AuxModulation;
		else
			RelativeAuxModulation = 1;
		end if;
		
		// Heat Pump
		when HPon then
			StartTime=time;
		end when;			
		
		QHeatPump.u1=max(min((TFlowSource),TSourceMax),TSourceMin);
		QHeatPump.u2=max(min((TFlow),TFlowMax),TFlowMin);
		COPHeatPump.u1=max(min((TFlowSource),TSourceMax),TSourceMin);
		COPHeatPump.u2=max(min((TFlow),TFlowMax),TFlowMin);
		COP=COPHeatPump.y;
		
		when (HPon and not ((time-StartTime)<tHPStart)) then
			reinit(QHeatInput,QHeatPump.y * RelativeModulation);
			reinit(PCOMP,-QHeatPump.y/(max(COP,1)) * RelativeModulation);
		elsewhen (not HPon) then
			reinit(QHeatInput,0);
			reinit(PCOMP,0);
		end when;
		
		if HPon then
			if (((time-StartTime)<tHPStart) and (StartTime>time.start)) then
				tHPStart/3*der(QHeatInput)+QHeatInput=QHeatPump.y * RelativeModulation;	
			else
				der(QHeatInput)=der(QHeatPump.y * RelativeModulation);
			end if;
		
			if (((time-StartTime)<tHPStart) and (StartTime>time.start)) then
				tHPStart/3*der(PCOMP)+PCOMP=-QHeatInput/(max(COP,1));
			else
				der(PCOMP)=-(der(QHeatInput)*(max(COP,1))-QHeatInput*der(COPHeatPump.y))/((max(COP,1))^2);
			end if;
		else
			der(QHeatInput)=0;
			der(PCOMP)=0;
		end if;
		
		if (abs(CosPhiCOMP)>1e-10) then
			SCOMP=abs(PCOMP)/CosPhiCOMP;
		else
			SCOMP=abs(PCOMP);
		end if;
		
		// Auxiliary heater
		if AuxHeat then			
			when AUXon then
				StartTimeAux=time;
			end when;
		
			when (AUXon and not (time-StartTimeAux)<tAUX) then
		       	reinit(QHeatAux,AuxHeatPower * RelativeAuxModulation);
		    elsewhen not AUXon then
		    	reinit(QHeatAux,0);
		    end when;	        
		
			if AUXon then
				if ((time-StartTimeAux)<tAUX and (StartTimeAux>time.start)) then
					tAUX/3*der(QHeatAux)+QHeatAux=AuxHeatPower * RelativeAuxModulation;
				else
					der(QHeatAux)=0;
				end if;
			else
				der(QHeatAux)=0;
			end if;
		else
			der(QHeatAux)=0;
		end if;			
		
		PAUX=-abs(QHeatAux);
		
		// Heating System
		TReturn=FromReturn.TMedium;
		qv=FromReturn.qvMedium;
		if (CPon) then	
			tCP*der(ToFlow.qvMedium)+ToFlow.qvMedium=max(min((qvRef),qvMax),qvMin);
			PelCP.u[1]=qv;
			PCP=-PelCP.y[1];
		else
			tCP*der(ToFlow.qvMedium)+ToFlow.qvMedium=0;
			PelCP.u[1]=0;
			PCP=0;
		end if;
		cpMed*rhoMed*VHP*der(TFlow)=-QlossRate*(TFlow-TAmbient)+QHeatInput+QHeatAux-cpMed*rhoMed*qv*(TFlow-TReturn);
		ToFlow.TMedium=TFlow;	
		QHeat=cpMed*rhoMed*qv*(TFlow-TReturn);
		if (abs(CosPhiCP)>1e-10) then
			SCP=abs(PCP)/CosPhiCP;
		else
			SCP=abs(PCP);
		end if;
		
		// Heat Source
		TFlowSource=FromSource.TMedium;
		qvSource=FromSource.qvMedium;
		if (SPon) then
			tSP * der(ToSource.qvMedium) + ToSource.qvMedium = max(min(qvSourceRef, qvSourceMax), qvSourceMin);
			PelSP.u[1] = qvSource;
			PSP = -PelSP.y[1];
		else
			tSP * der(ToSource.qvMedium) + ToSource.qvMedium = 0;
			PelSP.u[1] = 0;
			PSP = 0;
		end if;
		cpMedSource*rhoMedSource*VSource*der(TReturnSource)=-QlossRate*(TReturnSource-TAmbient)-QHeatInput*(1-1/COP)+cpMedSource*rhoMedSource*qvSource*(TFlowSource-TReturnSource);
		ToSource.TMedium=TReturnSource;
		if (abs(CosPhiSP)>1e-10) then
			SSP=abs(PSP)/CosPhiSP;
		else
			SSP=abs(PSP);
		end if;
		
		// Energy
		der(EHeat)=QHeat;
		der(ECOMP)=PCOMP;
		der(ECP)=PCP;
		der(ESP)=PSP;
		der(EAUX)=PAUX;
		
		if (SourcePhase==1) then
			if (SPGridConnection1.Veff>1e-10) then
				SPGridConnection1.Ieff=SSP/SPGridConnection1.Veff;
				SPGridConnection1.Phi=acos(min(max(CosPhiSP,-1),1));
			else
				SPGridConnection1.Ieff=0;
				SPGridConnection1.Phi=0;
			end if;
		end if;
		
		if (SourcePhase==3) then
			for i in 1:3 loop
				if (SPGridConnection3.Veff[i]>1e-10) then
					SPGridConnection3.Ieff[i]=SSP/(3*SPGridConnection3.Veff[i]);
					SPGridConnection3.Phi[i]=acos(min(max(CosPhiSP,-1),1));
				else
					SPGridConnection3.Ieff[i]=0;
					SPGridConnection3.Phi[i]=0;
				end if;
			end for;
		end if;
		
		if (CompPhase==1) then
			if (COMPGridConnection1.Veff>1e-10) then
				COMPGridConnection1.Ieff=SCOMP/COMPGridConnection1.Veff;
				COMPGridConnection1.Phi=acos(min(max(CosPhiCOMP,-1),1));
			else
				COMPGridConnection1.Ieff=0;
				COMPGridConnection1.Phi=0;
			end if;
		end if;
		
		if (CompPhase==3) then
			for i in 1:3 loop
				if (COMPGridConnection3.Veff[i]>1e-10) then
					COMPGridConnection3.Ieff[i]=SCOMP/(3*COMPGridConnection3.Veff[i]);
					COMPGridConnection3.Phi[i]=acos(min(max(CosPhiCOMP,-1),1));
				else
					COMPGridConnection3.Ieff[i]=0;
					COMPGridConnection3.Phi[i]=0;
				end if;
			end for;
		end if;
		
		if (CPPhase==1) then
			if (CPGridConnection1.Veff>1e-10) then
				CPGridConnection1.Ieff=SCP/CPGridConnection1.Veff;
				CPGridConnection1.Phi=acos(min(max(CosPhiCP,-1),1));
			else
				CPGridConnection1.Ieff=0;
				CPGridConnection1.Phi=0;
			end if;
		end if;
		if (CPPhase==3) then
			for i in 1:3 loop
				if (CPGridConnection3.Veff[i]>1e-10) then			
					CPGridConnection3.Ieff[i]=SCP/(3*CPGridConnection3.Veff[i]);
					CPGridConnection3.Phi[i]=acos(min(max(CosPhiCP,-1),1));
				else
					CPGridConnection3.Ieff[i]=0;
					CPGridConnection3.Phi[i]=0;
				end if;
			end for;
		end if;
		
		if (AuxHeat) then
			if (AUXPhase==1) then
				if (AUXGridConnection1.Veff>1e-10) then
					AUXGridConnection1.Ieff=abs(PAUX)/AUXGridConnection1.Veff;
					AUXGridConnection1.Phi=0;
				else
					AUXGridConnection1.Ieff=0;
					AUXGridConnection1.Phi=0;
				end if;
			end if;
			if (AUXPhase==3) then
				for i in 1:3 loop
					if (AUXGridConnection3.Veff[i]>1e-10) then
					AUXGridConnection3.Ieff[i]=abs(PAUX)/(3*AUXGridConnection3.Veff[i]);
					AUXGridConnection3.Phi[i]=0;
				else
					AUXGridConnection3.Ieff[i]=0;
					AUXGridConnection3.Phi[i]=0;
				end if;
				end for;
			end if;
		end if;
	equation
		if (CPPhase==1) then 
			connect(CPGrid1,CPGridConnection1.FlowCurrent) annotation(Line(points={{165,-175},{160,-175},{160,-147.7},{165,-147.7},{165,-120},{165,
		-115}}));
		end if;
		if (CPPhase==3) then
			connect(CPGrid3,CPGridConnection3.LVFlowCurrent) annotation(Line(points={{240,-175},{235,-175},{235,-147.7},{240,-147.7},{240,-120},{240,
		-115}}));
		end if;
		if (AuxHeat and (AUXPhase==3)) then
			connect(AUXGrid3,AUXGridConnection3.LVFlowCurrent) annotation(Line(points={{395,-140},{390,-140},{390,-115},{395,-115},{395,-90},{395,
		-85}}));
		end if;
		if (AuxHeat and (AUXPhase==1)) then
			connect(AUXGrid1,AUXGridConnection1.FlowCurrent) annotation(Line(points={{315,-140},{310,-140},{310,-115},{315,-115},{315,-90},{315,
		-85}}));
		end if;
		if (SourcePhase==3) then
			connect(SPGrid3,SPGridConnection3.LVFlowCurrent) annotation(Line(points={{95,-175},{90,-175},{90,-147.7},{95,-147.7},{95,-120},{95,
		-115}}));
		end if;
		if (SourcePhase==1) then
			connect(SPGrid1,SPGridConnection1.FlowCurrent) annotation(Line(points={{20,-175},{15,-175},{15,-147.7},{20,-147.7},{20,-120},{20,
		-115}}));
		end if;
		if (CompPhase==3) then
			connect(COMPGrid3,COMPGridConnection3.LVFlowCurrent) annotation(Line(points={{-60,-175},{-65,-175},{-65,-147.7},{-60,-147.7},{-60,-120},{-60,
		-115}}));
		end if;
		if (CompPhase==1) then
			connect(COMPGrid1,COMPGridConnection1.FlowCurrent) annotation(Line(points={{-125,-175},{-130,-175},{-130,-147.7},{-125,-147.7},{-125,-120},{-125,
		-115}}));
		end if;
		connect(ToFlow.Pipe,FlowHP) annotation(Line(
			points={{30,-5},{25,-5},{5,-5},{0,-5}},
			color={190,30,45}));
		connect(FromReturn.Pipe,ReturnHP) annotation(Line(
			points={{30,-35},{25,-35},{5,-35},{0,-35}},
			color={190,30,45},
			thickness=0.0625));
		connect(FromSource.Pipe,SourcePipeIn) annotation(Line(
			points={{30,30},{25,30},{5,30},{0,30}},
			color={190,30,45},
			thickness=0.0625));
		connect(ToSource.Pipe,SourcePipeOut) annotation(Line(
			points={{30,60},{25,60},{5,60},{0,60}},
			color={190,30,45}));
	annotation(
		Icon(
			coordinateSystem(extent={{-200,-200},{200,200}}),
			graphics={
							Bitmap(
								imageSource="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",
								extent={{-200,-200},{200,200}}),
							Text(
								textString="DZ",
								fontSize=14,
								textStyle={
									TextStyle.Bold},
								lineColor={0,128,255},
								fillColor={255,255,255},
								extent={{44.1,-51.4},{277.4,-288.1}})}),
		experiment(
			StopTime=1,
			StartTime=0,
			Tolerance=1e-06,
			Interval=0.002,
			__esi_Solver(
				bSplitCodeGen=false,
				typename="CVODE"),
			__esi_MaxInterval="0.002",
			__esi_AbsTolerance="1e-6"));
end GroundSourceHeatPump;
