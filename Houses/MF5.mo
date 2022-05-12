// CP: 65001
// SimulationX Version: 4.2.3.69223
within CoSES_Models.Houses;
model MF5 "House 5 with CHP and CB"
	GreenCity.Interfaces.Electrical.LV3Phase lV3Phase1 "Electrical Low-Voltage AC Three-Phase Connector" annotation(Placement(
		transformation(extent={{230,-385},{250,-365}}),
		iconTransformation(extent={{236.7,90},{256.7,110}})));
	GreenCity.Interfaces.Environment.EnvironmentConditions environmentConditions1 "Environment Conditions Connector" annotation(Placement(
		transformation(extent={{485,20},{505,40}}),
		iconTransformation(extent={{236.7,190},{256.7,210}})));
	Consumer.SimpleHeatedBuilding simpleHeatedBuilding1(
		cellar(
			CoolLoadFactorPerson(tableID "External table object"),
			CoolLoadFactorLigth(tableID "External table object"),
			CoolLoadFactorMachine(tableID "External table object"),
			AppliedLoadFactorLight(tableID "External table object"),
			AppliedLoadFactorMachine(tableID "External table object"),
			PelDIN(tableID "External table object"),
			NumberPersonDIN(tableID "External table object"),
			NumberPerson(tableID "External table object"),
			ElectricalPower(tableID "External table object"),
			ReactivePower(tableID "External table object"),
			BaseLoad(tableID "External table object"),
			NormLoad(tableID "External table object"),
			MachineLoad(tableID "External table object"),
			LightLoad(tableID "External table object"),
			InnerLoad(tableID "External table object")),
		livingZone(
			CoolLoadFactorPerson(tableID "External table object"),
			CoolLoadFactorLight(tableID "External table object"),
			CoolLoadFactorMachine(tableID "External table object"),
			AppliedLoadFactorLight(tableID "External table object"),
			AppliedLoadFactorMachine(tableID "External table object"),
			PelDIN(tableID "External table object"),
			NumberPersonDIN(tableID "External table object"),
			NumberPerson(tableID "External table object"),
			ElectricalPower(tableID "External table object"),
			ReactivePower(tableID "External table object"),
			BaseLoad(tableID "External table object"),
			NormLoad(tableID "External table object"),
			MachineLoad(tableID "External table object"),
			LightLoad(tableID "External table object"),
			InnerLoad(tableID "External table object")),
		roof(
			CoolLoadFactorPerson(tableID "External table object"),
			CoolLoadFactorLigth(tableID "External table object"),
			CoolLoadFactorMachine(tableID "External table object"),
			AppliedLoadFactorLight(tableID "External table object"),
			AppliedLoadFactorMachine(tableID "External table object"),
			PelDIN(tableID "External table object"),
			NumberPersonDIN(tableID "External table object"),
			NumberPerson(tableID "External table object"),
			ElectricalPower(tableID "External table object"),
			ReactivePower(tableID "External table object"),
			BaseLoad(tableID "External table object"),
			NormLoad(tableID "External table object"),
			MachineLoad(tableID "External table object"),
			LightLoad(tableID "External table object"),
			InnerLoad(tableID "External table object")),
		PelTable(tableID "External table object"),
		presenceTable(tableID "External table object"),
		redeclare replaceable parameter GreenCity.Utilities.BuildingData.ParameterSelectionSCB.AgeOfBuilding.To2001 buildingAge,
		nFloors=nFloors,
		nAp=nApartments,
		nPeople=nPeople,
		ALH=ALH,
		outline=true,
		livingTZoneInit(displayUnit="K")=TLiving_Init,
		UseStandardHeatNorm=UseStandardHeatNorm,
		QHeatNormLivingArea=QHeatNormLivingArea,
		n=n,
		TFlowHeatNorm(displayUnit="K")=TFlowHeatNorm,
		TReturnHeatNorm(displayUnit="K")=TReturnHeatNorm,
		TRef(displayUnit="K")=TRef,
		qvMaxLivingZone(displayUnit="m³/s")=qvMaxLivingZone,
		roofTZoneInit(displayUnit="K")=TRoof_Init,
		cellarTZoneInit(displayUnit="K")=TCellar_Init,
		UseIndividualPresence=UseIndividualPresence,
		PresenceFile=PresenceFile,
		Presence_WeeklyRepetition=true,
		UseIndividualElecConsumption=UseIndividualElecConsumption,
		ElConsumptionFile=ElConsumptionFile,
		ElConsumptionTable=ElConsumptionTable,
		ElConsumptionFactor=ElFactor,
		ElConsumption_YearlyRepetition=true,
		ActivateNightTimeReduction=ActivateNightTimeReduction,
		Tnight(displayUnit="K")=Tnight,
		NightTimeReductionStart(displayUnit="s")=NightTimeReductionStart,
		NightTimeReductionEnd(displayUnit="s")=NightTimeReductionEnd,
		VariableTemperatureProfile=VariableTemperatureProfile,
		TMin(displayUnit="K")=TMin,
		ceilingInsul=0,
		wallInsul=0,
		ceilingInsA=0.8,
		wallInsA=0.6,
		floorInsA=0.8) "Heated 3-zone-building with changeable heating system" annotation(Placement(transformation(extent={{375,-90},{415,-50}})));
	GreenCity.GreenBuilding.HeatingSystem.HeatingUnitFlowTemperature heatingUnitFlowTemperature1(
		CirculationPump(PPump(tableID "External table object")),
		qvMaxPump(displayUnit="l/min")=0.0005) annotation(Placement(transformation(extent={{295,-85},{330,-50}})));
	Consumer.DHW_demand dHW_demand1(
		Load(tableID "External table object"),
		WeeklyData=WeeklyData,
		File=File,
		Table=Table,
		DHWfactor=DHWfactor) annotation(Placement(transformation(extent={{415,-150},{435,-130}})));
	GreenCity.Utilities.Electrical.Grid grid1(
		OutputType=GreenCity.Utilities.Electrical.Grid.OutputEnum.MasterGrid,
		useA=true,
		useB=true,
		useC=true,
		useD=true,
		useE=true,
		useF=true) annotation(Placement(transformation(extent={{165,-280},{205,-240}})));
	GreenCity.Utilities.Electrical.PhaseTap phaseTap1 annotation(Placement(transformation(extent={{275,-265},{285,-255}})));
	Storage.HeatStorageCombined WolfSPU2_2000(
		VStorage=1.95,
		dStorage=1.1,
		QlossRate=7,
		LinearProfile=TSLinearProfile,
		TupInit(displayUnit="K")=TSTupInit,
		TlowInit(displayUnit="K")=TSTlowInit,
		TLayerVector(displayUnit="K")=TSTLayerVector,
		TMax(displayUnit="K")=Tmax_TS,
		alphaMedStatic=1,
		use1=true,
		iFlow1=9,
		iReturn1=2,
		use2=false,
		HE2=true,
		iFlow2=5,
		AHeatExchanger2=25,
		VHeatExchanger2=0.0165,
		use4=true,
		iFlow4=9,
		iReturn4=2,
		use5=true,
		iFlow5=9,
		iReturn5=2) "Heat storage with variable temperature profile" annotation(Placement(transformation(extent={{165,-179},{200,-105}})));
	GreenCity.Interfaces.Thermal.DefineVolumeFlow defineVolumeFlow1 annotation(Placement(transformation(
		origin={210,-10},
		extent={{-10,-10},{10,10}},
		rotation=-90)));
	GreenCity.Interfaces.Thermal.ExtractVolumeFlow extractVolumeFlow1 annotation(Placement(transformation(
		origin={180,-10},
		extent={{10,-10},{-10,10}},
		rotation=-90)));
	GreenCity.Utilities.Electrical.PhaseTap phaseTap5 annotation(Placement(transformation(extent={{210,-210},{220,-200}})));
	GreenCity.Utilities.Electrical.PhaseTap phaseTap6 annotation(Placement(transformation(extent={{215,-225},{225,-215}})));
	Distribution.HydraulicSwitch2HG hydraulicSwitch2HG1(
		FeedInPump(PPump(tableID "External table object")),
		ExtractionPump1(PPump(tableID "External table object"))) annotation(Placement(transformation(extent={{150,-75},{220,-60}})));
	Modelica.Blocks.Sources.RealExpression CBControlIn(y=CBIn) annotation(Placement(transformation(extent={{-40,-40},{-20,-20}})));
	Modelica.Blocks.Sources.RealExpression CHPModulation(y=CHPin) annotation(Placement(transformation(extent={{-40,-110},{-20,-90}})));
	Modelica.Blocks.Sources.BooleanExpression CHP_EVU(y=(CHPEVU and not StandardCHPcontrol) or CHPon) "Set output signal to a time varying Boolean expression" annotation(Placement(transformation(extent={{-40,-65},{-20,-45}})));
	Modelica.Blocks.Sources.RealExpression TColdWater(y(quantity="Basics.Temp")=288.15) annotation(Placement(transformation(extent={{470,-165},{450,-145}})));
	protected
		parameter Boolean CBControlMode=false "If true, flow temperature controlled, else power output is controlled" annotation(Dialog(
			group="Condensing Boiler",
			tab="Heat Generator Parameters"));
	public
		parameter Real CBDeltaT(quantity="Thermics.TempDiff")=20 "Temperature difference between flow and return temperature" annotation(Dialog(
			group="Condensing Boiler",
			tab="Heat Generator Parameters"));
	protected
		parameter Real CBPmax(quantity="Basics.Power")=50000 if not CBControlMode "Maximum power of CB" annotation(Dialog(
			group="Condensing Boiler",
			tab="Heat Generator Parameters"));
	public
		parameter Real CBTmax(quantity="Basics.Temp")=356.15 if CBControlMode "Maximum temperature of CB" annotation(Dialog(
			group="Condensing Boiler",
			tab="Heat Generator Parameters"));
	protected
		parameter Real CBPmin(quantity="Basics.Power")=10000 if not CBControlMode "Minimum power of CB" annotation(Dialog(
			group="Condensing Boiler",
			tab="Heat Generator Parameters"));
	public
		parameter Real CBTmin(quantity="Basics.Temp")=293.15 if CBControlMode "Minimum temperature of CB" annotation(Dialog(
			group="Condensing Boiler",
			tab="Heat Generator Parameters"));
		parameter Real CHPmax(quantity="Basics.Power")=5000 "Maximum electrical power of CHP" annotation(Dialog(
			group="CHP",
			tab="Heat Generator Parameters"));
		parameter Real CHPmin(quantity="Basics.Power")=2900 "Minimum electrical power of CHP" annotation(Dialog(
			group="CHP",
			tab="Heat Generator Parameters"));
		parameter Boolean CPC=true "If true, solar thermal collector is CPC collector, else, solar thermal collector is a flat plate collector" annotation(Dialog(
			group="Solar Thermal Collector",
			tab="Heat Generator Parameters"));
		parameter Real alphaModule(
			quantity="Geometry.Angle",
			displayUnit="°")=0.6108652381980153 "Inclination angle of solar thermal collector" annotation(Dialog(
			group="Solar Thermal Collector",
			tab="Heat Generator Parameters"));
		parameter Real betaModule(
			quantity="Geometry.Angle",
			displayUnit="°")=3.1415926535897931 "Orientation angle of solar thermal collector" annotation(Dialog(
			group="Solar Thermal Collector",
			tab="Heat Generator Parameters"));
		parameter Integer nSeries=1 "Number of solar thermal collectors in series" annotation(Dialog(
			group="Solar Thermal Collector",
			tab="Heat Generator Parameters"));
		parameter Integer nParallel=1 "Number of solar thermal collectors in parallel" annotation(Dialog(
			group="Solar Thermal Collector",
			tab="Heat Generator Parameters"));
		parameter Real AModule(
			quantity="Geometry.Area",
			displayUnit="m²")=1.312 "Effective surface area of solar thermal collector" annotation(Dialog(
			group="Solar Thermal Collector",
			tab="Heat Generator Parameters"));
		parameter Real VAbsorber(quantity="Geometry.Volume")=1.7 "Absorber volume" annotation(Dialog(
			group="Solar Thermal Collector",
			tab="Heat Generator Parameters"));
		parameter Real Tmax_TS(quantity="Basics.Temp")=353.15 "Maximum temperature within the thermal storage" annotation(Dialog(
			group="Thermal Storage",
			tab="Storage Parameters"));
		parameter Real T0_TS(quantity="Basics.Temp")=313.15 "Temperature level to calculate the stored energy (e.g. return temperature of consumption)" annotation(Dialog(
			group="Thermal Storage",
			tab="Storage Parameters"));
		parameter Boolean TSLinearProfile=true "If true, the temperature profile at simulation begin within the storage is linear, if false the profile is defined by a temperature vector" annotation(Dialog(
			group="Thermal Storage",
			tab="Storage Parameters"));
		parameter Real TSTupInit(
			quantity="Thermics.Temp",
			displayUnit="°C")=353.15 if TSLinearProfile "Temperature of upmost heat storage layer at simulation begin" annotation(Dialog(
			group="Thermal Storage",
			tab="Storage Parameters"));
		parameter Real TSTlowInit(
			quantity="Thermics.Temp",
			displayUnit="°C")=313.14999999999998 if TSLinearProfile "Temperature of lowmost heat storage layer at simulation begin" annotation(Dialog(
			group="Thermal Storage",
			tab="Storage Parameters"));
		parameter Real TSTLayerVector[20](quantity="Basics.Temp")={313.15,313.15,313.15,313.15,313.15,313.15,313.15,313.15,313.15,313.15,313.15,313.15,313.15,313.15,313.15,313.15,313.15,313.15,313.15,313.15} if not TSLinearProfile "Vector of temperature profile of the layers at simulation begin, element 1 is at lowest layer" annotation(Dialog(
			group="Thermal Storage",
			tab="Storage Parameters"));
		parameter Integer nPeople(quantity="Basics.Unitless")=6 "Number of people living in the building" annotation(Dialog(
			group="Size",
			tab="Consumption Parameters"));
		parameter Integer nFloors=2 "nFloors" annotation(Dialog(
			group="Size",
			tab="Consumption Parameters"));
		parameter Integer nApartments=1 "nApartments" annotation(Dialog(
			group="Size",
			tab="Consumption Parameters"));
		parameter Real ALH(
			quantity="Geometry.Area",
			displayUnit="m²")=300 "Heated (living) area (e.g. 50m² per person)" annotation(Dialog(
			group="Size",
			tab="Consumption Parameters"));
		parameter Boolean UseStandardHeatNorm=false "If true, use standard area-specific heating power, else define it manually" annotation(Dialog(
			group="Heating System",
			tab="Consumption Parameters"));
		parameter Real QHeatNormLivingArea(quantity="Thermics.HeatFlowSurf")=22 if not UseStandardHeatNorm "Area-specific heating power - modern radiators: 14 - 15 W/m²; space heating: 15 W/m²" annotation(Dialog(
			group="Heating System",
			tab="Consumption Parameters"));
		parameter Real n=1.3 "Heating system exponent - radiator: 1.3; floor heating: 1 - 1.1" annotation(Dialog(
			group="Heating System",
			tab="Consumption Parameters"));
		parameter Real TFlowHeatNorm(quantity="Basics.Temp")=333.15 "Normal flow temperature - radiator: 55 - 75°C; floor heating: 35 - 45°C" annotation(Dialog(
			group="Heating System",
			tab="Consumption Parameters"));
		parameter Real TReturnHeatNorm(quantity="Basics.Temp")=318.15 "Normal return temperature - radiator: 45 - 65°C; floor heating: 28 - 35°C" annotation(Dialog(
			group="Heating System",
			tab="Consumption Parameters"));
		parameter Real TRef(quantity="Basics.Temp")=294.15 "Reference indoor temperature" annotation(Dialog(
			group="Heating System",
			tab="Consumption Parameters"));
		parameter Real qvMaxLivingZone(quantity="Thermics.VolumeFlow")=0.00025 "Maximumg flow rate in Living Zone" annotation(Dialog(
			group="Heating System",
			tab="Consumption Parameters"));
		parameter Real TLiving_Init(quantity="Basics.Temp")=294.15 "Initial Temperature" annotation(Dialog(
			group="Heating System",
			tab="Consumption Parameters"));
		parameter Real TRoof_Init(quantity="Basics.Temp")=274.65 "Initial Temperature" annotation(Dialog(
			group="Heating System",
			tab="Consumption Parameters"));
		parameter Real TCellar_Init(quantity="Basics.Temp")=280.15 "Initial Temperature" annotation(Dialog(
			group="Heating System",
			tab="Consumption Parameters"));
		parameter Boolean UseIndividualPresence=true "If the presence is used, individual presence data has to be provided, else standart presence is used" annotation(Dialog(
			group="Additional Yields/Losses",
			tab="Consumption Parameters"));
		parameter String PresenceFile=classDirectory()+"Data\\MF5_WholeYear.txt" if UseIndividualPresence "File with presence timeseries (presence in %; 0% - no one is at home; 100% - everyone is at home)" annotation(Dialog(
			group="Additional Yields/Losses",
			tab="Consumption Parameters"));
		parameter Boolean UseIndividualElecConsumption=true "If individual electricity consumption is used, individual consumption data ha to be provided, else standart load profiles are used" annotation(Dialog(
			group="Additional Yields/Losses",
			tab="Consumption Parameters"));
		parameter String ElConsumptionFile=classDirectory()+"Data\\MF5_WholeYear.txt" if UseIndividualElecConsumption "File with electric consumption time series (consumption in kW)" annotation(Dialog(
			group="Additional Yields/Losses",
			tab="Consumption Parameters"));
		parameter String ElConsumptionTable="Pel" if UseIndividualElecConsumption "Table with electric consumption time series (consumption in W)" annotation(Dialog(
			group="Additional Yields/Losses",
			tab="Consumption Parameters"));
		parameter Real YearlyElecConsumption_kWh=6500 if UseIndividualElecConsumption "YearlyElecConsumption_kWh" annotation(Dialog(
			group="Additional Yields/Losses",
			tab="Consumption Parameters"));
		parameter Real ElFactor=YearlyElecConsumption_kWh/5175 if UseIndividualElecConsumption "ElFactor" annotation(Dialog(
			group="Additional Yields/Losses",
			tab="Consumption Parameters"));
		parameter Boolean ActivateNightTimeReduction=false "If true, night time reduction is activated, else temperature is constant" annotation(Dialog(
			group="Temperature Control",
			tab="Consumption Parameters"));
		parameter Real NightTimeReductionStart(
			quantity="Basics.Time",
			displayUnit="h")=82800 if ActivateNightTimeReduction "NightTimeReductionStart" annotation(Dialog(
			group="Temperature Control",
			tab="Consumption Parameters"));
		parameter Real NightTimeReductionEnd(
			quantity="Basics.Time",
			displayUnit="h")=25200 if ActivateNightTimeReduction "NightTimeReductionEnd" annotation(Dialog(
			group="Temperature Control",
			tab="Consumption Parameters"));
		parameter Real Tnight(quantity="Basics.Temp")=291.15 if ActivateNightTimeReduction "Temperature at night" annotation(Dialog(
			group="Temperature Control",
			tab="Consumption Parameters"));
		parameter Boolean VariableTemperatureProfile=false "If true, presence will be used to define the temperature (if less people are at home, less rooms are heated and the average temperature will decrease)" annotation(Dialog(
			group="Temperature Control",
			tab="Consumption Parameters"));
		parameter Real TMin(quantity="Basics.Temp")=292.15 if VariableTemperatureProfile "Minimum temperature, when noone is at home (TRefSet = TMin + (TRef - TMin) * Presence(t))" annotation(Dialog(
			group="Temperature Control",
			tab="Consumption Parameters"));
		parameter Boolean WeeklyData=false "If true: DHW consumption data repeats weekly" annotation(Dialog(
			group="DHW consumption",
			tab="Consumption Parameters"));
		parameter String File=classDirectory()+"Data\\MF5_WholeYear.txt" "DHW Data File" annotation(Dialog(
			group="DHW consumption",
			tab="Consumption Parameters"));
		parameter String Table="V_DHW" "DHW Table Name" annotation(Dialog(
			group="DHW consumption",
			tab="Consumption Parameters"));
		parameter Real V_DHWperDay_l=nPeople*50 "V_DHWperDay_l" annotation(Dialog(
			group="DHW consumption",
			tab="Consumption Parameters"));
		parameter Real DHWfactor=V_DHWperDay_l/300 "Factor, with which the DHW consumption gets multiplied" annotation(Dialog(
			group="DHW consumption",
			tab="Consumption Parameters"));
		Modelica.Blocks.Interfaces.BooleanInput StandardCBcontrol "If true, standard control will be used to control the condensing boiler" annotation(
			Placement(
				transformation(extent={{-95,-35},{-55,5}}),
				iconTransformation(
					origin={150,250},
					extent={{-20,-20},{20,20}},
					rotation=-90)),
			Dialog(
				group="Condensing Boiler",
				tab="Standard Control",
				visible=false));
		parameter Real SOCminCB(quantity="Basics.RelMagnitude")=0.5 "SOC, at which the CB turns on (SOCmin < SOCmin and T<TStart)" annotation(Dialog(
			group="Condensing Boiler",
			tab="Standard Control"));
		parameter Real SOCmaxCB(quantity="Basics.RelMagnitude")=0.65 "SOC, at which the CB turns off" annotation(Dialog(
			group="Condensing Boiler",
			tab="Standard Control"));
		parameter Real TStartCB(quantity="Basics.Temp")=333.15 "Minimum Temperature, at the top, at which the CB turns on (T<TStart and SOCmin < SOCmin)" annotation(Dialog(
			group="Condensing Boiler",
			tab="Standard Control"));
		parameter Real TStopCB(quantity="Basics.Temp")=343.15 "Temperature at the bottom, at which the CB stops" annotation(Dialog(
			group="Condensing Boiler",
			tab="Standard Control"));
	protected
		Boolean CBon "Condensing boiler is switched on" annotation(
			HideResult=false,
			Dialog(
				group="Condensing Boiler",
				tab="Standard Control"));
	public
		Real CBinStandardControl "Standard control value of the CB modulation" annotation(Dialog(
			group="Condensing Boiler",
			tab="Standard Control",
			visible=false));
		Modelica.Blocks.Interfaces.BooleanInput StandardCHPcontrol "If true, standard control will be used to control the CHP" annotation(
			Placement(
				transformation(extent={{-95,-105},{-55,-65}}),
				iconTransformation(
					origin={50,250},
					extent={{-20,-20},{20,20}},
					rotation=-90)),
			Dialog(
				group="CHP",
				tab="Standard Control",
				visible=false));
		parameter Real SOCminCHP(quantity="Basics.RelMagnitude")=0.6 "SOC, at which the CHP turns on (SOCmin < SOCmin and T<TStart)" annotation(Dialog(
			group="CHP",
			tab="Standard Control"));
		parameter Real SOCmaxCHP(quantity="Basics.RelMagnitude")=0.9500000000000001 "SOC, at which the CHP turns off" annotation(Dialog(
			group="CHP",
			tab="Standard Control"));
		parameter Real TStartCHP(quantity="Basics.Temp")=338.15 "Minimum Temperature, at the top, at which the CHP turns on (T<TStart and SOCmin < SOCmin)" annotation(Dialog(
			group="CHP",
			tab="Standard Control"));
		parameter Real TStopCHP(quantity="Basics.Temp")=343.15 "Temperature at the bottom, at which the CHP stops" annotation(Dialog(
			group="CHP",
			tab="Standard Control"));
	protected
		Boolean CHPon "CHP is switched on" annotation(
			HideResult=false,
			Dialog(
				group="CHP",
				tab="Standard Control"));
	public
		Real CHPinStandardControl(quantity="Basics.RelMagnitude") "Standard control value of the CHP modulation" annotation(Dialog(
			group="CHP",
			tab="Standard Control",
			visible=false));
		Boolean CHPEVU "CHPEVU" annotation(Dialog(
			group="CHP",
			tab="Standard Control",
			visible=false));
	protected
		Real CBIn "Input Signal of Condensing Boiler" annotation(
			HideResult=false,
			Dialog(tab="Results CB"));
	public
		Real CB_S_TM_VL(quantity="Basics.Temp") "Condensing boiler flow temperature" annotation(Dialog(
			group="Temperatures",
			tab="Results CB",
			visible=false));
		Real CB_S_TM_RL(quantity="Basics.Temp") "Condensing boiler return temperature" annotation(Dialog(
			group="Temperatures",
			tab="Results CB",
			visible=false));
		Real CB_S_FW_HC(
			quantity="Thermics.VolumeFlow",
			displayUnit="l/min") "Volume flow condensing boiler" annotation(Dialog(
			group="Volume Flow",
			tab="Results CB",
			visible=false));
		Real CB_S_FG(
			quantity="Thermics.VolumeFlow",
			displayUnit="l/min") "Gas flow condensing boiler" annotation(Dialog(
			group="Volume Flow",
			tab="Results CB",
			visible=false));
		Real CB_VFuel(
			quantity="Basics.Volume",
			displayUnit="l") "Demanded fuel volume" annotation(Dialog(
			group="Volume Flow",
			tab="Results CB",
			visible=false));
		Real CB_P_heat_is(quantity="Basics.Power") "Heat output power of condensing boiler" annotation(Dialog(
			group="Power",
			tab="Results CB",
			visible=false));
		Real CB_P_gas_is(quantity="Basics.Power") "Gas power of condensing boiler" annotation(Dialog(
			group="Power",
			tab="Results CB",
			visible=false));
		Real CB_E_heat_produced(
			quantity="Basics.Energy",
			displayUnit="kWh") "Heat output of condensing boiler" annotation(Dialog(
			group="Energy",
			tab="Results CB",
			visible=false));
		Real CB_E_gas_consumed(
			quantity="Basics.Energy",
			displayUnit="kWh") "Gas input of condensing boiler" annotation(Dialog(
			group="Energy",
			tab="Results CB",
			visible=false));
		Real CB_Efficiency(quantity="Basics.RelMagnitude") "Heating efficiency" annotation(Dialog(
			group="Efficiency",
			tab="Results CB",
			visible=false));
	protected
		Real CHPin "Input Signal of CHP" annotation(
			HideResult=false,
			Dialog(tab="Results CHP"));
	public
		Real CHP_S_TM_VL(quantity="Basics.Temp") "CHP flow temperature" annotation(Dialog(
			group="Temperatures",
			tab="Results CHP",
			visible=false));
		Real CHP_S_TM_RL(quantity="Basics.Temp") "CHP return temperature" annotation(Dialog(
			group="Temperatures",
			tab="Results CHP",
			visible=false));
		Real CHP_S_FW_HC(
			quantity="Thermics.VolumeFlow",
			displayUnit="l/min") "Volume flow CHP" annotation(Dialog(
			group="Volume Flow",
			tab="Results CHP",
			visible=false));
		Real CHP_S_FG(
			quantity="Thermics.VolumeFlow",
			displayUnit="l/min") "Gas flow CHP" annotation(Dialog(
			group="Volume Flow",
			tab="Results CHP",
			visible=false));
		Real CHP_VFuel(
			quantity="Basics.Volume",
			displayUnit="l") "Demanded fuel volume" annotation(Dialog(
			group="Volume Flow",
			tab="Results CHP",
			visible=false));
		Real CHP_P_heat_is(quantity="Basics.Power") "Heat output power of CHP" annotation(Dialog(
			group="Power",
			tab="Results CHP",
			visible=false));
		Real CHP_P_el_is(quantity="Basics.Power") "Electric power output of CHP" annotation(Dialog(
			group="Power",
			tab="Results CHP",
			visible=false));
		Real CHP_P_gas_is(quantity="Basics.Power") "Gas power of CHP" annotation(Dialog(
			group="Power",
			tab="Results CHP",
			visible=false));
		Real CHP_E_heat_produced(
			quantity="Basics.Energy",
			displayUnit="kWh") "Heat output of CHP" annotation(Dialog(
			group="Energy",
			tab="Results CHP",
			visible=false));
		Real CHP_E_el_produced(
			quantity="Basics.Energy",
			displayUnit="kWh") "Electricity output of CHP" annotation(Dialog(
			group="Energy",
			tab="Results CHP",
			visible=false));
		Real CHP_E_gas_consumed(
			quantity="Basics.Energy",
			displayUnit="kWh") "Gas input of CHP" annotation(Dialog(
			group="Energy",
			tab="Results CHP",
			visible=false));
		Real CHP_Efficiency_th(quantity="Basics.RelMagnitude") "Thermal efficiency" annotation(Dialog(
			group="Efficiency",
			tab="Results CHP",
			visible=false));
		Real CHP_Efficiency_el(quantity="Basics.RelMagnitude") "Electric efficiency" annotation(Dialog(
			group="Efficiency",
			tab="Results CHP",
			visible=false));
		Real CHP_Efficiency_total(quantity="Basics.RelMagnitude") "Overall efficiency" annotation(Dialog(
			group="Efficiency",
			tab="Results CHP",
			visible=false));
		Real TS_S_TM_HC_VL(quantity="Basics.Temp") "Flow temperature consumption side" annotation(Dialog(
			group="Temperatures",
			tab="Results TS",
			visible=false));
		Real TS_S_TM_HC_RL(quantity="Basics.Temp") "Return temperature consumption side" annotation(Dialog(
			group="Temperatures",
			tab="Results TS",
			visible=false));
		Real TS_S_TM_PS_VL(quantity="Basics.Temp") "Flow temperature producer side" annotation(Dialog(
			group="Temperatures",
			tab="Results TS",
			visible=false));
		Real TS_S_TM_PS_RL(quantity="Basics.Temp") "Return temperature producer side" annotation(Dialog(
			group="Temperatures",
			tab="Results TS",
			visible=false));
		Real TS_S_TM_BT_1(quantity="Basics.Temp") "Thermal storage temperature 1" annotation(Dialog(
			group="Storage Temperatures",
			__esi_groupCollapsed=true,
			tab="Results TS",
			visible=false));
		Real TS_S_TM_BT_2(quantity="Basics.Temp") "Thermal storage temperature 2" annotation(Dialog(
			group="Storage Temperatures",
			tab="Results TS",
			visible=false));
		Real TS_S_TM_BT_3(quantity="Basics.Temp") "Thermal storage temperature 3" annotation(Dialog(
			group="Storage Temperatures",
			tab="Results TS",
			visible=false));
		Real TS_S_TM_BT_4(quantity="Basics.Temp") "Thermal storage temperature 4" annotation(Dialog(
			group="Storage Temperatures",
			tab="Results TS",
			visible=false));
		Real TS_S_TM_BT_5(quantity="Basics.Temp") "Thermal storage temperature 5" annotation(Dialog(
			group="Storage Temperatures",
			tab="Results TS",
			visible=false));
		Real TS_S_TM_BT_6(quantity="Basics.Temp") "Thermal storage temperature 6" annotation(Dialog(
			group="Storage Temperatures",
			tab="Results TS",
			visible=false));
		Real TS_S_TM_BT_7(quantity="Basics.Temp") "Thermal storage temperature 7" annotation(Dialog(
			group="Storage Temperatures",
			tab="Results TS",
			visible=false));
		Real TS_S_TM_BT_8(quantity="Basics.Temp") "Thermal storage temperature 8" annotation(Dialog(
			group="Storage Temperatures",
			tab="Results TS",
			visible=false));
		Real TS_S_TM_BT_9(quantity="Basics.Temp") "Thermal storage temperature 9" annotation(Dialog(
			group="Storage Temperatures",
			tab="Results TS",
			visible=false));
		Real TS_S_TM_BT_10(quantity="Basics.Temp") "Thermal storage temperature 10" annotation(Dialog(
			group="Storage Temperatures",
			tab="Results TS",
			visible=false));
		Real TS_E_Storage_BT(
			quantity="Basics.Energy",
			displayUnit="kWh") "Energy in thermal storage" annotation(Dialog(
			group="Energy",
			tab="Results TS",
			visible=false));
		Real TS_SOC_BT(quantity="Basics.RelMagnitude") "State of charge of the thermal storage" annotation(Dialog(
			group="State of charge",
			tab="Results TS",
			visible=false));
		Real HS_S_TM_VL_bM(quantity="Basics.Temp") "Heat Sink flow temperature before mixing unit" annotation(Dialog(
			group="Temperatures",
			tab="Results HS",
			visible=false));
		Real HS_S_TM_VL_aM(quantity="Basics.Temp") "Heat Sink flow temperature after mixing unit" annotation(Dialog(
			group="Temperatures",
			tab="Results HS",
			visible=false));
		Real HS_S_TM_RL(quantity="Basics.Temp") "Heat sink return temperature" annotation(Dialog(
			group="Temperatures",
			tab="Results HS",
			visible=false));
		Real HS_S_TM_HW_VL(quantity="Basics.Temp") "Heat sink flow temperature hot water" annotation(Dialog(
			group="Temperatures",
			tab="Results HS",
			visible=false));
		Real HS_S_TM_HW_RL(quantity="Basics.Temp") "Heat sink return temperature hot water" annotation(Dialog(
			group="Temperatures",
			tab="Results HS",
			visible=false));
		Real HS_S_TM_Room(quantity="Basics.Temp") "Temperature in the house" annotation(Dialog(
			group="Temperatures",
			tab="Results HS",
			visible=false));
		Real HS_S_FW_HC_aM(
			quantity="Thermics.VolumeFlow",
			displayUnit="l/min") "Volume flow after mixing unit" annotation(Dialog(
			group="Volume Flow",
			tab="Results HS",
			visible=false));
		Real HS_S_FW_HC_bM(
			quantity="Thermics.VolumeFlow",
			displayUnit="l/min") "Volume flow before mixing unit" annotation(Dialog(
			group="Volume Flow",
			tab="Results HS",
			visible=false));
		Real HS_S_FW_HW_VL(
			quantity="Thermics.VolumeFlow",
			displayUnit="l/min") "Volume flow domestic hot water consumption" annotation(Dialog(
			group="Volume Flow",
			tab="Results HS",
			visible=false));
		Real HS_P_DemHeatHC_is(quantity="Basics.Power") "Heating power" annotation(Dialog(
			group="Power",
			tab="Results HS",
			visible=false));
		Real HS_P_DemHeatHW_is(quantity="Basics.Power") "Domestic hot water power" annotation(Dialog(
			group="Power",
			tab="Results HS",
			visible=false));
		Real HS_E_DemHeatHC_consumed(
			quantity="Basics.Energy",
			displayUnit="kWh") "Heating Energy" annotation(Dialog(
			group="Energy",
			tab="Results HS",
			visible=false));
		Real HS_E_DemHeatHW_consumed(
			quantity="Basics.Energy",
			displayUnit="kWh") "Domestic hot water energy" annotation(Dialog(
			group="Energy",
			tab="Results HS",
			visible=false));
		Modelica.Blocks.Interfaces.RealInput CBIn_TSet(quantity="Basics.Temp") if CBControlMode "Condensing boiler input - set temperature (power is constant)" annotation(
			Placement(
				transformation(extent={{-140,-40},{-100,0}}),
				iconTransformation(extent={{-270,-220},{-230,-180}})),
			Dialog(
				tab="Input Signals",
				visible=false));
		Modelica.Blocks.Interfaces.RealInput CBIn_P(quantity="Basics.Power") if not CBControlMode "Condensing boiler input - heat power (temperature difference between supply and return is constant)" annotation(
			Placement(
				transformation(extent={{-140,-70},{-100,-30}}),
				iconTransformation(extent={{-270,-170},{-230,-130}})),
			Dialog(
				tab="Input Signals",
				visible=false));
		Modelica.Blocks.Interfaces.RealInput CHPIn_P(quantity="Basics.Power") "CHP input - electric power" annotation(
			Placement(
				transformation(extent={{-140,-105},{-100,-65}}),
				iconTransformation(extent={{-270,-70},{-230,-30}})),
			Dialog(
				tab="Input Signals",
				visible=false));
		Modelica.Blocks.Interfaces.RealInput TDH_HEXout(quantity="Basics.Temp") "Outlet temperature of district heating heat exchanger" annotation(
			Placement(
				transformation(extent={{-140,70},{-100,110}}),
				iconTransformation(extent={{266.7,-170},{226.7,-130}})),
			Dialog(
				tab="Input Signals",
				visible=false));
		Modelica.Blocks.Interfaces.RealOutput qv_HEX(quantity="Thermics.VolumeFlow") "Volume flow to district heating heat exchanger" annotation(
			Placement(
				transformation(extent={{-120,55},{-100,75}}),
				iconTransformation(extent={{236.7,-10},{256.7,10}})),
			Dialog(
				tab="Input Signals",
				visible=false));
		Modelica.Blocks.Interfaces.RealInput qvDHpump(quantity="Thermics.VolumeFlow") "Reference volume flow of district heating pump - positive: feed in - negative: extraction" annotation(
			Placement(
				transformation(extent={{-140,-5},{-100,35}}),
				iconTransformation(extent={{266.7,-220},{226.7,-180}})),
			Dialog(
				tab="Input Signals",
				visible=false));
		Modelica.Blocks.Interfaces.RealOutput TDH_HEXin(quantity="Basics.Temp") "Inlet temperature of district heating heat exchanger" annotation(
			Placement(
				transformation(extent={{-120,30},{-100,50}}),
				iconTransformation(extent={{236.7,-60},{256.7,-40}})),
			Dialog(
				tab="Input Signals",
				visible=false));
		Modelica.Blocks.Logical.Switch switch3 annotation(Placement(transformation(extent={{-5,-95},{15,-75}})));
		Modelica.Blocks.Sources.RealExpression CHPin_StandardControl(y=CHPinStandardControl) annotation(Placement(transformation(extent={{-40,-80},{-20,-60}})));
		Modelica.Blocks.Logical.Switch switch4 annotation(Placement(transformation(extent={{-5,-25},{15,-5}})));
		Modelica.Blocks.Sources.RealExpression CBin_StandardControl(y=CBinStandardControl) annotation(Placement(transformation(extent={{-40,-10},{-20,10}})));
		HeatGenerator.DigitalTwins.NeoTower5_GC neoTower5_GC1(neoTower2(
			EffTotal_table(tableID "External table object"),
			StartUp_table(tableID "External table object"),
			CoolDown_table(tableID "External table object"))) "Green city of the CHP model based on measurements in the laboratory" annotation(Placement(transformation(extent={{35,-110},{80,-65}})));
		HeatGenerator.DigitalTwins.WolfCGB50_GC wolfCGB50_GC1(wolfCGB1(
			EffHeat_table(tableID "External table object"),
			StartUp_table(tableID "External table object"),
			CoolDown_table(tableID "External table object"),
			PHeat_table(tableID "External table object"),
			DeltaT_table(tableID "External table object"))) "WolfCGB50 validated with CoSES mearusements" annotation(Placement(transformation(extent={{90,-40},{135,5}})));
		GreenCity.Utilities.Thermal.MeasureThermal measureThermal1 annotation(Placement(transformation(extent={{340,-130},{350,-140}})));
		GreenCity.Local.Photovoltaic photovoltaic1 annotation(Placement(transformation(extent={{435,-330},{395,-290}})));
		GreenCity.Local.Controller.PV2ACInverter pV2ACInverter1 annotation(Placement(transformation(extent={{385,-290},{345,-330}})));
		GreenCity.Utilities.Electrical.Grid grid2(
			OutputType=GreenCity.Utilities.Electrical.Grid.OutputEnum.MasterGrid,
			useA=true,
			useD=true) annotation(Placement(transformation(extent={{220,-345},{260,-305}})));
	equation
		// Input Conversion
		// CB
		if CBControlMode then
			CBIn = min(max(0, 10*((CBIn_TSet-CBTmin)/(CBTmax-CBTmin))), 10);
		else
			CBIn = min(max(0, 2 + 8 * ((CBIn_P - CBPmin)/(CBPmax - CBPmin))), 10);
		end if;
		
		//CHP
		if CHPIn_P > 0 then
			CHPin = min(max(CHPmin / CHPmax, (CHPmin / CHPmax + (CHPIn_P - CHPmin) / CHPmax)), 1);
			CHPEVU = true;
		else
			CHPin = 0;
			CHPEVU = false;
		end if;
		
		// Controller
		// CHP
		when ((TS_SOC_BT < SOCminCHP) and (WolfSPU2_2000.TStorage[8] < TStartCHP) and StandardCHPcontrol) then
			CHPon = true;
		elsewhen ((TS_SOC_BT > SOCmaxCHP) or (WolfSPU2_2000.TStorage[3] > TStopCHP) or not StandardCHPcontrol) then
			CHPon = false;
		end when;
		if CHPon then
			CHPinStandardControl = 1;
		else
			CHPinStandardControl = 0;
		end if;
		
		// Condensing boiler
		when ((TS_SOC_BT < SOCminCB) and (TS_S_TM_BT_8 < TStartCB) and StandardCBcontrol) then
			CBon = true;
		elsewhen ((TS_SOC_BT > SOCmaxCB) or (TS_S_TM_BT_3 > TStopCB) or (not StandardCBcontrol)) then
			CBon = false;
		end when;
		if CBon then
			CBinStandardControl = 10;
		else
			CBinStandardControl = 0;
		end if;
		
		// Results
		// Condensing Boiler
		CB_S_TM_VL = wolfCGB50_GC1.TFlow;
		CB_S_TM_RL = wolfCGB50_GC1.TReturn;
		CB_S_FW_HC = wolfCGB50_GC1.qv;
		CB_S_FG = wolfCGB50_GC1.qvFuel;
		CB_VFuel = wolfCGB50_GC1.VFuel;
		CB_P_heat_is = wolfCGB50_GC1.QHeat;
		CB_P_gas_is = wolfCGB50_GC1.PFuel;
		CB_E_heat_produced = wolfCGB50_GC1.EHeat;
		CB_E_gas_consumed = wolfCGB50_GC1.EFuel;
		CB_Efficiency = wolfCGB50_GC1.Efficiency;
		
		// CHP
		CHP_S_TM_VL = neoTower5_GC1.TFlow;
		CHP_S_TM_RL = neoTower5_GC1.TReturn;
		CHP_S_FW_HC = neoTower5_GC1.qv;
		CHP_S_FG = neoTower5_GC1.qvFuel;
		CHP_VFuel = neoTower5_GC1.VFuel;
		CHP_P_heat_is = neoTower5_GC1.QHeat;
		CHP_P_el_is = neoTower5_GC1.PGEN;
		CHP_P_gas_is = neoTower5_GC1.PFuel;
		CHP_E_heat_produced = neoTower5_GC1.EHeat;
		CHP_E_el_produced = neoTower5_GC1.EGEN;
		CHP_E_gas_consumed = neoTower5_GC1.EFuel;
		CHP_Efficiency_th = neoTower5_GC1.HeatEfficiency;
		CHP_Efficiency_el = neoTower5_GC1.ElEfficiency;
		CHP_Efficiency_total = CHP_Efficiency_th + CHP_Efficiency_el;
		
		//Thermal Storage
		TS_S_TM_HC_VL = hydraulicSwitch2HG1.TSupplyHC;
		TS_S_TM_HC_RL = hydraulicSwitch2HG1.TReturnHC;
		TS_S_TM_PS_VL = (hydraulicSwitch2HG1.TSupplyHG1+hydraulicSwitch2HG1.TSupplyHG2)/2;
		TS_S_TM_PS_RL = (hydraulicSwitch2HG1.TReturnHG1+hydraulicSwitch2HG1.TReturnHG2)/2;
		TS_S_TM_BT_1 = WolfSPU2_2000.TStorage[1];
		TS_S_TM_BT_2 = WolfSPU2_2000.TStorage[2];
		TS_S_TM_BT_3 = WolfSPU2_2000.TStorage[3];
		TS_S_TM_BT_4 = WolfSPU2_2000.TStorage[4];
		TS_S_TM_BT_5 = WolfSPU2_2000.TStorage[5];
		TS_S_TM_BT_6 = WolfSPU2_2000.TStorage[6];
		TS_S_TM_BT_7 = WolfSPU2_2000.TStorage[7];
		TS_S_TM_BT_8 = WolfSPU2_2000.TStorage[8];
		TS_S_TM_BT_9 = WolfSPU2_2000.TStorage[9];
		TS_S_TM_BT_10 = WolfSPU2_2000.TStorage[10];
		TS_E_Storage_BT = WolfSPU2_2000.cpMed*WolfSPU2_2000.rhoMed*WolfSPU2_2000.VStorage*((WolfSPU2_2000.TLayer[1]+WolfSPU2_2000.TLayer[2]+WolfSPU2_2000.TLayer[3]+WolfSPU2_2000.TLayer[4]+WolfSPU2_2000.TLayer[5]+WolfSPU2_2000.TLayer[6]+WolfSPU2_2000.TLayer[7]+WolfSPU2_2000.TLayer[8]+WolfSPU2_2000.TLayer[9]+WolfSPU2_2000.TLayer[10])/10-T0_TS);
		TS_SOC_BT = TS_E_Storage_BT/(WolfSPU2_2000.cpMed*WolfSPU2_2000.rhoMed*WolfSPU2_2000.VStorage*(Tmax_TS - T0_TS));
		
		// Heat Sink (Heating)
		HS_S_TM_VL_bM = heatingUnitFlowTemperature1.FlowSupply.T;
		HS_S_TM_VL_aM = heatingUnitFlowTemperature1.FlowSink.T;
		HS_S_TM_RL = heatingUnitFlowTemperature1.ReturnSupply.T;
		HS_S_TM_Room = simpleHeatedBuilding1.TZone[2];
		HS_S_FW_HC_aM = heatingUnitFlowTemperature1.FlowSink.qv;
		HS_S_FW_HC_bM = heatingUnitFlowTemperature1.FlowSupply.qv;
		HS_P_DemHeatHC_is = simpleHeatedBuilding1.QHeat;
		HS_E_DemHeatHC_consumed = simpleHeatedBuilding1.EHeat;
		HS_S_TM_Room = simpleHeatedBuilding1.TZone[2];
		
		// Heat Sink (Domestic Hot Water)
		HS_S_TM_HW_VL = dHW_demand1.FlowHotWater.T;
		HS_S_TM_HW_RL = dHW_demand1.ReturnHotWater.T;
		HS_S_FW_HW_VL = dHW_demand1.qv_DHW;
		HS_P_DemHeatHW_is = dHW_demand1.Q_DHW;
		HS_E_DemHeatHW_consumed = dHW_demand1.E_DHW;
	initial equation
		// enter your equations here
		
		// CHP
		if ((TS_SOC_BT < SOCminCHP) and (WolfSPU2_2000.TStorage[8] < TStartCHP) and StandardCHPcontrol) then
			CHPon = true;
		else
			CHPon = false;
		end if;
		
		// CB
		if ((TS_SOC_BT < SOCminCB) and (TS_S_TM_BT_8 < TStartCB) and StandardCBcontrol) then
			CBon = true;
		else
			CBon = false;
		end if;
	equation
		connect(phaseTap1.Grid1,heatingUnitFlowTemperature1.Grid1) annotation(Line(
			points={{285,-260},{290,-260},{299.3,-260},{299.3,-90},{299.3,-85}},
			color={247,148,29},
			thickness=0.0625));
		connect(grid1.LVGridE,phaseTap1.Grid3) annotation(Line(
			points={{205,-260},{210,-260},{270,-260},{275,-260}},
			color={247,148,29},
			thickness=0.0625));
		connect(grid1.LVGridF,simpleHeatedBuilding1.Grid3) annotation(Line(
			points={{205,-275},{210,-275},{405,-275},{405,-95},{405,-90}},
			color={247,148,29},
			thickness=0.0625));
		connect(simpleHeatedBuilding1.T_Ref,heatingUnitFlowTemperature1.TRef) annotation(
			Line(
				points={{385,-50},{385,-40},{308,-40},{308,-50}},
				color={0,0,127},
				thickness=0.0625),
			__esi_AutoRoute=false);
		connect(simpleHeatedBuilding1.qv_Ref,heatingUnitFlowTemperature1.qvRef) annotation(Line(
			points={{380,-50},{380,-45},{321.3,-45},{321.3,-50}},
			color={0,0,127},
			thickness=0.0625));
		connect(heatingUnitFlowTemperature1.ReturnSink,simpleHeatedBuilding1.PipeOut) annotation(Line(
			points={{330,-76.3},{335,-76.3},{370,-76.3},{370,-75},{375,-75}},
			color={190,30,45},
			thickness=0.0625));
		connect(heatingUnitFlowTemperature1.FlowSink,simpleHeatedBuilding1.PipeIn) annotation(Line(
			points={{330,-58.7},{335,-58.7},{370,-58.7},{370,-60},{375,-60}},
			color={190,30,45}));
		connect(simpleHeatedBuilding1.EnvironmentConditions,environmentConditions1) annotation(Line(
			points={{400,-50},{400,-45},{400,30},{490,30},{495,30}},
			color={192,192,192},
			thickness=0.0625));
		connect(environmentConditions1,dHW_demand1.EnvironmentConditions) annotation(Line(
			points={{495,30},{490,30},{439.7,30},{439.7,-135},{434.7,-135}},
			color={192,192,192},
			thickness=0.0625));
		connect(hydraulicSwitch2HG1.HeatExchangerIn,extractVolumeFlow1.Pipe) annotation(Line(
			points={{180,-60},{180,-55},{180,-25},{180,-20}},
			color={190,30,45}));
		connect(hydraulicSwitch2HG1.HeatExchangerOut,defineVolumeFlow1.Pipe) annotation(Line(
			points={{190,-60},{190,-55},{190,-25},{210,-25},{210,-20}},
			color={190,30,45},
			thickness=0.0625));
		connect(hydraulicSwitch2HG1.qvDistrictHeating,qvDHpump) annotation(Line(
			points={{170,-60},{170,-55},{170,15},{-115,15},{-120,15}},
			color={0,0,127},
			thickness=0.0625));
		connect(phaseTap5.Grid1,hydraulicSwitch2HG1.FeedInPumpOut) annotation(Line(
			points={{220,-205},{225,-205},{225,-55},{210,-55},{210,-60}},
			color={247,148,29},
			thickness=0.0625));
		connect(hydraulicSwitch2HG1.ExtractionPumpOut,phaseTap6.Grid1) annotation(
			Line(
				points={{205,-60},{205,-50},{230,-50},{230,-220},{225,-220}},
				color={247,148,29},
				thickness=0.0625),
			__esi_AutoRoute=false);
		connect(TDH_HEXout,defineVolumeFlow1.TMedium) annotation(Line(
			points={{-120,90},{-115,90},{215,90},{215,5},{215,0}},
			color={0,0,127},
			thickness=0.0625));
		connect(extractVolumeFlow1.qvMedium,defineVolumeFlow1.qvMedium) annotation(Line(
			points={{185,0},{185,5},{205,5},{205,0}},
			color={0,0,127},
			thickness=0.0625));
		connect(extractVolumeFlow1.TMedium,TDH_HEXin) annotation(Line(
			points={{175,0},{175,5},{175,40},{-105,40},{-110,40}},
			color={0,0,127},
			thickness=0.0625));
		connect(qv_HEX,extractVolumeFlow1.qvMedium) annotation(Line(
			points={{-110,65},{-105,65},{185,65},{185,5},{185,0}},
			color={0,0,127},
			thickness=0.0625));
		connect(TColdWater.y,dHW_demand1.TColdWater) annotation(Line(
			points={{449,-155},{444,-155},{430,-155},{430,-154.7},{430,-149.7}},
			color={0,0,127},
			thickness=0.0625));
		connect(CHPModulation.y,switch3.u3) annotation(Line(
			points={{-19,-100},{-14,-100},{-12,-100},{-12,-93},{-7,-93}},
			color={0,0,127},
			thickness=0.0625));
		connect(CBControlIn.y,switch4.u3) annotation(Line(
			points={{-19,-30},{-14,-30},{-12,-30},{-12,-23},{-7,-23}},
			color={0,0,127},
			thickness=0.0625));
		connect(CBin_StandardControl.y,switch4.u1) annotation(Line(
			points={{-19,0},{-14,0},{-12,0},{-12,-7},{-7,-7}},
			color={0,0,127},
			thickness=0.0625));
		connect(CHPin_StandardControl.y,switch3.u1) annotation(Line(
			points={{-19,-70},{-14,-70},{-12,-70},{-12,-77},{-7,-77}},
			color={0,0,127},
			thickness=0.0625));
		connect(switch3.u2,StandardCHPcontrol) annotation(Line(
			points={{-7,-85},{-12,-85},{-70,-85},{-75,-85}},
			color={255,0,255},
			thickness=0.0625));
		connect(switch4.u2,StandardCBcontrol) annotation(Line(
			points={{-7,-15},{-12,-15},{-70,-15},{-75,-15}},
			color={255,0,255},
			thickness=0.0625));
		connect(hydraulicSwitch2HG1.DemandFlow,heatingUnitFlowTemperature1.FlowSupply) annotation(Line(
			points={{219.7,-65},{224.7,-65},{290,-65},{290,-58.7},{295,-58.7}},
			color={190,30,45}));
		connect(hydraulicSwitch2HG1.DemandReturn,heatingUnitFlowTemperature1.ReturnSupply) annotation(Line(
			points={{219.7,-70},{224.7,-70},{290,-70},{290,-76.3},{295,-76.3}},
			color={190,30,45},
			thickness=0.0625));
		connect(CHP_EVU.y,neoTower5_GC1.CHPOn) annotation(Line(
			points={{-19,-55},{-14,-55},{30,-55},{30,-70},{35,-70}},
			color={255,0,255},
			thickness=0.0625));
		connect(switch3.y,neoTower5_GC1.CHPModulation) annotation(Line(
			points={{16,-85},{21,-85},{30,-85},{30,-80},{35,-80}},
			color={0,0,127},
			thickness=0.0625));
		connect(neoTower5_GC1.Return,hydraulicSwitch2HG1.HeatGeneratorReturn1) annotation(Line(
			points={{79.7,-90},{84.7,-90},{145,-90},{145,-70},{150,-70}},
			color={190,30,45},
			thickness=0.0625));
		connect(hydraulicSwitch2HG1.HeatGeneratorSupply1,neoTower5_GC1.Flow) annotation(Line(
			points={{150,-65},{145,-65},{84.7,-65},{84.7,-80},{79.7,-80}},
			color={190,30,45},
			thickness=0.0625));
		connect(neoTower5_GC1.environmentConditions,environmentConditions1) annotation(Line(
			points={{70,-65},{70,-60},{70,30},{490,30},{495,30}},
			color={192,192,192},
			thickness=0.0625));
		connect(wolfCGB50_GC1.Return,hydraulicSwitch2HG1.HeatGeneratorReturn2) annotation(Line(
			points={{134.7,-20},{139.7,-20},{155,-20},{155,-55},{155,-60}},
			color={190,30,45},
			thickness=0.0625));
		connect(hydraulicSwitch2HG1.HeatGeneratorSupply2,wolfCGB50_GC1.Flow) annotation(Line(
			points={{160,-60},{160,-55},{160,-10},{139.7,-10},{134.7,-10}},
			color={190,30,45},
			thickness=0.0625));
		connect(switch4.y,wolfCGB50_GC1.ControlIn) annotation(Line(
			points={{16,-15},{21,-15},{85,-15},{90,-15}},
			color={0,0,127},
			thickness=0.0625));
		connect(wolfCGB50_GC1.lV3Phase,grid1.LVGridB) annotation(Line(
			points={{125,-39.7},{125,-44.7},{125,-260},{160,-260},{165,-260}},
			color={247,148,29},
			thickness=0.0625));
		connect(wolfCGB50_GC1.environmentConditions,environmentConditions1) annotation(Line(
			points={{125,5},{125,10},{125,30},{490,30},{495,30}},
			color={192,192,192},
			thickness=0.0625));
		connect(measureThermal1.TMedium,dHW_demand1.TPipe) annotation(Line(
			points={{345,-130},{345,-125},{430,-125},{430,-130}},
			color={0,0,127},
			thickness=0.0625));
		connect(measureThermal1.PipeOut,dHW_demand1.FlowHotWater) annotation(Line(
			points={{350,-135},{355,-135},{410,-135},{415,-135}},
			color={190,30,45}));
		connect(grid1.LVGridD,phaseTap6.Grid3) annotation(Line(
			points={{205,-245},{210,-245},{210,-220},{215,-220}},
			color={247,148,29},
			thickness=0.0625));
		connect(grid1.LVGridA,phaseTap5.Grid3) annotation(Line(
			points={{165,-245},{160,-245},{160,-205},{205,-205},{210,-205}},
			color={247,148,29},
			thickness=0.0625));
		connect(neoTower5_GC1.lV3Phase,grid1.LVGridC) annotation(Line(
			points={{70,-109.7},{70,-114.7},{70,-275},{160,-275},{165,-275}},
			color={247,148,29},
			thickness=0.0625));
		connect(dHW_demand1.ReturnHotWater,WolfSPU2_2000.ReturnIn5) annotation(Line(
			points={{415,-145},{410,-145},{205,-145},{205,-145.3},{200,-145.3}},
			color={190,30,45}));
		connect(WolfSPU2_2000.FlowOut5,measureThermal1.PipeIn) annotation(Line(
			points={{200,-135.3},{205,-135.3},{335,-135.3},{335,-135},{340,-135}},
			color={190,30,45}));
		connect(hydraulicSwitch2HG1.StorageDischargeReturn,WolfSPU2_2000.ReturnIn4) annotation(Line(
			points={{215,-74.7},{215,-79.7},{215,-120},{205,-120},{200,-120}},
			color={190,30,45}));
		connect(WolfSPU2_2000.FlowOut4,hydraulicSwitch2HG1.StorageDischargeFlow) annotation(Line(
			points={{200,-110},{205,-110},{210,-110},{210,-79.7},{210,-74.7}},
			color={190,30,45}));
		connect(hydraulicSwitch2HG1.StorageChargeReturn,WolfSPU2_2000.ReturnOut1) annotation(Line(
			points={{155,-74.7},{155,-79.7},{155,-120},{160,-120},{165,-120}},
			color={190,30,45},
			thickness=0.0625));
		connect(WolfSPU2_2000.FlowIn1,hydraulicSwitch2HG1.StorageChargeFlow) annotation(Line(
			points={{165,-110},{160,-110},{160,-79.7},{160,-74.7}},
			color={190,30,45},
			thickness=0.0625));
		connect(pV2ACInverter1.MPP,photovoltaic1.MPP) annotation(Line(
			points={{365,-330},{365,-335},{415,-335},{415,-330}},
			color={0,0,127},
			thickness=0.0625));
		connect(photovoltaic1.DC,pV2ACInverter1.DCPV) annotation(Line(
			points={{395,-310},{390,-310},{385,-310}},
			color={247,148,29},
			thickness=0.0625));
		connect(environmentConditions1,photovoltaic1.EnvironmentConditions) annotation(Line(
			points={{495,30},{490,30},{440,30},{440,-310},{435,-310}},
			color={192,192,192},
			thickness=0.0625));
		connect(grid2.LVMastGrid,lV3Phase1) annotation(Line(
			points={{240,-345},{240,-350},{245,-350},{245,-375},{240,-375}},
			color={247,148,29},
			thickness=0.0625));
		connect(grid2.LVGridD,pV2ACInverter1.LVGrid3) annotation(Line(
			points={{260,-310},{265,-310},{340,-310},{345,-310}},
			color={247,148,29},
			thickness=0.0625));
		connect(grid2.LVGridA,grid1.LVMastGrid) annotation(Line(
			points={{220,-310},{215,-310},{185,-310},{185,-285},{185,-280}},
			color={247,148,29},
			thickness=0.0625));
	annotation(
		__esi_neoTower2(
			Return(viewinfo[0](
				tabGroupAlignment=589834,
				typename="ModelInfo")),
			Flow(viewinfo[0](
				tabGroupAlignment=589834,
				typename="ModelInfo")),
			cHP_DZ1(
				ReturnCHP(viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo")),
				FlowCHP(viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo")),
				FromReturn(Pipe(viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"))),
				ToFlow(Pipe(viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo")))),
			measureThermal1(
				PipeOut(viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo")),
				PipeIn(viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo")),
				FromPipe(Pipe(viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"))),
				ToPipe(Pipe(viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo")))),
			measureThermal2(
				PipeOut(viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo")),
				PipeIn(viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo")),
				FromPipe(Pipe(viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"))),
				ToPipe(Pipe(viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"))))),
		__esi_hydraulicSwitch2HG1(viewinfo[0](
			fMin=1,
			fMax=100,
			nf=100,
			kindSweep=1,
			expDataFormat=0,
			expNumberFormat="%.7lg",
			expMatrixNames={
							"A","B","C","D","E"},
			typename="AnaLinSysInfo")),
		Icon(
			coordinateSystem(extent={{-250,-250},{250,250}}),
			graphics={
							Text(
								textString="MF5",
								fontName="TUM Neue Helvetica 55 Regular",
								textStyle={
									TextStyle.Bold},
								extent={{-252.5,269.8},{253.7,97.3}}),
							Bitmap(
								imageSource="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",
								extent={{-216.5,-232.6},{230.2,116.9}}),
							Text(
								textString="DZ",
								fontSize=14,
								textStyle={
									TextStyle.Bold},
								lineColor={0,128,255},
								extent={{164.7,-196.8},{274.7,-260.2}})}),
		Documentation(info="<HTML><HEAD>
<META http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\"> 
<TITLE>House 2 with ST, CB and ASHP (not yet validated)</TITLE> 
<STYLE type=\"text/css\">
table>tbody>tr:hover,th{background-color:#edf1f3}html{font-size:90%}body,table{font-size:1rem}body{font-family:'Open Sans',Arial,sans-serif;color:#465e70}h1,h2{margin:1em 0 .6em;font-weight:600}p{margin-top:.3em;margin-bottom:.2em}table{border-collapse:collapse;margin:1em 0;width:100%;}tr{border:1px solid #beccd3}td,th{padding:.3em 1em; border-width: 1px; border-style: solid; border-color: rgb(190, 204, 211);}td{word-break:break-word}tr:nth-child(even){background-color:#fafafa}th{font-family:'Open Sans Semibold',Arial,sans-serif;font-weight:700;text-align:left;word-break:keep-all}.lib-wrap{width:70%}@media screen and (max-width:800px){.lib-wrap{width:100%}}td p{margin:.2em}
</STYLE>
       
<META name=\"GENERATOR\" content=\"MSHTML 11.00.10570.1001\"></HEAD> 
<BODY>
<H1>House 2 with ST, CB and ASHP</H1>
<HR>

<P>This model is a digital twin of the House&nbsp;2 in the CoSES laboratory (<A 
href=\"https://doi.org/10.1109/PESGM41954.2020.9281442\">https://doi.org/10.1109/PESGM41954.2020.9281442</A>)</P>
<P><BR></P>
<P>The house consists of the following components and default conditions:</P>
<UL>
  <LI>Air Source Heat Pump (ASHP): Wolf CHA10<BR>nominal heating power / COP     
      (A2/W35):   5.75 kW_th&nbsp;/ 4.65<BR>electric auxiliary heater: 6         
  kW<BR>nominal cooling   power / EER (A35/W18): 6.01 kW_th / 5.92</LI>
  <LI>Condensing Boiler: Wolf CGB20, nominal thermal power: 20 kW_th</LI>
  <LI>Solar Thermal emulator of variable size, up to 9 kW_th</LI>
  <LI>PV system of variable size</LI>
  <LI>Thermal Storage: Wolf&nbsp;BSP 800,&nbsp;content: 785 l&nbsp;</LI>
  <LI>Domestic Hot Water (DHW) preparation: Fresh water station        
  (simplified)</LI>
  <LI>Consumption - House parameters:<BR>Construction year: 2007 to 2009 (EnEv   
          2007)<BR>Additional insulation: roof + walls + floor<BR>Number of   
  floors:         2<BR>Number       of apartements: 2<BR>Number of inhabitants:  
     10<BR>Living       area: 500m²<BR>Heating     system:&nbsp;floor     
  heating&nbsp;(supply / return       temperatur:&nbsp;40    
  /&nbsp;30&nbsp;°C)</LI></UL>
<P>Four boolean inputs can activate a predefined standard control for simple     
 simulation results or during a lead time of the simulation. The standard    
control  of each element is as follows:</P>
<UL>
  <LI>ASHP:<BR>Switched on at 100 % modulation,           
  when:<BR>&nbsp;&nbsp;&nbsp;&nbsp;     T_Storage,top         
  &lt;&nbsp;T_Start,HP,high&nbsp;or T_Storage,middle &lt;         
  T_Start,HP,low<BR>Switched   off,     when:<BR>&nbsp;&nbsp;&nbsp;&nbsp;        
   T_Storage,top &gt; T_Stop,HP,high and T_Storage,middle&nbsp;&gt;         
  T_Stop,HP,low<BR><BR></LI>
  <LI>Auxiliary Heater (standard control is active, when ASHP standard control   
        is active):<BR>Switch on at 100%, when:<BR>&nbsp;&nbsp;&nbsp;&nbsp; ASHP 
  =     on     and (T_Storage,top &lt;&nbsp;T_Start,Aux,high&nbsp;or   
  T_Storage,middle   &lt;     T_Start,Aux,low)<BR>Switch off,   
  when:<BR>&nbsp;&nbsp;&nbsp;&nbsp;   ASHP =     off&nbsp;or   
  (T_Storage,top&nbsp;&gt;&nbsp;T_Stop,Aux,high&nbsp;and         
  T_Storage,middle&nbsp;&gt; T_Stop,Aux,low)<BR><BR></LI>
  <LI>ASHP 3way valve:<BR>Domestic hot water should be produced at a higher      
     priority<BR>Switch to the top ports (DHW), when:<BR>&nbsp;&nbsp;&nbsp;      
     T_Storage,top &lt;&nbsp;T_Start,HP,high<BR>Switch to the middle ports       
    (heating), when:<BR>&nbsp;&nbsp;&nbsp;         
  T_Storage,top&nbsp;&gt;&nbsp;T_Stop,HP,high<BR><BR></LI>
  <LI>Condensing Boiler:<BR>The condensing boiler should only operate, if the    
         ASHP cannot provide the required heat.<BR>Switched on at 100 %   
  modulation,             when:<BR>&nbsp;&nbsp;&nbsp;&nbsp; T_Storage,top &lt;   
  T_Start,CB and             SOC_Storage &lt; SOCminCB<BR>Switched off,     
  when:<BR>&nbsp;&nbsp;&nbsp;&nbsp;           T_Storage,bottom &gt; T_Stop,CB or 
      SOC_Storage &gt;   SOCmaxCB<BR><BR></LI>
  <LI>Solar Thermal pump:<BR>The control is&nbsp;based on Green City's           
    'SolarController'<BR>Solar thermal pump switched on,             
  when:<BR>&nbsp;&nbsp;&nbsp;&nbsp; (T_Collector - T_Storage,in) &gt;            
   deltaTonST<BR>Solar thermal pump switched off,             
  when:<BR>&nbsp;&nbsp;&nbsp;&nbsp; (T_Collector - T_Storage,in)&nbsp;&lt;       
        deltaToffST<BR>The pump is controlled with the following             
  conditions:<BR>&nbsp;&nbsp;&nbsp;&nbsp; if (T_Flow - T_Return) &lt;            
   deltaTFlowReturnLow, the reference volume flow is at  minimum             
  level.<BR>&nbsp;&nbsp;&nbsp;&nbsp; if (T_Flow - T_Return) &gt;             
  deltaTFlowReturnMax, the reference volume flow is at  maximum             
  level.<BR>&nbsp;&nbsp;&nbsp;&nbsp; Between the two temperature  boundaries the 
              reference volume flow is linearly  interpolated.<BR></LI></UL>
<P><BR></P>
<DIV class=\"lib-wrap\">
<TABLE class=\"type\">
  <TBODY>
  <TR>
    <TH>Symbol:</TH>
    <TD colspan=\"3\"><IMG width=\"350\" height=\"273\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAV4AAAERCAYAAAAzJc+jAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAAEnQAABJ0Ad5mH3gAAEumSURBVHhe7Z0HmBRV1oYHBAQJSjBgQCSoIIIZUdewqwimFUVEwF1d0V0FBWEwLIirIAoiKGkIQ5CckRyHmc49mSBgwJUV06+uLgICKnz/Pbeququqq3u6mc593uc5z0xXjm+fvnXvrSwwTAzZl9sJ2fnqB438bHTK3ad+YJjMg8XLxIh8ZGdlIStIBMiYYTIIFi8TUywzXobJcFi8DMMwcYbFy8QAKmboBCrGpYzXqqiBy3iZTIbFyzAME2dYvExMUTJeJftlGEaBxcvEgX3I7aQrauCnbUyGw+Jl4ohfwFzGy2QyLF4mphgfrnGRA8MQLF4mxuiKGbiIgWEkLF4mfuRn+7JfLmpgMhkWLxMXDEUOnPkyGQ6Ll4kpmnA5w2UYPyxehmGYOMPiZeJGfjaX7zIMweJlYoIsYtCV5ZJ0NeHSOC7mZTIZFi8TEwxypdoMetNyR+hMhsPiZWKEviP0bPFJQ6nXyxkvk8mweBmGYeIMi5eJGdrDNArOcBnGD4uXiQ2Gcl0qXuB+GhhGg8Wb9ujKWkmEuma7WZ1yhRJjQ0DNBbFeznoZRoHFm+YE1C7QPeiicbGqXZAo8dJ6fV8sFsG1KZhkgMWb5hgFKLJffZYrZBhL8VqJTwsWIJPJsHjTHBYgwyQfLF4mbdHXqpARw7IO/oJjIoHFy8SERIuI1m9eh9UwhkkELN50J0Q5LmWE8XjgFVC2HA8s9pvFyyQLLN40h2QTVK4xfLhmJAHiFcSzqEFPotbLpA4s3nQnlFzTXLyJgIs4mHBg8aY9Sqc0ATe+kK6x85pYEn/xhsz0YwkXcTBhwOLNEAJ+/sZYhCQbw/pMEXMR7ctFpwT9xOeiBqYiWLxMWhJM/Jx5MskAi5dhokjCijiYlILFm+Yk6id/wosaEkUCiziY1IHFy6QllplnHGpxcBEHEw4sXibNyNe9cigwOBllkgEWbwaRSQ0KuKyVSWZYvBkCicj8c9dqWLRJ1HoThaXw49ZQhUkVWLyZQqIq9iesQYF1kUPs1stFHEz4sHgzCC5qiD2JWi+TWrB4mfRkXy6yY55VM8zJweLNEDItA6T1GrJsNdKviINJRVi8mUKiKvZnWIMCLmpgwoHFmyEkKgNMXOaZILiIgwkDFi+TtiTqoZ5hnWpwUQOjh8XLpCUkQLPsrIYxTCJg8WYIJJ2AhC9OfRckYr1W62DxMskCizftSVTF/sQ3KMikestMasHizRAsM884kKj1JgqrrJozbcYMi5dJTyyKGigTjfmXABdxMGHA4s0YElWxPzHrtcy041G2LOCiBqYiWLwZQqJ+8idqvWLF6GR4oafytmV2IJMMsHgzhURV7E9kgwKR4eozz7j83E9UEQeTUrB4MwTKPPUSipeMErXeRJHIIg4mdWDxMmmHvow17pkmF3EwYcDiZdILKl7wWY6k1wnxSDYNmW4iijiYlILFm0Ek6ml7PNcb8FNfSDAeu2lZxMAwQWDxZggkBnPmZTUs2sR7vQECZPEySQiLN1OweMATD/HGe720bEN2bYp0Wy+TmrB4M4hMKGpIFJzxMpHA4mWYKMDiZSKBxcukFYksamDxMuHC4k13LMpYNagIIGaySNR6DeQj21CnlmGSAxZvmhMyEwshx8qSqPUaSax4tbLt+Owrk0qweNOdUJKLpQATtV4D8ROvLOLQfdOQdLV95GIIxgyLN+1RmqwGiE7ILysrW6gpViRqvXriK16fXGkf9aaN2xcNkyqweDOEgCpdcRJSvNcrM0/9+kwROwHq+x3Wf7FwXw1MICxehmGYOMPiTXMSlQHyeo3BRQ2MHhZvpkDdFZp+7+Znx6Gsldcbn/UyKQWLN0OgjCygnDEOD314vQJ+uMaYYPFmCuLmNz/YiktDBl5vfNbLpBQs3kyCpKAve4yXDXi96giGUWDxMgzDxBkWb4ZgWfYYB3i9DBMIizdTsHjaHhd4vQwTAIs3Q6BMzFDuqEY8nvLzerkeL2OExcswDBNnWLwMwzBxhsWbMeg7cYnnT2Beb3zWy6QSLN4Mgcoe5c2ve/izLzcbsfYBrzc+62VSCxZvhkBCUDwgMjKtZVV+tiKJGMLrpX9jv14mtWDxZgqUgakiIDkoP4E7xT4T4/XGZ71MSsHiZRiGiTMs3jTHn3VZR6x+AvN6jcFFDYweFm+moHvYo8H94saARK2XSSlYvBkCZWQmH8TloQ+vV8AP1xgTLN5MQdz83C8u98fLJAcs3kyCpKAve4yXDXi96giGUWDxMgzDxBkWL8MwTJxh8WYMiepDgNcbn/UyqQSLN0OwfNoeB3i9DBMIizdT2JeL7ERkXbxehgmAxZshUCZm/vkbj5/AvN74rJdJLVi8DMMwcYbFyzAME2dYvBkD1y5I7/UyqQSLN0Ogskd58+s6ceE3QUSfRK2XSS1YvBkCCUHxgMjItL4E8rMVScQQXi/9G/v1MqkFizdToAxMFQHJQfkJzG+CiDqJWi+TUrB4GYZh4gyLl2EYJs6weDMEf9mjjriWeerg9TIZDos37bGu3qRFgCSiBq9XH7FbL5OKsHgzBMtMLA7wehkmEBYvwzBMnGHxZiD0DjD6+RvvckdeL8MosHjTHPrpq3/nF8lAE0EsfxbzeuOzXiY1YfGmOYabPj/b+OLFGD5t5/XGZ71MasLiTXv0T9uzxSeNfcjtFK+n/Lze2K2XSUVYvKlMGxF0BsMNmj4a8HpDR7TWy6QtdJkwqcqTIqqJMN/4VkHT0fTRgNcbPKK5XiZtoUuFSVW+EVFPhPnmtwqajqaPBrze4BHN9TJpC10qTCoTTjYWiyyM1xsYsVgvk5bQ5cKkMuFkY7HIwni9gRGL9TJpCV0uTKoTKhuLZRbG643Pepm0gy4ZJtUJlY3FMgvj9cZnvUzaQZcMkw5YZWPxyMJ4vfFZL5NW0GXDpANW2Vg8sjBeb3zWy6QVdNkw6YI+GzvZLIyau/paYFlHQCusCtcbuq/ak411Nx8Mb3/pPWgW8yuhb2UWJtE4zkxGw+JNJ/TZWERZ2MmKUX2JY4XrjY14H3lnf8j1Uv8JVvMFi7Cb9Z70cWYYBRZvukHZ1ynq3zDQui6sVJCxQq43NuKVHc9YrlfpH8FqngojXPuG3F+GCQ2LN92g7Otc9W8FREW6apxz2zz8HnS9MRRvwP5WQrpahCPfCI4zw5hh8WYokf4MDyuCCiuG4jURrS8T7saRiSUs3kwk5MMmEcEEWuGDN7XMN4AQ4u2UK3LUKBFyvwK3LfSXz0k8dGOYMGHxZiChhBPOr+xQWaV1phgf8QbfrhASDfFlEm5xL8NECos34whRBhq2aSIVaTzEG3wdFe1WUGGzeZkYweLNOKIh3hCySpR4gxYzhFFkECzrjWI2zjB6WLwZR3x+9huJwzqDyTOcL5MUEO/x48exf/9+lJSU4LPPPsOxY8fUMUwqwuLNOCqqbhWLh0qxF2+wcuuwaickuXhJsm63G3a7HQUFBTJcLhcOHz6sTsGkGizeDCT8KlfRknByizfow8YkKeP98MMPYbPZfNLVwuv1qlMwqQaLNxMJ8SQ/dJysiBNRvBEuwbctWeryOp3OAOlSOBwOLnJIUVi8GUr4WW+ICDsjDCHek4koZqLBj0OwOsnxh8p1rcRLQmZSk5QRr/HnIN0UQcoqk+TnYfIThaa1WlSYtSaneEN++STRdXTgwAFZpmuW7rfffqtOwaQaqSFeqioU4uYmKXMTz5MjKpmvGsFdlWzirWh7YvGAsXKQfIuKiqR0ScLff/+9OiZa0DFJvv0OhBKGilshRu170+Ae/TEyb0dkxy9h4tUfqOzsbDVrMu8MfRY7Q2WSkYhXPVj5vnXolmmSuG9edXiuJiI6c76y0MD5LZedskQv+7W+4JNHvOYb1CqidtMyMSBQvDJ5iNVJM/nCT+B2REJixEs7o/t2kAdO3TmDRGk69YAqmZn1jlqKV9xAvmF6cZsOpEG8vptOFYW67oBtCrbstKCykrT61k8G8Ya3DbG6f2OO/oGpthPqte5PEujcBElu5PFRz506n0xCtGtbv3z9ObZch394hYkMEdG2q9OJ8N232jZaEel2y1H+L+fsXP3ytWNksR2+cSoVrDch4g0QJW2kfufU/2k6442g3jy+aRUClhdwMgIvKm2cb17DcOXA+tZN22e6ICyXnZaoxzyCMJwLSYhlmM5lTDDcBMEihc+h6ZqkJEVerjRc7Jt2Pmg4/W+4X2gaObHpHhHz+a5/+dl/fGh+w/1gsQ7jMtTzr84TsP4Itl2MMHxxBNz7ek56u/3z0HCDm3zjjNthGBfGepNQvPSRdkjsWLb1Tek7OSoBy6OdM9zQpoOiG+eb1zCcxRsMeRHRhRMq9CdHot54VmE4ltFH3jhW69VHwPamFlbnJPCaFviuY3E+1OE0r7L7YdwjPoJP61tHmPdT5NsevnhPZrsD5qHhvul085u2Qz8unPUmpqiBdsa3A/RRHHDTQeiUnS3SfP3G+wlLvOIEatPQeN/y5TjtgCkXhJzXcCIqEG+wZWcQIYUWcDzowrOYjiJmxy7EOn2hv3FSl8AbXcVwTQt013FgchMoB22+cEQSsI4w76fIt90kPBqun07HyWx3wDyG5evmN2+Hblw4603YwzX9jet/uKZBG2o6uPobxncGFQJ2VN05X/mS72Ap+Nctvu3FBSjnDfNCsVr2tR1nY+bMcmV8UkPHVdtuYxgvlHBQjpHVsgJ/tgdfb0zES+fIal36MF1DKY3cX/MxFxiuaYH+Ohb/G5ObQDn45jMtn+438/0QsA7D8Arup4i23Sw89Tr0LVwgplUmPYntpr+6eYxJoe4YBWyH6fhVsN6EidcA7az+IFQW80GNJhbLzsp6FXXqvIFGjUYmuYCjK8CgWW/AsuIp3hDrUkN/j6YL8ub27aNOAPrj65OX/CCOUwhxmM+LFJK6fP24YOswDA8hXkGk265N708WVPlqy9AtO+Ltlv/6l2VMCnXHSGDcDuO4itbL4o0Ui2WTeLVIdgEHlaUI/fVaMaaLXR8BCwohw6iepxDbJEN3YzBMAkkO8aY4evEmu4CN2YU59BlQaEItJ1Dg8RFv6H1j6TLJA4s3CliJV4vkE3AICfoihKQo47ecRwureeMh3lD7Ff4XCsPEAxZvFLASrjmSSsD68qcoh3VxRezFGzrbPdngLJmJDSzeKGAl2mBRrdpruP76aeqcCSQG8g1eMyL24g1Vdn3yweJlYgOLNwpYCdYqKOvt2nURPv/8J3XOBFNhsUH4EfrBXKzFG6qYoTLB4mViA4s3ClhJVh9JJ1wTlfqZHlZVCBYvw+hh8UYBK9lSJLtwrQhLwhHLMsbijWLmbgwWLxMbWLxRIB2EyzBM/GDxRgEWLsMwkcDijQIsXIZhIoHFyzAME2dYvAzDMHGGxcswDBNnWLwMk2ScOHFC/Y9JV1i8TELYu3cvunXrhhtuuAHLly9XhzIEizf9YfEyccfhcOCmm25CrVq1cNZZZ+Hcc8/FlClTcPToUXWKzMZSvL8fxW/bcnF0YSf85h6OE4e/U0cwqQiLl4kbJJRZs2ahSZMmOP300/Haa69h7ty5uPLKK6WEBwwYgG+++UadOnMJEK+Q7tF5t+BoTnMcmXABjowXMb0tTvy4V52ASTVYvExcOHz4MIYNG4aaNWuiRYsWmDhxIsrKyrBt2zasXLkSnTt3RpUqVXDvvfdi9+7d6lyZiVm8v7nfFNJtoUhXF0dn36hOwaQaLF4m5nzxxRf429/+hqpVq6JDhw5YsmQJysvL4XK5ZLFDcXExCgoK5DQ1atTAVVddha1bt6pzZx5m8VLxglm6UrwiAz5x9IA6FZNKsHiZmEJSvf3220Gdzjz88MPYvHmzzHSdTqeUrhaFhYXwer2y+KFhw4Y477zzZDHE8ePH1SUpHP/1V3y2KQ+7l3+A346kZ5mwWby/bvi7tXgnt1SnYFINS/Eae6gK97Up1AOV1puT+dXHFgR9IaV+OSqGac09XdG0QV5yqHZZaL0/VsuJlDD2M4NZtmwZLr74YtSpUwcDBw6E2+2WItYLVx8k3tLSUkyaNAnNmzdHvXr18Morr+DgwYPKAoWEP16+GuOatsLIRo2R989X8csPPyrj0gizeKks92huO6N0p16K37bPVKdgUo1A8QYVYiTEWrz+8VKquj5h6bPhTQhhrse8nPBg8VpBtRPGjRuH+vXr4/zzz8c777yDkpISKVYr4eqDih8oI166dCluvvlm+aX4+OOPY/+XX8plb+g7EIPFsNezamJEjfpY0esJ/PfTz+S4dCHg4Zrg+DelODrzGl+m+/uu+eoYwn8t05s4Ai5j36vLjcmG/z4xDvclIVFxQQXIN6GY7vcMIFC8QV61np/tF4xBUnRyfCeVDqAx+/SdXP2rZmh69aTm+7JR7eAbhSgJIV7zxREg3iD7E3I5+m21mCaXXjPTKRvZVvuZ4Xz33Xfo168fqlWrhnbt2mHevHlSpJTtWonWKqgYgjJfKpbo3r27fOh22x//iJKyUvy0/UMs7Hg/XsuqgWFZp4mojfdvuRP78h3qFqQ+VuINje5apmvXZF79veuDrmXftW28F3z3t+neii6qJ7LFfaS/xzIEy6IG5f1VxpPlF5p6wNQTQsOV86w/eaZMUJ5k08mXw/zConUq/9Ny/ELzhe8CCHKRqASIV2C1P0GXY7ggTctXt9m/Os549Wzfvh133323FCX9Xbt2rWV5brhBxRIk7Gxxc9auXRuXtmqF1evX48Bn+7D+yT4Ydkodmfm+nlULk1pfid1LluPE8UillXxUSrym61p+tpKnQaqmebRx6l/r5Mh/b/rvN33SpVueOekyYN7ezCDEwzX14Gonh06CPGhiuPirfYv6v031B9AoJCsZGk+8wPdNbXEiAi4S7eTqtk/Fcl0S0/4EWU7g/LrtMW+z+I/Fq5CXl4fLLrsM1atXxzPPPCNlS8ULVkKNJLRyXyquoIYWDRo2xNjx43Dohx9R/Pa7GHXGOSL7VeQ7+pwmcL01GscOqGXCKUrlxCs+6YobzNezTCQC7hvj/HIaWgBd72JabX5/cqRDTqPMa3nvme4Z/bYpGNedKYQQr4L/QJFkxAESglT8SH/FQTOITDuAsRZv8BNluS4d/v2xXk7g/LrpzNts2s9M5Pfff8eMGTPQuHFjNGjQAMOHD5fCpVoKdrvdUqaRhlbuS8UWV199NU455RRkv/Qi/ve//2HvouUY1/RS/CurhpDvaXijRj2sefJZHNz/tbqFqUdlxeu/l0JcnzphKvMHJiEB17tvuTRKy4IpdPeH+KxOIjFOp0TQ+yuDiEC89L+QknYi5UnphGzfQdQfQNMJN5xklaAn1eJEGKYNfaIqK17ztsoLRzsA5m0272eGcejQIQwZMkRmuS1btkRubq6sn+vxeCwFWpmgDJqWvW7dOnndUZ3gLl274tPPPsP/uYow8/rbfPKl7Hd+5y74tmyHuqWpRaXFq30OuF716K/dEPeC1T2qE7DVvHSPaTKu6H4Muu40x/rhmv4byneABTTOdyLoxOm/3YwHUPum0w664ZuPZgp2Uq1OhGHa0Ccq4EQH3Z8Qy9HPo99GiwvZt5+P64emP//5z3/Qs2dPue+33norVq1aJVuhaY0iYhVU7EASfvLJJ2Xme+VVV8EuRP/zZ/uw/KFeeL1KLfnQjSQ8ue112Lt2o7rFqUPlxUuXsLgmhViDSo+uZd88Qe6FIPeo4R6T90rgvL4Ex7AeK0Lfz+lKhRkvEwZ0FOuIaCQiA6pWUkZLvYqRdHv16iVbnVFRgJUoox1UfFFUVCQfvA0dOhRnnHEGzmncGPMWL8bR//6E/BeG4M1ajWTm+2pWdYw5pxlKJk7Db78cUbc++YmGeBUhmn6NGZIQ/bjIxKtMry5HVyvBkFzp5jMMD1gPi5c5WegoapHGAiYhLBaCo2IF6tRm0KBBoLLcaDxEiyRIviR/KnqgXs2osUXdunUxcswY/Ph/36FciHbsuc2FfOmhW028WbMh8gYNwS8//Ffdk+QmcvEyqQaLNxroxatFmgn44MGDePPNN2WjiAsvvBBjhOTCbRQRq6CqZiTfRYsWyQyc6g7/rXdvfPHFfuxbuwnT2rWX5b0Uw6rUxtKHH8UPH32i7lHywuJNf0gRTGUxS1cfaSDgL7/8En379sWpp56K9u3bY/78+bI8N5JGEbEK7aHbli1bZGMLetDXsVMnlO/8ED9QY4t7HsDwrLqyoQWV+8668Xbsy7Ore5acsHjTH1IDU1nMsrWKFBUwld3ec889UmjUZSPVKiDRnWyjiFgFPXSjL4Lnn38edWrXRus2l2F93hb874svseGp5/BmjQbyoRuV+45r1ho7Zs3Hid+NHfAkCyze9IeUwFQWs2RDRTUR14tIcqhXsDVr1shOyqmTG2oUQWWrJDgr8SVDaOXNI0eOlH1EUA9nE6dOwXf/2Y/Ct97BmHOa4nWR+b6WdSrebnQ+XG+OxtGfkq9bRRZv+kMqYCqLWa7BgrLeriI+F5HE/PLLL/KhFYmLWou98cYbshYB1SZwCPnaHVRlzJ/x0mebI3FlvfrQHrpRow5qbEFfGs8PysZXX32NT5Z9gMmXXSOLHai12/BT62F172fw4yfJ1ckOizf9IR0kMRZVTQxVXHTVWgxVVZThVnUYlaotJ1F9xVy1Ro9ZsOZIEeESX3/9NV5++WX5ap62bdti6tSpsriBHqJpLdGcDpuQrVa+64TLsRXFjqXif60Or12IuFCGJsR4BW0j1SWmMmjK2KnPCCqb7t6zJz7auxf7852Ye0snWe5LD92o3HfenX/GV95i9QgkHhZv+kNaSGLCEa9/vJSqoZ6hWbBKo4+4iTeFhEt8+OGH8gHVaaedhj/96U+yP12Srv4hms1RhN32N7DTMUbKlz7vso/E97ZbxHjKgp0ocJSgxDEfZY5Z6rBAQcY6qAyaikXoTRb0Zou6IvPtcOMNyLPZ8P2ej7Hq0SfVcl/lodvkttdiz9IPcMLU8XoiYPGmP6SHJCYy8frHKcNzhYh9DdWI/GyRBeca5zFUKjeuS1/xO1vMZxCvYT4xVwoLl6BObqj/W/pp/thjj8kuGZVWYkpRgt2hNAMucJThP46/4YC9rfq5BF/b/4zDtotQaF+BfMd2eByrxfg2+I+9tzqfUy5DL8Z4hFvIt6S4WGbr1KH6mWeeKev8zpw7Fz/s2w/H0NcxulETVb7V8c5ZTVA4ZgKO/ZzYTnZYvOlPCohXk5suwsp4xXBTlqr0pKabh8Zbzi8/GMbJ9ufasszLFdskRqekcKnT8jlz5sgXUJKYBg8eLMtJ6SEVydLlyMNO+zsociyXki1wlOJj+xD8Zq+ND0WmW2AvwUFXC5woOQU7bOPk52/ddwGFWfjIPlQtctAaWFh0miPk6HK55TpJkF6vR/7vdrngNE3ndmvThBEeN4pE0DLoM+3P+PHj0bp1a1kX+Y2Rb+H7b/8PO6bPwsRmbXyZ71u1GmJj30H4nxBzomDxpj8pIF6//CQG6ZnEbCFkX7eVNJ9eynKQuS17iHGU4arL12fCWnS6WoxJIeES1Gk5vePsrLPOkq3RtDdFUO0ARXhOKc5P7C/gB/vNUr5bHJ8K4b6DE6XV8HNRK/y7oA+ObWsAfJSFr+wPYZ/Ick/srgqUZ2G7LUdM/xHKHDOw1z5QlgX7y4EdcArheoVk7QVbsXHjRqxfv07ERmzatBn5NjtcHq8UsJzeXoAtmzdi7TqaZn2FsTlvq1i+kLcQtl3MT8UlVGyycOFC3PyHP8iWbn/v8ww++XQvPl+7CTOvv0XKdxg1tsg6DQvvewhfFZUKC6oHK46weNOfNBCvabxEN1xtX27VK1llxGv14C6V+Oyzz9C7d2/Zwfgtt9wiG0VodWG1h2gUVI5L8a39Lhy2N8OnQsK7Ct7E0bKzgI/F5eMVISSL7Vn4vfBU5f99WTheUh07CiYIab+EX+wX4BPHC0LiVPNBKfN1ur3w2DZh/sQx6PdEd1x33XW4/PI2Iq7FjTd1wqN9+uLtqfOwqcAOL30RrJqJfzz0R7RpQ9NcLqIt2ra7AldcoUS7dm3V4Uo8+PRQLN0ksmeXv4yZJEzy3bBhgyzLpn2/o2NHeIuL8d32D7G8Wy+MqF5fNjP+p/gyXdPneRw/9qt6xOIHizf9SX/xiin1b8wwjKNl6eaXmaxW1CDLcP3jAooaLNebGtBT/7vuukuW59Kbf0lEJKTAnsUoW3TLcl2PfR2Ous+Wgj3ibozfPbWAMkW6J3aI2FkF2CY+0zD6XFQVRzznAkVZ+MZ2vyyi0GpCkHSdW9djTL8/o8XZdVHN9OtBxinV0OD8lujWbzjW2EXmu2ICOl7eMHC6ING605OYs84Lrzvw4Z5Sdu2Ub7Zo2KAB2rS9HMtXr8aB/V9ha/bLGFHjDLzX9BLsXb85IW+0YPGmPxkgXoGQqD9DDRznu2F9y1WQslXH0U2qH28sbhDLS4EWab/99huWLFkis8ZGjRrhueeek9ktFS9YtUSjamNUxktFBHa7E/vsTwEfikuGokTI9aMqOPFvU3wmgiRcLKYRGfHhoqbw2lcjz7Eb+Y5yKfGi4kIsGv0MmtRSjl/ds67GA4/3w4BB2cju1x+PdbkFDU9Tj23Nc/HEiDlwCFGPf+sV9H22HwYOHITn+/TGrZc3QlWa5pTT0PzG+/Ds8wMxcMDz6Ne/P0aMm4F1W11wWewXhdbD2ahRo3DRRRfh7HPOwXuTJuL7L79C8bsTsHvhcvWoxR8Wb/qT5OJNEego0oO1JG4SfODAAYwePRrnCMFQJzdvvfWWFI+/PNcYVLa70/4efrRdj//Zr8L3rlvxo6MDjntq4ARluXuFYD/XCVcf+0TsFiHkfMjWEp84XsZu+wjsczyJva6XUOb4AIMfukwRa9Va+OPTk+Ap+xA7dm7HjvJt8GxZiSG970Dbyy7BpZe1wwPZ72KLowil4guCstXy7TtRYluD7C4tlWy5egPc0ucduEq2Y3t5mZymqNAja2RY7ZsW9BCPpn3//fdxzTXXyF8Az/brh8///W/1qCUGFm/6w+KNBnQUtUhCAe/fvx/PPvusFMu1114rW3WRcOhpv748Vx9Uo8HrWCtrMPxsa60UIYgM9kRJVZzYI6QaTLpaiPFyHq3owV0Nx2xn4jP3yygqWIt+nRor4q1SAy07/xVvT56OxavXo8AusmxPITwiy960Ya1sBLFmwxaxnZSBK9tG4+0blqLfvc1V8dbHTU+NwBa7sUw3nNBeK7Ry5Urcf//9qFmzJu657z5s275NPXrxh8Wb/pAqmMpCR9EcSSJgKkZ44IEHUKNGDdnJDb0pwro8NzCoDi5VIXM43PjU+SJ+La0PlFaQ7WpB43cJ+Yrpj5adjS8dj6DIvgx2JzU9diJ3aHc0ri6kSeIUUfeCFrj6D7ehc5cueHzQIIyfNQcbNhegsLgExZS96rYrmuKl0BpbUIfuTz/9tHzoRhkwdQiUCMzi/cc/VmPsWA+OHPlNHcKkOqQIprKYpauPBAqYssV27drJtzQ89dRTshUXCcaqPNcqlAdrxVK+Oxzj8IvtPFl2K4sSrGSrDxLvJ+IAOLLwvf02OOxObHXshE0sz+kpgjtvGd58pjPatqyPU6r6BSyjZi2c0+QiXHPDfXh+5ESsFtvidvu/KKItXi2o3Jd+Bbz++uvy5Z3UT8XkyZNx+PBh9YjGB7N4mzYdi+7dl8i/LOD0gNTAVBa9aINFHAV87Ngx2cdCkyZNZC9dw4YNk+WZVKZrJRzrcImf+xuw2z4cP9qvw4niasBOsSOU8VqJ1hwk3j1KccNvu2vjZ9dl2G/vgZ32sXA5NsPlLoTbtQGLZg7DM890Q5e7O+K6VpegwRnVUUUn4VPPuwSPDJuCArdXtkSjbYuVeKnYhY4T/SKgToKosQXV96UHq1TnOV5Yiffzz3/CN98cRP/+61nAaQApgaksesFWFDHuFvL777/Hiy++KMtzqfYCvflXK8+1kk2wUPpkGIEfbdfiJ9s1+J/rKhwubAp4hVA/FlFR1kvi3S7Eu13s9G4RJVk4YmuMnwquwTbX+ygs2Ymy8u3YVk7b5kDBpnVCwtMxevRQvND3IVzf9ExUV+V71hX3I2dFgWyNRtsWK/FqoTW2WLp0KTp27Cj7IqYXe+7du1c9yrElmHg1SMDXXz8Nl146nuWbopAKmMqiSbWioKw3hk2Kd+3ahQcffFC+fZeEoXVyE055bmAovY45HQXId5TK7iC/cdwHFAuZ0sMyTa5m4WrDPxHTFWfhkPMi7C3oLyVeYp8rstx85K1aiNGjRmLEiDcxZspC5ItsVjYV9haiSGTlRd48zBs5CNeeXk2Kt/Y5l+ClqRtQKL48qKw31uKl0BpbaJ3s0DvmbrzxRvk51oQS74oVe3DFFTm4//4FKC//Rg5jUo8spV4q1W1VsgslLOrOmt9YGhHK8q1aeyn1Ya3q4laAoT5vMILV89VDDSzCeONqKKwkq48YC5cgIdBreeip/F/+8hdDeW6wmgsVhdKxjUs2fvDaVuJQ8UXAZ2KHyoR4twm5Up1dynwpSLbaX8qIqTaDyHR/9raBy7ZFNh2mLNpTWIr1U19A8zNOxaliW89ocRNGLshDaUkpiulBmogykQVvWvw2/nh2DXk91jn/Krz2/mYhXqWjnniIVwsqnqFfC9RVZsOGDWVVPKoVQnWiY4WVeKlogYWbPujE65eNoQWXQDaRFXLSD4sMTexmocWom0YfJyPek0AvWX3EQbi//vorZs6ciWbNmslGEdQLF/1Ujqw8N3hQfV6XYwt+clwnW6n9vu00HHM3BEpERkst1XYJCe8R8ZH4TEUKNKxUBDUdpibFYtg3rvvkgzq7wyu2TWSt6+fgkavrSalmZVVBq5t64Y0xuVgwbxEWLpqDmZOGo/f9V6F+FRpfHa3ufQ5Lt7jgVR+wxVO8FFTXmY7nhAkTZGdC1FcxPYCjutGxwCze+AjX4l4JaKxE50MLZVqzK5TpKnk/ZQCW4jUecBITjQs1jXICKKOl1l6+zFbtJ0Fbfsy6aQyyLcb9ov+15WrbqIlfP8y0n1bbo64v37c9YrhwTDyFS/z3v//Fq6++KmstXHLJJcjJyZHVxyItzw0WJEsqathvfwQH7ZfiP/bHZQ9k39v/qNTpFVnt8fyasnmwfOjmUst092bht6K6smOdo8VnAu4sfG2/XywrXyzXA2+xG8um/BO3Xnq+79jWOaORrEnQuPE5OLNBXZwih1dF49Z3441Zq+Eu8ogvAGW7NPE+e3dTZf4q9dCh9xsxEy8FfZnRL4gFCxbIvi3ol8UTTzyBzz+P/kk2izc+mK57IkC8pvES5R7S7mt/nyhMKCrOeOngq/8bDmqFstOETajDTPPEqptGa/HqMCzLnPGGsT1yuP8LhrqF7ERHMk7CJehBDxUpUP1cEgH1unXy5bnWoXULSb2LeR2rZHUwu92N/zmvxu/FtfCZsx922d/CsZJGUrjfO/6Ig9uay+IIGlZaMBuFthXYZXsTX9geRbF9oZS5wymy10IXls+ZiH6P9cDN11yK02rV8ku4bj20aXcTHvzb8xgzfRnsLi9culZoiniXYUCXVjhN7H+NOmfjtqffiql4KbT6vtS3RdeuXWW57x133CGlHE1ORrzy2lSPn795u/na1t+TZizuFcN9FeReIrTpDNMzobAu4zVJzCdbXwYrMB1kv+wEapbom0930mLRTWPwbTFeLDTct4++4cHFG3R7zBdYbbEtF4s54iBcgjJaekMEZV30tJ1EQEKIpnT9QV1DFskiB5ujFOWO6Thkb4aP7S/Lsl+bvQiHnM3xa+HpKLW9j52OsfittA5+K64nRLsIeY4P1UYYTpk9a8t1Cvl6xH54CvLxwaI5GDdunGzSTEE/6ectWI4tNrd86KaXrjavvSAPS+fkYMzoUXh77DjMWLRabJ9YRwXNhKMRVOxA5eYDBgyQfftStbPly5dHLVONeDl0Pequc31SYriGffecFXRta/eGLnzXuWm8/voXyHVyEUPYWBc1+LA6Gep0QWUnCCFeOU6M8GfP/nFBRSf+CxgXqXjV9Srohou5Ki1ew7JjBz3Qoe4btc68KbOhLIwq/ofbKKIyQZ3cfGR/VdbHpfJakjH9/c7eEYdsF8Pt2CAkW46vHA/jhLMaShzzxGelrFl5UGfeRiFK8WXh8XhB5ai0HxT0v9IZeiiROuGm+WgeMb1W/huvoG2koDcaU31p6gPj3XffxcGDlX97RaTiDXlv0DWr/k/TBb9M9feEiuE6txivg8UbGaHFayEU30mmk+I70CQvcxmpfpn6/5Vpjd+k6ji5TP920Lp866dt0Y0LKGoIuS3KsnwXp2FZwcUbdHsMF6QgDuKlN//STU5P1ukBD3Vart38VmKIRVAxQaFjpSx20F7po3SU/qKs60tvmKAsuFQI97/2DuLvHDE+Og/5kjHoy4HK1OnhptbJDmXBX375pXrWTo7oipc+0vUtrvNs3TUbgP4eVTFc5xbjNbT1me8LJighxevPSnXoDq7yLad802WLk0snn4ZpF4FfnKblixPlv1ACx/mya9NJ9K9PbJepm0arbTEum/5XpxHz6tcpt1MMD5xHYLU9pgus47V3IavzNPVT9KEbuW/fvvIllFRljHrTohueyhathBC7oFe7e4RM/Q/vbOJzkWOx7EzHLiSsDKdWb+tl+XBglpteQcU7dC6ok5377rtPFv9Qnxg7d+5Uz17kRFzUIK9R/zUr7wX9vUP3G13zvnvOCtN1T4QlXmPior//meDQM3imkmRlvSqynTfQqNFIkf2Uq0OjA93Ud955p8ymHnnkEdn/ApUxxqY89+SCMmHKfP3DqAN1JSPWT5euQcU8dE62bNmC/v37y3fXXX/99fIFoifDyZQVh0pKFGnqf9VZEY54/evQihUCRRvOuhgWbxQg8WoRTQFTFnXZZZfJ6mJUtPDpp59GrX4uR3SDHrbRQ89///vf8hdJ06ZNccEFF2DatGmy74xIOBnxGqAM2CBeJtlg8UYBvXijIWB68++kSZPkAxt6CSU9UKObkfphoBv8ZFuiccQu6JzYbDbZ9zGdK3o9PmW99EuFWr399JO/r4WKMIs34m4hQ4rXnLly0UAiYPFGASvxahGpgKkXrIEDB8ry3JtvvlkWKWh8/fXXLN4kDU289BJRjT179sj6vqeeeip69eols+FwMIuXmgxzt5DpBYs3ClgJ1xzhCHj37t3o0qWLfEBD5bkff/yxOkaBxZu8YSVegr5IBw0aJBtb3HrrrbImREVYiZe7hUwvWLxRwEq0waJatddkl35m6OalV5zXq1cPQ4cOlcUKZli8yRvBxEtQR+pjxoyRD92aN2+OxYsXq2OsCSZeDe4WMvVh8UYBK8FaBWW9XbsuMtxEVD939uzZstcreiAzb948/P777+pYIyze5I1Q4iXonK5evVr2kUwPS99++238+OOP6lgjocTL3UKmBxGKN9IqJ9q0ynCrQnylDq1V/cAKMNWltcZiewMI0YAiTKwkqw8r4WrQzUjCpb5e6cYNBYs3eaMi8Wrs2LEDnTt3lj2cUY2H48ePq2P8WImXu4VML2IgXv94YwMKvYg1lFZmySXeyLGSLUUo4WqUl5fL/l3D6eWKxZu8Ea54iS+++EK+Wojq/1phFm/FwtXuL134Wj5p95jV+IruZysqmse8Lcq0fhdo0HTafWexzDQnpuL1j1OGp2+3kDeIiEy4JwOLN3kjEvFWhFm8FWO6ZrXr2nCz6e8LDfN8AtO9FEhF81iMlyjbpG0SNbwwbV5GcRLi1SSkiyAH3ZjxiuGmk5ou3UIqx6FfzISrweJN3kgu8RI0zPhLLrHiFWjTBaxDnUcdbujnWp0i3YhtGa/FyUjHbiHr1L4JWRcPjZlwNVi8yRvJJ166RYxZpfX1rLtftdBd24FUNI9pvGlZStNm4xeCMo96X4l5tG0MbI6cPsS2qMGHbjgJU1wN/ovCPy6o6MR/AeMiFa+6XgX9dlZevMZlx45Yild2KxmHriWTO4Q8nR4oXVhajQ8eqSte03zmazuAiuax3haNCsWbgPsqEcRfvGJKWf5kNQ8tSzc/XSi+A08nQTdOnkBtGXI+7WQqyzeL13DRGZZ1kkUNCbhAIhGvfBuvywmPWxfis7lTcTktdbhDPZ3FQOipFAXOInyyZSxKty4SAo7s9UnJJ97AYQkXL90nNF3AOtR5EnRfJYIEiFcgDqj/AggcF/pnihKZ1C2kRjjipY7DCz0uFArR5hfYsG7TVixbuxlzV2zA1EXrsWrDVkPn4i4h3IL8fMwZNAjr582Du6jIsLzMCTvyXNvx5fpB2FMwCwWuyDojSi7x6pMPP4kVrzHBofs1wAEsXiYStJoMsegWUk8o8VKG6xWypb9LhWjHzF6DAeNW4PFRK/Dw8KW4d+hidBq6HCNnrfW9l0xmusXFWDZgAKbUr48FI0eiQIjXRa8R8nqV4gd1+ekeNocbXsdW/LT2MfzgGQuHywt7BN1aJl68anKghpWv4ide/bYosjWKlqDpNBGry2TxMpFgrkoWKwEHEy+9IsfjcmDJmi14ceIH6PbGcnQcsgS3D16Kjq8sx51CuHeKv3e9vgZvSfFSZiykUlKCZaNGYXXdutgibpL5TZpgbseOWCh+EaxZsgQ2jwcuIeJMEHC+qwR78nKApe1wdFUXuBz5sp9hq2mtIrHiZVINFm8U0Is3lgK2Ei9lrwXihh/1/hp0HbYMdwjB3jFkKToPXYbOr4i/QxbL6DR4Me7610pfxusUUl01YQJWnHceXEK6ThF2EfTG5HVVqmDhuediwaOPYp0QMGXFzri/7SJ+QQ/UXI4CHFpxL04suhKHl3aEy741w8VrzlwDiy6Yk4fFGwWsxKtFNAVsFi8JdFNePl7KWYVOr64QWe4ydHpliRCuEp1IuPRXCPjOV4SIKeOduRZejxt2IdL53bohT9xQJF4Srk0EydehDtssYslFF2HJK6/AJqan4gezcNIh8l1l+GjjGBxfdLUIId5lqnidnPEysYHFGwWshGuOaAhYL14qXigosOGFiSvR8ZUVUq6dXxHZrRDtneL/jiLrvXOoGP7qB1LAdw1ZiHteW463RWYsM14h0bVz5mBx8+ZStvooEEEiJgG7RaysUQOLH38cBUIwlClbiSdVQ5Huezi+4Ar8vuBKEVfg8OLbWLxMTGHxRgEr0QaLYN1ChoMmXqr25XY5RPa6Wj4wI9HKDFdktbeLrJeKGboNX4Jnxy7Hq1NX4725azFjyQbMX7kJG/MK5AM4qrPrKivDstGjsapePSlcynBJuFTsQEEZMEmY5LtOxOKnn5blvulS33eruxxe23r8vPguYE4r/DrvKhyf2wZHl96plPGyeJkYweKNAlaCtQrKeivTpFgTL0l35fo8PDxsqXyARmW5VLZ716tL8fd3lmPs7DVYsW6LLPul7FZ5+KbV4/VLk2o12IuKsOSppzBDZLXT774b82+7DUvPOQdrhWgp4yUBk3yp6OGD2rWxctw4+cBNL51UjHxXKXZumoYfFnfFb++3wrE57WTg/Zb4Nm9EitVqYFKNtBKvVh9XC6UmiukhQYX1DSvC/NCB6vlai1aLygpXg8RLN7nX7cDo91eLzJay3WXyYVqvN5djwvy12JJfgEKP0mCCGktQdisz3CDhEhnslnXrMLVbN6yaNUsIyYWVs2djQb9+WNCmjcx0Sb4kYRLwqp494dy2zXJZqRFO5ItMd8+6t/H7zNY4Pr0Fjs1qI+Jy8X8zfLPkL7DRW5IjyHYpWLxMJKSNeGUDCss6f0bB+usTVka8/vkU2f81QLbRFK4GiZckarfbkD1+Of74zyXoKMRLRQqrNuTJRhOU1VqJIVRQjYX8zZtRsGmTFLG7pAT24mKsX7sWC/r2xbJGjfzZ78MPw5Gy4nXK4oU9a0bi12nN8WtuCxzNbS1CZLy5l+L4tKZCyKPFNDvEtIF1pUMFi5eJhPQQb8hK33pR6lvP6Iar84fXK5JJ2GLerKx7fbKNhXA1SLyUxW7Nz8ez767EzS8vw3PvrcDmPCXL1bdIizRIvrJBhfaZyoALC2VRxMqpU7GkdWspX0/KildksS4vPlr9Jo5NboJjORfi6JSWIoR8Rfw66Tz8OO8uFLq2ysYU+vmMy7EOFi8TCWkh3sAWOXpIlLqiAV9WbBKvGKctI7CVjR6jePUZb6yEq+EXbwGeGbsSXYctUTPdyDt1CTekgMvKsGbhQixr2hTeLl1SUryy4xuXBwemt8ev48/CkYlNDPHbuAb4au5DIts17ZvTDbuz4pocLF4mEjJEvCZRSvmaxBt2U0WTyMV8tWMsXA1NvHlCvH9/eymG566sdKYbdpSW4oPXX8f6xx+XTYotp0niKBDy3ONZh1+mXoNj75yDI+8K4eri19EN8PWch2Er+lDtLIgyXSf2r30dpXnLKmxMweJlIiE9ihpIlGEVNQh8kq2MeHXLiyOaeLfk5eG5nM0YPH0znA67HGYlg2gG1d/NW7cOH4wfn5INKQrcJfh0yWAcHdUUR0aKGNXMGG+ei0M5N6Hcvg75bvpicSLfuw0/TfwDvpv2ZzGsLGCZ+mDxMpGQJg/XlN6YDLIU8lQ+GkUZnYw3weLdvBnZM1x4eEIJ3l++CUVuKhKwFkK0gnotWz9/Pha89FJK9mBmcxVi29oZ+HlUOxx5/UL88kZzfwynvy1w7F/n4Iext8GTvwFbi3Zgxwfj5bQ/jrsdHocNdmfwIh0WLxMJaSJeQpWvVgTgEyeJUjfcJ9joibdjx9kx7ZVMw1fGKzLe7Klb8MCUT/DkFA/mf7ARhW6lNZuVFCoVQihukeFSE+OZ992HJQ88AHd5ufW0SRxSmi43fhh1K44MvgCHh7aQcUjEkX9egF9eaSo+t8RRMe6nEdfju3c64uBrrXDs5bPxw8g/oGjjUiHv4Jl+IsVLr3yna/Cnn46oQ5hkJ43Emzi0B2vx6BZS1su1FWDo9A14aPKH6D79Uzye48bkRRthL9iqlvn6Baw1oNBLIpJwFxfLfhrm9O6NSeKLa2XXrnCl4sM1Eq+I//7rBvwysAkOvXgxDr7YEkdebIEfRt+H/w1ui8ODLpLDf8luKkLI+YXmODzwQhx480/YXrBGlhNbLZsiEeIl4V500VicfvoI1KjxesyfMTDRg8UbFFOmLCLYAzxzVbJYdwvpddmFaDegR045ekz/BI+I6JFThpembsK8FRthy98qhGuX9XoXrtyE5Ws3wx1BM1+qVkZVyVxCuhtWrMBMIducqlUxTRyDFd27w52y1cnc+HT6YBx+thkO9rsEh/s0xQ/DOssvpo9mD8OhZ5vL4Qf7tcTB/uJv/0txsM9FOPL6n/BJwWrkJ4l49cLVX3cs3tSBxRsF9OLV3wix6haSihs2bs7D05O24uFpn6DntD3oOf1jdJuyB70meNE/ZxPenbceH6zdhH9O+gD9xq9Bfn6BbGqslwVlxiRZqsNLD8yo4YRsPCGGbVy1CgteeAGTWrTAFCHcXBFTRSzs1i0lxWtze/Hh4hxsXzYd3794Cw491QJHnmiCL955CltKd8O9dTO+y75BDG+JQ4Nvw8EnhZz/cQkOPXEh/u9f96LQaYMtwWW8VsLVX28s3tSBxRsFzDeBPqIpYE28StbrxPSlG9Ezpxg9Znwq5PsheubuwSO5H6O7kHD3SeXo9Z4dj7xrQ7eJZRg9l7Jem5C2P/Ml4dqEZKnXsc3r12Pt3LlY+vbbmNWjhxTuRCFaynK1mEziHTgQ7hSsTkZFDe78zfhi+GPYN+IJHHy0GX557GJ8OfFF5HtL4CgqxWezR+FQjwtxLPdFHB31KA78RUhYTPfdgNtRmLcBdi89VLRu0RZL8YYSrhYs3tSCxRsFrG4Ec0RDwHrxyoYNDhvGzt+EnpPL8ch0Id/c3ULAu5SY/hF6zdiLXkLCVBTRa2IRZi7bKIStFCXYhSTmPfccpt5+O6bcdhtyrroKkxo3xsRq1ZAjBEsZrpblauKdcvXVsl8HEraVfJI7nLB5vPh4/GAc7tIEB7pfjEMPXogvhvREXsk2FAopH8y+Bz/fdx6+mTgE+9ctwoEHm+FAj8tw+MGL8J++HeHYuA52sQyr5cdCvOEIVwsWb2rB4o0CVjdCsIhGt5AUdLO7nUKidhsmLNyEv0xwo9u0j9BDiLbX9D1KBjxVhJBwLyFkegjXO8eJpWu2wOP1yBdcjr/4YpnFkmi14oTpIqRkRZB0NflOveQSrJkzJ6V7JqOst6CkHHveexU/d74IB7Ifwv5RA1BYXCKP6X+G9cHR+y9F8eI5KJ49BYduP0+I+BL8dPv52DnoL2J+8WtBfGlZLjvK4n344cWoXv11y2vIKli8qQWLNwpY3QhWQTdHZVq4mcVLQeW99A41eqg2cMoW9JhUgq6Td8vih14zhIRzFQn3oOw3pxTvL98Mr1d5s3DO5ZdjhpCqltGSYEm4eglTTYap110n30DsKhE/yXWyScWg8muS7+5Rr+Lr+ztg15zpKNyxE/l2B8rE+G8/mAu3+GLaPmksDnRqix/uvQp7b24B98zJsJcEb0QRbfF+881BPPnkKtSrN0J+WVtdT/pg8aYWLN4oYHUj6KOywtWwEi8FVTGjNwxT5zm5i9fjhamb8NhEN7qOL8HDk3eiJ5UB55RjvMiMqXhCe6V7Ttu2Urz64gStiIHKdyc2bow5f/87tqxfL6uV6deZ0iEy14KiEhS+n4vdzz4B74xpsBcWKxmx2wubtxBFSxdhx9xZ2NP9HuwaMRS2UiFd03HXR7TFqxGugFm8qQWLNwpY3QgU0RKuRjDxauFyOVHodiBfSHXZms2YuGA9+k7chK6TtmPEnC1w2vNlzQYqoyXxTmjZUkpWK2qYWrUqJtSujUkiE57z1FOyaMFZVCSrllmtL9XDVloO+8YN2C3EW1hQoBQl0DiSqNhvZ14eCieOQ5EQqm9ckIiVeDWCC7ifCGO1Rxm+1plWwzUCGwMFNCYKoKJ5zOtUpvW3GNWg6bSeAiNF38tgasLijQJ62VJEW7gaFYlXC6qXShlwsceBN2aswYBJ65C3laqTKfKQD9eEaKZ364acK65Azo03YkbXrpj/wgv4YMIE5G3eLN/JJl/tHqRMMz1CHEuPR3xhueAU0jSPl8Nc1DtZxccg1uLVCCZguuacb/3JVNfcLElz0/pYidc0XqKsW1s19QBo8HBEsHgZQayFqxGueLWgqmMr1uVh3aY8ywYUdhEFJAwxzqk2mKDsljJifeu3jI4wj0O8xKthFnCtWsPCEC9Bwyz6pNaImXgF2nRW66Bm+qYsWWKaVumGVZsudV85z+KNArEWrkak4qUI1WRYNp5QI11eYJmoiLd4NTQB1679BorfuT0M8ZLjgrwWS4sKxRtqHtN407Lkm2LMRQwkV912GoolLMTbKTefM14mfpjFa7eLrNZbhPLt27FdRHlZMdz081kvBBFub7E6zTaUlRTBJadxwlOoDt+2DdtMQcPKS0tQ6BHZr255qRgulxuFRaUoKxf7pu6vb9+c+mnFcXW6UVxaLo+n+ZjI40LHubwcxYVeWaNEmzdR4tWjSMmguTDEaxpvlY0aqGge63VqWIk35HazeJlEYxCvyFA9HifWLpiCwc/3x7N9+2HwsAlYXeD2Z7hiGrfLhpVzJuClfs/huX4D8dqoKVhn88Dr3IolM94Tw/uj//PPY8CAAf4Qn/sPHIghb4/FovVb4C0qNEgmZcLpgld8uTjsmzBv+mi8OnQAnu8v9nfQILw86j3MW7VV7FsxvB61DFdI152/GhPfeAXPi+PyvP6YqNFfzD9kyBBMmbcMtsIi+VJRmjd1xKsfVpFErahoHqt1qlBxAk1nKdMg283iZRKNUbwulBQ7MfPVHqiv/qxrcMl9yM0rRrEqAxJJkXcrJmbfj9PUaZpe1xOzt5ag3L0eb/2jI2qpwy2jbn20uv4u9H9rLjY7vELiOqkleTjdHhS5bZg/4V946O4OaH5eHeO+nVYfTdvdhG59/oUlG+zwej1wuYtQuCkXXS472zitKapUrYbGzS7HA/94DcsLxJeY+KJLpHiphRt1C7lj3B0ViFd5wOWfJp7iNT4Qo8zXtx00v24ekquhqMGXIWvbz+Jl4oiVeGf9qycaqkJodOn9mG4l3kFdUEedpln7XpijiffpTqitDq9Z90w0u6QVWrdqhVYiLjynEaqo406/8A94afJyuDzi57VJcMkYTpdbyHALZrzxLK4+v77ch6ys6jjzvGZo3bo1Wl9yAerXUPYtK6sOrr27P+aut8NDdXs35+KBNo3VcVVR/9yLcKmYh45JK/G3ZZOGqK4el6zTLsbToxaisKwQzgSIV9+kmLqFtH64pu2nEsaaBLESr36diiANopXQdDp56h+umdavFE8oy8rOVrJjKWcxzLjM1IHFm0JYive1XjhTvWDPat3FUryTXngA9eQ0VdCiw6M+8Y58pjPqyuHV0faOpzBno5CWvUAK5IPZE/HorW1Rp6oYX7U22ncfglUFLt9P6+QNJzzeQqzKHYybm9eVxyXrtHNx219fwKwla2Gz22DbuhQ5Q5/EtY3OUMYL+XZ+djQ2e8pQvGU6Hmx7njq8ProPnY58kT3bCvLFvE5sXT0OPdqfh6pyfD10eupt5JWVybL1eInXqg8HesDLDShSBxZvClGReM9u0w3zvbuxe3s5yoQMysq3Y9fOQsx85WGcLqcJFK+SCVfHFZ36YGGBkLb4ye12e1FS5sLcUX3QulZVuezm7XtgypoCeDzJ3UGO0yV++heswpBef0Bd+tLIOg1XdxmAxVs8KCnyin1zw+0pRGmRC1Oe74YmDWujVq0aaNK5D5ZtFsO3zhTiPV/uc1ZWAzw2aim2f/Qxdu7Yjh07duGjj+14s8cNqCHH18Fdfd5FfllpXMQbqtOc6Is3MFtO1ewyGWHxphAVibd+05vx8nu5yJ2cg0mTJmFSzmRMmzoOA3veohYpBBdvuzufxoKthSiUVcvcKCl3Y9HYfrhcFW+zax9Gzqr8pBcvSXXT/NG4+4qz5HZXbXwFnh+7CIVUT1n3gFA2IsnfgBXLFmPxYhEr16HAKfZ/sz7jrYs7nhiCSdNyMTknB5OnTsV7w3ujfZPqqHpKHfFl9ADeXbAFRYXimIhzEivxhtNLGWe8qQWLN4WoSLwVR3DxXnl3P6zw7MTObeUoL9+GgtXz0efeDjj9FBp/Kq68fxCW54uf8e5kbsnmQmGxA7PfegaX11O+MBpefjtGzd0Mr8cTUC1OlgV7hWyFlL3iC0V5uKYXb/A4pdbVeGb4CpRuLxVCV85JtMUbjnC1YPGmFizeFKIi8VapegpOrVkTtUTU1EWN6qeoD8qClfFWQb1GTXBF+xtwww0dZLRpeaH6czoLNRq2w7PvLoSTHq4ldbUyId6SfEx79XG0rKqI9/xr7sJ7i20yU6+oPrIzQLxVUK36qeIY1lKOZS3x99Tq6ri6OOuSP2Hw5KXwFkf/4Rp3C5nesHhTiIrE2+jiznh32UZsWrsaq1atwqrVa7Fx3XKM7HO3T7DW4g0SVarhrObX4S8vT8UGm1e2grMSVvIEideGmcOeRKuainjPufJOjFmw1VK8TrcXZduo7HYHtovM1estNon3DDzwwnis2rgJa1avwpq167Fq+Sz07XwZasjy4yw0vvmvmLvBgyKPM6riDd4pjnWweFMLFm8KUeHDtcsexGzHdmwvEZmb+PlcWFSCbWVOTH25awW1GqrirGZX4r5H/oq/PvooevXsiZ5/eRT/GPwaZq3cCI/I6CJ5WWYiw1NUiKUTX0KHJop4azS7AUOmrkSR12sQL3WNaVu/AMOzn8Pf//53PN3ndczf4ERR3gx09Ym3AR59Yz4KhZyLxXLpmBaXbYd90Qhcf35NOU2VM9pj6Mw1Qvhe+VYPs3j3OcVN9q8QsUKdUMeJ74FO2vjsg8i6ehWyTh2BrKrcLWS6wOJNISoS78lUJ9PKeK++dwDWlHyEj3Z9iJ07d8rYXl4mMrnUajLs9BTBvmIyHr7pAnlMsmqchbv7jMImt8hmvdREmF7w6UZpaTEWjHgMZ8sybBEt/ozcNS6U5c/S1Wqojx6vz4azuES2BqR53d4SFG6cgrta1pfTVDmlLbJzlsNdWnhy4lWjk5hOwyBeLSoQcGTiDayxUPnuIplIYPGmELEUL9VqmJ/nla2wzDJLpXCK4+L1bEXO4B5oWls5LrUuuA7PjJyOPFcRtpVvF1GMDfNG4b4rmqhl39Vxx7PvYItnG0q2zNAVNTTAX99ajLJdu8U8ZSin/hrEvPOG/RUX1KuiTFPvWgydEV7Gq5crkZvjH0eR/ZEyPFh1MvwA3KYTcFVTt5CRiVcvVqVFWOW6i2QigcWbQlRevFkB4lWqmVVLG/FSuNxeuLcuxSuPdcSZagu1qg0uwq13P4Qnej+FJ/76ENq3aCiHUzHLedf2wOSVm+EtLjWV8dZEm1vvx+O9n8Tf/vY4/vZEbzzW635c3vg0dfypaNNlIJbbPSgUx82qjDeUeIn8Ff7xWULEJLZg4jWIeqaxDLhm9ZbqNmUhO1vtE0EKVd+0lj6TUC3EKodp01YgXvX/fLX1mKHTG5Ogff0wqMNztVZoJHlfa7XA+S2XnUaweFMIK/HOHNrdJ9XTW9xj2VfDhIH34lR1mibXPOLrq+HNp273NX9t9ccnMS9NxEut19zeQni2rsTwPl3Rqkl9VK+i7Kc+atQ9Ezfe8zimLNkAT5EHLg/VapiGP1/aKGBac1Sv0wiX3NkbOSsKUFTsFtmuda2GisRLWay+WCFXfLYSr7nIQpOifAj3SF9xHm/CMvE/IZvYqvIzdEBDUpNZrZV4lfmUpJfGB+6zrykvLUd89i1X6/yG/g8lXjGPYflqhh2wjcGWnUaweFMIs3gLC51YMnEw7upwPa69pj3u6j4Qi/K9MvuSAqKf3e58zH0nG3dcdx2ubX8juj4xBMsKClHs2oxpbzyH29tfh+va34KefYdjRb47BWouhB/UAs/jsmP5oul4NftR3Hv3jbihQwd0uOVm3N6zN4a+NxsbC1woEtKlcmynS0yftxCDet6HDu3b44Ybb8SNpujQoT06d34Ig0dNx/ICap7slVXJ6JyclHgF+kyWihsCxCuGaeO1afQYxEUYZCUkp/5P0/nFV5F4K854/WvUTR9KvL7hStGG6l1asb+YI9Sy0wgWbwqhiZducE0u1AKLbn6viGB1VZWGAuo0bpechvrptRpunjfVg/ZROz5WEdggRGTLHo/ltObQH7NYijdbHRdsGaHFSx/p57qQXbY2zEpm+mEs3ljD4k0hvvrqKxQUFMiXWdJNLoOyLdPNbw4abjVNsOHpGHJf7cq+avtrpw5zAqal4eIXhTqdVVjNq52XvXv3qmdLobLitSoDDoDEpZOTvqhBIsZ3ys5Gtk/OZpkpIvTLOwzx+ooN6GMnY1GDr1xWt9xIxBts2WkEizeF+PHHH7F7927s2rVL/uVInqBzQvHtt9+qZ0uhMmW85nJdGhcMf9eJQlq+h2saJFL9Qyr67J9ezmOwbBjiFf/7HpSZpvVvi78bx4jEG2LZ6QKLN4WgG/L48eMcSRzmYoKKxGvIaNXGFHIZJiEHy5YtIZEZxBtlDBKNMrFcdhLB4mWYGBJKvOZ6vFpmR+I1jAtWxBAMFm/Sw+JlmBhiLi4IFvqf05+HOQ9FqOIHJnlh8TJMDKlIvOaqYcTW5dbTWgWLNzVh8TIMw8QZFi/DMEycYfEyDMPEGRYvwzBMXAH+H0uz+KayEP6LAAAAAElFTkSuQmCC\"></TD></TR>
  <TR>
    <TH>Identifier:</TH>
    <TD colspan=\"3\">CoSES_Models.Houses.SF2</TD></TR>
  <TR>
    <TH>Version:</TH>
    <TD colspan=\"3\">1.0</TD></TR>
  <TR>
    <TH>File:</TH>
    <TD colspan=\"3\">SF2.mo</TD></TR>
  <TR>
    <TH>Connectors:</TH>
    <TD>Electrical Low-Voltage AC Three-Phase Connector</TD>
    <TD>lV3Phase1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>If true, standard control will be used to control the condensing       
                                  boiler</TD>
    <TD>StandardControlCB</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Environment Conditions Connector</TD>
    <TD>environmentConditions1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>If true, standard control will be used to control the heat pump</TD>
    <TD>StandardHPcontrol</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Standard Control for the 3-way valve to switch the connection to the   
                                        thermal storage</TD>
    <TD>StandardControlHPSwitch</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>If true, standard control will be used to control the solar thermal    
                                       pump</TD>
    <TD>StandardSTcontrol</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Condensing boiler input - heat power (temperature difference between   
                                        supply and return is constant)</TD>
    <TD>CBIn_P</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Outlet temperature of district heating heat exchanger</TD>
    <TD>TDH_HEXout</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Inlet temperature of district heating heat exchanger</TD>
    <TD>DTH_HEXin</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Volume flow to heat exchanger</TD>
    <TD>qv_HEX</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Reference volume flow of solar thermal pump</TD>
    <TD>qvSTpump</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Reference volume flow of district heating pump - positive: feed in -   
                                        negative: extraction</TD>
    <TD>qvDHpump</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Air source heat pump modulation in percent</TD>
    <TD>HPModulation</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Switches between the inlet of the HP into the TS (true: upper storage  
                                         connection)</TD>
    <TD>SwitchHPTSPort</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Air source heat pump - modulation of the auxiliary heater (percent)</TD>
    <TD>HPAuxModulation</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heating mode (true) or cooling mode (false)</TD>
    <TD>HPMode</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>Parameters:</TH>
    <TD>Volume flow generation and electrical power calculation</TD>
    <TD>pump2</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Flow temperature controller wiring for heating system</TD>
    <TD>heatingUnitFlowTemperature1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>DHW_demand</TD>
    <TD>dHW_demand1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Connection of 1-phase to 3-phase AC components</TD>
    <TD>phaseTap2</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Electrical power grid for connection of maximum six 3-phase AC         
                                  components</TD>
    <TD>grid1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Connection of 1-phase to 3-phase AC components</TD>
    <TD>phaseTap1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Connection of 1-phase to 3-phase AC components</TD>
    <TD>phaseTap5</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Connection of 1-phase to 3-phase AC components</TD>
    <TD>phaseTap6</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Solar Thermal</TD>
    <TD>WolfCRK12</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Specifies a Thermal Volume Flow Connector</TD>
    <TD>defineVolumeFlow1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Extracts the characteristics of a Thermal Volume Flow Connector</TD>
    <TD>extractVolumeFlow1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Measurement of pipe temperature and volume flow</TD>
    <TD>measureThermal1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Electrical power grid for connection of maximum six 3-phase AC         
                                  components</TD>
    <TD>grid2</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heat storage with variable temperature profile with 5 inlet ports</TD>
    <TD>WolfBSP800</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Change between inlet ports of thermal storage</TD>
    <TD>switchPort1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>WolfCHA10_GC</TD>
    <TD>wolfCHA1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Connection of 1-phase to 3-phase AC components</TD>
    <TD>phaseTap7</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Set output signal to a time varying Real expression</TD>
    <TD>TColdWater</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heated 3-zone-building with changeable heating system</TD>
    <TD>simpleHeatedBuilding1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Switch between two Real signals</TD>
    <TD>switch2</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Set output signal to a time varying Real expression</TD>
    <TD>qvSTpump_StandardControl</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Set output signal to a time varying Boolean expression</TD>
    <TD>HP_EVU</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Logical Switch</TD>
    <TD>logicalSwitch1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Set output signal to a time varying Boolean expression</TD>
    <TD>SwitchSignal_StandardControl</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Temperature difference between flow and return temperature</TD>
    <TD>CBDeltaT</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Maximum temperature of CB</TD>
    <TD>CBTmax</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Minimum temperature of CB</TD>
    <TD>CBTmin</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Maximum power of the auxiliary heater</TD>
    <TD>PAuxMax</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Nominal heat output at A2/W35 (not maximum heat output)</TD>
    <TD>PHeatNom</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Nominal cooling power at A35/W18 (not maximum cooling output)</TD>
    <TD>PCoolingNom</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Nominal COP at A2/W35</TD>
    <TD>COPNom</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Nominal EER at A35/W18</TD>
    <TD>EERNom</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>If true, solar thermal collector is CPC collector, else, solar thermal 
                                          collector is a flat plate collector</TD>
    <TD>CPC</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Inclination angle of solar thermal collector</TD>
    <TD>alphaModule</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Orientation angle of solar thermal collector</TD>
    <TD>betaModule</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Number of solar thermal collectors in series</TD>
    <TD>nSeries</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Number of solar thermal collectors in parallel</TD>
    <TD>nParallel</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Effective surface area of solar thermal collector</TD>
    <TD>AModule</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Absorber volume</TD>
    <TD>VAbsorber</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Maximum temperature within the thermal storage</TD>
    <TD>Tmax_TS</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Temperature level to calculate the stored energy (e.g. return          
                                 temperature of consumption)</TD>
    <TD>T0_TS</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>If true, the temperature profile at simulation begin within the        
                                   storage is linear, if false the profile is 
      defined       by a             temperature                 vector</TD>
    <TD>TSLinearProfile</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Temperature of upmost heat storage layer at simulation begin</TD>
    <TD>TSTupInit</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Temperature of lowmost heat storage layer at simulation begin</TD>
    <TD>TSTlowInit</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Vector of temperature profile of the layers at simulation begin,       
                                    element 1 is at lowest layer</TD>
    <TD>TSTLayerVector</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Number of people living in the building</TD>
    <TD>nPeople</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>nFloors</TD>
    <TD>nFloors</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>nApartments</TD>
    <TD>nApartments</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heated (living) area (e.g. 50m² per person)</TD>
    <TD>ALH</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>If true, use standard area-specific heating power, else define it      
                                     manually</TD>
    <TD>UseStandardHeatNorm</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Area-specific heating power - modern radiators: 14 - 15 W/m²; space    
                                       heating: 15 W/m²</TD>
    <TD>QHeatNormLivingArea</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heating system exponent - radiator: 1.3; floor heating: 1 - 1.1</TD>
    <TD>n</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Normal flow temperature - radiator: 55 - 75°C; floor heating: 35 -     
                                         45°C</TD>
    <TD>TFlowHeatNorm</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Normal return temperature - radiator: 45 - 65°C; floor heating: 28 -   
                                            35°C</TD>
    <TD>TReturnHeatNorm</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Reference indoor temperature</TD>
    <TD>TRef</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Maximumg flow rate in Living Zone</TD>
    <TD>qvMaxLivingZone</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Initial Temperature</TD>
    <TD>TLiving_Init</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Initial Temperature</TD>
    <TD>TRoof_Init</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Initial Temperature</TD>
    <TD>TCellar_Init</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>If the presence is used, individual presence data has to be provided,  
                                         else standart presence is used</TD>
    <TD>UseIndividualPresence</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>File with presence timeseries (presence in %; 0% - no one is at home;  
                                         100% - everyone is at home)</TD>
    <TD>PresenceFile</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>If individual electricity consumption is used, individual consumption  
                                         data ha to be provided, else standart 
      load       profiles       are       used</TD>
    <TD>UseIndividualElecConsumption</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>File with electric consumption time series (consumption in kW)</TD>
    <TD>ElConsumptionFile</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Table with electric consumption time series (consumption in W)</TD>
    <TD>ElConsumptionTable</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>YearlyElecConsumption_kWh</TD>
    <TD>YearlyElecConsumption_kWh</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>ElFactor</TD>
    <TD>ElFactor</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>If true, night time reduction is activated, else temperature is        
                                   constant</TD>
    <TD>ActivateNightTimeReduction</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>NightTimeReductionStart</TD>
    <TD>NightTimeReductionStart</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>NightTimeReductionEnd</TD>
    <TD>NightTimeReductionEnd</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Temperature at night</TD>
    <TD>Tnight</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>If true, presence will be used to define the temperature (if less      
                                     people are at home, less rooms are heated 
      and the             average             temperature       will       
      decrease)</TD>
    <TD>VariableTemperatureProfile</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Minimum temperature, when noone is at home (TRefSet = TMin + (TRef -   
                                        TMin) * Presence(t))</TD>
    <TD>TMin</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>If true: DHW consumption data repeats weekly</TD>
    <TD>WeeklyData</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>DHW Data File</TD>
    <TD>File</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>DHW Table Name</TD>
    <TD>Table</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>V_DHWperDay_l</TD>
    <TD>V_DHWperDay_l</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Factor, with which the DHW consumption gets multiplied</TD>
    <TD>DHWfactor</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Photovoltaic Modules</TD>
    <TD>photovoltaic1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>PV to AC Grid Inverter</TD>
    <TD>pV2ACInverter1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>HydraulicSwitch between thermal storage, district heating and heat     
                                      generatrion</TD>
    <TD>hydraulicSwitch_TS_DH_HG1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Set output signal to a time varying Real expression</TD>
    <TD>CBControlIn</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Switch between two Real signals</TD>
    <TD>switch4</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Set output signal to a time varying Real expression</TD>
    <TD>CBin_StandardControl</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Switch between two Real signals</TD>
    <TD>switch3</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Set output signal to a time varying Real expression</TD>
    <TD>HPin_StandardControl</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Switch between two Real signals</TD>
    <TD>switch5</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Set output signal to a time varying Real expression</TD>
    <TD>AUXin_StandardControl</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Minimum Temperature, at the top, at which the CB turns on</TD>
    <TD>TStartCB</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Temperature at the bottom, at which the CB stops</TD>
    <TD>TStopCB</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Minimum Temperature, at the top, at which the heat pump turns on</TD>
    <TD>TStartHPhigh</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Temperature at the top, at which the heat pump stops</TD>
    <TD>TStopHPhigh</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Minimum Temperature, at the bottom, at which the heat pump turns on</TD>
    <TD>TStartHPlow</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Temperature at the bottom, at which the heat pump stops</TD>
    <TD>TStopHPlow</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Minimum Temperature, at the top, at which the auxiliary heater turns   
                                      on</TD>
    <TD>TStartAUXhigh</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Minimum Temperature, at the bottom, at which the auxiliary heater      
                                     turns on</TD>
    <TD>TStopAUXhigh</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Minimum Temperature, at the top, at which the auxiliary heater         
                           stops</TD>
    <TD>TStartAUXlow</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Minimum Temperature, at the bottom, at which the auxiliary heater      
                                   stops</TD>
    <TD>TStopAUXlow</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Required temperature difference between upper layer and DHW set        
                                   temperature</TD>
    <TD>deltaTLowDHW</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Switch-on temperature difference between collector and storage         
                                  temperature</TD>
    <TD>deltaTonST</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Switch-off-temperature difference between collector and storage        
                                   temperature</TD>
    <TD>deltaToffST</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Minimum temperature difference between flow and return, qv=qvMin</TD>
    <TD>deltaTFlowReturnLowST</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Maximum temperature difference between flow and return, qv=qvMax</TD>
    <TD>deltaTFlowReturnUpST</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Minimum volume flow of circulation pump</TD>
    <TD>qvMinST</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Maximum volume flow of circulation pump</TD>
    <TD>qvMaxST</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Inclination angle of the PV system</TD>
    <TD>alphaPV</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Orientation angle of the PV system</TD>
    <TD>betaPV</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Installed peak power of the PV system</TD>
    <TD>PVPeak</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>WolfCGB20 validated with CoSES mearusements</TD>
    <TD>wolfCGB20_GC1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>Results:</TH>
    <TD>If true, standard control will be used to control the condensing       
                                  boiler</TD>
    <TD>StandardControlCB</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Standard control value of the CB modulation</TD>
    <TD>CBinStandardControl</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Standard control value of the heat pump modulation</TD>
    <TD>HPinStandardControl</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Standard control value of the auxiliary heater modulation</TD>
    <TD>AUXinStandardControl</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>If true, standard control will be used to control the heat pump</TD>
    <TD>StandardHPcontrol</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Switches between the inlet of the HP into the TS (true: upper storage  
                                         connection)</TD>
    <TD>SwitchHPTSPort_StandardControl</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Standard Control for the 3-way valve to switch the connection to the   
                                        thermal storage</TD>
    <TD>StandardControlHPSwitch</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Switch-on/off of solar thermal pump</TD>
    <TD>CPonST</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Reference volume flow of solar thermal pump</TD>
    <TD>qvRefST</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Solar thermal collector temperature</TD>
    <TD>TCollectorST</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Temperature of solar thermal heat storage connection</TD>
    <TD>TStorageSTConnection</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Flow temperature solar thermal</TD>
    <TD>TFlowST</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Return temperature solar thermal</TD>
    <TD>TReturnST</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>If true, standard control will be used to control the solar thermal    
                                       pump</TD>
    <TD>StandardSTcontrol</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>PV power</TD>
    <TD>PV_P</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Produced energy of the PV system</TD>
    <TD>PV_E</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Condensing boiler flow temperature</TD>
    <TD>CB_S_TM_VL</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Condensing boiler return temperature</TD>
    <TD>CB_S_TM_RL</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Volume flow condensing boiler</TD>
    <TD>CB_S_FW_HC</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Gas flow condensing boiler</TD>
    <TD>CB_S_FG</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Demanded fuel volume</TD>
    <TD>CB_VFuel</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heat output power of condensing boiler</TD>
    <TD>CB_P_heat_is</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Gas power of condensing boiler</TD>
    <TD>CB_P_gas_is</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heat output of condensing boiler</TD>
    <TD>CB_E_heat_produced</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Gas input of condensing boiler</TD>
    <TD>CB_E_gas_consumed</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heating efficiency</TD>
    <TD>CB_Efficiency</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heat pump flow temperature (output of the outdoor unit)</TD>
    <TD>HP_S_TM_VL</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heat pump return temperature</TD>
    <TD>HP_S_TM_RL</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heat pump flow temperature - Low temperature</TD>
    <TD>HP_S_TM_HC_TL</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heat pump flow temperature - High temperature</TD>
    <TD>HP_S_TM_HW_TH</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Volume flow heat pump </TD>
    <TD>HP_S_FW_HC</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heat output power of the heat pump </TD>
    <TD>HP_P_heat_HP</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heat output power of the auxiliary heater</TD>
    <TD>HP_P_heat_Aux</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Total heat output power of the heat pump</TD>
    <TD>HP_P_heat_Tot</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Cooling output of the heat pump</TD>
    <TD>HP_P_cooling</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Total electricity demand of heat pump</TD>
    <TD>HP_P_elec_is</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heat output of the heat pump </TD>
    <TD>HP_E_heat_HP</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heat output power of the auxiliary heater</TD>
    <TD>HP_E_heat_Aux</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Total heat output power of the heat pump</TD>
    <TD>HP_E_heat_Tot</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Cooling output of the heat pump</TD>
    <TD>HP_E_cooling</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Consumed electric energy of heat pump</TD>
    <TD>HP_E_elec_consumed</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Coefficiency of performance</TD>
    <TD>HP_COP</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Energy Efficiency Ratio (Cooling)</TD>
    <TD>HP_EER</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Solar thermal flow temperature</TD>
    <TD>ST_S_TM_VL</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Solar thermal return temperature</TD>
    <TD>ST_S_TM_RL</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Volume flow solar thermal</TD>
    <TD>ST_S_FW_HC</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heat output power of solar thermal</TD>
    <TD>ST_P_heat_is</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heat output of solar thermal</TD>
    <TD>ST_E_heat_produced</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Flow temperature consumption side</TD>
    <TD>TS_S_TM_HC_VL</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Return temperature consumption side</TD>
    <TD>TS_S_TM_HC_RL</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Flow temperature producer side</TD>
    <TD>TS_S_TM_PS_VL</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Return temperature producer side</TD>
    <TD>TS_S_TM_PS_RL</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Flow temperature to fresh water station</TD>
    <TD>TS_S_TM_HC_HW_VL</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Return temperature to fresh water station</TD>
    <TD>TS_S_TM_HC_HW_RL</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Thermal storage temperature 1</TD>
    <TD>TS_S_TM_BT_1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Thermal storage temperature 2</TD>
    <TD>TS_S_TM_BT_2</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Thermal storage temperature 3</TD>
    <TD>TS_S_TM_BT_3</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Thermal storage temperature 4</TD>
    <TD>TS_S_TM_BT_4</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Thermal storage temperature 5</TD>
    <TD>TS_S_TM_BT_5</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Thermal storage temperature 6</TD>
    <TD>TS_S_TM_BT_6</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Thermal storage temperature 7</TD>
    <TD>TS_S_TM_BT_7</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Thermal storage temperature 8</TD>
    <TD>TS_S_TM_BT_8</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Thermal storage temperature 9</TD>
    <TD>TS_S_TM_BT_9</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Thermal storage temperature 10</TD>
    <TD>TS_S_TM_BT_10</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Energy in thermal storage</TD>
    <TD>TS_E_Storage_BT</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>State of charge of the thermal storage</TD>
    <TD>TS_SOC_BT</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heat Sink flow temperature before mixing unit</TD>
    <TD>HS_S_TM_VL_bM</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heat Sink flow temperature after mixing unit</TD>
    <TD>HS_S_TM_VL_aM</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heat sink return temperature</TD>
    <TD>HS_S_TM_RL</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heat sink flow temperature hot water</TD>
    <TD>HS_S_TM_HW_VL</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heat sink return temperature hot water</TD>
    <TD>HS_S_TM_HW_RL</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Temperature in the house</TD>
    <TD>HS_S_TM_Room</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Volume flow after mixing unit</TD>
    <TD>HS_S_FW_HC_aM</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Volume flow before mixing unit</TD>
    <TD>HS_S_FW_HC_bM</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Volume flow domestic hot water consumption</TD>
    <TD>HS_S_FW_HW_VL</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heating power</TD>
    <TD>HS_P_DemHeatHC_is</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Domestic hot water power</TD>
    <TD>HS_P_DemHeatHW_is</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heating Energy</TD>
    <TD>HS_E_DemHeatHC_consumed</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Domestic hot water energy</TD>
    <TD>HS_E_DemHeatHW_consumed</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Condensing boiler input - set temperature (power is constant)</TD>
    <TD>CBIn_TSet</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Condensing boiler input - heat power (temperature difference between   
                                        supply and return is constant)</TD>
    <TD>CBIn_P</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Outlet temperature of district heating heat exchanger</TD>
    <TD>TDH_HEXout</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Inlet temperature of district heating heat exchanger</TD>
    <TD>DTH_HEXin</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Volume flow to heat exchanger</TD>
    <TD>qv_HEX</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Reference volume flow of solar thermal pump</TD>
    <TD>qvSTpump</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Reference volume flow of district heating pump - positive: feed in -   
                                        negative: extraction</TD>
    <TD>qvDHpump</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Air source heat pump modulation in percent</TD>
    <TD>HPModulation</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Switches between the inlet of the HP into the TS (true: upper storage  
                                         connection)</TD>
    <TD>SwitchHPTSPort</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Air source heat pump - modulation of the auxiliary heater (percent)</TD>
    <TD>HPAuxModulation</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heating mode (true) or cooling mode (false)</TD>
    <TD>HPMode</TD>
    <TD>&nbsp;</TD></TR></TBODY></TABLE></DIV>
<H2>Description:</H2>
<P>&nbsp;</P></BODY></HTML>
"),
		experiment(
			StopTime=1,
			StartTime=0,
			Tolerance=1e-06,
			Interval=0.001,
			__esi_SolverOptions(
				solver="CVODE",
				typename="ExternalCVODEOptionData"),
			__esi_MinInterval="9.999999999999999e-10",
			__esi_AbsTolerance="1e-6"));
end MF5;
