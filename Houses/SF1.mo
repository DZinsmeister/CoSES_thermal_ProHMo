// CP: 65001
// SimulationX Version: 4.2.3.69223
within CoSES_Models.Houses;
model SF1 "House 1 with ST, CHP and CB"
	GreenCity.Interfaces.Electrical.LV3Phase lV3Phase1 "Electrical Low-Voltage AC Three-Phase Connector" annotation(Placement(
		transformation(extent={{210,-400},{230,-380}}),
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
		qvMaxPump(displayUnit="l/min")=0.00025) annotation(Placement(transformation(extent={{295,-85},{330,-50}})));
	GreenCity.Utilities.Thermal.Pump pump1(
		qvMax(displayUnit="m³/s")=qvMaxDHW,
		PPump(tableID "External table object")) annotation(Placement(transformation(
		origin={290,-130},
		extent={{0,0},{10,10}},
		rotation=-180)));
	Consumer.DHW_demand dHW_demand1(
		Load(tableID "External table object"),
		WeeklyData=WeeklyData,
		File=File,
		Table=Table,
		DHWfactor=DHWfactor) annotation(Placement(transformation(extent={{415,-180},{435,-160}})));
	GreenCity.Utilities.Electrical.PhaseTap phaseTap2 annotation(Placement(transformation(extent={{260,-325},{270,-315}})));
	GreenCity.Utilities.Electrical.Grid grid1(
		OutputType=GreenCity.Utilities.Electrical.Grid.OutputEnum.MasterGrid,
		useA=true,
		useB=true,
		useC=true,
		useD=true,
		useE=true,
		useF=true) annotation(Placement(transformation(extent={{200,-355},{240,-315}})));
	GreenCity.Utilities.Electrical.PhaseTap phaseTap1 annotation(Placement(transformation(extent={{275,-340},{285,-330}})));
	Storage.HeatStorageCombined WolfSPU2_800(
		VStorage=0.8,
		dStorage=0.79,
		QlossRate=20,
		LinearProfile=TSLinearProfile,
		TupInit(displayUnit="K")=TSTupInit,
		TlowInit(displayUnit="K")=TSTlowInit,
		TLayerVector(displayUnit="K")=TSTLayerVector,
		TMax(displayUnit="K")=Tmax_TS,
		alphaMedStatic=1,
		use1=true,
		iFlow1=10,
		iReturn1=1,
		use2=false,
		HE2=true,
		iFlow2=5,
		AHeatExchanger2=25,
		VHeatExchanger2=0.0165,
		use4=true,
		iFlow4=10,
		iReturn4=1,
		use5=false) annotation(Placement(transformation(extent={{165,-179},{200,-105}})));
	GreenCity.Local.SolarThermal WolfCRK12(
		CPC=CPC,
		alphaModule(displayUnit="rad")=alphaModule,
		betaModule(displayUnit="rad")=betaModule,
		nSeries=nSeries,
		nParallel=nParallel,
		AModule=AModule,
		VAbsorber(displayUnit="m³")=VAbsorber,
		etaOptical=0.642,
		a1=0.885,
		a2=0.001,
		CCollector=8416) annotation(Placement(transformation(extent={{-40,-220},{0,-180}})));
	GreenCity.Utilities.Thermal.Pump pump2(
		qvMax(displayUnit="m³/s")=qvMaxST,
		PPump(tableID "External table object")) annotation(Placement(transformation(
		origin={35,-185},
		extent={{0,0},{10,10}},
		rotation=-180)));
	GreenCity.Interfaces.Thermal.DefineVolumeFlow defineVolumeFlow1 annotation(Placement(transformation(
		origin={210,-10},
		extent={{-10,-10},{10,10}},
		rotation=-90)));
	GreenCity.Interfaces.Thermal.ExtractVolumeFlow extractVolumeFlow1 annotation(Placement(transformation(
		origin={180,-10},
		extent={{10,-10},{-10,10}},
		rotation=-90)));
	GreenCity.Utilities.Electrical.PhaseTap phaseTap3 annotation(Placement(transformation(extent={{185,-355},{175,-345}})));
	GreenCity.Utilities.Electrical.Grid grid2(
		OutputType=GreenCity.Utilities.Electrical.Grid.OutputEnum.MasterGrid,
		useA=true,
		useB=false,
		useC=false,
		useD=true,
		useE=true,
		useF=false) annotation(Placement(transformation(extent={{155,-305},{195,-265}})));
	GreenCity.Utilities.Electrical.PhaseTap phaseTap5 annotation(Placement(transformation(extent={{210,-275},{220,-265}})));
	GreenCity.Utilities.Electrical.PhaseTap phaseTap6 annotation(Placement(transformation(extent={{215,-290},{225,-280}})));
	Storage.HeatStorageCombined WolfSEM1_500(
		VStorage=0.5,
		dStorage=0.65,
		QlossRate=7,
		LinearProfile=DHWLinearProfile,
		TupInit(displayUnit="K")=DHWTupInit,
		TlowInit(displayUnit="K")=DHWTlowInit,
		TLayerVector(displayUnit="K")=DHWTLayerVector,
		TMax(displayUnit="K")=Tmax_DHW,
		alphaMedStatic=1,
		use1=true,
		HE1=true,
		iFlow1=8,
		iReturn1=6,
		AHeatExchanger1=0.95,
		VHeatExchanger1=0.0061,
		use2=true,
		HE2=true,
		iFlow2=5,
		AHeatExchanger2=1.8,
		VHeatExchanger2=0.0115,
		use4=true,
		HE4=false) annotation(Placement(transformation(extent={{310,-234},{345,-160}})));
	GreenCity.Utilities.Thermal.DistributionValve distributionValve1 annotation(Placement(transformation(extent={{245,-55},{265,-75}})));
	GreenCity.Utilities.Thermal.MergingValve mergingValve1 annotation(Placement(transformation(extent={{245,-180},{265,-160}})));
	Distribution.HydraulicSwitch2HG hydraulicSwitch2HG1(
		FeedInPump(PPump(tableID "External table object")),
		ExtractionPump1(PPump(tableID "External table object"))) annotation(Placement(transformation(extent={{150,-75},{220,-60}})));
	Modelica.Blocks.Sources.RealExpression CBControlIn(y=CBIn) annotation(Placement(transformation(extent={{-40,-40},{-20,-20}})));
	Modelica.Blocks.Sources.RealExpression CHPModulation(y=CHPin) annotation(Placement(transformation(extent={{-40,-110},{-20,-90}})));
	Modelica.Blocks.Sources.BooleanExpression CHP_EVU(y=(CHPEVU and not StandardCHPcontrol) or CHPon) "Set output signal to a time varying Boolean expression" annotation(Placement(transformation(extent={{-40,-65},{-20,-45}})));
	Modelica.Blocks.Sources.RealExpression TColdWater(y(quantity="Basics.Temp")=288.15) annotation(Placement(transformation(extent={{470,-215},{450,-195}})));
	HeatGenerator.DigitalTwins.NeoTower2_GC neoTower2_GC1(neoTower2(
		EffTotal_table(tableID "External table object"),
		StartUp_table(tableID "External table object"),
		CoolDown_table(tableID "External table object"))) annotation(Placement(transformation(extent={{75,-95},{120,-50}})));
	Modelica.Blocks.Sources.RealExpression VolumeFlow_DHWpump(y=qvRefDHW) annotation(Placement(transformation(extent={{395,-115},{375,-95}})));
	Modelica.Blocks.Logical.Switch switch1 annotation(Placement(transformation(extent={{345,-130},{325,-110}})));
	Modelica.Blocks.Logical.Switch switch2 annotation(Placement(transformation(extent={{-80,-165},{-60,-145}})));
	protected
		parameter Boolean CBControlMode=false "If true, flow temperature controlled, else power output is controlled" annotation(Dialog(
			group="Condensing Boiler",
			tab="Heat Generator Parameters"));
	public
		parameter Real CBDeltaT(quantity="Thermics.TempDiff")=20 "Temperature difference between flow and return temperature" annotation(Dialog(
			group="Condensing Boiler",
			tab="Heat Generator Parameters"));
	protected
		parameter Real CBPmax(quantity="Basics.Power")=14000 if not CBControlMode "Maximum power of CB" annotation(Dialog(
			group="Condensing Boiler",
			tab="Heat Generator Parameters"));
	public
		parameter Real CBTmax(quantity="Basics.Temp")=356.15 if CBControlMode "Maximum temperature of CB" annotation(Dialog(
			group="Condensing Boiler",
			tab="Heat Generator Parameters"));
	protected
		parameter Real CBPmin(quantity="Basics.Power")=1990 if not CBControlMode "Minimum power of CB" annotation(Dialog(
			group="Condensing Boiler",
			tab="Heat Generator Parameters"));
	public
		parameter Real CBTmin(quantity="Basics.Temp")=293.15 if CBControlMode "Minimum temperature of CB" annotation(Dialog(
			group="Condensing Boiler",
			tab="Heat Generator Parameters"));
		parameter Real CHPmax(quantity="Basics.Power")=2000 "Maximum electrical power of CHP" annotation(Dialog(
			group="CHP",
			tab="Heat Generator Parameters"));
		parameter Real CHPmin(quantity="Basics.Power")=1100 "Minimum electrical power of CHP" annotation(Dialog(
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
		parameter Real Tmax_DHW(quantity="Basics.Temp")=353.15 "Maximum temperature within the thermal storage" annotation(Dialog(
			group="DHW Storage",
			tab="Storage Parameters"));
		parameter Real T0_DHW(quantity="Basics.Temp")=288.15 "Temperature level to calculate the stored energy (e.g. return temperature of DHW" annotation(Dialog(
			group="DHW Storage",
			tab="Storage Parameters"));
		parameter Boolean DHWLinearProfile=true "If true, the temperature profile at simulation begin within the storage is linear, if false the profile is defined by a temperature vector" annotation(Dialog(
			group="DHW Storage",
			tab="Storage Parameters"));
		parameter Real DHWTupInit(
			quantity="Thermics.Temp",
			displayUnit="°C")=338.15 if TSLinearProfile "Temperature of upmost heat storage layer at simulation begin" annotation(Dialog(
			group="DHW Storage",
			tab="Storage Parameters"));
		parameter Real DHWTlowInit(
			quantity="Thermics.Temp",
			displayUnit="°C")=313.14999999999998 if TSLinearProfile "Temperature of lowmost heat storage layer at simulation begin" annotation(Dialog(
			group="DHW Storage",
			tab="Storage Parameters"));
		parameter Real DHWTLayerVector[20](quantity="Basics.Temp")={313.15,313.15,313.15,313.15,313.15,313.15,313.15,313.15,313.15,313.15,313.15,313.15,313.15,313.15,313.15,313.15,313.15,313.15,313.15,313.15} if not TSLinearProfile "Vector of temperature profile of the layers at simulation begin, element 1 is at lowest layer" annotation(Dialog(
			group="DHW Storage",
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
		parameter String PresenceFile=classDirectory()+"Data\\SF1_WholeYear.txt" if UseIndividualPresence "File with presence timeseries (presence in %; 0% - no one is at home; 100% - everyone is at home)" annotation(Dialog(
			group="Additional Yields/Losses",
			tab="Consumption Parameters"));
		parameter Boolean UseIndividualElecConsumption=true "If individual electricity consumption is used, individual consumption data ha to be provided, else standart load profiles are used" annotation(Dialog(
			group="Additional Yields/Losses",
			tab="Consumption Parameters"));
		parameter String ElConsumptionFile=classDirectory()+"Data\\SF1_WholeYear.txt" if UseIndividualElecConsumption "File with electric consumption time series (consumption in kW)" annotation(Dialog(
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
		parameter String File=classDirectory()+"Data\\SF1_WholeYear.txt" "DHW Data File" annotation(Dialog(
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
		Boolean CHPEVU "CHPEVU" annotation(
			HideResult=false,
			Dialog(
				group="CHP",
				tab="Standard Control"));
		Modelica.Blocks.Interfaces.BooleanInput StandardSTcontrol "If true, standard control will be used to control the solar thermal pump" annotation(
			Placement(
				transformation(extent={{-140,-175},{-100,-135}}),
				iconTransformation(
					origin={-50,250},
					extent={{-20,-20},{20,20}},
					rotation=-90)),
			Dialog(
				group="Solar Thermal",
				tab="Standard Control",
				visible=false));
		parameter Real deltaTonST(quantity="Thermics.TempDiff")=3 "Switch-on temperature difference between collector and storage temperature" annotation(Dialog(
			group="Solar Thermal",
			__esi_groupCollapsed=true,
			tab="Standard Control"));
		parameter Real deltaToffST(quantity="Thermics.TempDiff")=2 "Switch-off-temperature difference between collector and storage temperature" annotation(Dialog(
			group="Solar Thermal",
			tab="Standard Control"));
		parameter Real deltaTFlowReturnLowST(quantity="Thermics.TempDiff")=3 "Minimum temperature difference between flow and return, qv=qvMin" annotation(Dialog(
			group="Solar Thermal",
			tab="Standard Control"));
		parameter Real deltaTFlowReturnUpST(quantity="Thermics.TempDiff")=7 "Maximum temperature difference between flow and return, qv=qvMax" annotation(Dialog(
			group="Solar Thermal",
			tab="Standard Control"));
		parameter Real qvMinST(
			quantity="Thermics.VolumeFlow",
			displayUnit="m³/h")=0 "Minimum volume flow of circulation pump" annotation(Dialog(
			group="Solar Thermal",
			tab="Standard Control"));
		parameter Real qvMaxST(
			quantity="Thermics.VolumeFlow",
			displayUnit="l/min")=0.0003333333333333334 "Maximum volume flow of circulation pump" annotation(Dialog(
			group="Solar Thermal",
			tab="Standard Control"));
		Boolean CPonST "Switch-on/off of solar thermal pump" annotation(Dialog(
			group="Solar Thermal",
			__esi_groupCollapsed=true,
			tab="Standard Control",
			visible=false));
		Real qvRefST(quantity="Thermics.VolumeFlow") "Reference volume flow of solar thermal pump" annotation(Dialog(
			group="Solar Thermal",
			tab="Standard Control",
			visible=false));
		Real TCollectorST(quantity="Basics.Temp") "Solar thermal collector temperature" annotation(Dialog(
			group="Solar Thermal",
			tab="Standard Control",
			visible=false));
		Real TStorageSTConnection(quantity="Basics.Temp") "Temperature of solar thermal heat storage connection" annotation(Dialog(
			group="Solar Thermal",
			tab="Standard Control",
			visible=false));
		Real TFlowST(quantity="Basics.Temp") "Flow temperature solar thermal" annotation(Dialog(
			group="Solar Thermal",
			tab="Standard Control",
			visible=false));
		Real TReturnST(quantity="Basics.Temp") "Return temperature solar thermal" annotation(Dialog(
			group="Solar Thermal",
			tab="Standard Control",
			visible=false));
		Modelica.Blocks.Interfaces.BooleanInput StandardDHWcontrol "If true, standard control will be used to control the DHW pump" annotation(
			Placement(
				transformation(extent={{475,-120},{515,-80}}),
				iconTransformation(
					origin={-150,250},
					extent={{-20,-20},{20,20}},
					rotation=-90)),
			Dialog(
				group="DHW storage pump",
				tab="Standard Control",
				visible=false));
		parameter Real TonTS_DHW(quantity="Thermics.Temp")=323.15 "Switch-on temperature of DHW storage charging" annotation(Dialog(
			group="DHW storage pump",
			__esi_groupCollapsed=true,
			tab="Standard Control"));
		parameter Real ToffTS_DHW(quantity="Thermics.Temp")=333.15 "Switch-off temperature of DHW storage charging" annotation(Dialog(
			group="DHW storage pump",
			tab="Standard Control"));
		parameter Real deltaTonDHW(quantity="Thermics.TempDiff")=3 "Switch-on temperature, if the DHW temperature < DHW consumption temperater + deltaTonDHW, the storage will be charged" annotation(Dialog(
			group="DHW storage pump",
			tab="Standard Control"));
		parameter Real qvMaxDHW(
			quantity="Thermics.VolumeFlow",
			displayUnit="l/min")=0.0003333333333333334 "Maximum volume flow of circulation pump" annotation(Dialog(
			group="DHW storage pump",
			tab="Standard Control"));
		Boolean CPonDHW "Switch-on/off of DHW pump" annotation(Dialog(
			group="DHW storage pump",
			tab="Standard Control",
			visible=false));
		Real qvRefDHW(quantity="Thermics.VolumeFlow") "Standard control flow rate of the DHW pump" annotation(Dialog(
			group="DHW storage pump",
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
		Real ST_S_TM_VL(quantity="Basics.Temp") "Solar thermal flow temperature" annotation(Dialog(
			group="Temperatures",
			tab="Results ST",
			visible=false));
		Real ST_S_TM_RL(quantity="Basics.Temp") "Solar thermal return temperature" annotation(Dialog(
			group="Temperatures",
			tab="Results ST",
			visible=false));
		Real ST_S_TM_Collector(quantity="Basics.Temp") "ST_S_TM_Collector" annotation(Dialog(
			group="Temperatures",
			tab="Results ST",
			visible=false));
		Real ST_S_FW_HC(
			quantity="Thermics.VolumeFlow",
			displayUnit="l/min") "Volume flow solar thermal" annotation(Dialog(
			group="Volume Flow",
			tab="Results ST",
			visible=false));
		Real ST_P_heat_is(quantity="Basics.Power") "Heat output power of solar thermal" annotation(Dialog(
			group="Power",
			tab="Results ST",
			visible=false));
		Real ST_E_heat_produced(
			quantity="Basics.Energy",
			displayUnit="kWh") "Heat output of solar thermal" annotation(Dialog(
			group="Energy",
			tab="Results ST",
			visible=false));
		Real TS_P_heat_toHWS(quantity="Basics.Power") "Power transfered to DHW storage" annotation(Dialog(
			group="Power",
			tab="Results TS",
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
		Real TS_S_TM_HC_HW_VL(quantity="Basics.Temp") "Flow temperature to DHW storage" annotation(Dialog(
			group="Temperatures",
			tab="Results TS",
			visible=false));
		Real TS_S_TM_HC_HW_RL(quantity="Basics.Temp") "Return temperature to DHW storage" annotation(Dialog(
			group="Temperatures",
			tab="Results TS",
			visible=false));
		Real TS_S_TM_HWS_1(quantity="Basics.Temp") "DHW storage temperature 1" annotation(Dialog(
			group="Storage Temperatures",
			__esi_groupCollapsed=true,
			tab="Results TS",
			visible=false));
		Real TS_S_TM_HWS_2(quantity="Basics.Temp") "DHW storage temperature 2" annotation(Dialog(
			group="Storage Temperatures",
			tab="Results TS",
			visible=false));
		Real TS_S_TM_HWS_3(quantity="Basics.Temp") "DHW storage temperature 3" annotation(Dialog(
			group="Storage Temperatures",
			tab="Results TS",
			visible=false));
		Real TS_S_TM_BT_1(quantity="Basics.Temp") "Thermal storage temperature 1" annotation(Dialog(
			group="Storage Temperatures",
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
		Real TS_S_FW_HC_HW(
			quantity="Thermics.VolumeFlow",
			displayUnit="l/min") "Volume flow to DHW storage" annotation(Dialog(
			group="Volume Flow",
			tab="Results TS",
			visible=false));
		Real TS_E_Storage_BT(
			quantity="Basics.Energy",
			displayUnit="kWh") "Energy in thermal storage" annotation(Dialog(
			group="Energy",
			tab="Results TS",
			visible=false));
		Real TS_E_Storage_HWS(
			quantity="Basics.Energy",
			displayUnit="kWh") "Energy in DHW storage" annotation(Dialog(
			group="Energy",
			tab="Results TS",
			visible=false));
		Real TS_E_heat_toHWS(
			quantity="Basics.Energy",
			displayUnit="kWh") "Total energy transfered to DHW storage" annotation(Dialog(
			group="Energy",
			tab="Results TS",
			visible=false));
		Real TS_SOC_BT(quantity="Basics.RelMagnitude") "State of charge of the thermal storage" annotation(Dialog(
			group="State of charge",
			tab="Results TS",
			visible=false));
		Real TS_SOC_HWS(quantity="Basics.RelMagnitude") "State of charge of the DHW storage" annotation(Dialog(
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
		Modelica.Blocks.Interfaces.RealInput qvSTpump(quantity="Thermics.VolumeFlow") "Reference volume flow of solar thermal pump" annotation(
			Placement(
				transformation(extent={{-140,-210},{-100,-170}}),
				iconTransformation(extent={{-270,30},{-230,70}})),
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
		Modelica.Blocks.Interfaces.RealInput qvDHWpump(quantity="Thermics.VolumeFlow") "Reference volume flow of domestic hot water pump to charge the DHW storage" annotation(
			Placement(
				transformation(extent={{475,-150},{515,-110}}),
				iconTransformation(extent={{-270,130},{-230,170}})),
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
		Modelica.Blocks.Sources.RealExpression qvSTpump_StandardControl(y=qvRefST) annotation(Placement(transformation(extent={{-115,-130},{-95,-110}})));
		Modelica.Blocks.Logical.Switch switch3 annotation(Placement(transformation(extent={{-5,-95},{15,-75}})));
		Modelica.Blocks.Sources.RealExpression CHPin_StandardControl(y=CHPinStandardControl) annotation(Placement(transformation(extent={{-40,-80},{-20,-60}})));
		Modelica.Blocks.Logical.Switch switch4 annotation(Placement(transformation(extent={{-5,-25},{15,-5}})));
		Modelica.Blocks.Sources.RealExpression CBin_StandardControl(y=CBinStandardControl) annotation(Placement(transformation(extent={{-40,-10},{-20,10}})));
		HeatGenerator.DigitalTwins.WolfCGB14_GC wolfCGB14_GC1(
			DeltaT=CBDeltaT,
			wolfCGB1(
				EffHeat_table(tableID "External table object"),
				StartUp_table(tableID "External table object"),
				CoolDown_table(tableID "External table object"),
				PHeat_table(tableID "External table object"),
				DeltaT_table(tableID "External table object"))) annotation(Placement(transformation(extent={{25,-40},{70,5}})));
	equation
		// Input Conversion
		// CB
		if CBControlMode then
			CBIn = min(max(0, 10 * ((CBIn_TSet - CBTmin)/(CBTmax - CBTmin))), 10);
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
		// Solar thermal controller (copied from Green City's 'SolarController')
		TCollectorST = WolfCRK12.TCollector;
		TStorageSTConnection = WolfSEM1_500.TStorage[5];
		TFlowST = WolfCRK12.FlowST.T;
		TReturnST = WolfCRK12.ReturnST.T;
		when (((TCollectorST - TStorageSTConnection) > deltaTonST) and StandardSTcontrol) then
			CPonST = true;
		elsewhen (((TCollectorST - TStorageSTConnection) < deltaToffST) or not StandardSTcontrol) then		
			CPonST = false;
		end when;
		if CPonST then
			qvRefST = max(min((qvMinST + (qvMaxST - qvMinST) * ((((TFlowST - TReturnST) - deltaTFlowReturnLowST) / (deltaTFlowReturnUpST - deltaTFlowReturnLowST)))),qvMaxST),qvMinST);
		else
			qvRefST = 0;
		end if;
		
		// DHW pump
		when ((WolfSEM1_500.TStorage[7] < TonTS_DHW) and (WolfSPU2_800.TStorage[8] > ToffTS_DHW) and StandardDHWcontrol) then
			CPonDHW = true;
		elsewhen (((WolfSEM1_500.TStorage[7]) > ToffTS_DHW) or (WolfSPU2_800.TStorage[9] < WolfSEM1_500.TStorage[7]) or not StandardDHWcontrol) then
			CPonDHW = false;
		end when;
		if CPonDHW then
			qvRefDHW = qvMaxDHW;
		else
			qvRefDHW = 0;
		end if;
		
		// CHP
		when ((TS_SOC_BT < SOCminCHP) and (WolfSPU2_800.TStorage[8] < TStartCHP) and StandardCHPcontrol) then
			CHPon = true;
		elsewhen ((TS_SOC_BT > SOCmaxCHP) or (WolfSPU2_800.TStorage[3] > TStopCHP) or not StandardCHPcontrol) then
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
		CB_S_TM_VL = wolfCGB14_GC1.TFlow;
		CB_S_TM_RL = wolfCGB14_GC1.TReturn;
		CB_S_FW_HC = wolfCGB14_GC1.qv;
		CB_S_FG = wolfCGB14_GC1.qvFuel;
		CB_VFuel = wolfCGB14_GC1.VFuel;
		CB_P_heat_is = wolfCGB14_GC1.QHeat;
		CB_P_gas_is = wolfCGB14_GC1.PFuel;
		CB_E_heat_produced = wolfCGB14_GC1.EHeat;
		CB_E_gas_consumed = wolfCGB14_GC1.EFuel;
		CB_Efficiency = wolfCGB14_GC1.Efficiency;
		
		// CHP
		CHP_S_TM_VL = neoTower2_GC1.TFlow;
		CHP_S_TM_RL = neoTower2_GC1.TReturn;
		CHP_S_FW_HC = neoTower2_GC1.qv;
		CHP_S_FG = neoTower2_GC1.qvFuel;
		CHP_VFuel = neoTower2_GC1.VFuel;
		CHP_P_heat_is = neoTower2_GC1.QHeat;
		CHP_P_el_is = neoTower2_GC1.PGEN;
		CHP_P_gas_is = neoTower2_GC1.PFuel;
		CHP_E_heat_produced = neoTower2_GC1.EHeat;
		CHP_E_el_produced = neoTower2_GC1.EGEN;
		CHP_E_gas_consumed = neoTower2_GC1.EFuel;
		CHP_Efficiency_th = neoTower2_GC1.HeatEfficiency;
		CHP_Efficiency_el = neoTower2_GC1.ElEfficiency;
		CHP_Efficiency_total = CHP_Efficiency_th + CHP_Efficiency_el;
		
		
		// Solar Thermal Collectors
		ST_S_TM_VL = WolfCRK12.FlowST.T;
		ST_S_TM_RL = WolfCRK12.ReturnST.T;
		ST_S_TM_Collector = WolfCRK12.TCollector;
		ST_S_FW_HC = WolfCRK12.FlowST.qv;
		ST_E_heat_produced = WolfCRK12.EST;
		ST_P_heat_is = WolfCRK12.QSolarThermal;
		
		// Hot Water Storage
		TS_P_heat_toHWS = -WolfSEM1_500.PStorage[1];
		TS_S_TM_HWS_1 = WolfSEM1_500.TStorage[3];
		TS_S_TM_HWS_2 = WolfSEM1_500.TStorage[7];
		TS_S_TM_HWS_3 = WolfSEM1_500.TStorage[8];
		TS_S_FW_HC_HW = pump1.qvRef;
		TS_E_Storage_HWS = WolfSEM1_500.cpMed*WolfSEM1_500.rhoMed*WolfSEM1_500.VStorage*((WolfSEM1_500.TLayer[1]+WolfSEM1_500.TLayer[2]+WolfSEM1_500.TLayer[3]+WolfSEM1_500.TLayer[4]+WolfSEM1_500.TLayer[5]+WolfSEM1_500.TLayer[6]+WolfSEM1_500.TLayer[7]+WolfSEM1_500.TLayer[8]+WolfSEM1_500.TLayer[9]+WolfSEM1_500.TLayer[10])/10-T0_DHW);
		TS_E_heat_toHWS = WolfSEM1_500.EHeat[1];
		TS_SOC_HWS = TS_E_Storage_HWS/(WolfSEM1_500.cpMed*WolfSEM1_500.rhoMed*WolfSEM1_500.VStorage*(Tmax_DHW - T0_DHW));
		
		//Thermal Storage
		TS_S_TM_HC_VL = hydraulicSwitch2HG1.TSupplyHC;
		TS_S_TM_HC_RL = hydraulicSwitch2HG1.TReturnHC;
		TS_S_TM_PS_VL = hydraulicSwitch2HG1.mergingValve6.PipeOut.T;
		TS_S_TM_PS_RL = hydraulicSwitch2HG1.HeatGeneratorValve2.PipeIn.T;
		TS_S_TM_HC_HW_VL = distributionValve1.PipeOutRemain.T;
		TS_S_TM_HC_HW_RL = mergingValve1.PipeIn2.T;
		TS_S_TM_BT_1 = WolfSPU2_800.TStorage[1];
		TS_S_TM_BT_2 = WolfSPU2_800.TStorage[2];
		TS_S_TM_BT_3 = WolfSPU2_800.TStorage[3];
		TS_S_TM_BT_4 = WolfSPU2_800.TStorage[4];
		TS_S_TM_BT_5 = WolfSPU2_800.TStorage[5];
		TS_S_TM_BT_6 = WolfSPU2_800.TStorage[6];
		TS_S_TM_BT_7 = WolfSPU2_800.TStorage[7];
		TS_S_TM_BT_8 = WolfSPU2_800.TStorage[8];
		TS_S_TM_BT_9 = WolfSPU2_800.TStorage[9];
		TS_S_TM_BT_10 = WolfSPU2_800.TStorage[10];
		TS_E_Storage_BT = WolfSPU2_800.cpMed*WolfSPU2_800.rhoMed*WolfSPU2_800.VStorage*((WolfSPU2_800.TLayer[1]+WolfSPU2_800.TLayer[2]+WolfSPU2_800.TLayer[3]+WolfSPU2_800.TLayer[4]+WolfSPU2_800.TLayer[5]+WolfSPU2_800.TLayer[6]+WolfSPU2_800.TLayer[7]+WolfSPU2_800.TLayer[8]+WolfSPU2_800.TLayer[9]+WolfSPU2_800.TLayer[10])/10-T0_TS);
		TS_SOC_BT = TS_E_Storage_BT/(WolfSPU2_800.cpMed*WolfSPU2_800.rhoMed*WolfSPU2_800.VStorage*(Tmax_TS - T0_TS));
		
		// Heat Sink (Heating)
		HS_S_TM_VL_bM = heatingUnitFlowTemperature1.FlowSupply.T;
		HS_S_TM_VL_aM = heatingUnitFlowTemperature1.FlowSink.T;
		HS_S_TM_RL = heatingUnitFlowTemperature1.ReturnSupply.T;
		HS_S_TM_Room = simpleHeatedBuilding1.TZone[2];
		HS_S_FW_HC_bM = heatingUnitFlowTemperature1.FlowSink.qv;
		HS_S_FW_HC_aM = -heatingUnitFlowTemperature1.FlowSupply.qv;
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
		
		// Solar thermal controller (copied from Green City's 'SolarController')
		assert(deltaTonST > deltaToffST, "Switch-on-temperature difference lower than switch-off-temperature difference");
		assert((deltaTonST > 0) and (deltaToffST > 0), "Switching temperature differences must be greater than 0");
		assert(deltaTFlowReturnUpST > deltaTFlowReturnLowST, "Volume Flow Control Temperature Difference are out of limits");
		if (((TCollectorST - TStorageSTConnection) > deltaTonST) and StandardSTcontrol) then
			CPonST = true;
		else
			CPonST = false;
		end if;
		
		// DHW
		if ((WolfSEM1_500.TStorage[7] < TonTS_DHW) and (WolfSPU2_800.TStorage[8] > ToffTS_DHW) and StandardDHWcontrol) then
			CPonDHW = true;
		else
			CPonDHW = false;
		end if;
		
		// CHP
		if ((TS_SOC_BT < SOCminCHP) and (WolfSPU2_800.TStorage[8] < TStartCHP) and StandardCHPcontrol) then
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
		connect(pump1.PumpOut,WolfSEM1_500.FlowIn1) annotation(Line(
			points={{290,-135},{295,-135},{305,-135},{305,-165},{310,-165}},
			color={190,30,45}));
		connect(WolfSEM1_500.ReturnOut1,mergingValve1.PipeIn2) annotation(Line(
			points={{310,-175},{305,-175},{270,-175},{265,-175}},
			color={190,30,45}));
		connect(pump2.PumpIn,WolfCRK12.FlowST) annotation(Line(
			points={{25,-190},{20,-190},{5,-190},{0,-190}},
			color={190,30,45},
			thickness=0.0625));
		connect(mergingValve1.PipeIn1,heatingUnitFlowTemperature1.ReturnSupply) annotation(
			Line(
				points={{265,-165},{270,-165},{270,-76},{295,-76}},
				color={190,30,45},
				thickness=0.0625),
			__esi_AutoRoute=false);
		connect(phaseTap6.Grid3,grid2.LVGridE) annotation(Line(
			points={{215,-285},{210,-285},{200,-285},{195,-285}},
			color={247,148,29},
			thickness=0.0625));
		connect(phaseTap5.Grid3,grid2.LVGridD) annotation(Line(
			points={{210,-270},{205,-270},{200,-270},{195,-270}},
			color={247,148,29},
			thickness=0.0625));
		connect(grid2.LVMastGrid,grid1.LVGridA) annotation(Line(
			points={{175,-305},{175,-310},{175,-320},{195,-320},{200,-320}},
			color={247,148,29},
			thickness=0.0625));
		connect(phaseTap3.Grid1,pump2.Grid1) annotation(Line(
			points={{175,-350},{170,-350},{32.3,-350},{32.3,-200},{32.3,-195}},
			color={247,148,29},
			thickness=0.0625));
		connect(grid1.LVGridC,phaseTap3.Grid3) annotation(Line(
			points={{200,-350},{195,-350},{190,-350},{185,-350}},
			color={247,148,29},
			thickness=0.0625));
		connect(phaseTap1.Grid1,heatingUnitFlowTemperature1.Grid1) annotation(Line(
			points={{285,-335},{290,-335},{299.3,-335},{299.3,-90},{299.3,-85}},
			color={247,148,29},
			thickness=0.0625));
		connect(grid1.LVGridE,phaseTap1.Grid3) annotation(Line(
			points={{240,-335},{245,-335},{270,-335},{275,-335}},
			color={247,148,29},
			thickness=0.0625));
		connect(phaseTap2.Grid1,pump1.Grid1) annotation(Line(
			points={{270,-320},{275,-320},{287.3,-320},{287.3,-145},{287.3,-140}},
			color={247,148,29},
			thickness=0.0625));
		connect(grid1.LVGridD,phaseTap2.Grid3) annotation(Line(
			points={{240,-320},{245,-320},{255,-320},{260,-320}},
			color={247,148,29},
			thickness=0.0625));
		connect(grid1.LVGridF,simpleHeatedBuilding1.Grid3) annotation(Line(
			points={{240,-350},{245,-350},{405,-350},{405,-95},{405,-90}},
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
		connect(grid1.LVMastGrid,lV3Phase1) annotation(
			Line(
				points={{220,-355},{220,-360},{220,-390}},
				color={247,148,29},
				thickness=0.0625),
			__esi_AutoRoute=false);
		connect(simpleHeatedBuilding1.EnvironmentConditions,environmentConditions1) annotation(Line(
			points={{400,-50},{400,-45},{400,30},{490,30},{495,30}},
			color={192,192,192},
			thickness=0.0625));
		connect(environmentConditions1,WolfCRK12.EnvironmentConditions) annotation(Line(
			points={{495,30},{490,30},{-45,30},{-45,-200},{-40,-200}},
			color={192,192,192},
			thickness=0.0625));
		connect(environmentConditions1,dHW_demand1.EnvironmentConditions) annotation(Line(
			points={{495,30},{490,30},{439.7,30},{439.7,-165},{434.7,-165}},
			color={192,192,192},
			thickness=0.0625));
		connect(WolfSEM1_500.TStorage[10],dHW_demand1.TPipe) annotation(
			Line(
				points={{315,-233.6666564941406},{315,-233},{315,-240},{355,-240},{355,-150},{430,
				-150},{430,-160}},
				color={0,0,127},
				thickness=0.015625),
			__esi_AutoRoute=false);
		connect(WolfSPU2_800.FlowIn1,hydraulicSwitch2HG1.StorageChargeFlow) annotation(Line(
			points={{165,-110},{160,-110},{160,-79.7},{160,-74.7}},
			color={190,30,45},
			thickness=0.0625));
		connect(hydraulicSwitch2HG1.StorageChargeReturn,WolfSPU2_800.ReturnOut1) annotation(Line(
			points={{155,-74.7},{155,-79.7},{155,-120},{160,-120},{165,-120}},
			color={190,30,45},
			thickness=0.0625));
		connect(WolfSPU2_800.FlowOut4,hydraulicSwitch2HG1.StorageDischargeFlow) annotation(Line(
			points={{200,-110},{205,-110},{210,-110},{210,-79.7},{210,-74.7}},
			color={190,30,45}));
		connect(hydraulicSwitch2HG1.StorageDischargeReturn,WolfSPU2_800.ReturnIn4) annotation(Line(
			points={{215,-74.7},{215,-79.7},{215,-120},{205,-120},{200,-120}},
			color={190,30,45}));
		connect(hydraulicSwitch2HG1.DemandFlow,distributionValve1.PipeIn) annotation(Line(
			points={{219.7,-65},{224.7,-65},{240,-65},{245,-65}},
			color={190,30,45}));
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
			points={{220,-270},{225,-270},{225,-55},{210,-55},{210,-60}},
			color={247,148,29},
			thickness=0.0625));
		connect(hydraulicSwitch2HG1.ExtractionPumpOut,phaseTap6.Grid1) annotation(
			Line(
				points={{205,-60},{205,-50},{230,-50},{230,-285},{225,-285}},
				color={247,148,29},
				thickness=0.0625),
			__esi_AutoRoute=false);
		connect(hydraulicSwitch2HG1.DemandReturn,mergingValve1.PipeOut) annotation(Line(
			points={{219.7,-70},{224.7,-70},{240,-70},{240,-170},{245,-170}},
			color={190,30,45},
			thickness=0.0625));
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
			points={{449,-205},{444,-205},{430,-205},{430,-184.7},{430,-179.7}},
			color={0,0,127},
			thickness=0.0625));
		connect(hydraulicSwitch2HG1.HeatGeneratorSupply1,neoTower2_GC1.Flow) annotation(Line(
			points={{150,-65},{145,-65},{124.7,-65},{119.7,-65}},
			color={190,30,45},
			thickness=0.0625));
		connect(hydraulicSwitch2HG1.HeatGeneratorReturn1,neoTower2_GC1.Return) annotation(Line(
			points={{150,-70},{145,-70},{124.7,-70},{124.7,-75},{119.7,-75}},
			color={190,30,45}));
		connect(CHP_EVU.y,neoTower2_GC1.CHPOn) annotation(Line(
			points={{-19,-55},{-14,-55},{70,-55},{75,-55}},
			color={255,0,255},
			thickness=0.0625));
		connect(grid2.LVGridA,neoTower2_GC1.lV3Phase) annotation(Line(
			points={{155,-270},{150,-270},{110,-270},{110,-99.7},{110,-94.7}},
			color={247,148,29},
			thickness=0.0625));
		connect(environmentConditions1,neoTower2_GC1.environmentConditions) annotation(Line(
			points={{495,30},{490,30},{110,30},{110,-45},{110,-50}},
			color={192,192,192},
			thickness=0.0625));
		connect(switch1.y,pump1.qvRef) annotation(Line(
			points={{324,-120},{319,-120},{285,-120},{285,-125},{285,-130}},
			color={0,0,127},
			thickness=0.0625));
		connect(VolumeFlow_DHWpump.y,switch1.u1) annotation(Line(
			points={{374,-105},{369,-105},{352,-105},{352,-112},{347,-112}},
			color={0,0,127},
			thickness=0.0625));
		connect(qvDHWpump,switch1.u3) annotation(Line(
			points={{495,-130},{490,-130},{352,-130},{352,-128},{347,-128}},
			color={0,0,127},
			thickness=0.0625));
		connect(switch2.y,pump2.qvRef) annotation(Line(
			points={{-59,-155},{-54,-155},{30,-155},{30,-180},{30,-185}},
			color={0,0,127},
			thickness=0.0625));
		connect(pump2.PumpOut,WolfSEM1_500.FlowIn2) annotation(Line(
			points={{35,-190},{40,-190},{305,-190},{305,-190.3},{310,-190.3}},
			color={190,30,45}));
		connect(WolfCRK12.ReturnST,WolfSEM1_500.ReturnOut2) annotation(Line(
			points={{0,-210},{5,-210},{305,-210},{305,-200.3},{310,-200.3}},
			color={190,30,45},
			thickness=0.0625));
		connect(qvSTpump,switch2.u3) annotation(Line(
			points={{-120,-190},{-115,-190},{-87,-190},{-87,-163},{-82,-163}},
			color={0,0,127},
			thickness=0.0625));
		connect(qvSTpump_StandardControl.y,switch2.u1) annotation(Line(
			points={{-94,-120},{-89,-120},{-87,-120},{-87,-147},{-82,-147}},
			color={0,0,127},
			thickness=0.0625));
		connect(CHPModulation.y,switch3.u3) annotation(Line(
			points={{-19,-100},{-14,-100},{-12,-100},{-12,-93},{-7,-93}},
			color={0,0,127},
			thickness=0.0625));
		connect(switch3.y,neoTower2_GC1.CHPModulation) annotation(Line(
			points={{16,-85},{21,-85},{70,-85},{70,-65},{75,-65}},
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
		connect(WolfSEM1_500.FlowOut4,dHW_demand1.FlowHotWater) annotation(Line(
			points={{345,-165},{350,-165},{410,-165},{415,-165}},
			color={190,30,45}));
		connect(dHW_demand1.ReturnHotWater,WolfSEM1_500.ReturnIn4) annotation(Line(
			points={{415,-175},{410,-175},{350,-175},{345,-175}},
			color={190,30,45}));
		connect(StandardDHWcontrol,switch1.u2) annotation(
			Line(
				points={{495,-100},{490,-100},{460,-100},{460,-120},{347,-120}},
				color={255,0,255},
				thickness=0.0625),
			__esi_AutoRoute=false);
		connect(switch2.u2,StandardSTcontrol) annotation(Line(
			points={{-82,-155},{-87,-155},{-115,-155},{-120,-155}},
			color={255,0,255},
			thickness=0.0625));
		connect(switch3.u2,StandardCHPcontrol) annotation(Line(
			points={{-7,-85},{-12,-85},{-70,-85},{-75,-85}},
			color={255,0,255},
			thickness=0.0625));
		connect(switch4.u2,StandardCBcontrol) annotation(Line(
			points={{-7,-15},{-12,-15},{-70,-15},{-75,-15}},
			color={255,0,255},
			thickness=0.0625));
		connect(switch4.y,wolfCGB14_GC1.ControlIn) annotation(Line(
			points={{16,-15},{21,-15},{20,-15},{25,-15}},
			color={0,0,127},
			thickness=0.0625));
		connect(wolfCGB14_GC1.Return,hydraulicSwitch2HG1.HeatGeneratorReturn2) annotation(Line(
			points={{69.7,-20},{74.7,-20},{155,-20},{155,-55},{155,-60}},
			color={190,30,45},
			thickness=0.0625));
		connect(hydraulicSwitch2HG1.HeatGeneratorSupply2,wolfCGB14_GC1.Flow) annotation(Line(
			points={{160,-60},{160,-55},{160,-10},{74.7,-10},{69.7,-10}},
			color={190,30,45},
			thickness=0.0625));
		connect(grid1.LVGridB,wolfCGB14_GC1.lV3Phase) annotation(Line(
			points={{200,-335},{195,-335},{60,-335},{60,-44.7},{60,-39.7}},
			color={247,148,29},
			thickness=0.0625));
		connect(wolfCGB14_GC1.environmentConditions,environmentConditions1) annotation(Line(
			points={{60,5},{60,10},{60,30},{490,30},{495,30}},
			color={192,192,192},
			thickness=0.0625));
		connect(distributionValve1.PipeOutRemain,heatingUnitFlowTemperature1.FlowSupply) annotation(Line(
			points={{265,-60},{270,-60},{290,-60},{290,-58.7},{295,-58.7}},
			color={190,30,45}));
		connect(switch1.y,distributionValve1.qvRef) annotation(Line(
			points={{324,-120},{319,-120},{255,-120},{255,-80},{255,-75}},
			color={0,0,127},
			thickness=0.0625));
		connect(distributionValve1.PipeOutRegulated,pump1.PumpIn) annotation(Line(
			points={{265,-70},{270,-70},{275,-70},{275,-135},{280,-135}},
			color={190,30,45}));
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
							Bitmap(
								imageSource="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
/wE+rRa6sslftgAAAABJRU5ErkJggg==",
								extent={{-225,-250.6},{225,120.6}}),
							Text(
								textString="SF1",
								fontName="TUM Neue Helvetica 55 Regular",
								textStyle={
									TextStyle.Bold},
								extent={{-252.5,269.8},{253.7,97.3}}),
							Text(
								textString="DZ",
								fontSize=14,
								textStyle={
									TextStyle.Bold},
								lineColor={0,128,255},
								extent={{164.7,-196.8},{274.7,-260.2}})}),
		Documentation(info="<HTML><HEAD>
<META http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\"> 
<TITLE>House 1 with ST, CHP and CB</TITLE> 
<STYLE type=\"text/css\">
table>tbody>tr:hover,th{background-color:#edf1f3}html{font-size:90%}body,table{font-size:1rem}body{font-family:'Open Sans',Arial,sans-serif;color:#465e70}h1,h2{margin:1em 0 .6em;font-weight:600}p{margin-top:.3em;margin-bottom:.2em}table{border-collapse:collapse;margin:1em 0;width:100%;}tr{border:1px solid #beccd3}td,th{padding:.3em 1em; border-width: 1px; border-style: solid; border-color: rgb(190, 204, 211);}td{word-break:break-word}tr:nth-child(even){background-color:#fafafa}th{font-family:'Open Sans Semibold',Arial,sans-serif;font-weight:700;text-align:left;word-break:keep-all}.lib-wrap{width:70%}@media screen and (max-width:800px){.lib-wrap{width:100%}}td p{margin:.2em}
</STYLE>
    
<META name=\"GENERATOR\" content=\"MSHTML 11.00.10570.1001\"></HEAD> 
<BODY>
<H1>House 1 with ST, CHP and CB</H1>
<HR>

<P>This model is a digital twin of the House 1 in the CoSES laboratory (<A href=\"https://doi.org/10.1109/PESGM41954.2020.9281442\">https://doi.org/10.1109/PESGM41954.2020.9281442</A>)</P>
<P><BR></P>
<P>The house consists of the following components and default conditions:</P>
<UL>
  <LI>Combined Heat and Power unit (CHP): neoTower 2.0, nominal electric and 
  thermal power: 2 kW_el / 5       kW_th</LI>
  <LI>Condensing Boiler: Wolf CGB14, nominal thermal power: 14 kW_th</LI>
  <LI>Solar Thermal emulator of variable size, up to 9 kW_th</LI>
  <LI>Thermal Storage: Wolf SPU-2 800,&nbsp;content: 750 l&nbsp;</LI>
  <LI>Domestic Hot Water (DHW)&nbsp;preparation: Wolf SEM-1 500,&nbsp;DHW 
  storage, connected to the thermal storage and solar thermal unit, content: 500 
        l</LI>
  <LI>Consumption - House parameters:<BR>Construction year: 1995 to       
  2002<BR>Additional insulation: roof + floor<BR>Number of floors: 2<BR>Number   
      of apartements: 1<BR>Number of inhabitants: 6<BR>Living area:   
  300m²<BR>Heating     system: radiators (supply / return temperatur: 60 / 45   
  °C)</LI></UL>
<P>Four boolean inputs can activate a predefined standard control for simple  
 simulation results or during a lead time of the simulation. The standard  
control  of each element is as follows:</P>
<UL>
  <LI>CHP:<BR>Switched on at 100 % modulation, when:<BR>&nbsp;&nbsp;&nbsp;&nbsp; 
      T_Storage,top &lt; T_Start,CHP and SOC_Storage &lt; SOCminCHP<BR>Switched  
   off,   when:<BR>&nbsp;&nbsp;&nbsp;&nbsp; T_Storage,bottom &gt; T_Stop,CHP or  
     SOC_Storage &gt; SOCmaxCHP<BR><BR></LI>
  <LI>Condensing Boiler:<BR>The condensing boiler should only operate, if the    
   CHP cannot provide the required heat.<BR>Switched on at 100 % modulation,     
  when:<BR>&nbsp;&nbsp;&nbsp;&nbsp; T_Storage,top &lt; T_Start,CB and     
  SOC_Storage &lt; SOCminCB<BR>Switched off, when:<BR>&nbsp;&nbsp;&nbsp;&nbsp;   
    T_Storage,bottom &gt; T_Stop,CB or SOC_Storage &gt; SOCmaxCB<BR><BR></LI>
  <LI>Solar Thermal pump:<BR>The control is&nbsp;based on Green City's   
  'SolarController'<BR>Solar thermal pump switched on,   
  when:<BR>&nbsp;&nbsp;&nbsp;&nbsp; (T_Collector - T_DHWStorage,in) &gt;   
  deltaTonST<BR>Solar thermal pump switched off,   
  when:<BR>&nbsp;&nbsp;&nbsp;&nbsp; (T_Collector - T_DHWStorage,in)&nbsp;&lt;   
  deltaToffST<BR>The pump is controlled with the following   
  conditions:<BR>&nbsp;&nbsp;&nbsp;&nbsp; if (T_Flow - T_Return) &lt;   
  deltaTFlowReturnLow, the reference volume flow is at  minimum   
  level.<BR>&nbsp;&nbsp;&nbsp;&nbsp; if (T_Flow - T_Return) &gt;   
  deltaTFlowReturnMax, the reference volume flow is at  maximum   
  level.<BR>&nbsp;&nbsp;&nbsp;&nbsp; Between the two temperature  boundaries the 
    reference volume flow is linearly  interpolated.<BR><BR></LI>
  <LI>Domestic Hot Water pump:<BR>If the solar thermal yield isn't enough to   
  heat the domestic hot water storage, the DHW pump can charge it from the   
  thermal storage.<BR>Switched on at qvMaxDHW, when:<BR>&nbsp;&nbsp;&nbsp;&nbsp; 
      T_DHWStorage,top &lt; T_onTS_DHW and T_Storage,top &gt;   
  T_offTS_DHW<BR>Switched off,   when:<BR>&nbsp;&nbsp;&nbsp;&nbsp;   
  T_DHWStorage,top &gt; ToffTS_DHW or T_Storage,top &lt; TDHWStorage,top</LI></UL>
<P><BR></P>
<DIV class=\"lib-wrap\">
<TABLE class=\"type\">
  <TBODY>
  <TR>
    <TH>Symbol:</TH>
    <TD colspan=\"3\"><IMG width=\"330\" height=\"254\" src=\"data:image/png;base64,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\"></TD></TR>
  <TR>
    <TH>Identifier:</TH>
    <TD colspan=\"3\">CoSES_Models.Houses.SF1</TD></TR>
  <TR>
    <TH>Version:</TH>
    <TD colspan=\"3\">1.0</TD></TR>
  <TR>
    <TH>File:</TH>
    <TD colspan=\"3\">SF1.mo</TD></TR>
  <TR>
    <TH>Connectors:</TH>
    <TD>Electrical Low-Voltage AC Three-Phase Connector</TD>
    <TD>lV3Phase1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Environment Conditions Connector</TD>
    <TD>environmentConditions1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>If true, standard control will be used to control the condensing       
                boiler</TD>
    <TD>StandardCBcontrol</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>If true, standard control will be used to control the CHP</TD>
    <TD>StandardCHPcontrol</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>If true, standard control will be used to control the solar thermal    
                     pump</TD>
    <TD>StandardSTcontrol</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>If true, standard control will be used to control the DHW pump</TD>
    <TD>StandardDHWcontrol</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Condensing boiler input - heat power (temperature difference between   
                      supply and return is constant)</TD>
    <TD>CBIn_P</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>CHP input - electric power</TD>
    <TD>CHPIn_P</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Outlet temperature of district heating heat exchanger</TD>
    <TD>TDH_HEXout</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Volume flow to district heating heat exchanger</TD>
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
    <TD>Reference volume flow of domestic hot water pump to charge the DHW     
                    storage</TD>
    <TD>qvDHWpump</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Inlet temperature of district heating heat exchanger</TD>
    <TD>TDH_HEXin</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>Parameters:</TH>
    <TD>Heated 3-zone-building with changeable heating system</TD>
    <TD>simpleHeatedBuilding1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Flow temperature controller wiring for heating system</TD>
    <TD>heatingUnitFlowTemperature1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Volume flow generation and electrical power calculation</TD>
    <TD>pump1</TD>
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
    <TD>Heat storage with variable temperature profile</TD>
    <TD>WolfSPU2_800</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Solar Thermal</TD>
    <TD>WolfCRK12</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Volume flow generation and electrical power calculation</TD>
    <TD>pump2</TD>
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
    <TD>Connection of 1-phase to 3-phase AC components</TD>
    <TD>phaseTap3</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Electrical power grid for connection of maximum six 3-phase AC         
                components</TD>
    <TD>grid2</TD>
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
    <TD>Heat storage with variable temperature profile</TD>
    <TD>WolfSEM1_500</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Controllable valve for volume flow distribution</TD>
    <TD>distributionValve1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Valve for volume flow merging</TD>
    <TD>mergingValve1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Hydraulic Switch with two heat generators</TD>
    <TD>hydraulicSwitch2HG1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Set output signal to a time varying Real expression</TD>
    <TD>CBControlIn</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Set output signal to a time varying Real expression</TD>
    <TD>CHPModulation</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Set output signal to a time varying Boolean expression</TD>
    <TD>CHP_EVU</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Set output signal to a time varying Real expression</TD>
    <TD>TColdWater</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Green city of the CHP model based on measurements in the laboratory</TD>
    <TD>neoTower2_GC1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Set output signal to a time varying Real expression</TD>
    <TD>VolumeFlow_DHWpump</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Switch between two Real signals</TD>
    <TD>switch1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Switch between two Real signals</TD>
    <TD>switch2</TD>
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
    <TD>Maximum electrical power of CHP</TD>
    <TD>CHPmax</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Minimum electrical power of CHP</TD>
    <TD>CHPmin</TD>
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
                 storage is linear, if false the profile is defined by a 
      temperature                 vector</TD>
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
    <TD>Maximum temperature within the thermal storage</TD>
    <TD>Tmax_DHW</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Temperature level to calculate the stored energy (e.g. return          
               temperature of DHW</TD>
    <TD>T0_DHW</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>If true, the temperature profile at simulation begin within the        
                 storage is linear, if false the profile is defined by a 
      temperature                 vector</TD>
    <TD>DHWLinearProfile</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Temperature of upmost heat storage layer at simulation begin</TD>
    <TD>DHWTupInit</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Temperature of lowmost heat storage layer at simulation begin</TD>
    <TD>DHWTlowInit</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Vector of temperature profile of the layers at simulation begin,       
                  element 1 is at lowest layer</TD>
    <TD>DHWTLayerVector</TD>
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
                       data ha to be provided, else standart load profiles are 
      used</TD>
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
                   people are at home, less rooms are heated and the average     
        temperature       will       decrease)</TD>
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
    <TD>SOC, at which the CB turns on (SOCmin &lt; SOCmin and T<tstart)< 
      td=\"\">         </tstart)<>             
    <TD>SOCminCB</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>SOC, at which the CB turns off</TD>
    <TD>SOCmaxCB</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Minimum Temperature, at the top, at which the CB turns on (T<tstart 
      td=\"\" and=\"\" socmin=\"\" <=\"\" socmin)<=\"\">         </tstart>             
    <TD>TStartCB</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Temperature at the bottom, at which the CB stops</TD>
    <TD>TStopCB</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>SOC, at which the CHP turns on (SOCmin &lt; SOCmin and T<tstart)< td=\"\"> 
                                </tstart)<>             
    <TD>SOCminCHP</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>SOC, at which the CHP turns off</TD>
    <TD>SOCmaxCHP</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Minimum Temperature, at the top, at which the CHP turns on (T<tstart 
      td=\"\" and=\"\" socmin=\"\" <=\"\" socmin)<=\"\">         </tstart>             
    <TD>TStartCHP</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Temperature at the bottom, at which the CHP stops</TD>
    <TD>TStopCHP</TD>
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
    <TD>Switch-on temperature of DHW storage charging</TD>
    <TD>TonTS_DHW</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Switch-off temperature of DHW storage charging</TD>
    <TD>ToffTS_DHW</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Switch-on temperature, if the DHW temperature &lt; DHW consumption     
                    temperater + deltaTonDHW, the storage will be charged</TD>
    <TD>deltaTonDHW</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Maximum volume flow of circulation pump</TD>
    <TD>qvMaxDHW</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Set output signal to a time varying Real expression</TD>
    <TD>qvSTpump_StandardControl</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Switch between two Real signals</TD>
    <TD>switch3</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Set output signal to a time varying Real expression</TD>
    <TD>CHPin_StandardControl</TD>
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
    <TD>WolfCGB14 validated with CoSES mearusements</TD>
    <TD>wolfCGB14_GC1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>Results:</TH>
    <TD>If true, standard control will be used to control the condensing       
                boiler</TD>
    <TD>StandardCBcontrol</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Standard control value of the CB modulation</TD>
    <TD>CBinStandardControl</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>If true, standard control will be used to control the CHP</TD>
    <TD>StandardCHPcontrol</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Standard control value of the CHP modulation</TD>
    <TD>CHPinStandardControl</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>If true, standard control will be used to control the solar thermal    
                     pump</TD>
    <TD>StandardSTcontrol</TD>
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
    <TD>If true, standard control will be used to control the DHW pump</TD>
    <TD>StandardDHWcontrol</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Switch-on/off of DHW pump</TD>
    <TD>CPonDHW</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Standard control flow rate of the DHW pump</TD>
    <TD>qvRefDHW</TD>
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
    <TD>CHP flow temperature</TD>
    <TD>CHP_S_TM_VL</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>CHP return temperature</TD>
    <TD>CHP_S_TM_RL</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Volume flow CHP</TD>
    <TD>CHP_S_FW_HC</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Gas flow CHP</TD>
    <TD>CHP_S_FG</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Demanded fuel volume</TD>
    <TD>CHP_VFuel</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heat output power of CHP</TD>
    <TD>CHP_P_heat_is</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Electric power output of CHP</TD>
    <TD>CHP_P_el_is</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Gas power of CHP</TD>
    <TD>CHP_P_gas_is</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heat output of CHP</TD>
    <TD>CHP_E_heat_produced</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Electricity output of CHP</TD>
    <TD>CHP_E_el_produced</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Gas input of CHP</TD>
    <TD>CHP_E_gas_consumed</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Thermal efficiency</TD>
    <TD>CHP_Efficiency_th</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Electric efficiency</TD>
    <TD>CHP_Efficiency_el</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Overall efficiency</TD>
    <TD>CHP_Efficiency_total</TD>
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
    <TD>ST_S_TM_Collector</TD>
    <TD>ST_S_TM_Collector</TD>
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
    <TD>Power transfered to DHW storage</TD>
    <TD>TS_P_heat_toHWS</TD>
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
    <TD>Flow temperature to DHW storage</TD>
    <TD>TS_S_TM_HC_HW_VL</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Return temperature to DHW storage</TD>
    <TD>TS_S_TM_HC_HW_RL</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>DHW storage temperature 1</TD>
    <TD>TS_S_TM_HWS_1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>DHW storage temperature 2</TD>
    <TD>TS_S_TM_HWS_2</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>DHW storage temperature 3</TD>
    <TD>TS_S_TM_HWS_3</TD>
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
    <TD>Volume flow to DHW storage</TD>
    <TD>TS_S_FW_HC_HW</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Energy in thermal storage</TD>
    <TD>TS_E_Storage_BT</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Energy in DHW storage</TD>
    <TD>TS_E_Storage_HWS</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Total energy transfered to DHW storage</TD>
    <TD>TS_E_heat_toHWS</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>State of charge of the thermal storage</TD>
    <TD>TS_SOC_BT</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>State of charge of the DHW storage</TD>
    <TD>TS_SOC_HWS</TD>
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
    <TD>CHP input - electric power</TD>
    <TD>CHPIn_P</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Outlet temperature of district heating heat exchanger</TD>
    <TD>TDH_HEXout</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Volume flow to district heating heat exchanger</TD>
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
    <TD>Reference volume flow of domestic hot water pump to charge the DHW     
                    storage</TD>
    <TD>qvDHWpump</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Inlet temperature of district heating heat exchanger</TD>
    <TD>TDH_HEXin</TD>
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
end SF1;
