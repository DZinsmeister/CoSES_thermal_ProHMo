// CP: 65001
// SimulationX Version: 4.2.3.69223
within CoSES_Models.HeatGenerator.GeneralModels;
model AirSourceHeatPump "Air source heat pump (not yet validated)"
	import GreenCity.GreenBuilding.HeatPump.*;
	import GreenCity.GreenBuilding.*;
	import GreenCity.*;
	GreenCity.Interfaces.Thermal.DefineVolumeFlow ToFlow "Specifies a Thermal Volume Flow Connector" annotation(Placement(transformation(extent={{200,30},{220,50}})));
	GreenCity.Interfaces.Thermal.ExtractVolumeFlow FromReturn annotation(Placement(transformation(extent={{219,-23},{199,-3}})));
	input Modelica.Blocks.Interfaces.RealInput qvRef(
		quantity="Thermics.VolumeFlow",
		displayUnit="m³/h") "Reference volume flow of circulation pump" annotation(
		Placement(
			transformation(
				origin={115,105},
				extent={{-20,-20},{20,20}},
				rotation=-90),
			iconTransformation(
				origin={100,200},
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
				origin={170,105},
				extent={{-20,-20},{20,20}},
				rotation=-90),
			iconTransformation(
				origin={150,200},
				extent={{-20,-20},{20,20}},
				rotation=-90)),
		Dialog(
			group="Volume Flow",
			tab="Results 1",
			visible=false));
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
				transformation(extent={{-85,61},{-45,101}}),
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
				transformation(extent={{-85,10},{-45,50}}),
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
				transformation(extent={{-85,-42},{-45,-2}}),
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
					origin={-5,105},
					extent={{-20,-20},{20,20}},
					rotation=-90),
				iconTransformation(
					origin={-100,200},
					extent={{-20,-20},{20,20}},
					rotation=-90)),
			Dialog(
				group="I/O",
				tab="Results 1",
				visible=false));
		input Modelica.Blocks.Interfaces.BooleanInput DEICINGon "Switch on/off de-icing process for air heat pumps" annotation(
			Placement(
				transformation(extent={{220,55},{260,95}}),
				iconTransformation(extent={{-220,130},{-180,170}})),
			Dialog(
				group="I/O",
				tab="Results 1",
				visible=false));
	protected
		Boolean DeIcing "DeIcing on/off-switch" annotation(Dialog(
			group="I/O",
			tab="Results 1"));
	public
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
		Modelica.Blocks.Interfaces.RealInput AuxModulation(quantity="Basics.RelMagnitude") if AuxHeat and not ConstantAuxPower "Reference relative power output of the auxiliary heater" annotation(
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
		GreenCity.Interfaces.Electrical.LV3Phase SPGrid3 if(SourcePhase==3) "3-phase connection of source pump to Grid" annotation(Placement(
			transformation(
				origin={95,-140},
				extent={{-10,-10},{10,10}},
				rotation=-90),
			iconTransformation(
				origin={150,-196.7},
				extent={{-10,-10},{10,10}},
				rotation=-90)));
		GreenCity.Interfaces.Electrical.LV1Phase CPGrid1 if(CPPhase==1) "1-phase connection of circulation pump to Grid" annotation(Placement(
			transformation(extent={{155,-150},{175,-130}}),
			iconTransformation(extent={{90,-206.7},{110,-186.7}})));
		GreenCity.Interfaces.Electrical.LV3Phase CPGrid3 if(CPPhase==3) "3-phase connection of circulation pump to Grid" annotation(Placement(
			transformation(extent={{230,-150},{250,-130}}),
			iconTransformation(extent={{90,-206.7},{110,-186.7}})));
		GreenCity.Interfaces.Electrical.LV3Phase AUXGrid3 if(AuxHeat and(AUXPhase==3)) "3-phase connection of auxiliary heating system to Grid" annotation(Placement(
			transformation(extent={{385,-150},{405,-130}}),
			iconTransformation(extent={{-10,-206.7},{10,-186.7}})));
		GreenCity.Interfaces.Electrical.LV1Phase AUXGrid1 if(AuxHeat and(AUXPhase==1)) "1-phase connection of auxiliary heating system to Grid" annotation(Placement(
			transformation(extent={{305,-150},{325,-130}}),
			iconTransformation(extent={{-10,-206.7},{10,-186.7}})));
		GreenCity.Interfaces.Electrical.LV1Phase SPGrid1 if(SourcePhase==1) "1-phase connection of source pump to Grid" annotation(Placement(
			transformation(extent={{10,-150},{30,-130}}),
			iconTransformation(extent={{140,-206.7},{160,-186.7}})));
		GreenCity.Interfaces.Electrical.LV3Phase COMPGrid3 if CompPhase==3 "3-phase connection of compressor to Grid" annotation(Placement(
			transformation(extent={{-70,-150},{-50,-130}}),
			iconTransformation(extent={{40,-206.7},{60,-186.7}})));
		GreenCity.Interfaces.Electrical.LV1Phase COMPGrid1 if CompPhase==1 "1-phase connection of compressor to Grid" annotation(Placement(
			transformation(extent={{-135,-150},{-115,-130}}),
			iconTransformation(extent={{40,-206.7},{60,-186.7}})));
		GreenCity.Interfaces.Thermal.VolumeFlowIn ReturnHP "Return pipe" annotation(Placement(
			transformation(extent={{240,-25},{260,-5}}),
			iconTransformation(extent={{186.7,-60},{206.7,-40}})));
		GreenCity.Interfaces.Thermal.VolumeFlowOut FlowHP "flow pipe" annotation(Placement(
			transformation(extent={{240,30},{260,50}}),
			iconTransformation(extent={{190,90},{210,110}})));
		GreenCity.Interfaces.Environment.EnvironmentConditions EnvironmentConditions "Ambient Connection Connection" annotation(Placement(
			transformation(extent={{75,85},{95,105}}),
			iconTransformation(extent={{-210,-10},{-190,10}})));
	protected
		type VoltageEnum = enumeration( 
			LV "Low-Voltage", 
			MV "Medium-Voltage", 
			HV "High-Voltage") "Voltage-Level Enumeration" annotation(initValue=LV);
	public
		output Modelica.Blocks.Interfaces.RealOutput COP "Actual COP of heat pump" annotation(
			Placement(
				transformation(extent={{240,90},{260,110}}),
				iconTransformation(extent={{-190,-160},{-210,-140}})),
			Dialog(
				group="Coefficient of Performance",
				tab="Results 1",
				visible=false));
		GreenCity.Interfaces.Electrical.DefineCurrentAC3 SPGridConnection3(VoltageType=VoltageType) if(SourcePhase==3) annotation(Placement(transformation(
			origin={95,-70},
			extent={{-10,-10},{10,10}},
			rotation=-90)));
		GreenCity.Interfaces.Electrical.DefineCurrentAC3 CPGridConnection3(VoltageType=VoltageType) if(CPPhase==3) annotation(Placement(transformation(
			origin={240,-70},
			extent={{10,-10},{-10,10}},
			rotation=90)));
		GreenCity.Interfaces.Electrical.DefineCurrentAC1 CPGridConnection1 if(CPPhase==1) annotation(Placement(transformation(
			origin={165,-70},
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
		Real TSource(
			quantity="Thermics.Temp",
			displayUnit="°C") "Temperature of heat source" annotation(Dialog(
			group="Temperature",
			tab="Results 1",
			visible=false));
	protected
		Real QHeatInput(
			quantity="Basics.Power",
			displayUnit="kW") "actual heat power" annotation(Dialog(
			group="Heating Power",
			tab="Results 1"));
	public
		Real QHeatAux(
			quantity="Basics.Power",
			displayUnit="kW") "Actual auxiliary heat power" annotation(Dialog(
			group="Heating Power",
			tab="Results 1",
			visible=false));
		Real QHeat(
			quantity="Basics.Power",
			displayUnit="kW") "Heat output power of HP" annotation(Dialog(
			group="Heating Power",
			tab="Results 1",
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
		discrete Real DeIcingEndTime(
			quantity="Basics.Time",
			displayUnit="s") "Ending time of de-icing proceess" annotation(Dialog(
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
			origin={20,-70},
			extent={{10,-10},{-10,10}},
			rotation=90)));
		GreenCity.Interfaces.Electrical.DefineCurrentAC3 COMPGridConnection3(VoltageType=VoltageType) if CompPhase==3 annotation(Placement(transformation(
			origin={-60,-70},
			extent={{10,-10},{-10,10}},
			rotation=90)));
		GreenCity.Interfaces.Electrical.DefineCurrentAC1 COMPGridConnection1 if CompPhase==1 annotation(Placement(transformation(
			origin={-125,-70},
			extent={{10,-10},{-10,10}},
			rotation=90)));
		Modelica.Blocks.Tables.CombiTable1D PelCP(
			tableOnFile=true,
			tableName=CPTable,
			fileName=HPFile) "Electrical power demand of circulation pump" annotation(Placement(transformation(extent={{-10,-10},{10,10}})));
		Modelica.Blocks.Tables.CombiTable1D PelSP(
			tableOnFile=true,
			tableName=SPTable,
			fileName=HPFile) "Electrical power demand of source pump" annotation(Placement(transformation(extent={{-10,-10},{10,10}})));
		Modelica.Blocks.Tables.CombiTable2D QHeatPump(
			tableOnFile=true,
			tableName=QHeatTable,
			fileName=HPFile) "Heat power output of heat pump" annotation(Placement(transformation(extent={{-10,-10},{10,10}})));
		Modelica.Blocks.Tables.CombiTable2D COPHeatPump(
			tableOnFile=true,
			tableName=COPTable,
			fileName=HPFile) "COP of heat pump" annotation(Placement(transformation(extent={{-10,-10},{10,10}})));
		parameter Boolean AuxHeat=false "If true, auxiliary heater is installed" annotation(Dialog(
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
	protected
		parameter VoltageEnum VoltageType=VoltageEnum.LV "Voltage-Level" annotation(Dialog(
			group="Voltage-Level",
			tab="Model Configuration"));
	public
		parameter Integer CompPhase=3 "Phase number of HP-compressor" annotation(Dialog(
			group="Voltage-Level",
			tab="Model Configuration"));
		parameter Real cpMed(
			quantity="Thermics.SpecHeatCapacity",
			displayUnit="kJ/(kg·K)")=4177 "Specific heat capacity of heating medium" annotation(Dialog(
			group="Heating System",
			tab="Heat Pump - Dimensions"));
		parameter Real rhoMed(
			quantity="Basics.Density",
			displayUnit="kg/m³")=1000 "Density of heating medium" annotation(Dialog(
			group="Heating System",
			tab="Heat Pump - Dimensions"));
		parameter Real VHP(
			quantity="Geometry.Volume",
			displayUnit="l")=0.01 "Heating medium volume of HP" annotation(Dialog(
			group="Dimensions",
			tab="Heat Pump - Dimensions"));
		parameter Real TAmbient(
			quantity="Thermics.Temp",
			displayUnit="°C")=291.14999999999998 "Ambient temperature" annotation(Dialog(
			group="Heat Losses",
			tab="Heat Pump - Dimensions"));
		parameter Real QlossRate(
			quantity="Thermics.HeatCond",
			displayUnit="W/K")=0.2 "Heat loss rate of HP-isolation" annotation(Dialog(
			group="Heat Losses",
			tab="Heat Pump - Dimensions"));
		parameter String HPFile=GreenCity.Utilities.Functions.getModelDataDirectory()+"\\heat_pump\\hp_data\\Stiebel_Eltron\\WPL_10_ACS\\SE_WPL_10_ACS.txt" "File name for heat pump characteristics" annotation(Dialog(
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
			displayUnit="kW")=5500 if AuxHeat "Heat power of auxiliary heating system" annotation(Dialog(
			group="Auxiliary Heating Power",
			tab="HP - Power Data"));
		parameter Real TSourceMin(
			quantity="Thermics.Temp",
			displayUnit="°C")=253.14999999999998 "Minimum source temperature for heat pump" annotation(Dialog(
			group="Boundaries",
			tab="HP - Power Data"));
		parameter Real TSourceMax(
			quantity="Thermics.Temp",
			displayUnit="°C")=293.14999999999998 "Maximum source temperature for heat pump" annotation(Dialog(
			group="Boundaries",
			tab="HP - Power Data"));
		parameter Real TFlowMin(
			quantity="Thermics.Temp",
			displayUnit="°C")=288.14999999999998 "Minimum flow temperature for heat pump" annotation(Dialog(
			group="Boundaries",
			tab="HP - Power Data"));
		parameter Real TFlowMax(
			quantity="Thermics.Temp",
			displayUnit="°C")=333.14999999999998 "Maximum flow temperature for heat pump" annotation(Dialog(
			group="Boundaries",
			tab="HP - Power Data"));
		parameter String CPTable="P_CP" "Table name for CP-power behavior" annotation(Dialog(
			group="Power Data",
			tab="CP - Dimensions"));
		parameter Real CosPhiCP=0.98 "Power factor of circulation pump" annotation(Dialog(
			group="Power Data",
			tab="CP - Dimensions"));
		parameter Real qvMax(
			quantity="Thermics.VolumeFlow",
			displayUnit="m³/h")=0.00083333333333333328 "Maximum volume flow of CP" annotation(Dialog(
			group="Boundaries",
			tab="CP - Dimensions"));
		parameter Real qvMin(
			quantity="Thermics.VolumeFlow",
			displayUnit="m³/h")=0.00019444444444444443 "Minimum volume flow of CP" annotation(Dialog(
			group="Boundaries",
			tab="CP - Dimensions"));
		parameter String SPTable="P_VEN" "Table name for volume flow depending power demand of source pump" annotation(Dialog(
			group="Power Data",
			tab="SP - Dimensions"));
		parameter Real CosPhiSP=0.98 "Power factor of source pump" annotation(Dialog(
			group="Power Data",
			tab="SP - Dimensions"));
		parameter Real qvSourceMax(
			quantity="Thermics.VolumeFlow",
			displayUnit="m³/h")=0.97222222222222221 "Maximum volume flow of SP" annotation(Dialog(
			group="Boundaries",
			tab="SP - Dimensions"));
		parameter Real qvSourceMin(
			quantity="Thermics.VolumeFlow",
			displayUnit="m³/h")=0 "Minimum volume flow of SP" annotation(Dialog(
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
			
		if SPon then
			qvSource=max(min(qvSourceRef,qvSourceMax),qvSourceMin);
		else
			qvSource=0;
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
		
		DeIcingEndTime=time.start;
		
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
		DeIcing=DEICINGon;
		TSource=EnvironmentConditions.TAmbient;
		when HPon then
			StartTime=time;
		end when;			
		
		// DeIcing
		when not DeIcing then
			DeIcingEndTime=time;
		end when;
		
		// Heat Pump
		QHeatPump.u1=max(min((TSource),TSourceMax),TSourceMin);
		QHeatPump.u2=max(min((TFlow),TFlowMax),TFlowMin);
		COPHeatPump.u1=max(min((TSource),TSourceMax),TSourceMin);
		COPHeatPump.u2=max(min((TFlow),TFlowMax),TFlowMin);
		
		when (HPon and (not ((time-StartTime)<tHPStart)) and (not DeIcing)) then
			reinit(QHeatInput,QHeatPump.y * RelativeModulation);
			reinit(PCOMP,-QHeatPump.y/(max(COP,1)) * RelativeModulation);
		elsewhen DeIcing then	
			reinit(QHeatInput,0);
			reinit(PCOMP,-QHeatPump.y/(max(COP,1))); // Check for better description of deicing heat demand
		elsewhen (not HPon) then
			reinit(QHeatInput,0);
			reinit(PCOMP,0);
		end when;
		
		if HPon then
			if (not DeIcing) then
				if (((time-StartTime)<tHPStart) and (StartTime>time.start) and (StartTime>DeIcingEndTime)) then
					tHPStart/3*der(QHeatInput)+QHeatInput=QHeatPump.y * RelativeModulation;	
				elseif ((time-DeIcingEndTime)<tHPStart) then
					tHPStart/3*der(QHeatInput)+QHeatInput=QHeatPump.y * RelativeModulation;	
				else
					der(QHeatInput)=der(QHeatPump.y * RelativeModulation);
				end if;
			else
				der(QHeatInput)=0;
			end if;
		
			if (((time-StartTime)<tHPStart) and (StartTime>time.start)) then
				tHPStart/3*der(PCOMP)+PCOMP=-QHeatInput/(max(COPHeatPump.y,1));
			else
				der(PCOMP)=-(der(QHeatInput)*(max(COPHeatPump.y,1))-QHeatInput*der(COPHeatPump.y))/((max(COPHeatPump.y,1))^2);
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
		COP=COPHeatPump.y;
		
		if (abs(CosPhiCP)>1e-10) then
			SCP=abs(PCP)/CosPhiCP;
		else
			SCP=abs(PCP);
		end if;
		
		// Heat Source
		if SPon then
			tSP*der(qvSource)+qvSource=max(min(qvSourceRef,qvSourceMax),qvSourceMin);
			PelSP.u[1]=qvSource;
			PSP=-PelSP.y[1];
		else
			tSP*der(qvSource)+qvSource=0;
			PelSP.u[1]=0;
			PSP=0;
		end if;
		
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
			connect(CPGrid1,CPGridConnection1.FlowCurrent) annotation(Line(points={{165,-140},{160,-140},{160,-113},{165,-113},{165,-85},{165,
		-80}}));
		end if;
		if (CPPhase==3) then
			connect(CPGrid3,CPGridConnection3.LVFlowCurrent) annotation(Line(points={{240,-140},{235,-140},{235,-113},{240,-113},{240,-85},{240,
		-80}}));
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
			connect(SPGrid3,SPGridConnection3.LVFlowCurrent) annotation(Line(points={{95,-140},{90,-140},{90,-113},{95,-113},{95,-85},{95,
		-80}}));
		end if;
		if (SourcePhase==1) then
			connect(SPGrid1,SPGridConnection1.FlowCurrent) annotation(Line(points={{20,-140},{15,-140},{15,-113},{20,-113},{20,-85},{20,
		-80}}));
		end if;
		if (CompPhase==3) then
			connect(COMPGrid3,COMPGridConnection3.LVFlowCurrent) annotation(Line(points={{-60,-140},{-65,-140},{-65,-113},{-60,-113},{-60,-85},{-60,
		-80}}));
		end if;
		if (CompPhase==1) then
			connect(COMPGrid1,COMPGridConnection1.FlowCurrent) annotation(Line(points={{-125,-140},{-130,-140},{-130,-113},{-125,-113},{-125,-85},{-125,
		-80}}));
		end if;
		connect(ToFlow.Pipe,FlowHP) annotation(Line(
			points={{220,40},{225,40},{245,40},{250,40}},
			color={190,30,45}));
		connect(FromReturn.Pipe,ReturnHP) annotation(Line(
			points={{219,-13},{224,-13},{245,-13},{245,-15},{250,-15}},
			color={190,30,45},
			thickness=0.0625));
	annotation(
		Icon(
			coordinateSystem(extent={{-200,-200},{200,200}}),
			graphics={
				Bitmap(
					imageSource="iVBORw0KGgoAAAANSUhEUgAAAG4AAABuCAYAAADGWyb7AAAABGdBTUEAALGPC/xhBQAAABl0RVh0
U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAlSSURBVHhe7Z1biFVVGMd9CYsKhC4aBQ1J
WZQ1JFlP4YNgDz0MBBX0og8G9ZL16JPdILpNFx8kIelCaEFiJKZBQ0pXCAuKoKIxpzJT0TGRKZHd
/u9Z+8z6vvN9+6yz9trnzHi+H/zxzJxvr7X2+p9122fWcp5hGIYRw3CusVyZaVYIXsCTShAgXWzq
vyrNs5Y2ewVvVKQLTLNHKlJwtnr16mxsbCwbHx/PjGZA3aKOUdeSB04qbcHbt293SRu9AnUueZFL
hQTCfaM/KC1PhQSi6Rr9AXXP/cilQgKPHz/ukjF6DcY87kcuFRJo9BfuRy4VEmj0F+5HLhUS2DTo
DkZHR7MNGzZEa8uWLV116SnyhJBG08sj7kcuFRLYJOvWrSN51dGCBQuCli0wGbFSGjFCWkizKYQ8
VUhgU3RYZEaryjxllpZE+/fvd7mkRchLhQQ2QZMVODQ05HJpB+9J16TQyMiIyyUtQl4qJLAJcJM8
H2h4eDhbsWJFsLQuT+q6tCcRUrqdJKUDNbF0EvJRIYGpwc3xPNASYhb6SEvqcqVPP49DnrETCy3f
Jh4N8jxyqZDA1EjdZJ2ZGSqRtzz8zOHdZIoJBU8TM83U+Ok7qZDA1ODm/PTxya2LNDvl8PdTdGv8
XgbKuBQ3i9bjpwn5szyplaeAj5sY/1Ljp++kQgJTcfbEZHbqrW3ZjpV3Z4+ed3FL+Bm/x/uxSMb4
Y2YTxv381+nsnT3fZqseeLSlB9e/lH3+04ls4tiUi6oPL3cuFRKYgpOvvpb9vmhJdvCCK1Th/dMf
7HJXdEcvjYMpmz/5I3th52+VQgzMrQsvdy4VEliXY2sfEY3ShNbXLZIxnbrKmDEORkgmVenvyX/d
1XHwcudSIYF1mHzqeWLKxPkLs4n5l7cr/30Zg5Z35sBBl0I1GNswrkgLa3/dhfUhf79cM4Y+8Zj6
72y2cc+EaE6VPvruqEshDl7uXCokMBaMWX73KBrmyzMPrTQEPtGJkd+lVoGxSzKmk2B2HYQyq5DA
WDCutUzTWhrTwQsWta4JoZfGvbnvkGhMiCZPn3GpdI9QZhUSWFZkHUkmifJa3dTez13RdXppnGRI
LySUWYUE+gZE6fxFskmSzLg2CWVWIYEzJuQGwISuFdZNFjLj2iSUWYUElhVZmCBVdkqZcW0SyqxC
AsuKnBYmD91rYn5gqzPj2iSUWYUEUuPiFNxdmnFtEsqsQgKxiI6R/8TEjIuXUGYVEhgLKt6MmxYW
77EIZVYhgbGYcTMy4xhmHIUExmLGzciMY5hxFBIYixk3IzOOYcZRSGAsZtyMzDiGGUchgbGYcTMy
4xhmHIUExmLGzciMY5hxFBIYS5Rxucw4ilBmFRIYixk3IzOOYcZRSGAsvTAuxT5ynJwQgmRIqMw4
D8k0bGjE77H9yd8sidf4nWZ0iHmSIaEy4xzcABiGbjNkIwdipI2QuL4KyZBQmXE5fFzD5o2Yoyow
tvEtyFXbiyVDQjXwxqGy/bLBtDpbgmG4bx5ea/vRJUNCNfDG+dulqiq5G/iHAd2whGRIqAbaOL7f
OnQ2GAIf86QPhGRIqAbaOP9QG2xkTAm6W7/LhJEcyZBQDbRxfplStrYSf6YqfTAkQ0I1sMbxcSjF
2MbhXTGf9NTZ2NgX4w6vuidKh25fmcw4tDC/TE2AD4OfB38U9u6Xh0VTQoR94DitIUZ+mZxUSGBZ
kXVU1zh/7YYN903h33dK4+rIL5OTCgn0DZC2UIUoeJtVLjOOyi+TkwoJLCuyJxsbc3UyDrO/pvDv
24zrUpJx/KyuOk9LNPgE6BzrKuMUPMblceU1vnG8UlMcWcjhi3DOgBoX2FoV44C/QG5inPNPJ8Kj
Nc6cM07abRqqP69fPm1EAuP4Vzm8K6sD74qlBX4d43AgG9ZyMfLL5aRCAutw5N41LSNEo5imZ6HT
53lxeHdZ95uBEv64C5LS/Wb8pGhKiGBALH65nFRIYB1wEl7LuA7jHFplGYvWKoEu0i+b9iQ/FBjk
f+MASc8pAQ5hCznukAtneeHaWPyyOamQwDrwg9gKodv05BsG4YmLdugonm7w1hFrnmQaxrmqVown
GZI5Vap7ZqVfPicVElgXtLo28xRVmVbCxyMIBnTzLTi6XemoxJA0vp84FXT8IWLm9EGjAOdP4jQ9
PMPcvXBx9u78S1r6asmyYizs5oBR/ucLpdD68LBYAi0JpvPutlQ3Swychofnj89u/Sp7+JltLa3f
tLuYxGA8rNM9+ghlVSGBqeEVBxNikFqeL7RC5AXxLtEXul7N7E7wDxDySo2fvpMKCUwNTz/WOKB1
eaFCRcf8oVGJGVcTtL5uDEQL7KZr1Bgo43gFpzCuBK0H6aECIXSDyA+v8acPWFjXaWGcgTION+en
n9K4XsONa+J/tPLTd1Ihgak5l41r4l789J1USGBq+FP4uWwcv5fY2WkVfvpOKiQwNXwajzGoLlij
YQ2H1hwifFiqnpCEgOv5eF03TQk/fScVEpga3BzPA5UJQzG9j1HVOk0TxiMprRChZfE8mxjfgJ+H
kwoJbAL+Fc25IBjaBEJeKiSwCfifws111f2WogohPxUS2BSdHlnNFaGbb2JsKxHyVCGBTYKxopsn
HrNJWNz3YkYs5K1CAnsBH/y7VYz5aClSWqHqFULZVUjgXABjJmZ15XS/kzAmNdm9pYT7kUuFBBr9
hfuRS4UEGuk58s8P2e8nvnA/VcP9yKVCAo20fH1gNNv46dVt2v7dfdm+Xx4vTPXhfuRSIYFGWn49
uls0rtT6XYsLE0sDuR+5VEigkR7JsFJLNw9nD+24rngNk7kfuVRIoJGend+vzZ77ZCi7842l2cjW
G1tGQWvevz5b/votxevNny0lXjipkEAjPT/+9R4x6qqNywrBwMc+vLZodeX73I9cKiTQSM/Umcns
lb03F6atevum7NpNtxb/Xvji8sI0vK5tXBMb5Y3p2eX9791QdJVPfnxNYRImJpe+fFvxe/z8xLYr
iRdOKiSwl493Bgm0OoxhZcsqBfPKrvKRlxcSL5xUSGCTX1kMOtqaruwq77jrIuKFk0pbcBN/S2FM
gzUbNw5d54NPX9bmg5PIUC4puGh56DZtzEsLuszSPIxp6B6VllZKRQo2zR6pjOWSLjD1X/BGZTiX
dJGp/4I3lSDAWt7sEbzoaJphGIbBmDfvf2E3twQLSFFpAAAAAElFTkSuQmCC",
					extent={{-197,200},{210,-210}})}),
		experiment(
			StopTime=1,
			StartTime=0,
			Interval=0.002,
			__esi_MaxInterval="0.002"));
end AirSourceHeatPump;
