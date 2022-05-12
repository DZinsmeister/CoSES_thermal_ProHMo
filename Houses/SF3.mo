// CP: 65001
// SimulationX Version: 4.2.3.69223
within CoSES_Models.Houses;
model SF3 "House 3 with ST and GSHP"
	GreenCity.Interfaces.Electrical.LV3Phase lV3Phase1 "Electrical Low-Voltage AC Three-Phase Connector" annotation(Placement(
		transformation(extent={{240,-500},{260,-480}}),
		iconTransformation(extent={{236.7,90},{256.7,110}})));
	GreenCity.Interfaces.Environment.EnvironmentConditions environmentConditions1 "Environment Conditions Connector" annotation(Placement(
		transformation(extent={{445,-105},{465,-85}}),
		iconTransformation(extent={{236.7,190},{256.7,210}})));
	Modelica.Blocks.Interfaces.RealInput TDH_HEXout(quantity="Basics.Temp") "Outlet temperature of district heating heat exchanger" annotation(
		Placement(
			transformation(extent={{-145,70},{-105,110}}),
			iconTransformation(extent={{266.7,-170},{226.7,-130}})),
		Dialog(
			tab="Input Signals",
			visible=false));
	Modelica.Blocks.Interfaces.RealOutput DTH_HEXin(quantity="Basics.Temp") "Inlet temperature of district heating heat exchanger" annotation(
		Placement(
			transformation(extent={{-125,35},{-105,55}}),
			iconTransformation(extent={{236.7,-60},{256.7,-40}})),
		Dialog(
			tab="Input Signals",
			visible=false));
	Modelica.Blocks.Interfaces.RealOutput qv_HEX(quantity="Thermics.VolumeFlow") "Volume flow to heat exchanger" annotation(
		Placement(
			transformation(extent={{-125,55},{-105,75}}),
			iconTransformation(
				origin={246.7,0},
				extent={{10,-10},{-10,10}},
				rotation=-180)),
		Dialog(
			tab="Input Signals",
			visible=false));
	Modelica.Blocks.Interfaces.RealInput qvSTpump(quantity="Thermics.VolumeFlow") "Reference volume flow of solar thermal pump" annotation(
		Placement(
			transformation(extent={{-145,-355},{-105,-315}}),
			iconTransformation(extent={{-270,130},{-230,170}})),
		Dialog(
			tab="Input Signals",
			visible=false));
	Modelica.Blocks.Interfaces.RealInput qvDHpump(quantity="Thermics.VolumeFlow") "Reference volume flow of district heating pump - positive: feed in - negative: extraction" annotation(
		Placement(
			transformation(extent={{-145,0},{-105,40}}),
			iconTransformation(extent={{266.7,-220},{226.7,-180}})),
		Dialog(
			tab="Input Signals",
			visible=false));
	Modelica.Blocks.Interfaces.BooleanInput SwitchHPTSPort "Switches between the inlet of the HP into the TS (true: upper storage connection)" annotation(
		Placement(
			transformation(extent={{-145,-75},{-105,-35}}),
			iconTransformation(extent={{-270,-120},{-230,-80}})),
		Dialog(
			tab="Input Signals",
			visible=false));
	Modelica.Blocks.Interfaces.RealInput HPAUXIn(quantity="Basics.Power") "Air source heat pump input - heat power (temperature difference between supply and return is constant)" annotation(
		Placement(
			transformation(extent={{-145,-205},{-105,-165}}),
			iconTransformation(extent={{-270,-70},{-230,-30}})),
		Dialog(
			tab="Input Signals",
			visible=false));
	Modelica.Blocks.Interfaces.BooleanInput SwitchSTTSPort "Switches between the inlet of the HP into the TS (true: upper storage connection)" annotation(
		Placement(
			transformation(extent={{-145,-285},{-105,-245}}),
			iconTransformation(extent={{-270,180},{-230,220}})),
		Dialog(
			tab="Input Signals",
			visible=false));
	Modelica.Blocks.Interfaces.BooleanInput HPOn "Turns the heat pump on" annotation(
		Placement(
			transformation(extent={{-145,-150},{-105,-110}}),
			iconTransformation(extent={{-270,-20},{-230,20}})),
		Dialog(
			tab="Input Signals",
			visible=false));
	GreenCity.Utilities.Thermal.Pump pump2(
		qvMax(displayUnit="l/min")=0.00025,
		PPump(tableID "External table object")) "Volume flow generation and electrical power calculation" annotation(Placement(transformation(
		origin={75,-315},
		extent={{0,0},{10,10}},
		rotation=-180)));
	GreenCity.GreenBuilding.HeatingSystem.HeatingUnitFlowTemperature heatingUnitFlowTemperature1(
		CirculationPump(PPump(tableID "External table object")),
		qvMaxPump(displayUnit="l/min")=0.00025) annotation(Placement(transformation(extent={{255,-230},{290,-195}})));
	Consumer.DHW_demand dHW_demand1(
		Load(tableID "External table object"),
		WeeklyData=WeeklyData,
		File=File,
		Table=Table,
		DHWfactor=DHWfactor,
		THotWaterSet=323.15) annotation(Placement(transformation(extent={{375,-270},{395,-250}})));
	GreenCity.Utilities.Electrical.Grid grid1(
		OutputType=GreenCity.Utilities.Electrical.Grid.OutputEnum.MasterGrid,
		useA=true,
		useB=true,
		useC=true,
		useD=true,
		useE=true,
		useF=true) annotation(Placement(transformation(extent={{155,-390},{195,-350}})));
	GreenCity.Utilities.Electrical.PhaseTap phaseTap1 annotation(Placement(transformation(extent={{235,-375},{245,-365}})));
	GreenCity.Utilities.Electrical.PhaseTap phaseTap5 annotation(Placement(transformation(extent={{200,-345},{210,-335}})));
	GreenCity.Utilities.Electrical.PhaseTap phaseTap6 annotation(Placement(transformation(extent={{205,-360},{215,-350}})));
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
		CCollector=8416) annotation(Placement(transformation(extent={{-35,-350},{5,-310}})));
	GreenCity.Interfaces.Thermal.DefineVolumeFlow defineVolumeFlow1 annotation(Placement(transformation(
		origin={210,-115},
		extent={{-10,-10},{10,10}},
		rotation=-90)));
	GreenCity.Interfaces.Thermal.ExtractVolumeFlow extractVolumeFlow1 annotation(Placement(transformation(
		origin={180,-115},
		extent={{10,-10},{-10,10}},
		rotation=-90)));
	GreenCity.Utilities.Thermal.MeasureThermal measureThermal1 annotation(Placement(transformation(extent={{295,-250},{305,-260}})));
	GreenCity.Utilities.Electrical.PhaseTap phaseTap7 annotation(Placement(transformation(extent={{140,-375},{130,-365}})));
	Storage.HeatStorageCombined5Inlets WolfBSP_W_SL_1000(
		VStorage=0.9,
		dStorage=0.79,
		QlossRate=7,
		LinearProfile=TSLinearProfile,
		TupInit(displayUnit="K")=TSTupInit,
		TlowInit(displayUnit="K")=TSTlowInit,
		TLayerVector(displayUnit="K")=TSTLayerVector,
		TMax(displayUnit="K")=Tmax_TS,
		alphaMedStatic=1,
		use1=true,
		iFlow1=8,
		iReturn1=2,
		use2=true,
		iFlow2=7,
		iReturn2=6,
		use3=true,
		iFlow3=4,
		iReturn3=2,
		use4=true,
		HE4=true,
		iFlow4=9,
		iReturn4=7,
		AHeatExchanger4=1.9,
		VHeatExchanger4=0.011,
		use5=true,
		HE5=true,
		iFlow5=5,
		AHeatExchanger5=3,
		VHeatExchanger5=0.0198,
		use6=true,
		iFlow6=8,
		iReturn6=2,
		use7=true,
		iFlow7=7,
		use8=true) annotation(Placement(transformation(extent={{165,-253},{200,-180}})));
	Distribution.HydraulicSwitch_TS_DH hydraulicSwitch_TS_DH1(
		FeedInPump(PPump(tableID "External table object")),
		ExtractionPump1(PPump(tableID "External table object"))) annotation(Placement(transformation(extent={{150,-160},{220,-145}})));
	Distribution.SwitchPort switchPort1 annotation(Placement(transformation(extent={{100,-345},{120,-315}})));
	Distribution.SwitchPort switchPort2 annotation(Placement(transformation(extent={{100,-225},{120,-195}})));
	HeatGenerator.DigitalTwins.WolfBWS1_10_GC wolfBWS1_10(
		horizontalCollector=horizontalCollector,
		numberHE=numberHE,
		HoleDepth=HoleDepth,
		rHole=rHole,
		wolfBWS1(
			PElHeatFactor_table(tableID "External table object"),
			PHeatFactor_table(tableID "External table object")),
		groundCollector1(horizontalCollector=false)) annotation(Placement(transformation(extent={{20,-230},{65,-185}})));
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
	parameter Boolean horizontalCollector=true "if true: horizontal collector, else downhole heat exchanger" annotation(Dialog(
		group="Heat Pump",
		tab="Heat Generator Parameters"));
	parameter Integer numberHE=1 "Number of independent heat exchangers" annotation(Dialog(
		group="Heat Pump",
		tab="Heat Generator Parameters"));
	parameter Real HoleDepth(
		quantity="Basics.Length",
		displayUnit="m")=6 "Depth of hole, for horizontal collectors: laying depth of heat collectors" annotation(Dialog(
		group="Heat Pump",
		tab="Heat Generator Parameters"));
	parameter Real rHole(
		quantity="Basics.Length",
		displayUnit="m")=0.3 "Radius of hole, for horizontal collectors: equivalent radius of the flat collector field" annotation(Dialog(
		group="Heat Pump",
		tab="Heat Generator Parameters"));
	protected
		parameter Real PmaxAUX(quantity="Basics.Power")=6000 "Maximum power of auxiliary heater" annotation(Dialog(
			group="Heat Pump",
			tab="Heat Generator Parameters"));
	public
		parameter Real Tmax_TS(quantity="Basics.Temp")=363.15 "Maximum temperature within the thermal storage" annotation(Dialog(
			group="Thermal Storage",
			tab="Storage Parameters"));
		parameter Real T0_TS(quantity="Basics.Temp")=303.15 "Temperature level to calculate the stored energy (e.g. return temperature of consumption)" annotation(Dialog(
			group="Thermal Storage",
			tab="Storage Parameters"));
		parameter Boolean TSLinearProfile=true "If true, the temperature profile at simulation begin within the storage is linear, if false the profile is defined by a temperature vector" annotation(Dialog(
			group="Thermal Storage",
			tab="Storage Parameters"));
		parameter Real TSTupInit(
			quantity="Thermics.Temp",
			displayUnit="°C")=338.15 if TSLinearProfile "Temperature of upmost heat storage layer at simulation begin" annotation(Dialog(
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
		parameter Integer nPeople(quantity="Basics.Unitless")=8 "Number of people living in the building" annotation(Dialog(
			group="Size",
			tab="Consumption Parameters"));
		parameter Integer nFloors=2 "nFloors" annotation(Dialog(
			group="Size",
			tab="Consumption Parameters"));
		parameter Integer nApartments=3 "nApartments" annotation(Dialog(
			group="Size",
			tab="Consumption Parameters"));
		parameter Real ALH(
			quantity="Geometry.Area",
			displayUnit="m²")=400 "Heated (living) area (e.g. 50m² per person)" annotation(Dialog(
			group="Size",
			tab="Consumption Parameters"));
		parameter Boolean UseStandardHeatNorm=false "If true, use standard area-specific heating power, else define it manually" annotation(Dialog(
			group="Heating System",
			tab="Consumption Parameters"));
		parameter Real QHeatNormLivingArea(quantity="Thermics.HeatFlowSurf")=13 if not UseStandardHeatNorm "Area-specific heating power - modern radiators: 14 - 15 W/m²; space heating: 15 W/m²" annotation(Dialog(
			group="Heating System",
			tab="Consumption Parameters"));
		parameter Real n=1.3 "Heating system exponent - radiator: 1.3; floor heating: 1 - 1.1" annotation(Dialog(
			group="Heating System",
			tab="Consumption Parameters"));
		parameter Real TFlowHeatNorm(quantity="Basics.Temp")=313.15 "Normal flow temperature - radiator: 55 - 75°C; floor heating: 35 - 45°C" annotation(Dialog(
			group="Heating System",
			tab="Consumption Parameters"));
		parameter Real TReturnHeatNorm(quantity="Basics.Temp")=303.15 "Normal return temperature - radiator: 45 - 65°C; floor heating: 28 - 35°C" annotation(Dialog(
			group="Heating System",
			tab="Consumption Parameters"));
		parameter Real TRef(quantity="Basics.Temp")=294.15 "Reference indoor temperature" annotation(Dialog(
			group="Heating System",
			tab="Consumption Parameters"));
		parameter Real qvMaxLivingZone(quantity="Thermics.VolumeFlow")=0.00025 "Maximumg flow rate in Living Zone" annotation(Dialog(
			group="Heating System",
			tab="Consumption Parameters"));
		parameter Real TLiving_Init(
			quantity="Basics.Temp",
			displayUnit="°C")=294.15 "Initial Temperature" annotation(Dialog(
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
		parameter String PresenceFile=classDirectory()+"Data\\SF3_WholeYear.txt" if UseIndividualPresence "File with presence timeseries (presence in %; 0% - no one is at home; 100% - everyone is at home)" annotation(Dialog(
			group="Additional Yields/Losses",
			tab="Consumption Parameters"));
		parameter Boolean UseIndividualElecConsumption=true "If individual electricity consumption is used, individual consumption data ha to be provided, else standart load profiles are used" annotation(Dialog(
			group="Additional Yields/Losses",
			tab="Consumption Parameters"));
		parameter String ElConsumptionFile=classDirectory()+"Data\\SF3_WholeYear.txt" if UseIndividualElecConsumption "File with electric consumption time series (consumption in kW)" annotation(Dialog(
			group="Additional Yields/Losses",
			tab="Consumption Parameters"));
		parameter String ElConsumptionTable="Pel" if UseIndividualElecConsumption "Table with electric consumption time series (consumption in W)" annotation(Dialog(
			group="Additional Yields/Losses",
			tab="Consumption Parameters"));
		parameter Real YearlyElecConsumption_kWh=9500 if UseIndividualElecConsumption "YearlyElecConsumption_kWh" annotation(Dialog(
			group="Additional Yields/Losses",
			tab="Consumption Parameters"));
		parameter Real ElFactor=YearlyElecConsumption_kWh/6041 if UseIndividualElecConsumption "ElFactor" annotation(Dialog(
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
		parameter Boolean WeeklyData=true "If true: DHW consumption data repeats weekly" annotation(Dialog(
			group="DHW consumption",
			tab="Consumption Parameters"));
		parameter String File=classDirectory()+"Data\\SF3_WholeYear.txt" "DHW Data File" annotation(Dialog(
			group="DHW consumption",
			tab="Consumption Parameters"));
		parameter String Table="V_DHW" "DHW Table Name" annotation(Dialog(
			group="DHW consumption",
			tab="Consumption Parameters"));
		parameter Real V_DHWperDay_l=400 "V_DHWperDay_l" annotation(Dialog(
			group="DHW consumption",
			tab="Consumption Parameters"));
		parameter Real DHWfactor=V_DHWperDay_l/400 "Factor, with which the DHW consumption gets multiplied" annotation(Dialog(
			group="DHW consumption",
			tab="Consumption Parameters"));
		Modelica.Blocks.Interfaces.BooleanInput StandardHPcontrol "If true, standard control will be used to control the heat pump" annotation(
			Placement(
				transformation(
					origin={-125,-100},
					extent={{-20,-20},{20,20}}),
				iconTransformation(
					origin={-50,250},
					extent={{-20,-20},{20,20}},
					rotation=270)),
			Dialog(
				group="Heat Pump",
				tab="Standard Control",
				visible=false));
		parameter Real TStartHPhigh(quantity="Basics.Temp")=328.15 "Minimum Temperature, at the top, at which the heat pump turns on" annotation(Dialog(
			group="Heat Pump",
			tab="Standard Control"));
		parameter Real TStopHPhigh(quantity="Basics.Temp")=333.15 "Temperature at the top, at which the heat pump stops" annotation(Dialog(
			group="Heat Pump",
			tab="Standard Control"));
		parameter Real TStartHPlow(quantity="Basics.Temp")=316.15 "Minimum Temperature, at the bottom, at which the heat pump turns on" annotation(Dialog(
			group="Heat Pump",
			tab="Standard Control"));
		parameter Real TStopHPlow(quantity="Basics.Temp")=318.15 "Temperature at the bottom, at which the heat pump stops" annotation(Dialog(
			group="Heat Pump",
			tab="Standard Control"));
		parameter Real TStartAUXhigh(quantity="Basics.Temp")=323.15 "Minimum Temperature, at the top, at which the auxiliary heater turns on" annotation(Dialog(
			group="Heat Pump",
			tab="Standard Control"));
		parameter Real TStopAUXhigh(quantity="Basics.Temp")=328.15 "Minimum Temperature, at the bottom, at which the auxiliary heater turns on" annotation(Dialog(
			group="Heat Pump",
			tab="Standard Control"));
		parameter Real TStartAUXlow(quantity="Basics.Temp")=308.15 "Minimum Temperature, at the top, at which the auxiliary heater stops" annotation(Dialog(
			group="Heat Pump",
			tab="Standard Control"));
		parameter Real TStopAUXlow(quantity="Basics.Temp")=313.15 "Minimum Temperature, at the bottom, at which the auxiliary heater stops" annotation(Dialog(
			group="Heat Pump",
			tab="Standard Control"));
	protected
		Boolean HPon "Heat pump is switched on" annotation(
			HideResult=false,
			Dialog(
				group="Heat Pump",
				tab="Standard Control"));
		Boolean AUXon "Auxiliary heater is switched on" annotation(
			HideResult=false,
			Dialog(
				group="Heat Pump",
				tab="Standard Control"));
	public
		Boolean HPinStandardControl(quantity="Basics.Real") "Standard control value of the heat pump modulation" annotation(Dialog(
			group="Heat Pump",
			tab="Standard Control",
			visible=false));
		Real AUXinStandardControl(quantity="Basics.RelMagnitude") "Standard control value of the auxiliary heater modulation" annotation(Dialog(
			group="Heat Pump",
			tab="Standard Control",
			visible=false));
		Modelica.Blocks.Interfaces.BooleanInput StandardControlHPSwitch "Standard Control for the 3-way valve to switch the connection to the thermal storage" annotation(
			Placement(
				transformation(extent={{-145,-45},{-105,-5}}),
				iconTransformation(
					origin={-150,250},
					extent={{-20,20},{20,-20}},
					rotation=-90)),
			Dialog(
				group="Heat Pump 3-way valve",
				tab="Standard Control",
				visible=false));
		parameter Real deltaTLowDHW(quantity="Thermics.TempDiff")=2 "Required temperature difference between upper layer and DHW set temperature" annotation(Dialog(
			group="Heat Pump 3-way valve",
			tab="Standard Control"));
		Boolean SwitchHPTSPort_StandardControl "Switches between the inlet of the HP into the TS (true: upper storage connection)" annotation(Dialog(
			group="Heat Pump 3-way valve",
			tab="Standard Control",
			visible=false));
		Modelica.Blocks.Interfaces.BooleanInput StandardSTcontrol "If true, standard control will be used to control the solar thermal pump" annotation(
			Placement(
				transformation(
					origin={-125,-305},
					extent={{20,20},{-20,-20}},
					rotation=180),
				iconTransformation(
					origin={150,250},
					extent={{-20,-20},{20,20}},
					rotation=270)),
			Dialog(
				group="Solar Thermal",
				tab="Standard Control",
				visible=false));
		parameter Real deltaTonST(quantity="Thermics.TempDiff")=3 "Switch-on temperature difference between collector and storage temperature" annotation(Dialog(
			group="Solar Thermal",
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
		Modelica.Blocks.Interfaces.BooleanInput StandardControlSTSwitch "Standard Control for the 3-way valve to switch the connection to the thermal storage" annotation(
			Placement(
				transformation(extent={{-145,-255},{-105,-215}}),
				iconTransformation(
					origin={50,250},
					extent={{-20,20},{20,-20}},
					rotation=-90)),
			Dialog(
				group="Solar Thermal 3-way valve",
				tab="Standard Control",
				visible=false));
		Boolean SwitchSTTSPort_StandardControl "Switches between the inlet of the HP into the TS (true: upper storage connection)" annotation(Dialog(
			group="Solar Thermal 3-way valve",
			tab="Standard Control",
			visible=false));
		parameter Real alphaPV(
			quantity="Geometry.Angle",
			displayUnit="°")=0.6108652381980153 "Inclination angle of the PV system" annotation(Dialog(
			group="Parameters",
			tab="PV System"));
		parameter Real betaPV(
			quantity="Geometry.Angle",
			displayUnit="°")=3.141592653589793 "Orientation angle of the PV system" annotation(Dialog(
			group="Parameters",
			tab="PV System"));
		parameter Real PVPeak(quantity="Basics.Power")=10000 "Installed peak power of the PV system" annotation(Dialog(
			group="Parameters",
			tab="PV System"));
		Real PV_P(quantity="Basics.Power") "PV power" annotation(Dialog(
			group="Results",
			tab="PV System",
			visible=false));
		Real PV_E(
			quantity="Basics.Energy",
			displayUnit="kWh") "Produced energy of the PV system" annotation(Dialog(
			group="Results",
			tab="PV System",
			visible=false));
		Real HP_Signal(quantity="Basics.RelMagnitude") "Input Signal of Heat Pump" annotation(
			HideResult=false,
			Dialog(tab="Results HP"));
		Real HP_S_TM_VL(quantity="Basics.Temp") "Heat pump flow temperature" annotation(Dialog(
			group="Temperatures",
			tab="Results HP",
			visible=false));
		Real HP_S_TM_RL(quantity="Basics.Temp") "Heat pump return temperature" annotation(Dialog(
			group="Temperatures",
			tab="Results HP",
			visible=false));
		Real HP_S_TM_BC_VL(quantity="Basics.Temp") "Heat pump brine flow temperature" annotation(Dialog(
			group="Temperatures",
			tab="Results HP",
			visible=false));
		Real HP_S_TM_BC_RL(quantity="Basics.Temp") "Heat pump brine return temperature" annotation(Dialog(
			group="Temperatures",
			tab="Results HP",
			visible=false));
		Real HP_S_FW_HC(
			quantity="Thermics.VolumeFlow",
			displayUnit="l/min") "Volume flow heat pump " annotation(Dialog(
			group="Volume Flow",
			tab="Results HP",
			visible=false));
		Real HP_S_FW_BC(quantity="Thermics.VolumeFlow") "Brine volume flow heat pump " annotation(Dialog(
			group="Volume Flow",
			tab="Results HP",
			visible=false));
		Real HP_P_heat_is(quantity="Basics.Power") "Heat output power of heat pump " annotation(Dialog(
			group="Power",
			tab="Results HP",
			visible=false));
		Real HP_P_elec_is(quantity="Basics.Power") "Electricity demand of heat pump" annotation(Dialog(
			group="Power",
			tab="Results HP",
			visible=false));
		Real HP_E_heat_produced(
			quantity="Basics.Energy",
			displayUnit="kWh") "Heat output of heat pump" annotation(Dialog(
			group="Energy",
			tab="Results HP",
			visible=false));
		Real HP_E_elec_consumed(
			quantity="Basics.Energy",
			displayUnit="kWh") "Consumed electric energy of heat pump" annotation(Dialog(
			group="Energy",
			tab="Results HP",
			visible=false));
		Real HP_COP(quantity="Basics.Unitless") "Coefficiency of performance" annotation(Dialog(
			group="Efficiency",
			tab="Results HP",
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
		Real TS_P_heat_toFWS(quantity="Basics.Power") "Power transfered to fresh water station" annotation(Dialog(
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
		Real TS_S_TM_HC_HW_VL(quantity="Basics.Temp") "Flow temperature to fresh water station" annotation(Dialog(
			group="Temperatures",
			tab="Results TS",
			visible=false));
		Real TS_S_TM_HC_HW_RL(quantity="Basics.Temp") "Return temperature to fresh water station" annotation(Dialog(
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
		Real TS_S_FW_HC_HW(
			quantity="Thermics.VolumeFlow",
			displayUnit="l/min") "Volume flow to fresh water station" annotation(Dialog(
			group="Volume Flow",
			tab="Results TS",
			visible=false));
		Real TS_E_Storage_BT(
			quantity="Basics.Energy",
			displayUnit="kWh") "Energy in thermal storage" annotation(Dialog(
			group="Energy",
			tab="Results TS",
			visible=false));
		Real TS_E_heat_toFWS(
			quantity="Basics.Energy",
			displayUnit="kWh") "Total energy transfered to fresh water station" annotation(Dialog(
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
		Modelica.Blocks.Sources.RealExpression TColdWater(y(quantity="Basics.Temp")=293.15) annotation(Placement(transformation(extent={{435,-295},{415,-275}})));
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
			redeclare replaceable parameter GreenCity.Utilities.BuildingData.ParameterSelectionSCB.AgeOfBuilding.EnEV2016 buildingAge,
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
			TMin(displayUnit="K")=TMin) "Heated 3-zone-building with changeable heating system" annotation(Placement(transformation(extent={{340,-235},{380,-195}})));
		Modelica.Blocks.Logical.Switch switch2 annotation(Placement(transformation(extent={{-90,-315},{-70,-295}})));
		Modelica.Blocks.Sources.RealExpression qvSTpump_StandardControl(y=qvRefST) annotation(Placement(transformation(extent={{-125,-295},{-105,-275}})));
		Modelica.Blocks.Logical.LogicalSwitch logicalSwitch1 annotation(Placement(transformation(extent={{-90,-245},{-70,-225}})));
		Modelica.Blocks.Sources.BooleanExpression SwitchSignal_StandardControl(y=SwitchSTTSPort_StandardControl) "Set output signal to a time varying Boolean expression" annotation(Placement(transformation(extent={{-125,-220},{-105,-200}})));
		Modelica.Blocks.Logical.LogicalSwitch logicalSwitch2 annotation(Placement(transformation(extent={{-90,-35},{-70,-15}})));
		Modelica.Blocks.Sources.BooleanExpression SwitchSignal_StandardControl1(y=SwitchHPTSPort_StandardControl) "Set output signal to a time varying Boolean expression" annotation(Placement(transformation(extent={{-125,-10},{-105,10}})));
		Modelica.Blocks.Logical.Switch switch5 annotation(Placement(transformation(extent={{-90,-175},{-70,-155}})));
		Modelica.Blocks.Sources.BooleanExpression booleanExpression3(y=StandardHPcontrol) annotation(Placement(transformation(extent={{-125,-175},{-105,-155}})));
		Modelica.Blocks.Sources.RealExpression AUXin_StandardControl(y=AUXinStandardControl) annotation(Placement(transformation(extent={{-125,-160},{-105,-140}})));
		Modelica.Blocks.Logical.LogicalSwitch logicalSwitch3 annotation(Placement(transformation(extent={{-90,-110},{-70,-90}})));
		Modelica.Blocks.Sources.BooleanExpression SwitchSignal_StandardControl2(y=HPinStandardControl) "Set output signal to a time varying Boolean expression" annotation(Placement(transformation(extent={{-125,-85},{-105,-65}})));
		GreenCity.Local.Photovoltaic photovoltaic1(
			alphaModule(displayUnit="rad")=alphaPV,
			betaModule(displayUnit="rad")=betaPV,
			PPeak(displayUnit="Nm/s")=PVPeak) annotation(Placement(transformation(extent={{395,-440},{355,-400}})));
		GreenCity.Local.Controller.PV2ACInverter pV2ACInverter1 annotation(Placement(transformation(extent={{345,-400},{305,-440}})));
		GreenCity.Utilities.Electrical.Grid grid2(
			OutputType=GreenCity.Utilities.Electrical.Grid.OutputEnum.MasterGrid,
			useA=true,
			useB=true,
			useC=true,
			useD=true,
			useE=true,
			useF=true) annotation(Placement(transformation(extent={{230,-455},{270,-415}})));
	equation
		// Controller
		// Solar thermal controller (copied from Green City's 'SolarController')
		TCollectorST = WolfCRK12.TCollector;
		TStorageSTConnection = TS_S_TM_BT_5;
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
		
		// Solar Thermal 3way valve
		when (((TCollectorST - TS_S_TM_BT_9) > deltaTonST) and StandardControlSTSwitch) then 
			SwitchSTTSPort_StandardControl = true;
		elsewhen (((TCollectorST - TS_S_TM_BT_9) < deltaToffST) or not StandardControlSTSwitch) then
			SwitchSTTSPort_StandardControl = false;
		end when;
		
		// Heat pump 3way valve
		when (TS_S_TM_BT_8 < TStartHPhigh) and StandardControlHPSwitch then 
			SwitchHPTSPort_StandardControl = true;
		elsewhen (TS_S_TM_BT_7 > TStopHPhigh) or not StandardControlHPSwitch then
			SwitchHPTSPort_StandardControl = false;
		end when;
		
		// Heat pump
		when ((SwitchHPTSPort_StandardControl or (TS_S_TM_BT_3 < TStartHPlow)) and StandardHPcontrol) then
			HPon = true;
		elsewhen (((not SwitchHPTSPort_StandardControl) and (TS_S_TM_BT_2 > TStopHPlow)) or not StandardHPcontrol) then
			HPon = false;
		end when;
		when (HPon and ((TS_S_TM_BT_8 < TStartAUXhigh) or (TS_S_TM_BT_3 < TStartAUXlow))) then
			AUXon = true;
		elsewhen ((((TS_S_TM_BT_7 > TStopAUXhigh) or (not SwitchHPTSPort_StandardControl)) and (TS_S_TM_BT_2 > TStopAUXlow)) or not HPon) then
			AUXon = false;
		end when;
		if HPon and AUXon then
			HPinStandardControl = true;
			AUXinStandardControl = 1;
		elseif HPon and not AUXon then
			HPinStandardControl =  true;
			AUXinStandardControl = 0;
		else
			HPinStandardControl = false;
			AUXinStandardControl = 0;
		end if;
		
		// Results
		// Heat Pump
		HP_S_TM_VL = wolfBWS1_10.TFlow;
		HP_S_TM_RL = wolfBWS1_10.TReturn;
		HP_S_FW_HC = wolfBWS1_10.wolfBWS1.VWater;
		HP_P_heat_is = wolfBWS1_10.QHeat_HP + wolfBWS1_10.QHeat_Aux;
		HP_P_elec_is = wolfBWS1_10.PEl_HP + wolfBWS1_10.PEl_Aux;
		HP_S_TM_BC_VL = wolfBWS1_10.TSourceIn;
		HP_S_TM_BC_RL = wolfBWS1_10.TSouceOut;
		HP_S_FW_BC = wolfBWS1_10.wolfBWS1.VSource;
		HP_E_heat_produced = wolfBWS1_10.EHeat_HP + wolfBWS1_10.EHeat_Aux;
		HP_E_elec_consumed = wolfBWS1_10.EEl_HP + wolfBWS1_10.EEl_Aux;
		HP_COP = wolfBWS1_10.COP;
		
		// Solar Thermal Collectors
		ST_S_TM_VL = WolfCRK12.FlowST.T;
		ST_S_TM_RL = WolfCRK12.ReturnST.T;
		ST_S_TM_Collector = WolfCRK12.TCollector;
		ST_S_FW_HC = WolfCRK12.FlowST.qv;
		ST_E_heat_produced = WolfCRK12.EST;
		ST_P_heat_is = WolfCRK12.QSolarThermal;
		
		// Hot Water Storage
		TS_P_heat_toFWS = WolfBSP_W_SL_1000.PStorage[8];
		TS_S_FW_HC_HW = dHW_demand1.qv_Set;
		TS_E_heat_toFWS = WolfBSP_W_SL_1000.EHeat[8];
		
		//Thermal Storage
		TS_S_TM_HC_VL = WolfBSP_W_SL_1000.FlowOut7.T;
		TS_S_TM_HC_RL = WolfBSP_W_SL_1000.ReturnIn7.T;
		TS_S_TM_PS_VL = switchPort2.HeatGeneratorFlow.T;
		TS_S_TM_PS_RL = switchPort2.HeatGeneratorReturn.T;
		TS_S_TM_HC_HW_VL = dHW_demand1.FlowHotWater.T;
		TS_S_TM_HC_HW_RL = dHW_demand1.ReturnHotWater.T;
		TS_S_TM_BT_1 = WolfBSP_W_SL_1000.TStorage[1];
		TS_S_TM_BT_2 = WolfBSP_W_SL_1000.TStorage[2];
		TS_S_TM_BT_3 = WolfBSP_W_SL_1000.TStorage[3];
		TS_S_TM_BT_4 = WolfBSP_W_SL_1000.TStorage[4];
		TS_S_TM_BT_5 = WolfBSP_W_SL_1000.TStorage[5];
		TS_S_TM_BT_6 = WolfBSP_W_SL_1000.TStorage[6];
		TS_S_TM_BT_7 = WolfBSP_W_SL_1000.TStorage[7];
		TS_S_TM_BT_8 = WolfBSP_W_SL_1000.TStorage[8];
		TS_S_TM_BT_9 = WolfBSP_W_SL_1000.TStorage[9];
		TS_S_TM_BT_10 = WolfBSP_W_SL_1000.TStorage[10];
		TS_E_Storage_BT = WolfBSP_W_SL_1000.cpMed*WolfBSP_W_SL_1000.rhoMed*WolfBSP_W_SL_1000.VStorage*((WolfBSP_W_SL_1000.TLayer[1]+WolfBSP_W_SL_1000.TLayer[2]+WolfBSP_W_SL_1000.TLayer[3]+WolfBSP_W_SL_1000.TLayer[4]+WolfBSP_W_SL_1000.TLayer[5]+WolfBSP_W_SL_1000.TLayer[6]+WolfBSP_W_SL_1000.TLayer[7]+WolfBSP_W_SL_1000.TLayer[8]+WolfBSP_W_SL_1000.TLayer[9]+WolfBSP_W_SL_1000.TLayer[10])/10-T0_TS);
		TS_SOC_BT = TS_E_Storage_BT/(WolfBSP_W_SL_1000.cpMed*WolfBSP_W_SL_1000.rhoMed*WolfBSP_W_SL_1000.VStorage*(Tmax_TS - T0_TS));
		
		// Heat Sink (Heating)
		HS_S_TM_VL_bM = heatingUnitFlowTemperature1.FlowSupply.T;
		HS_S_TM_VL_aM = heatingUnitFlowTemperature1.FlowSink.T;
		HS_S_TM_RL = heatingUnitFlowTemperature1.ReturnSupply.T;
		HS_S_TM_Room = simpleHeatedBuilding1.TZone[2];
		HS_S_FW_HC_aM = heatingUnitFlowTemperature1.FlowSink.qv;
		HS_S_FW_HC_bM = heatingUnitFlowTemperature1.FlowSupply.qv;
		HS_P_DemHeatHC_is = simpleHeatedBuilding1.QHeat;
		HS_E_DemHeatHC_consumed = simpleHeatedBuilding1.EHeat;
		
		// Heat Sink (Domestic Hot Water)
		HS_S_TM_HW_VL = dHW_demand1.FlowHotWater.T;
		HS_S_TM_HW_RL = dHW_demand1.ReturnHotWater.T;
		HS_S_FW_HW_VL = dHW_demand1.qv_DHW;
		HS_P_DemHeatHW_is = dHW_demand1.Q_DHW;
		HS_E_DemHeatHW_consumed = dHW_demand1.E_DHW;
		
		
		// PV
		PV_P = -grid2.PGrid[4];
		PV_E = -grid2.EGridfeed[4];
	initial equation
		// enter your equations here
		// Solar thermal controller
		if (((TCollectorST - TStorageSTConnection) > deltaTonST) and StandardSTcontrol) then
			CPonST = true;
		else	
			CPonST = false;
		end if;
		
		// Solar Thermal 3way valve
		if (((TCollectorST - TS_S_TM_BT_9) > deltaTonST) and StandardControlSTSwitch) then 
			SwitchSTTSPort_StandardControl = true;
		else
			SwitchSTTSPort_StandardControl = false;
		end if;
		
		// Heat pump 3way valve
		if (TS_S_TM_BT_8 < TStartHPhigh) and StandardControlHPSwitch then 
			SwitchHPTSPort_StandardControl = true;
		else
			SwitchHPTSPort_StandardControl = false;
		end if;
		
		// Heat pump
		if ((SwitchHPTSPort_StandardControl or (TS_S_TM_BT_3 < TStartHPlow)) and StandardHPcontrol) then
			HPon = true;
		else
			HPon = false;
		end if;
		if (HPon and ((TS_S_TM_BT_8 < TStartAUXhigh) or (TS_S_TM_BT_3 < TStartAUXlow))) then
			AUXon = true;
		else
			AUXon = false;
		end if;
	equation
		connect(environmentConditions1,WolfCRK12.EnvironmentConditions) annotation(Line(
			points={{455,-95},{450,-95},{-40,-95},{-40,-330},{-35,-330}},
			color={192,192,192},
			thickness=0.015625));
		connect(phaseTap1.Grid1,heatingUnitFlowTemperature1.Grid1) annotation(Line(
			points={{245,-370},{250,-370},{259.3,-370},{259.3,-235},{259.3,-230}},
			color={247,148,29},
			thickness=0.015625));
		connect(environmentConditions1,dHW_demand1.EnvironmentConditions) annotation(Line(
			points={{455,-95},{450,-95},{399.7,-95},{399.7,-255},{394.7,-255}},
			color={192,192,192},
			thickness=0.015625));
		connect(grid1.LVGridE,phaseTap1.Grid3) annotation(Line(
			points={{195,-370},{200,-370},{230,-370},{235,-370}},
			color={247,148,29},
			thickness=0.015625));
		connect(pump2.PumpIn,WolfCRK12.FlowST) annotation(Line(
			points={{65,-320},{60,-320},{10,-320},{5,-320}},
			color={190,30,45},
			thickness=0.015625));
		connect(measureThermal1.TMedium,dHW_demand1.TPipe) annotation(
			Line(
				points={{300,-250},{300,-245},{390,-245},{390,-250}},
				color={0,0,127},
				thickness=0.0625),
			__esi_AutoRoute=false);
		connect(extractVolumeFlow1.qvMedium,defineVolumeFlow1.qvMedium) annotation(Line(
			points={{185,-105},{185,-100},{205,-100},{205,-105}},
			color={0,0,127},
			thickness=0.0625));
		connect(extractVolumeFlow1.TMedium,DTH_HEXin) annotation(Line(
			points={{175,-105},{175,-100},{175,45},{-110,45},{-115,45}},
			color={0,0,127},
			thickness=0.0625));
		connect(TDH_HEXout,defineVolumeFlow1.TMedium) annotation(Line(
			points={{-125,90},{-120,90},{215,90},{215,-100},{215,-105}},
			color={0,0,127},
			thickness=0.0625));
		connect(extractVolumeFlow1.qvMedium,qv_HEX) annotation(Line(
			points={{185,-105},{185,-100},{185,65},{-110,65},{-115,65}},
			color={0,0,127},
			thickness=0.0625));
		connect(wolfBWS1_10.Return,switchPort2.HeatGeneratorReturn) annotation(Line(
			points={{64.7,-210},{69.7,-210},{95,-210},{95,-220},{100,-220}},
			color={190,30,45},
			thickness=0.0625));
		connect(wolfBWS1_10.Flow,switchPort2.HeatGeneratorFlow) annotation(Line(
			points={{64.7,-200},{69.7,-200},{95,-200},{100,-200}},
			color={190,30,45}));
		connect(hydraulicSwitch_TS_DH1.qvDistrictHeating,qvDHpump) annotation(Line(
			points={{170,-145},{170,-140},{170,20},{-120,20},{-125,20}},
			color={0,0,127},
			thickness=0.0625));
		connect(hydraulicSwitch_TS_DH1.HeatExchangerOut,defineVolumeFlow1.Pipe) annotation(Line(
			points={{190,-145},{190,-140},{190,-130},{210,-130},{210,-125}},
			color={190,30,45},
			thickness=0.0625));
		connect(hydraulicSwitch_TS_DH1.HeatExchangerIn,extractVolumeFlow1.Pipe) annotation(Line(
			points={{180,-145},{180,-140},{180,-130},{180,-125}},
			color={190,30,45}));
		connect(hydraulicSwitch_TS_DH1.FeedInPumpOut,phaseTap5.Grid1) annotation(Line(
			points={{210,-145},{210,-140},{215,-140},{215,-340},{210,-340}},
			color={247,148,29},
			thickness=0.0625));
		connect(phaseTap6.Grid1,hydraulicSwitch_TS_DH1.ExtractionPumpOut) annotation(
			Line(
				points={{215,-355},{220,-355},{220,-135},{205,-135},{205,-145}},
				color={247,148,29},
				thickness=0.0625),
			__esi_AutoRoute=false);
		connect(WolfCRK12.ReturnST,switchPort1.HeatGeneratorReturn) annotation(Line(
			points={{5,-340},{10,-340},{95,-340},{100,-340}},
			color={190,30,45},
			thickness=0.0625));
		connect(pump2.PumpOut,switchPort1.HeatGeneratorFlow) annotation(Line(
			points={{75,-320},{80,-320},{95,-320},{100,-320}},
			color={190,30,45}));
		connect(WolfBSP_W_SL_1000.ReturnOut4,switchPort1.StorageReturnTop) annotation(
			Line(
				points={{165,-234.6666564941406},{160,-234.7},{130,-234.7},{130,-325},{119.6666564941406,-325}},
				color={190,30,45}),
			__esi_AutoRoute=false);
		connect(WolfBSP_W_SL_1000.FlowIn4,switchPort1.StorageFlowTop) annotation(Line(
			points={{165,-229.7},{160,-229.7},{125,-229.7},{125,-320},{120,-320}},
			color={190,30,45},
			thickness=0.0625));
		connect(WolfBSP_W_SL_1000.ReturnIn7,heatingUnitFlowTemperature1.ReturnSupply) annotation(Line(
			points={{200,-219.7},{205,-219.7},{250,-219.7},{250,-221.3},{255,-221.3}},
			color={190,30,45},
			thickness=0.0625));
		connect(WolfBSP_W_SL_1000.FlowOut7,heatingUnitFlowTemperature1.FlowSupply) annotation(Line(
			points={{200,-210},{205,-210},{250,-210},{250,-203.7},{255,-203.7}},
			color={190,30,45}));
		connect(switchPort2.StorageFlowTop,WolfBSP_W_SL_1000.FlowIn2) annotation(Line(
			points={{120,-200},{125,-200},{160,-200},{165,-200}},
			color={190,30,45}));
		connect(switchPort2.StorageReturnTop,WolfBSP_W_SL_1000.ReturnOut2) annotation(Line(
			points={{119.7,-205},{124.7,-205},{160,-205},{165,-205}},
			color={190,30,45},
			thickness=0.0625));
		connect(switchPort2.StorageFlowBottom,WolfBSP_W_SL_1000.FlowIn3) annotation(Line(
			points={{119.7,-215},{124.7,-215},{160,-215},{165,-215}},
			color={190,30,45}));
		connect(switchPort2.StorageReturnBottom,WolfBSP_W_SL_1000.ReturnOut3) annotation(Line(
			points={{119.7,-220},{124.7,-220},{160,-220},{160,-219.7},{165,-219.7}},
			color={190,30,45},
			thickness=0.0625));
		connect(switchPort1.StorageReturnBottom,WolfBSP_W_SL_1000.ReturnOut5) annotation(
			Line(
				points={{119.6666564941406,-340},{124.7,-340},{140,-340},{140,-249.7},{165,-249.6666564941406}},
				color={190,30,45},
				thickness=0.0625),
			__esi_AutoRoute=false);
		connect(hydraulicSwitch_TS_DH1.StorageDischargeReturn,WolfBSP_W_SL_1000.ReturnIn6) annotation(Line(
			points={{215,-159.7},{215,-164.7},{215,-195},{205,-195},{200,-195}},
			color={190,30,45}));
		connect(hydraulicSwitch_TS_DH1.StorageDischargeFlow,WolfBSP_W_SL_1000.FlowOut6) annotation(Line(
			points={{210,-159.7},{210,-164.7},{210,-185},{205,-185},{200,-185}},
			color={190,30,45},
			thickness=0.0625));
		connect(hydraulicSwitch_TS_DH1.StorageChargeReturn,WolfBSP_W_SL_1000.ReturnOut1) annotation(Line(
			points={{155,-159.7},{155,-164.7},{155,-190},{160,-190},{165,-190}},
			color={190,30,45},
			thickness=0.0625));
		connect(WolfBSP_W_SL_1000.FlowIn1,hydraulicSwitch_TS_DH1.StorageChargeFlow) annotation(Line(
			points={{165,-185},{160,-185},{160,-164.7},{160,-159.7}},
			color={190,30,45},
			thickness=0.0625));
		connect(TColdWater.y,dHW_demand1.TColdWater) annotation(Line(
			points={{414,-285},{409,-285},{390,-285},{390,-274.7},{390,-269.7}},
			color={0,0,127},
			thickness=0.0625));
		connect(simpleHeatedBuilding1.PipeIn,heatingUnitFlowTemperature1.FlowSink) annotation(Line(
			points={{340,-205},{335,-205},{295,-205},{295,-203.7},{290,-203.7}},
			color={190,30,45},
			thickness=0.0625));
		connect(heatingUnitFlowTemperature1.ReturnSink,simpleHeatedBuilding1.PipeOut) annotation(Line(
			points={{290,-221.3},{295,-221.3},{335,-221.3},{335,-220},{340,-220}},
			color={190,30,45},
			thickness=0.0625));
		connect(simpleHeatedBuilding1.qv_Ref,heatingUnitFlowTemperature1.qvRef) annotation(Line(
			points={{345,-195},{345,-190},{281.3,-190},{281.3,-195}},
			color={0,0,127},
			thickness=0.0625));
		connect(simpleHeatedBuilding1.T_Ref,heatingUnitFlowTemperature1.TRef) annotation(
			Line(
				points={{350,-195},{350,-185},{268,-185},{268,-195}},
				color={0,0,127},
				thickness=0.0625),
			__esi_AutoRoute=false);
		connect(grid1.LVGridF,simpleHeatedBuilding1.Grid3) annotation(Line(
			points={{195,-385},{200,-385},{370,-385},{370,-240},{370,-235}},
			color={247,148,29},
			thickness=0.0625));
		connect(simpleHeatedBuilding1.EnvironmentConditions,environmentConditions1) annotation(Line(
			points={{365,-195},{365,-190},{365,-95},{450,-95},{455,-95}},
			color={192,192,192},
			thickness=0.0625));
		connect(qvSTpump_StandardControl.y,switch2.u1) annotation(Line(
			points={{-104,-285},{-99,-285},{-97,-285},{-97,-297},{-92,-297}},
			color={0,0,127},
			thickness=0.0625));
		connect(switch2.y,pump2.qvRef) annotation(Line(
			points={{-69,-305},{-64,-305},{70,-305},{70,-310},{70,-315}},
			color={0,0,127},
			thickness=0.0625));
		connect(phaseTap7.Grid1,pump2.Grid1) annotation(Line(
			points={{130,-370},{125,-370},{72.3,-370},{72.3,-330},{72.3,-325}},
			color={247,148,29},
			thickness=0.015625));
		connect(qvSTpump,switch2.u3) annotation(Line(
			points={{-125,-335},{-120,-335},{-97,-335},{-97,-313},{-92,-313}},
			color={0,0,127},
			thickness=0.0625));
		connect(SwitchSignal_StandardControl.y,logicalSwitch1.u1) annotation(Line(
			points={{-104,-210},{-99,-210},{-97,-210},{-97,-227},{-92,-227}},
			color={255,0,255},
			thickness=0.0625));
		connect(SwitchSTTSPort,logicalSwitch1.u3) annotation(Line(
			points={{-125,-265},{-120,-265},{-97,-265},{-97,-243},{-92,-243}},
			color={255,0,255},
			thickness=0.0625));
		connect(logicalSwitch1.y,switchPort1.SwitchPort) annotation(Line(
			points={{-69,-235},{-64,-235},{110,-235},{110,-310},{110,-315}},
			color={255,0,255},
			thickness=0.0625));
		connect(SwitchSignal_StandardControl1.y,logicalSwitch2.u1) annotation(Line(
			points={{-104,0},{-99,0},{-97,0},{-97,-17},{-92,-17}},
			color={255,0,255},
			thickness=0.0625));
		connect(logicalSwitch2.y,switchPort2.SwitchPort) annotation(Line(
			points={{-69,-25},{-64,-25},{110,-25},{110,-190},{110,-195}},
			color={255,0,255},
			thickness=0.0625));
		connect(SwitchHPTSPort,logicalSwitch2.u3) annotation(Line(
			points={{-125,-55},{-120,-55},{-97,-55},{-97,-33},{-92,-33}},
			color={255,0,255},
			thickness=0.0625));
		connect(AUXin_StandardControl.y,switch5.u1) annotation(Line(
			points={{-104,-150},{-99,-150},{-97,-150},{-97,-157},{-92,-157}},
			color={0,0,127},
			thickness=0.0625));
		connect(booleanExpression3.y,switch5.u2) annotation(Line(
			points={{-104,-165},{-99,-165},{-97,-165},{-92,-165}},
			color={255,0,255},
			thickness=0.0625));
		connect(HPAUXIn,switch5.u3) annotation(Line(
			points={{-125,-185},{-120,-185},{-97,-185},{-97,-173},{-92,-173}},
			color={0,0,127},
			thickness=0.0625));
		connect(wolfBWS1_10.HPAuxModulation,switch5.y) annotation(Line(
			points={{20,-210},{15,-210},{-64,-210},{-64,-165},{-69,-165}},
			color={0,0,127},
			thickness=0.0625));
		connect(SwitchSignal_StandardControl2.y,logicalSwitch3.u1) annotation(Line(
			points={{-104,-75},{-99,-75},{-97,-75},{-97,-92},{-92,-92}},
			color={255,0,255},
			thickness=0.0625));
		connect(logicalSwitch3.y,wolfBWS1_10.HPOn) annotation(Line(
			points={{-69,-100},{-64,-100},{15,-100},{15,-200},{20,-200}},
			color={255,0,255},
			thickness=0.0625));
		connect(wolfBWS1_10.environmentConditions,environmentConditions1) annotation(Line(
			points={{55,-185},{55,-180},{55,-95},{450,-95},{455,-95}},
			color={192,192,192},
			thickness=0.0625));
		connect(measureThermal1.PipeOut,dHW_demand1.FlowHotWater) annotation(Line(
			points={{305,-255},{310,-255},{370,-255},{375,-255}},
			color={190,30,45}));
		connect(WolfBSP_W_SL_1000.FlowOut8,measureThermal1.PipeIn) annotation(Line(
			points={{200,-234.7},{205,-234.7},{290,-234.7},{290,-255},{295,-255}},
			color={190,30,45}));
		connect(dHW_demand1.ReturnHotWater,WolfBSP_W_SL_1000.ReturnIn8) annotation(Line(
			points={{375,-265},{370,-265},{205,-265},{205,-244.7},{200,-244.7}},
			color={190,30,45}));
		connect(phaseTap6.Grid3,grid1.LVGridD) annotation(Line(
			points={{205,-355},{200,-355},{195,-355}},
			color={247,148,29},
			thickness=0.0625));
		connect(phaseTap5.Grid3,grid1.LVGridA) annotation(Line(
			points={{200,-340},{195,-340},{150,-340},{150,-355},{155,-355}},
			color={247,148,29},
			thickness=0.0625));
		connect(grid1.LVGridB,phaseTap7.Grid3) annotation(Line(
			points={{155,-370},{150,-370},{145,-370},{140,-370}},
			color={247,148,29},
			thickness=0.0625));
		connect(grid1.LVGridC,wolfBWS1_10.lV3Phase) annotation(Line(
			points={{155,-385},{150,-385},{55,-385},{55,-234.7},{55,-229.7}},
			color={247,148,29},
			thickness=0.0625));
		connect(HPOn,logicalSwitch3.u3) annotation(Line(
			points={{-125,-130},{-120,-130},{-97,-130},{-97,-108},{-92,-108}},
			color={255,0,255},
			thickness=0.0625));
		connect(pV2ACInverter1.MPP,photovoltaic1.MPP) annotation(Line(
			points={{325,-440},{325,-445},{375,-445},{375,-440}},
			color={0,0,127},
			thickness=0.0625));
		connect(photovoltaic1.DC,pV2ACInverter1.DCPV) annotation(Line(
			points={{355,-420},{350,-420},{345,-420}},
			color={247,148,29},
			thickness=0.0625));
		connect(environmentConditions1,photovoltaic1.EnvironmentConditions) annotation(Line(
			points={{455,-95},{450,-95},{400,-95},{400,-420},{395,-420}},
			color={192,192,192},
			thickness=0.0625));
		connect(grid2.LVGridD,pV2ACInverter1.LVGrid3) annotation(Line(
			points={{270,-420},{275,-420},{300,-420},{305,-420}},
			color={247,148,29},
			thickness=0.0625));
		connect(grid2.LVMastGrid,lV3Phase1) annotation(
			Line(
				points={{250,-455},{250,-460},{250,-490}},
				color={247,148,29},
				thickness=0.0625),
			__esi_AutoRoute=false);
		connect(grid2.LVGridA,grid1.LVMastGrid) annotation(Line(
			points={{230,-420},{225,-420},{175,-420},{175,-395},{175,-390}},
			color={247,148,29},
			thickness=0.0625));
		connect(logicalSwitch3.u2,StandardHPcontrol) annotation(Line(
			points={{-92,-100},{-97,-100},{-120,-100},{-125,-100}},
			color={255,0,255},
			thickness=0.0625));
		connect(WolfBSP_W_SL_1000.FlowIn5,switchPort1.StorageFlowBottom) annotation(
			Line(
				points={{165,-244.6666564941406},{160,-244.7},{135,-244.7},{135,-335},{119.6666564941406,-335}},
				color={190,30,45},
				thickness=0.0625),
			__esi_AutoRoute=false);
		connect(logicalSwitch2.u2,StandardControlHPSwitch) annotation(Line(
			points={{-92,-25},{-97,-25},{-120,-25},{-125,-25}},
			color={255,0,255},
			thickness=0.0625));
		connect(switch2.u2,StandardSTcontrol) annotation(Line(
			points={{-92,-305},{-97,-305},{-120,-305},{-125,-305}},
			color={255,0,255},
			thickness=0.0625));
		connect(StandardControlSTSwitch,logicalSwitch1.u2) annotation(Line(
			points={{-125,-235},{-120,-235},{-97,-235},{-92,-235}},
			color={255,0,255},
			thickness=0.0625));
	annotation(
		__esi_WolfCRK1(
			ReturnST(
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"),
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo")),
			FlowST(
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"),
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo")),
			ToFlow(Pipe(
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"),
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"))),
			FromReturn(Pipe(
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"),
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo")))),
		__esi_WolfSPU2_800(
			FromFlow1(Pipe(
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"),
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"))),
			ToReturn1(Pipe(
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"),
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"))),
			ToReturn2(Pipe(
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"),
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"))),
			FromFlow2(Pipe(
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"),
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"))),
			FromFlow3(Pipe(
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"),
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"))),
			ToReturn3(Pipe(
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"),
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"))),
			FromReturn4(Pipe(
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"),
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"))),
			ToFlow4(Pipe(
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"),
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"))),
			ToFlow5(Pipe(
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"),
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"))),
			FromReturn5(Pipe(
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"),
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"))),
			ToFlow6(Pipe(
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"),
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"))),
			FromReturn6(Pipe(
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"),
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"))),
			FlowIn1(
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"),
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo")),
			ReturnOut1(
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"),
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo")),
			FlowIn2(
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"),
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo")),
			ReturnOut2(
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"),
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo")),
			FlowIn3(
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"),
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo")),
			ReturnOut3(
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"),
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo")),
			FlowOut4(
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"),
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo")),
			ReturnIn4(
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"),
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo")),
			FlowOut5(
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"),
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo")),
			ReturnIn5(
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"),
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo")),
			FlowOut6(
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"),
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo")),
			ReturnIn6(
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"),
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"))),
		__esi_wolfCGB14(
			Return(
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"),
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo")),
			Flow(
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"),
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo")),
			measureThermal1(
				PipeOut(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
				PipeIn(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
				FromPipe(Pipe(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"))),
				ToPipe(Pipe(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")))),
			measureThermal2(
				PipeOut(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
				PipeIn(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
				FromPipe(Pipe(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"))),
				ToPipe(Pipe(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")))),
			condensingBoiler_DZ1(
				ReturnCB(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
				FlowCB(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
				ToFlow(Pipe(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"))),
				FromReturn(Pipe(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"))))),
		__esi_distributionValve1(
			PipeIn(
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"),
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo")),
			PipeOutRegulated(
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"),
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo")),
			PipeOutRemain(
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"),
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo")),
			FromPipe(Pipe(
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"),
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"))),
			ToPipe2(Pipe(
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"),
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"))),
			ToPipe1(Pipe(
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"),
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo")))),
		__esi_mergingValve1(
			PipeOut(
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"),
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo")),
			PipeIn1(
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"),
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo")),
			PipeIn2(
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"),
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo")),
			FromPipe1(Pipe(
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"),
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"))),
			FromPipe2(Pipe(
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"),
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"))),
			ToPipe(Pipe(
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"),
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo")))),
		__esi_neoTower2(
			Return(
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"),
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo")),
			Flow(
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"),
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo")),
			cHP_DZ1(
				ReturnCHP(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
				FlowCHP(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
				FromReturn(Pipe(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"))),
				ToFlow(Pipe(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")))),
			measureThermal1(
				PipeOut(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
				PipeIn(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
				FromPipe(Pipe(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"))),
				ToPipe(Pipe(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")))),
			measureThermal2(
				PipeOut(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
				PipeIn(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
				FromPipe(Pipe(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"))),
				ToPipe(Pipe(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"))))),
		__esi_hydraulicSwitch2HG1(
			HeatExchangerIn(
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"),
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo")),
			HeatGeneratorSupply2(
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"),
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo")),
			HeatGeneratorReturn2(
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"),
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo")),
			HeatExchangerOut(
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"),
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo")),
			HeatGeneratorSupply1(
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"),
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo")),
			HeatGeneratorReturn1(
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"),
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo")),
			StorageChargeReturn(
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"),
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo")),
			StorageChargeFlow(
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"),
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo")),
			StorageDischargeFlow(
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"),
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo")),
			StorageDischargeReturn(
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"),
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo")),
			DemandFlow(
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"),
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo")),
			DemandReturn(
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"),
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo")),
			StorageChargeOut(Pipe(
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"),
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"))),
			FeedInPump(
				PumpIn(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
				PumpOut(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
				ToPump(Pipe(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"))),
				FromPump(Pipe(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")))),
			FeedInValve(
				PipeIn(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
				PipeOutRegulated(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
				PipeOutRemain(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
				FromPipe(Pipe(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"))),
				ToPipe2(Pipe(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"))),
				ToPipe1(Pipe(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")))),
			DemandValve(
				PipeIn(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
				PipeOutRegulated(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
				PipeOutRemain(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
				FromPipe(Pipe(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"))),
				ToPipe2(Pipe(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"))),
				ToPipe1(Pipe(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")))),
			mergingValve1(
				PipeOut(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
				PipeIn1(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
				PipeIn2(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
				FromPipe1(Pipe(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"))),
				FromPipe2(Pipe(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"))),
				ToPipe(Pipe(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")))),
			mergingValve2(
				PipeOut(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
				PipeIn1(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
				PipeIn2(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
				FromPipe1(Pipe(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"))),
				FromPipe2(Pipe(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"))),
				ToPipe(Pipe(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")))),
			measureThermal3(
				PipeOut(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
				PipeIn(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
				FromPipe(Pipe(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"))),
				ToPipe(Pipe(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")))),
			DHFeedIn_Extract(
				PipeIn(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
				PipeOutRegulated(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
				PipeOutRemain(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
				FromPipe(Pipe(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"))),
				ToPipe2(Pipe(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"))),
				ToPipe1(Pipe(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")))),
			mergingValve3(
				PipeOut(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
				PipeIn1(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
				PipeIn2(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
				FromPipe1(Pipe(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"))),
				FromPipe2(Pipe(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"))),
				ToPipe(Pipe(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")))),
			mergingValve4(
				PipeOut(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
				PipeIn1(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
				PipeIn2(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
				FromPipe1(Pipe(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"))),
				FromPipe2(Pipe(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"))),
				ToPipe(Pipe(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")))),
			measureMixed(
				PipeOut(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
				PipeIn(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
				FromPipe(Pipe(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"))),
				ToPipe(Pipe(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")))),
			HeatGeneratorValve1(
				PipeIn(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
				PipeOutRegulated(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
				PipeOutRemain(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
				FromPipe(Pipe(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"))),
				ToPipe2(Pipe(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"))),
				ToPipe1(Pipe(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")))),
			mergingValve5(
				PipeOut(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
				PipeIn1(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
				PipeIn2(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
				FromPipe1(Pipe(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"))),
				FromPipe2(Pipe(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"))),
				ToPipe(Pipe(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")))),
			measureHGSupply1(
				PipeOut(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
				PipeIn(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
				FromPipe(Pipe(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"))),
				ToPipe(Pipe(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")))),
			measureDHSupply(
				PipeOut(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
				PipeIn(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
				FromPipe(Pipe(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"))),
				ToPipe(Pipe(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")))),
			DistrictHeatingValve1(
				PipeIn(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
				PipeOutRegulated(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
				PipeOutRemain(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
				FromPipe(Pipe(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"))),
				ToPipe2(Pipe(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"))),
				ToPipe1(Pipe(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")))),
			StorageChargeIn(Pipe(
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"),
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"))),
			StorageDischargeIn(Pipe(
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"),
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"))),
			StorageDischargeOut(Pipe(
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"),
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"))),
			StorageChargeIn1(Pipe(
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"),
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"))),
			StorageChargeOut1(Pipe(
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"),
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"))),
			StorageDischargeOut1(Pipe(
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"),
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"))),
			StorageDischargeIn1(Pipe(
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"),
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"))),
			measureDemandSupply(
				PipeOut(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
				PipeIn(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
				FromPipe(Pipe(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"))),
				ToPipe(Pipe(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")))),
			measureDemandReturn(
				PipeOut(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
				PipeIn(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
				FromPipe(Pipe(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"))),
				ToPipe(Pipe(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")))),
			ExtractionPump1(
				PumpIn(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
				PumpOut(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
				ToPump(Pipe(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"))),
				FromPump(Pipe(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")))),
			measureHGSupply2(
				PipeOut(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
				PipeIn(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
				FromPipe(Pipe(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"))),
				ToPipe(Pipe(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")))),
			mergingValve6(
				PipeOut(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
				PipeIn1(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
				PipeIn2(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
				FromPipe1(Pipe(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"))),
				FromPipe2(Pipe(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"))),
				ToPipe(Pipe(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")))),
			HeatGeneratorValve2(
				PipeIn(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
				PipeOutRegulated(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
				PipeOutRemain(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
				FromPipe(Pipe(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"))),
				ToPipe2(Pipe(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"))),
				ToPipe1(Pipe(
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"),
					viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")))),
			viewinfo[0](
				fMin=1,
				fMax=100,
				nf=100,
				kindSweep=1,
				expDataFormat=0,
				expNumberFormat="%.7lg",
				expMatrixNames={
																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																													"A","B","C","D","E"},
				typename="AnaLinSysInfo")),
		__esi_WolfSEM1_500(
			FromFlow1(Pipe(
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"),
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"))),
			ToReturn1(Pipe(
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"),
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"))),
			ToReturn2(Pipe(
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"),
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"))),
			FromFlow2(Pipe(
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"),
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"))),
			FromFlow3(Pipe(
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"),
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"))),
			ToReturn3(Pipe(
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"),
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"))),
			FromReturn4(Pipe(
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"),
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"))),
			ToFlow4(Pipe(
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"),
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"))),
			ToFlow5(Pipe(
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"),
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"))),
			FromReturn5(Pipe(
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"),
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"))),
			ToFlow6(Pipe(
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"),
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"))),
			FromReturn6(Pipe(
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"),
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"))),
			FlowIn1(
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"),
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo")),
			ReturnOut1(
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"),
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo")),
			FlowIn2(
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"),
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo")),
			ReturnOut2(
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"),
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo")),
			FlowIn3(
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"),
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo")),
			ReturnOut3(
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"),
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo")),
			FlowOut4(
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"),
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo")),
			ReturnIn4(
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"),
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo")),
			FlowOut5(
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"),
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo")),
			ReturnIn5(
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"),
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo")),
			FlowOut6(
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"),
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo")),
			ReturnIn6(
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"),
				viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"))),
		__esi_hydraulicSwitch_TS_DH1(viewinfo[0](
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
								textString="SF3",
								fontName="TUM Neue Helvetica 55 Regular",
								textStyle={
									TextStyle.Bold},
								extent={{-252.5,269.8},{253.7,97.3}}),
							Bitmap(
								imageSource="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
EUJd3f8B7chaQ/qC6bMAAAAASUVORK5CYII=",
								extent={{-225,-251.5},{225,123.5}}),
							Text(
								textString="DZ",
								fontSize=14,
								textStyle={
									TextStyle.Bold},
								lineColor={0,128,255},
								extent={{164.7,-196.8},{274.7,-260.2}})}),
		Documentation(info="<HTML><HEAD>
<META http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\"> 
<TITLE>House 3 with ST and GSHP (not yet validated)</TITLE> 
<STYLE type=\"text/css\">
table>tbody>tr:hover,th{background-color:#edf1f3}html{font-size:90%}body,table{font-size:1rem}body{font-family:'Open Sans',Arial,sans-serif;color:#465e70}h1,h2{margin:1em 0 .6em;font-weight:600}p{margin-top:.3em;margin-bottom:.2em}table{border-collapse:collapse;margin:1em 0;width:100%;}tr{border:1px solid #beccd3}td,th{padding:.3em 1em; border-width: 1px; border-style: solid; border-color: rgb(190, 204, 211);}td{word-break:break-word}tr:nth-child(even){background-color:#fafafa}th{font-family:'Open Sans Semibold',Arial,sans-serif;font-weight:700;text-align:left;word-break:keep-all}.lib-wrap{width:70%}@media screen and (max-width:800px){.lib-wrap{width:100%}}td p{margin:.2em}
</STYLE>
      
<META name=\"GENERATOR\" content=\"MSHTML 11.00.10570.1001\"></HEAD> 
<BODY>
<H1>House 3 with ST and GSHP</H1>
<HR>

<P>This model is a digital twin of the House&nbsp;3 in the CoSES laboratory (<A 
href=\"https://doi.org/10.1109/PESGM41954.2020.9281442\">https://doi.org/10.1109/PESGM41954.2020.9281442</A>)</P>
<P><BR></P>
<P>The house consists of the following components and default conditions:</P>
<UL>
  <LI>Ground Source Heat Pump (GSHP): Wolf BWS-1 10<BR>nominal heating power /   
        COP   (B0/W35):&nbsp;8.4 kW_th&nbsp;/ 4.7<BR>electric auxiliary heater: 
  6           kW<BR></LI>
  <LI>Solar Thermal emulator of variable size, up to 9 kW_th</LI>
  <LI>PV system of variable size</LI>
  <LI>Thermal Storage: Wolf&nbsp;BSP-W-SL 1000,&nbsp;content:&nbsp;900         
  l&nbsp;</LI>
  <LI>Domestic Hot Water (DHW) preparation: Fresh water station          
  (simplified)</LI>
  <LI>Consumption - House parameters:<BR>Construction year:&nbsp;2016 (EnEv      
         2016)<BR>Additional insulation: roof + ceiling +&nbsp;walls +     
  floor<BR>Number     of floors:     2<BR>Number       of apartements:     
  3<BR>Number of inhabitants:     8<BR>Living     area: 400m²<BR>Heating         
  system:&nbsp;floor     heating&nbsp;(supply / return     temperatur:&nbsp;40   
     /&nbsp;30&nbsp;°C)</LI></UL>
<P>Four boolean inputs can activate a predefined standard control for simple     
 simulation results or during a lead time of the simulation. The standard     
control  of each element is as follows:</P>
<UL>
  <LI>GSHP:<BR>Switched on at 100 % modulation,             
  when:<BR>&nbsp;&nbsp;&nbsp;&nbsp;     T_Storage,top           
  &lt;&nbsp;T_Start,HP,high&nbsp;or T_Storage,middle &lt;           
  T_Start,HP,low<BR>Switched   off,     when:<BR>&nbsp;&nbsp;&nbsp;&nbsp;        
     T_Storage,top &gt; T_Stop,HP,high and T_Storage,middle&nbsp;&gt;           
  T_Stop,HP,low<BR><BR></LI>
  <LI>Auxiliary Heater (standard control is active, when GSHP standard control   
          is active):<BR>Switch on at 100%, when:<BR>&nbsp;&nbsp;&nbsp;&nbsp; 
  GSHP   =     on     and (T_Storage,top &lt;&nbsp;T_Start,Aux,high&nbsp;or     
  T_Storage,middle   &lt;     T_Start,Aux,low)<BR>Switch off,     
  when:<BR>&nbsp;&nbsp;&nbsp;&nbsp;   GSHP =     off&nbsp;or     
  (T_Storage,top&nbsp;&gt;&nbsp;T_Stop,Aux,high&nbsp;and           
  T_Storage,middle&nbsp;&gt; T_Stop,Aux,low)<BR><BR></LI>
  <LI>GSHP 3way valve:<BR>Domestic hot water should be produced at a higher      
       priority<BR>Switch to the top ports (DHW), when:<BR>&nbsp;&nbsp;&nbsp;    
         T_Storage,top &lt;&nbsp;T_Start,HP,high<BR>Switch to the middle ports   
          (heating), when:<BR>&nbsp;&nbsp;&nbsp;           
  T_Storage,top&nbsp;&gt;&nbsp;T_Stop,HP,high<BR><BR></LI>
  <LI>Solar Thermal pump:<BR>The control is&nbsp;based on Green City's           
      'SolarController'<BR>Solar thermal pump switched on,               
  when:<BR>&nbsp;&nbsp;&nbsp;&nbsp; (T_Collector - T_Storage,in,bottom) &gt;     
            deltaTonST<BR>Solar thermal pump switched off,               
  when:<BR>&nbsp;&nbsp;&nbsp;&nbsp; (T_Collector -   
  T_Storage,in,bottom)&nbsp;&lt;             deltaToffST<BR>The pump is   
  controlled with the following               
  conditions:<BR>&nbsp;&nbsp;&nbsp;&nbsp; if (T_Flow - T_Return) &lt;            
     deltaTFlowReturnLow, the reference volume flow is at  minimum               
  level.<BR>&nbsp;&nbsp;&nbsp;&nbsp; if (T_Flow - T_Return) &gt;               
  deltaTFlowReturnMax, the reference volume flow is at  maximum               
  level.<BR>&nbsp;&nbsp;&nbsp;&nbsp; Between the two temperature  boundaries the 
                reference volume flow is linearly  interpolated.<BR><BR></LI>
  <LI>Solar Thermal&nbsp;3way valve:<BR>The upper level should be heated first   
  with the solar thermal unit<BR>Switch to the top ports,   
  when:<BR>&nbsp;&nbsp;&nbsp;&nbsp; (T_Collector - T_Storage,in,top) &gt;        
         deltaTonST<BR>Switch to the lower ports,   
  when:<BR>&nbsp;&nbsp;&nbsp;&nbsp; (T_Collector - T_Storage,in,top)&nbsp;&lt;   
              deltaToffST<BR></LI></UL>
<DIV class=\"lib-wrap\">
<TABLE class=\"type\">
  <TBODY>
  <TR>
    <TH>Symbol:</TH>
    <TD colspan=\"3\"><IMG width=\"340\" height=\"273\" src=\"data:image/png;base64,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\"></TD></TR>
  <TR>
    <TH>Identifier:</TH>
    <TD colspan=\"3\">CoSES_Models.Houses.SF3</TD></TR>
  <TR>
    <TH>Version:</TH>
    <TD colspan=\"3\">1.0</TD></TR>
  <TR>
    <TH>File:</TH>
    <TD colspan=\"3\">SF3.mo</TD></TR>
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
    <TD>Switches between the inlet of the HP into the TS (true: upper storage  
                                   connection)</TD>
    <TD>SwitchHPTSPort</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Air source heat pump input - heat power (temperature difference        
                             between supply and return is constant)</TD>
    <TD>HPAUXIn</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Switches between the inlet of the HP into the TS (true: upper storage  
                                   connection)</TD>
    <TD>SwitchSTTSPort</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Turns the heat pump on</TD>
    <TD>HPOn</TD>
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
    <TD>Standard Control for the 3-way valve to switch the connection to the   
                                  thermal storage</TD>
    <TD>StandardControlSTSwitch</TD>
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
    <TD>Connection of 1-phase to 3-phase AC components</TD>
    <TD>phaseTap7</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heat storage with variable temperature profile with 5 inlet ports</TD>
    <TD>WolfBSP_W_SL_1000</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>HydraulicSwitch between thermal storage and district heating</TD>
    <TD>hydraulicSwitch_TS_DH1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Change between inlet ports of thermal storage</TD>
    <TD>switchPort1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Change between inlet ports of thermal storage</TD>
    <TD>switchPort2</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>WolfBWS1_10_GC</TD>
    <TD>wolfBWS1_10</TD>
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
    <TD>if true: horizontal collector, else downhole heat exchanger</TD>
    <TD>horizontalCollector</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Number of independent heat exchangers</TD>
    <TD>numberHE</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Depth of hole, for horizontal collectors: laying depth of heat         
                            collectors</TD>
    <TD>HoleDepth</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Radius of hole, for horizontal collectors: equivalent radius of the    
                                 flat collector field</TD>
    <TD>rHole</TD>
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
                             storage is linear, if false the profile is defined 
      by a             temperature                 vector</TD>
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
                                   data ha to be provided, else standart load 
      profiles       are       used</TD>
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
                               people are at home, less rooms are heated and the 
            average             temperature       will       decrease)</TD>
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
    <TD>Input Signal of Heat Pump</TD>
    <TD>HP_Signal</TD>
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
    <TD>Logical Switch</TD>
    <TD>logicalSwitch2</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Set output signal to a time varying Boolean expression</TD>
    <TD>SwitchSignal_StandardControl1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Switch between two Real signals</TD>
    <TD>switch5</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Set output signal to a time varying Boolean expression</TD>
    <TD>booleanExpression3</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Set output signal to a time varying Real expression</TD>
    <TD>AUXin_StandardControl</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Logical Switch</TD>
    <TD>logicalSwitch3</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Set output signal to a time varying Boolean expression</TD>
    <TD>SwitchSignal_StandardControl2</TD>
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
    <TD>Electrical power grid for connection of maximum six 3-phase AC         
                            components</TD>
    <TD>grid2</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>Results:</TH>
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
    <TD>Switches between the inlet of the HP into the TS (true: upper storage  
                                   connection)</TD>
    <TD>SwitchHPTSPort</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Air source heat pump input - heat power (temperature difference        
                             between supply and return is constant)</TD>
    <TD>HPAUXIn</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Switches between the inlet of the HP into the TS (true: upper storage  
                                   connection)</TD>
    <TD>SwitchSTTSPort</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Turns the heat pump on</TD>
    <TD>HPOn</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>If true, standard control will be used to control the heat pump</TD>
    <TD>StandardHPcontrol</TD>
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
    <TD>Standard Control for the 3-way valve to switch the connection to the   
                                  thermal storage</TD>
    <TD>StandardControlHPSwitch</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Switches between the inlet of the HP into the TS (true: upper storage  
                                   connection)</TD>
    <TD>SwitchHPTSPort_StandardControl</TD>
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
    <TD>Standard Control for the 3-way valve to switch the connection to the   
                                  thermal storage</TD>
    <TD>StandardControlSTSwitch</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Switches between the inlet of the HP into the TS (true: upper storage  
                                   connection)</TD>
    <TD>SwitchSTTSPort_StandardControl</TD>
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
    <TD>Input Signal of Heat Pump</TD>
    <TD>HP_Signal</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heat pump flow temperature</TD>
    <TD>HP_S_TM_VL</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heat pump return temperature</TD>
    <TD>HP_S_TM_RL</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heat pump brine flow temperature</TD>
    <TD>HP_S_TM_BC_VL</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heat pump brine return temperature</TD>
    <TD>HP_S_TM_BC_RL</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Volume flow heat pump </TD>
    <TD>HP_S_FW_HC</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Brine volume flow heat pump </TD>
    <TD>HP_S_FW_BC</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heat output power of heat pump </TD>
    <TD>HP_P_heat_is</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Electricity demand of heat pump</TD>
    <TD>HP_P_elec_is</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heat output of heat pump</TD>
    <TD>HP_E_heat_produced</TD>
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
    <TD>Power transfered to fresh water station</TD>
    <TD>TS_P_heat_toFWS</TD>
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
    <TD>Volume flow to fresh water station</TD>
    <TD>TS_S_FW_HC_HW</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Energy in thermal storage</TD>
    <TD>TS_E_Storage_BT</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Total energy transfered to fresh water station</TD>
    <TD>TS_E_heat_toFWS</TD>
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
    <TD>&nbsp;</TD></TR></TBODY></TABLE></DIV>
<H2>Description:</H2>
<P>&nbsp;</P></BODY></HTML>
"),
		experiment(
			StopTime=1,
			StartTime=0,
			Tolerance=1e-06,
			Interval=0.001,
			__esi_MinInterval="9.999999999999999e-10",
			__esi_AbsTolerance="1e-6"));
end SF3;
