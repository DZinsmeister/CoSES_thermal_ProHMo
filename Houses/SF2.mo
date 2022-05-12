// CP: 65001
// SimulationX Version: 4.2.3.69223
within CoSES_Models.Houses;
model SF2 "House 2 with ST, CB and ASHP"
	GreenCity.Interfaces.Electrical.LV3Phase lV3Phase1 "Electrical Low-Voltage AC Three-Phase Connector" annotation(Placement(
		transformation(extent={{170,-370},{190,-350}}),
		iconTransformation(extent={{236.7,90},{256.7,110}})));
	GreenCity.Utilities.Thermal.Pump pump2(qvMax(displayUnit="l/min")=0.00025) "Volume flow generation and electrical power calculation" annotation(Placement(transformation(
		origin={45,-120},
		extent={{0,0},{10,10}},
		rotation=-180)));
	GreenCity.GreenBuilding.HeatingSystem.HeatingUnitFlowTemperature heatingUnitFlowTemperature1(qvMaxPump(displayUnit="l/min")=0.00025) annotation(Placement(transformation(extent={{255,-120},{290,-85}})));
	Consumer.DHW_demand dHW_demand1(
		WeeklyData=WeeklyData,
		File=File,
		Table=Table,
		DHWfactor=DHWfactor,
		THotWaterSet=323.15) annotation(Placement(transformation(extent={{375,-205},{395,-185}})));
	GreenCity.Utilities.Electrical.PhaseTap phaseTap2 annotation(Placement(transformation(extent={{220,-275},{230,-265}})));
	GreenCity.Utilities.Electrical.Grid grid1(
		OutputType=GreenCity.Utilities.Electrical.Grid.OutputEnum.MasterGrid,
		useA=true,
		useB=true,
		useC=true,
		useD=true,
		useE=true,
		useF=true) annotation(Placement(transformation(extent={{160,-325},{200,-285}})));
	GreenCity.Utilities.Electrical.PhaseTap phaseTap1 annotation(Placement(transformation(extent={{235,-295},{245,-285}})));
	GreenCity.Utilities.Electrical.PhaseTap phaseTap5 annotation(Placement(transformation(extent={{205,-245},{215,-235}})));
	GreenCity.Utilities.Electrical.PhaseTap phaseTap6 annotation(Placement(transformation(extent={{210,-260},{220,-250}})));
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
		CCollector=8416) annotation(Placement(transformation(extent={{-15,-155},{25,-115}})));
	HeatGenerator.DigitalTwins wolfCGB20 annotation(Placement(transformation(extent={{50,-100},{95,-55}})));
	GreenCity.Interfaces.Thermal.DefineVolumeFlow defineVolumeFlow1 annotation(Placement(transformation(
		origin={200,-40},
		extent={{-10,-10},{10,10}},
		rotation=-90)));
	GreenCity.Interfaces.Thermal.ExtractVolumeFlow extractVolumeFlow1 annotation(Placement(transformation(
		origin={170,-40},
		extent={{10,-10},{-10,10}},
		rotation=-90)));
	GreenCity.Utilities.Thermal.MeasureThermal measureThermal1 annotation(Placement(transformation(extent={{295,-185},{305,-195}})));
	GreenCity.Utilities.Electrical.Grid grid2(
		OutputType=GreenCity.Utilities.Electrical.Grid.OutputEnum.MasterGrid,
		useA=true,
		useB=true,
		useC=true,
		useD=true,
		useE=true,
		useF=true) annotation(Placement(transformation(extent={{125,-275},{165,-235}})));
	Storage.HeatStorageCombined5Inlets WolfBSP800(
		VStorage=0.785,
		dStorage=0.79,
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
		use2=true,
		HE2=true,
		iFlow2=5,
		AHeatExchanger2=2.5,
		VHeatExchanger2=0.0165,
		use4=true,
		iFlow4=9,
		iReturn4=6,
		use5=true,
		iFlow5=4,
		iReturn5=2,
		use6=true,
		iFlow6=9,
		iReturn6=2,
		use7=true,
		iFlow7=5,
		use8=true) annotation(Placement(transformation(extent={{155,-208},{190,-135}})));
	Distribution.SwitchPort switchPort1 annotation(Placement(transformation(extent={{100,-210},{120,-180}})));
	HeatGenerator.DigitalTwins.WolfCHA10_GC wolfCHA1(
		PAuxMax(displayUnit="Nm/s")=PAuxMax,
		PHeatNom(displayUnit="Nm/s")=PHeatNom,
		COPNom=COPNom,
		EERNom=EERNom) annotation(Placement(transformation(extent={{-55,-280},{-10,-235}})));
	GreenCity.Utilities.Electrical.PhaseTap phaseTap7 annotation(Placement(transformation(extent={{110,-260},{100,-250}})));
	Modelica.Blocks.Sources.RealExpression TColdWater(y(quantity="Basics.Temp")=288.15) annotation(Placement(transformation(extent={{430,-230},{410,-210}})));
	Consumer.SimpleHeatedBuilding simpleHeatedBuilding1(
		redeclare replaceable parameter GreenCity.Utilities.BuildingData.ParameterSelectionSCB.AgeOfBuilding.EnEV2007 buildingAge,
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
		ceilingInsul=0) "Heated 3-zone-building with changeable heating system" annotation(Placement(transformation(extent={{330,-125},{370,-85}})));
	Modelica.Blocks.Logical.Switch switch2 annotation(Placement(transformation(extent={{-90,-110},{-70,-90}})));
	Modelica.Blocks.Sources.RealExpression qvSTpump_StandardControl(y=qvRefST) annotation(Placement(transformation(extent={{-125,-90},{-105,-70}})));
	Modelica.Blocks.Sources.BooleanExpression HP_EVU(y=HP_on) "Set output signal to a time varying Boolean expression" annotation(Placement(transformation(extent={{-120,-230},{-100,-210}})));
	Modelica.Blocks.Logical.LogicalSwitch logicalSwitch1 annotation(Placement(transformation(extent={{-90,-180},{-70,-160}})));
	Modelica.Blocks.Sources.BooleanExpression SwitchSignal_StandardControl(y=SwitchHPTSPort_StandardControl) "Set output signal to a time varying Boolean expression" annotation(Placement(transformation(extent={{-125,-160},{-105,-140}})));
	protected
		parameter Boolean CBControlMode=false "If true, flow temperature controlled, else power output is controlled" annotation(Dialog(
			group="Condensing Boiler",
			tab="Heat Generator Parameters"));
	public
		parameter Real CBDeltaT(quantity="Thermics.TempDiff")=20 "Temperature difference between flow and return temperature" annotation(Dialog(
			group="Condensing Boiler",
			tab="Heat Generator Parameters"));
	protected
		parameter Real CBPmax(quantity="Basics.Power")=20000 if not CBControlMode "Maximum power of CB" annotation(Dialog(
			group="Condensing Boiler",
			tab="Heat Generator Parameters"));
	public
		parameter Real CBTmax(quantity="Basics.Temp")=356.15 if CBControlMode "Maximum temperature of CB" annotation(Dialog(
			group="Condensing Boiler",
			tab="Heat Generator Parameters"));
	protected
		parameter Real CBPmin(quantity="Basics.Power")=2000 if not CBControlMode "Minimum power of CB" annotation(Dialog(
			group="Condensing Boiler",
			tab="Heat Generator Parameters"));
	public
		parameter Real CBTmin(quantity="Basics.Temp")=293.15 if CBControlMode "Minimum temperature of CB" annotation(Dialog(
			group="Condensing Boiler",
			tab="Heat Generator Parameters"));
		parameter Real PAuxMax(quantity="Basics.Power")=6000 "Maximum power of the auxiliary heater" annotation(Dialog(
			group="Heat Pump",
			tab="Heat Generator Parameters"));
		parameter Real PHeatNom(quantity="Basics.Power")=5750 "Nominal heat output at A2/W35 (not maximum heat output)" annotation(Dialog(
			group="Heat Pump",
			tab="Heat Generator Parameters"));
		parameter Real PCoolingNom(quantity="Basics.Power")=6010 "Nominal cooling power at A35/W18 (not maximum cooling output)" annotation(Dialog(
			group="Heat Pump",
			tab="Heat Generator Parameters"));
		parameter Real COPNom=4.65 "Nominal COP at A2/W35" annotation(Dialog(
			group="Heat Pump",
			tab="Heat Generator Parameters"));
		parameter Real EERNom=5.92 "Nominal EER at A35/W18" annotation(Dialog(
			group="Heat Pump",
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
		parameter Integer nPeople(quantity="Basics.Unitless")=6 "Number of people living in the building" annotation(Dialog(
			group="Size",
			tab="Consumption Parameters"));
		parameter Integer nFloors=2 "nFloors" annotation(Dialog(
			group="Size",
			tab="Consumption Parameters"));
		parameter Integer nApartments=2 "nApartments" annotation(Dialog(
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
		parameter Real QHeatNormLivingArea(quantity="Thermics.HeatFlowSurf")=16 if not UseStandardHeatNorm "Area-specific heating power - modern radiators: 14 - 15 W/m²; space heating: 15 W/m²" annotation(Dialog(
			group="Heating System",
			tab="Consumption Parameters"));
		parameter Real n=1.1 "Heating system exponent - radiator: 1.3; floor heating: 1 - 1.1" annotation(Dialog(
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
		parameter String PresenceFile=classDirectory()+"Data\\SF2_WholeYear.txt" if UseIndividualPresence "File with presence timeseries (presence in %; 0% - no one is at home; 100% - everyone is at home)" annotation(Dialog(
			group="Additional Yields/Losses",
			tab="Consumption Parameters"));
		parameter Boolean UseIndividualElecConsumption=true "If individual electricity consumption is used, individual consumption data ha to be provided, else standart load profiles are used" annotation(Dialog(
			group="Additional Yields/Losses",
			tab="Consumption Parameters"));
		parameter String ElConsumptionFile=classDirectory()+"Data\\SF2_WholeYear.txt" if UseIndividualElecConsumption "File with electric consumption time series (consumption in kW)" annotation(Dialog(
			group="Additional Yields/Losses",
			tab="Consumption Parameters"));
		parameter String ElConsumptionTable="Pel" if UseIndividualElecConsumption "Table with electric consumption time series (consumption in W)" annotation(Dialog(
			group="Additional Yields/Losses",
			tab="Consumption Parameters"));
		parameter Real YearlyElecConsumption_kWh=7000 if UseIndividualElecConsumption "YearlyElecConsumption_kWh" annotation(Dialog(
			group="Additional Yields/Losses",
			tab="Consumption Parameters"));
		parameter Real ElFactor=YearlyElecConsumption_kWh/5010 if UseIndividualElecConsumption "ElFactor" annotation(Dialog(
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
		parameter String File=classDirectory()+"Data\\SF2_WholeYear.txt" "DHW Data File" annotation(Dialog(
			group="DHW consumption",
			tab="Consumption Parameters"));
		parameter String Table="V_DHW" "DHW Table Name" annotation(Dialog(
			group="DHW consumption",
			tab="Consumption Parameters"));
		parameter Real V_DHWperDay_l=300 "V_DHWperDay_l" annotation(Dialog(
			group="DHW consumption",
			tab="Consumption Parameters"));
		parameter Real DHWfactor=V_DHWperDay_l/300 "Factor, with which the DHW consumption gets multiplied" annotation(Dialog(
			group="DHW consumption",
			tab="Consumption Parameters"));
		GreenCity.Local.Photovoltaic photovoltaic1(
			alphaModule(displayUnit="rad")=alphaPV,
			betaModule(displayUnit="rad")=betaPV,
			PPeak(displayUnit="Nm/s")=PVPeak) annotation(Placement(transformation(extent={{395,-355},{355,-315}})));
		GreenCity.Local.Controller.PV2ACInverter pV2ACInverter1 annotation(Placement(transformation(extent={{345,-315},{305,-355}})));
		Distribution.HydraulicSwitch_TS_DH_HG hydraulicSwitch_TS_DH_HG1 annotation(Placement(transformation(extent={{140,-85},{210,-70}})));
		Modelica.Blocks.Sources.RealExpression CBControlIn(y=CBIn) annotation(Placement(transformation(extent={{-15,-100},{5,-80}})));
		Modelica.Blocks.Logical.Switch switch4 annotation(Placement(transformation(extent={{20,-85},{40,-65}})));
		Modelica.Blocks.Sources.RealExpression CBin_StandardControl(y=CBinStandardControl) annotation(Placement(transformation(extent={{-15,-70},{5,-50}})));
		Modelica.Blocks.Logical.Switch switch3 annotation(Placement(transformation(extent={{-90,-295},{-70,-275}})));
		Modelica.Blocks.Sources.RealExpression HPin_StandardControl(y=HPinStandardControl) annotation(Placement(transformation(extent={{-125,-275},{-105,-255}})));
		Modelica.Blocks.Logical.Switch switch5 annotation(Placement(transformation(extent={{-90,-365},{-70,-345}})));
		Modelica.Blocks.Sources.RealExpression AUXin_StandardControl(y=AUXinStandardControl) annotation(Placement(transformation(extent={{-125,-350},{-105,-330}})));
		Modelica.Blocks.Interfaces.BooleanInput StandardControlCB "If true, standard control will be used to control the condensing boiler" annotation(
			Placement(
				transformation(extent={{-70,-95},{-30,-55}}),
				iconTransformation(
					origin={-150,250},
					extent={{-20,-20},{20,20}},
					rotation=-90)),
			Dialog(
				group="Condensing Boiler",
				tab="Standard Control",
				visible=false));
		parameter Real TStartCB(quantity="Basics.Temp")=328.15 "Minimum Temperature, at the top, at which the CB turns on" annotation(Dialog(
			group="Condensing Boiler",
			tab="Standard Control"));
		parameter Real TStopCB(quantity="Basics.Temp")=333.15 "Temperature at the bottom, at which the CB stops" annotation(Dialog(
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
		Real HPinStandardControl(quantity="Basics.RelMagnitude") "Standard control value of the heat pump modulation" annotation(Dialog(
			group="Heat Pump",
			tab="Standard Control",
			visible=false));
		Real AUXinStandardControl(quantity="Basics.RelMagnitude") "Standard control value of the auxiliary heater modulation" annotation(Dialog(
			group="Heat Pump",
			tab="Standard Control",
			visible=false));
		GreenCity.Interfaces.Environment.EnvironmentConditions environmentConditions1 "Environment Conditions Connector" annotation(Placement(
			transformation(extent={{445,20},{465,40}}),
			iconTransformation(extent={{236.7,190},{256.7,210}})));
		Modelica.Blocks.Interfaces.BooleanInput StandardHPcontrol "If true, standard control will be used to control the heat pump" annotation(
			Placement(
				transformation(extent={{-140,-305},{-100,-265}}),
				iconTransformation(
					origin={50,250},
					extent={{-20,-20},{20,20}},
					rotation=270)),
			Dialog(
				group="Heat Pump",
				tab="Standard Control",
				visible=false));
		parameter Real deltaTLowDHW(quantity="Thermics.TempDiff")=2 "Required temperature difference between upper layer and DHW set temperature" annotation(Dialog(
			group="Heat Pump 3-way valve",
			tab="Standard Control"));
		Boolean SwitchHPTSPort_StandardControl "Switches between the inlet of the HP into the TS (true: upper storage connection)" annotation(Dialog(
			group="Heat Pump 3-way valve",
			tab="Standard Control",
			visible=false));
		Modelica.Blocks.Interfaces.BooleanInput StandardControlHPSwitch "Standard Control for the 3-way valve to switch the connection to the thermal storage" annotation(
			Placement(
				transformation(extent={{-140,-190},{-100,-150}}),
				iconTransformation(
					origin={-50,250},
					extent={{-20,-20},{20,20}},
					rotation=-90)),
			Dialog(
				group="Heat Pump 3-way valve",
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
		Modelica.Blocks.Interfaces.BooleanInput StandardSTcontrol "If true, standard control will be used to control the solar thermal pump" annotation(
			Placement(
				transformation(extent={{-140,-120},{-100,-80}}),
				iconTransformation(
					origin={150,250},
					extent={{-20,-20},{20,20}},
					rotation=270)),
			Dialog(
				group="Solar Thermal",
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
		Boolean HP_on(quantity="Basics.RelMagnitude") "Heat pump on/off" annotation(
			HideResult=false,
			Dialog(tab="Results HP"));
	public
		Real HP_S_TM_VL(quantity="Basics.Temp") "Heat pump flow temperature (output of the outdoor unit)" annotation(Dialog(
			group="Temperatures",
			tab="Results HP",
			visible=false));
		Real HP_S_TM_RL(quantity="Basics.Temp") "Heat pump return temperature" annotation(Dialog(
			group="Temperatures",
			tab="Results HP",
			visible=false));
		Real HP_S_TM_HC_TL(quantity="Basics.Temp") "Heat pump flow temperature - Low temperature" annotation(Dialog(
			group="Temperatures",
			tab="Results HP",
			visible=false));
		Real HP_S_TM_HW_TH(quantity="Basics.Temp") "Heat pump flow temperature - High temperature" annotation(Dialog(
			group="Temperatures",
			tab="Results HP",
			visible=false));
		Real HP_S_FW_HC(
			quantity="Thermics.VolumeFlow",
			displayUnit="l/min") "Volume flow heat pump " annotation(Dialog(
			group="Volume Flow",
			tab="Results HP",
			visible=false));
		Real HP_P_heat_HP(quantity="Basics.Power") "Heat output power of the heat pump " annotation(Dialog(
			group="Power",
			tab="Results HP",
			visible=false));
		Real HP_P_heat_Aux(quantity="Basics.Power") "Heat output power of the auxiliary heater" annotation(Dialog(
			group="Power",
			tab="Results HP",
			visible=false));
		Real HP_P_heat_Tot(quantity="Basics.Power") "Total heat output power of the heat pump" annotation(Dialog(
			group="Power",
			tab="Results HP",
			visible=false));
		Real HP_P_cooling(quantity="Basics.Power") "Cooling output of the heat pump" annotation(Dialog(
			group="Power",
			tab="Results HP",
			visible=false));
		Real HP_P_elec_is(quantity="Basics.Power") "Total electricity demand of heat pump" annotation(Dialog(
			group="Power",
			tab="Results HP",
			visible=false));
		Real HP_E_heat_HP(
			quantity="Basics.Energy",
			displayUnit="kWh") "Heat output of the heat pump " annotation(Dialog(
			group="Energy",
			tab="Results HP",
			visible=false));
		Real HP_E_heat_Aux(
			quantity="Basics.Energy",
			displayUnit="kWh") "Heat output power of the auxiliary heater" annotation(Dialog(
			group="Energy",
			tab="Results HP",
			visible=false));
		Real HP_E_heat_Tot(
			quantity="Basics.Energy",
			displayUnit="kWh") "Total heat output power of the heat pump" annotation(Dialog(
			group="Energy",
			tab="Results HP",
			visible=false));
		Real HP_E_cooling(quantity="Basics.Energy") "Cooling output of the heat pump" annotation(Dialog(
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
		Real HP_EER "Energy Efficiency Ratio (Cooling)" annotation(Dialog(
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
		Modelica.Blocks.Interfaces.RealInput TDH_HEXout(quantity="Basics.Temp") "Outlet temperature of district heating heat exchanger" annotation(
			Placement(
				transformation(extent={{-140,70},{-100,110}}),
				iconTransformation(extent={{266.7,-170},{226.7,-130}})),
			Dialog(
				tab="Input Signals",
				visible=false));
		Modelica.Blocks.Interfaces.RealOutput DTH_HEXin(quantity="Basics.Temp") "Inlet temperature of district heating heat exchanger" annotation(
			Placement(
				transformation(extent={{-125,30},{-105,50}}),
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
				transformation(extent={{-140,-145},{-100,-105}}),
				iconTransformation(extent={{-270,130},{-230,170}})),
			Dialog(
				tab="Input Signals",
				visible=false));
		Modelica.Blocks.Interfaces.RealInput qvDHpump(quantity="Thermics.VolumeFlow") "Reference volume flow of district heating pump - positive: feed in - negative: extraction" annotation(
			Placement(
				transformation(extent={{-140,-10},{-100,30}}),
				iconTransformation(extent={{266.7,-220},{226.7,-180}})),
			Dialog(
				tab="Input Signals",
				visible=false));
		Modelica.Blocks.Interfaces.RealInput HPModulation(quantity="Basics.Power") "Air source heat pump modulation in percent" annotation(
			Placement(
				transformation(extent={{-140,-335},{-100,-295}}),
				iconTransformation(extent={{-270,-120},{-230,-80}})),
			Dialog(
				tab="Input Signals",
				visible=false));
		Modelica.Blocks.Interfaces.BooleanInput SwitchHPTSPort "Switches between the inlet of the HP into the TS (true: upper storage connection)" annotation(
			Placement(
				transformation(extent={{-140,-215},{-100,-175}}),
				iconTransformation(extent={{-270,30},{-230,70}})),
			Dialog(
				tab="Input Signals",
				visible=false));
		Modelica.Blocks.Interfaces.RealInput HPAuxModulation(quantity="Basics.Power") "Air source heat pump - modulation of the auxiliary heater (percent)" annotation(
			Placement(
				transformation(extent={{-140,-385},{-100,-345}}),
				iconTransformation(extent={{-270,-70},{-230,-30}})),
			Dialog(
				tab="Input Signals",
				visible=false));
		Modelica.Blocks.Interfaces.BooleanInput HPMode "Heating mode (true) or cooling mode (false)" annotation(
			Placement(
				transformation(extent={{-140,-265},{-100,-225}}),
				iconTransformation(extent={{-270,-20},{-230,20}})),
			Dialog(
				tab="Input Signals",
				visible=false));
		HeatGenerator.DigitalTwins.WolfCGB20_GC wolfCGB20_GC1(DeltaT=CBDeltaT) annotation(Placement(transformation(extent={{55,-100},{100,-55}})));
	equation
		// Input Conversion
		// CB
		if CBControlMode then
			CBIn = min(10, max(0, 10 * ((CBIn_TSet-CBTmin)/(CBTmax-CBTmin))));
		else
			CBIn = min(max(0, 2 + 8 * ((CBIn_P - CBPmin)/(CBPmax - CBPmin))), 10);
		end if;
		
		// HP
		if switch3.y > 0 then
			HP_on = true;
		else
			HP_on = false;
		end if;
		
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
			HPinStandardControl = 1;
			AUXinStandardControl = 1;
		elseif HPon and not AUXon then
			HPinStandardControl = 1;
			AUXinStandardControl = 0;
		else
			HPinStandardControl = 0;
			AUXinStandardControl = 0;
		end if;
		
		// Condensing boiler
		when ((TS_S_TM_BT_10 < TStartCB) or (TS_S_TM_BT_5 < heatingUnitFlowTemperature1.TRef - 5) and StandardControlCB) then
			CBon = true;
		elsewhen ((TS_S_TM_BT_5 > TStopCB) or (not StandardControlCB)) then
			CBon = false;
		end when;
		if CBon then
			CBinStandardControl = 10;
		else
			CBinStandardControl = 0;
		end if;
		
		// Results
		// Condensing Boiler
		CB_S_TM_VL = wolfCGB20_GC1.TFlow;
		CB_S_TM_RL = wolfCGB20_GC1.TReturn;
		CB_S_FW_HC = wolfCGB20_GC1.qv;
		CB_S_FG = wolfCGB20_GC1.qvFuel;
		CB_VFuel = wolfCGB20_GC1.VFuel;
		CB_P_heat_is = wolfCGB20_GC1.QHeat;
		CB_P_gas_is = wolfCGB20_GC1.PFuel;
		CB_E_heat_produced = wolfCGB20_GC1.EHeat;
		CB_E_gas_consumed = wolfCGB20_GC1.EFuel;
		CB_Efficiency = wolfCGB20_GC1.Efficiency;
		
		// Heat Pump
		HP_S_TM_VL = wolfCHA1.THPout;
		HP_S_TM_RL = wolfCHA1.TReturn;
		HP_S_TM_HC_TL = switchPort1.StorageFlowBottom.T;
		HP_S_TM_HW_TH = switchPort1.StorageFlowTop.T;
		HP_S_FW_HC = wolfCHA1.wolfCHA1.VWater;
		HP_P_heat_HP = wolfCHA1.QHeat_HP;
		HP_P_heat_Aux = wolfCHA1.QHeat_Aux;
		HP_P_heat_Tot = wolfCHA1.QHeat_HP + wolfCHA1.QHeat_Aux;
		HP_P_cooling = wolfCHA1.PCooling;
		HP_P_elec_is = wolfCHA1.PEl_HP + wolfCHA1.PEl_Aux;
		HP_E_heat_HP = wolfCHA1.EHeat_HP;
		HP_E_heat_Aux = wolfCHA1.EHeat_Aux;
		HP_E_heat_Tot = wolfCHA1.EHeat_HP + wolfCHA1.EHeat_Aux;
		HP_E_cooling = wolfCHA1.ECooling;
		HP_E_elec_consumed = wolfCHA1.EEl_HP + wolfCHA1.EEl_Aux;
		HP_COP = wolfCHA1.COP;
		HP_EER = wolfCHA1.EER;
		
		// Solar Thermal Collectors
		ST_S_TM_VL = WolfCRK12.FlowST.T;
		ST_S_TM_RL = WolfCRK12.ReturnST.T;
		ST_S_TM_Collector = WolfCRK12.TCollector;
		ST_S_FW_HC = WolfCRK12.FlowST.qv;
		ST_E_heat_produced = WolfCRK12.EST;
		ST_P_heat_is = WolfCRK12.QSolarThermal;
		
		//Thermal Storage
		TS_S_TM_HC_VL = hydraulicSwitch_TS_DH_HG1.TSupplyDH;
		TS_S_TM_HC_RL = hydraulicSwitch_TS_DH_HG1.TReturnDH;
		TS_S_TM_PS_VL = hydraulicSwitch_TS_DH_HG1.TSupplyHG;
		TS_S_TM_PS_RL = hydraulicSwitch_TS_DH_HG1.TReturnHG;
		TS_S_TM_HC_HW_VL = WolfBSP800.FlowOut8.T;
		TS_S_TM_HC_HW_RL = WolfBSP800.ReturnIn8.T;
		TS_S_TM_BT_1 = WolfBSP800.TStorage[1];
		TS_S_TM_BT_2 = WolfBSP800.TStorage[2];
		TS_S_TM_BT_3 = WolfBSP800.TStorage[3];
		TS_S_TM_BT_4 = WolfBSP800.TStorage[4];
		TS_S_TM_BT_5 = WolfBSP800.TStorage[5];
		TS_S_TM_BT_6 = WolfBSP800.TStorage[6];
		TS_S_TM_BT_7 = WolfBSP800.TStorage[7];
		TS_S_TM_BT_8 = WolfBSP800.TStorage[8];
		TS_S_TM_BT_9 = WolfBSP800.TStorage[9];
		TS_S_TM_BT_10 = WolfBSP800.TStorage[10];
		TS_E_Storage_BT = WolfBSP800.cpMed*WolfBSP800.rhoMed*WolfBSP800.VStorage*((WolfBSP800.TLayer[1]+WolfBSP800.TLayer[2]+WolfBSP800.TLayer[3]+WolfBSP800.TLayer[4]+WolfBSP800.TLayer[5]+WolfBSP800.TLayer[6]+WolfBSP800.TLayer[7]+WolfBSP800.TLayer[8]+WolfBSP800.TLayer[9]+WolfBSP800.TLayer[10])/10-T0_TS);
		TS_SOC_BT = TS_E_Storage_BT/(WolfBSP800.cpMed*WolfBSP800.rhoMed*WolfBSP800.VStorage*(Tmax_TS - T0_TS));
		
		// Heat Sink (Heating)
		HS_S_TM_VL_bM = heatingUnitFlowTemperature1.FlowSupply.T;
		HS_S_TM_VL_aM = heatingUnitFlowTemperature1.FlowSink.T;
		HS_S_TM_RL = heatingUnitFlowTemperature1.ReturnSupply.T;
		HS_S_TM_Room = simpleHeatedBuilding1.TZone[2];
		HS_S_FW_HC_aM = - heatingUnitFlowTemperature1.FlowSupply.qv;
		HS_S_FW_HC_bM = heatingUnitFlowTemperature1.FlowSink.qv;
		HS_P_DemHeatHC_is = simpleHeatedBuilding1.QHeat;
		HS_E_DemHeatHC_consumed = simpleHeatedBuilding1.EHeat;
		
		// Heat Sink (Domestic Hot Water)
		HS_S_TM_HW_VL = dHW_demand1.FlowHotWater.T;
		HS_S_TM_HW_RL = dHW_demand1.ReturnHotWater.T;
		HS_S_FW_HW_VL = dHW_demand1.ReturnHotWater.qv;
		HS_P_DemHeatHW_is = dHW_demand1.Q_DHW;
		HS_E_DemHeatHW_consumed = dHW_demand1.E_DHW;
		
		// PV
		PV_P = -grid1.PGrid[6];
		PV_E = -grid1.EGridfeed[6];
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
		
		// Condensing boiler
		if ((TS_S_TM_BT_8 < TStartCB) and StandardControlCB) then
			CBon = true;
		else
			CBon = false;
		end if;
	equation
		connect(environmentConditions1,WolfCRK12.EnvironmentConditions) annotation(Line(
			points={{455,30},{450,30},{-20,30},{-20,-135},{-15,-135}},
			color={192,192,192},
			thickness=0.015625));
		connect(phaseTap1.Grid1,heatingUnitFlowTemperature1.Grid1) annotation(Line(
			points={{245,-290},{250,-290},{259.3,-290},{259.3,-125},{259.3,-120}},
			color={247,148,29},
			thickness=0.015625));
		connect(environmentConditions1,dHW_demand1.EnvironmentConditions) annotation(Line(
			points={{455,30},{450,30},{399.7,30},{399.7,-190},{394.7,-190}},
			color={192,192,192},
			thickness=0.015625));
		connect(grid1.LVMastGrid,lV3Phase1) annotation(
			Line(
				points={{180,-325},{180,-330},{180,-360}},
				color={247,148,29},
				thickness=0.015625),
			__esi_AutoRoute=false);
		connect(pump2.PumpIn,WolfCRK12.FlowST) annotation(Line(
			points={{35,-125},{30,-125},{25,-125}},
			color={190,30,45},
			thickness=0.015625));
		connect(grid1.LVGridA,grid2.LVMastGrid) annotation(Line(
			points={{160,-290},{155,-290},{145,-290},{145,-280},{145,-275}},
			color={247,148,29},
			thickness=0.0625));
		connect(measureThermal1.TMedium,dHW_demand1.TPipe) annotation(
			Line(
				points={{300,-185},{300,-175},{390,-175},{390,-185}},
				color={0,0,127},
				thickness=0.0625),
			__esi_AutoRoute=false);
		connect(extractVolumeFlow1.qvMedium,defineVolumeFlow1.qvMedium) annotation(Line(
			points={{175,-30},{175,-25},{195,-25},{195,-30}},
			color={0,0,127},
			thickness=0.0625));
		connect(extractVolumeFlow1.TMedium,DTH_HEXin) annotation(Line(
			points={{165,-30},{165,-25},{165,40},{-110,40},{-115,40}},
			color={0,0,127},
			thickness=0.0625));
		connect(TDH_HEXout,defineVolumeFlow1.TMedium) annotation(Line(
			points={{-120,90},{-115,90},{205,90},{205,-25},{205,-30}},
			color={0,0,127},
			thickness=0.0625));
		connect(switchPort1.StorageFlowTop,WolfBSP800.FlowIn4) annotation(Line(
			points={{120,-185},{125,-185},{150,-185},{150,-184.7},{155,-184.7}},
			color={190,30,45}));
		connect(WolfBSP800.ReturnOut4,switchPort1.StorageReturnTop) annotation(Line(
			points={{155,-189.7},{150,-189.7},{124.7,-189.7},{124.7,-190},{119.7,-190}},
			color={190,30,45}));
		connect(switchPort1.StorageFlowBottom,WolfBSP800.FlowIn5) annotation(Line(
			points={{119.7,-200},{124.7,-200},{150,-200},{150,-199.7},{155,-199.7}},
			color={190,30,45}));
		connect(WolfBSP800.ReturnOut5,switchPort1.StorageReturnBottom) annotation(Line(
			points={{155,-204.7},{150,-204.7},{124.7,-204.7},{124.7,-205},{119.7,-205}},
			color={190,30,45}));
		connect(WolfBSP800.FlowIn2,pump2.PumpOut) annotation(Line(
			points={{155,-155},{150,-155},{50,-155},{50,-125},{45,-125}},
			color={190,30,45},
			thickness=0.0625));
		connect(extractVolumeFlow1.qvMedium,qv_HEX) annotation(Line(
			points={{175,-30},{175,-25},{175,65},{-110,65},{-115,65}},
			color={0,0,127},
			thickness=0.0625));
		connect(phaseTap7.Grid1,pump2.Grid1) annotation(Line(
			points={{100,-255},{95,-255},{42.3,-255},{42.3,-135},{42.3,-130}},
			color={247,148,29},
			thickness=0.0625));
		connect(TColdWater.y,dHW_demand1.TColdWater) annotation(Line(
			points={{409,-220},{404,-220},{390,-220},{390,-209.7},{390,-204.7}},
			color={0,0,127},
			thickness=0.0625));
		connect(heatingUnitFlowTemperature1.FlowSink,simpleHeatedBuilding1.PipeIn) annotation(Line(
			points={{290,-93.7},{295,-93.7},{325,-93.7},{325,-95},{330,-95}},
			color={190,30,45}));
		connect(heatingUnitFlowTemperature1.ReturnSink,simpleHeatedBuilding1.PipeOut) annotation(Line(
			points={{290,-111.3},{295,-111.3},{325,-111.3},{325,-110},{330,-110}},
			color={190,30,45},
			thickness=0.0625));
		connect(simpleHeatedBuilding1.qv_Ref,heatingUnitFlowTemperature1.qvRef) annotation(Line(
			points={{335,-85},{335,-80},{281.3,-80},{281.3,-85}},
			color={0,0,127},
			thickness=0.0625));
		connect(simpleHeatedBuilding1.T_Ref,heatingUnitFlowTemperature1.TRef) annotation(
			Line(
				points={{340,-85},{340,-75},{268,-75},{268,-85}},
				color={0,0,127},
				thickness=0.0625),
			__esi_AutoRoute=false);
		connect(simpleHeatedBuilding1.EnvironmentConditions,environmentConditions1) annotation(Line(
			points={{355,-85},{355,-80},{355,30},{450,30},{455,30}},
			color={192,192,192},
			thickness=0.0625));
		connect(WolfBSP800.ReturnOut2,WolfCRK12.ReturnST) annotation(Line(
			points={{155,-160},{150,-160},{30,-160},{30,-145},{25,-145}},
			color={190,30,45}));
		connect(grid2.LVGridB,phaseTap7.Grid3) annotation(Line(
			points={{125,-255},{120,-255},{115,-255},{110,-255}},
			color={247,148,29},
			thickness=0.0625));
		connect(qvSTpump_StandardControl.y,switch2.u1) annotation(Line(
			points={{-104,-80},{-99,-80},{-97,-80},{-97,-92},{-92,-92}},
			color={0,0,127},
			thickness=0.0625));
		connect(qvSTpump,switch2.u3) annotation(Line(
			points={{-120,-125},{-115,-125},{-97,-125},{-97,-108},{-92,-108}},
			color={0,0,127},
			thickness=0.0625));
		connect(switch2.y,pump2.qvRef) annotation(Line(
			points={{-69,-100},{-64,-100},{40,-100},{40,-115},{40,-120}},
			color={0,0,127},
			thickness=0.0625));
		connect(wolfCHA1.environmentConditions,environmentConditions1) annotation(Line(
			points={{-20,-235},{-20,-230},{-20,30},{450,30},{455,30}},
			color={192,192,192},
			thickness=0.0625));
		connect(switchPort1.HeatGeneratorFlow,wolfCHA1.Flow) annotation(Line(
			points={{100,-185},{95,-185},{-5.3,-185},{-5.3,-250},{-10.3,-250}},
			color={190,30,45},
			thickness=0.0625));
		connect(wolfCHA1.Return,switchPort1.HeatGeneratorReturn) annotation(Line(
			points={{-10.3,-260},{-5.3,-260},{95,-260},{95,-205},{100,-205}},
			color={190,30,45},
			thickness=0.0625));
		connect(grid1.LVGridB,wolfCHA1.lV3Phase) annotation(Line(
			points={{160,-305},{155,-305},{-20,-305},{-20,-284.7},{-20,-279.7}},
			color={247,148,29},
			thickness=0.0625));
		connect(HPMode,wolfCHA1.HPMode) annotation(Line(
			points={{-120,-245},{-115,-245},{-60,-245},{-55,-245}},
			color={255,0,255},
			thickness=0.0625));
		connect(HP_EVU.y,wolfCHA1.HPOn) annotation(Line(
			points={{-99,-220},{-94,-220},{-60,-220},{-60,-240},{-55,-240}},
			color={255,0,255},
			thickness=0.0625));
		connect(SwitchHPTSPort,logicalSwitch1.u3) annotation(Line(
			points={{-120,-195},{-115,-195},{-97,-195},{-97,-178},{-92,-178}},
			color={255,0,255},
			thickness=0.0625));
		connect(logicalSwitch1.y,switchPort1.SwitchPort) annotation(Line(
			points={{-69,-170},{-64,-170},{110,-170},{110,-175},{110,-180}},
			color={255,0,255},
			thickness=0.0625));
		connect(SwitchSignal_StandardControl.y,logicalSwitch1.u1) annotation(Line(
			points={{-104,-150},{-99,-150},{-97,-150},{-97,-162},{-92,-162}},
			color={255,0,255},
			thickness=0.0625));
		connect(photovoltaic1.DC,pV2ACInverter1.DCPV) annotation(Line(
			points={{355,-335},{350,-335},{345,-335}},
			color={247,148,29},
			thickness=0.0625));
		connect(pV2ACInverter1.MPP,photovoltaic1.MPP) annotation(Line(
			points={{325,-355},{325,-360},{375,-360},{375,-355}},
			color={0,0,127},
			thickness=0.0625));
		connect(grid2.LVGridD,phaseTap5.Grid3) annotation(Line(
			points={{165,-240},{170,-240},{200,-240},{205,-240}},
			color={247,148,29},
			thickness=0.0625));
		connect(grid2.LVGridE,phaseTap6.Grid3) annotation(Line(
			points={{165,-255},{170,-255},{205,-255},{210,-255}},
			color={247,148,29},
			thickness=0.0625));
		connect(grid2.LVGridF,phaseTap2.Grid3) annotation(Line(
			points={{165,-270},{170,-270},{215,-270},{220,-270}},
			color={247,148,29},
			thickness=0.0625));
		connect(grid1.LVGridD,phaseTap1.Grid3) annotation(Line(
			points={{200,-290},{205,-290},{230,-290},{235,-290}},
			color={247,148,29},
			thickness=0.0625));
		connect(grid1.LVGridE,simpleHeatedBuilding1.Grid3) annotation(Line(
			points={{200,-305},{205,-305},{360,-305},{360,-130},{360,-125}},
			color={247,148,29},
			thickness=0.0625));
		connect(environmentConditions1,photovoltaic1.EnvironmentConditions) annotation(Line(
			points={{455,30},{450,30},{400,30},{400,-335},{395,-335}},
			color={192,192,192},
			thickness=0.0625));
		connect(grid1.LVGridF,pV2ACInverter1.LVGrid3) annotation(Line(
			points={{200,-320},{205,-320},{300,-320},{300,-335},{305,-335}},
			color={247,148,29},
			thickness=0.0625));
		connect(hydraulicSwitch_TS_DH_HG1.qvDistrictHeating,qvDHpump) annotation(Line(
			points={{160,-70},{160,-65},{160,10},{-115,10},{-120,10}},
			color={0,0,127},
			thickness=0.0625));
		connect(hydraulicSwitch_TS_DH_HG1.StorageChargeFlow,WolfBSP800.FlowIn1) annotation(Line(
			points={{150,-84.7},{150,-89.7},{150,-140},{155,-140}},
			color={190,30,45}));
		connect(WolfBSP800.ReturnOut1,hydraulicSwitch_TS_DH_HG1.StorageChargeReturn) annotation(Line(
			points={{155,-145},{150,-145},{145,-145},{145,-89.7},{145,-84.7}},
			color={190,30,45}));
		connect(WolfBSP800.FlowOut6,hydraulicSwitch_TS_DH_HG1.StorageDischargeFlow) annotation(Line(
			points={{190,-140},{195,-140},{200,-140},{200,-89.7},{200,-84.7}},
			color={190,30,45}));
		connect(hydraulicSwitch_TS_DH_HG1.StorageDischargeReturn,WolfBSP800.ReturnIn6) annotation(Line(
			points={{205,-84.7},{205,-89.7},{205,-150},{195,-150},{190,-150}},
			color={190,30,45}));
		connect(hydraulicSwitch_TS_DH_HG1.HeatExchangerIn,extractVolumeFlow1.Pipe) annotation(Line(
			points={{170,-70},{170,-65},{170,-55},{170,-50}},
			color={190,30,45}));
		connect(hydraulicSwitch_TS_DH_HG1.HeatExchangerOut,defineVolumeFlow1.Pipe) annotation(Line(
			points={{180,-70},{180,-65},{180,-55},{200,-55},{200,-50}},
			color={190,30,45},
			thickness=0.0625));
		connect(hydraulicSwitch_TS_DH_HG1.FeedInPumpOut,phaseTap5.Grid1) annotation(Line(
			points={{200,-70},{200,-65},{220,-65},{220,-240},{215,-240}},
			color={247,148,29},
			thickness=0.0625));
		connect(hydraulicSwitch_TS_DH_HG1.ExtractionPumpOut,phaseTap6.Grid1) annotation(
			Line(
				points={{195,-70},{195,-60},{225,-60},{225,-255},{220,-255}},
				color={247,148,29},
				thickness=0.0625),
			__esi_AutoRoute=false);
		connect(WolfBSP800.ReturnIn7,heatingUnitFlowTemperature1.ReturnSupply) annotation(
			Line(
				points={{190,-174.6666564941406},{195,-174.7},{215,-174.7},{215,-111},{255,-111.3333282470703}},
				color={190,30,45},
				thickness=0.0625),
			__esi_AutoRoute=false);
		connect(WolfBSP800.FlowOut7,heatingUnitFlowTemperature1.FlowSupply) annotation(
			Line(
				points={{190,-165},{195,-165},{210,-165},{210,-93.7},{255,-93.66667175292969}},
				color={190,30,45}),
			__esi_AutoRoute=false);
		connect(CBin_StandardControl.y,switch4.u1) annotation(Line(
			points={{6,-60},{11,-60},{13,-60},{13,-67},{18,-67}},
			color={0,0,127},
			thickness=0.0625));
		connect(CBControlIn.y,switch4.u3) annotation(Line(
			points={{6,-90},{11,-90},{13,-90},{13,-83},{18,-83}},
			color={0,0,127},
			thickness=0.0625));
		connect(HPModulation,switch3.u3) annotation(Line(
			points={{-120,-315},{-115,-315},{-97,-315},{-97,-293},{-92,-293}},
			color={0,0,127},
			thickness=0.0625));
		connect(wolfCHA1.HPModulation,switch3.y) annotation(Line(
			points={{-55,-255},{-60,-255},{-64,-255},{-64,-285},{-69,-285}},
			color={0,0,127},
			thickness=0.0625));
		connect(HPin_StandardControl.y,switch3.u1) annotation(Line(
			points={{-104,-265},{-99,-265},{-97,-265},{-97,-277},{-92,-277}},
			color={0,0,127},
			thickness=0.0625));
		connect(HPAuxModulation,switch5.u3) annotation(Line(
			points={{-120,-365},{-115,-365},{-97,-365},{-97,-363},{-92,-363}},
			color={0,0,127},
			thickness=0.0625));
		connect(switch5.y,wolfCHA1.HPAuxModulation) annotation(Line(
			points={{-69,-355},{-64,-355},{-60,-355},{-60,-260},{-55,-260}},
			color={0,0,127},
			thickness=0.0625));
		connect(AUXin_StandardControl.y,switch5.u1) annotation(Line(
			points={{-104,-340},{-99,-340},{-97,-340},{-97,-347},{-92,-347}},
			color={0,0,127},
			thickness=0.0625));
		connect(WolfBSP800.FlowOut8,measureThermal1.PipeIn) annotation(Line(
			points={{190,-189.7},{195,-189.7},{290,-189.7},{290,-190},{295,-190}},
			color={190,30,45}));
		connect(measureThermal1.PipeOut,dHW_demand1.FlowHotWater) annotation(Line(
			points={{305,-190},{310,-190},{370,-190},{375,-190}},
			color={190,30,45}));
		connect(dHW_demand1.ReturnHotWater,WolfBSP800.ReturnIn8) annotation(Line(
			points={{375,-200},{370,-200},{195,-200},{195,-199.7},{190,-199.7}},
			color={190,30,45}));
		connect(logicalSwitch1.u2,StandardControlHPSwitch) annotation(Line(
			points={{-92,-170},{-97,-170},{-115,-170},{-120,-170}},
			color={255,0,255},
			thickness=0.0625));
		connect(StandardControlCB,switch4.u2) annotation(Line(
			points={{-50,-75},{-45,-75},{13,-75},{18,-75}},
			color={255,0,255},
			thickness=0.0625));
		connect(switch2.u2,StandardSTcontrol) annotation(Line(
			points={{-92,-100},{-97,-100},{-115,-100},{-120,-100}},
			color={255,0,255},
			thickness=0.0625));
		connect(switch3.u2,StandardHPcontrol) annotation(Line(
			points={{-92,-285},{-97,-285},{-115,-285},{-120,-285}},
			color={255,0,255},
			thickness=0.0625));
		connect(StandardHPcontrol,switch5.u2) annotation(
			Line(
				points={{-120,-285},{-115,-285},{-95,-285},{-95,-355},{-92,-355}},
				color={255,0,255},
				thickness=0.0625),
			__esi_AutoRoute=false);
		connect(wolfCGB20_GC1.ControlIn,switch4.y) annotation(Line(
			points={{55,-75},{50,-75},{46,-75},{41,-75}},
			color={0,0,127},
			thickness=0.0625));
		connect(wolfCGB20_GC1.Return,hydraulicSwitch_TS_DH_HG1.HeatGeneratorReturn) annotation(Line(
			points={{99.7,-80},{104.7,-80},{135,-80},{140,-80}},
			color={190,30,45},
			thickness=0.0625));
		connect(hydraulicSwitch_TS_DH_HG1.HeatGeneratorSupply,wolfCGB20_GC1.Flow) annotation(Line(
			points={{140,-75},{135,-75},{104.7,-75},{104.7,-70},{99.7,-70}},
			color={190,30,45},
			thickness=0.0625));
		connect(grid2.LVGridA,wolfCGB20_GC1.lV3Phase) annotation(Line(
			points={{125,-240},{120,-240},{90,-240},{90,-104.7},{90,-99.7}},
			color={247,148,29},
			thickness=0.0625));
		connect(environmentConditions1,wolfCGB20_GC1.environmentConditions) annotation(Line(
			points={{455,30},{450,30},{90,30},{90,-50},{90,-55}},
			color={192,192,192},
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
		__esi_hydraulicSwitch_TS_DH_HG1(viewinfo[0](
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
					imageSource="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",
					extent={{-225,-250.8},{225,118.8}}),
				Text(
					textString="SF2",
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
    <TD colspan=\"3\"><IMG width=\"350\" height=\"273\" src=\"data:image/png;base64,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\"></TD></TR>
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
			__esi_MinInterval="9.999999999999999e-10",
			__esi_AbsTolerance="1e-6"));
end SF2;
