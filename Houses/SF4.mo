// CP: 65001
// SimulationX Version: 4.2.3.69223
within CoSES_Models.Houses;
model SF4 "House 4 with a StirlingCHP and an electric heater"
	GreenCity.Interfaces.Electrical.LV3Phase lV3Phase1 "Electrical Low-Voltage AC Three-Phase Connector" annotation(Placement(
		transformation(extent={{145,-315},{165,-295}}),
		iconTransformation(extent={{236.7,90},{256.7,110}})));
	GreenCity.Interfaces.Environment.EnvironmentConditions environmentConditions1 "Environment Conditions Connector" annotation(Placement(
		transformation(extent={{370,25},{390,45}}),
		iconTransformation(extent={{236.7,190},{256.7,210}})));
	Modelica.Blocks.Interfaces.BooleanInput StandardCBcontrol "If true, standard control will be used to control the condensing boiler" annotation(
		Placement(
			transformation(extent={{-140,-105},{-100,-65}}),
			iconTransformation(
				origin={-150,250},
				extent={{-20,-20},{20,20}},
				rotation=-90)),
		Dialog(
			group="Condensing Boiler",
			tab="Standard Control",
			visible=false));
	GreenCity.Utilities.Electrical.Grid grid2(
		OutputType=GreenCity.Utilities.Electrical.Grid.OutputEnum.MasterGrid,
		useA=true,
		useB=true,
		useC=true,
		useD=true,
		useE=true,
		useF=true) "Electrical power grid for connection of maximum six 3-phase AC components" annotation(Placement(transformation(extent={{65,-205},{105,-165}})));
	GreenCity.Utilities.Electrical.Grid grid1(
		OutputType=GreenCity.Utilities.Electrical.Grid.OutputEnum.MasterGrid,
		useA=true,
		useB=true,
		useC=true,
		useD=true,
		useE=true,
		useF=true) annotation(Placement(transformation(extent={{135,-275},{175,-235}})));
	GreenCity.Utilities.Electrical.PhaseTap phaseTap1 annotation(Placement(transformation(extent={{160,-190},{170,-180}})));
	GreenCity.GreenBuilding.HeatingSystem.HeatingUnitFlowTemperature heatingUnitFlowTemperature1(
		CirculationPump(PPump(tableID "External table object")),
		qvMaxPump(displayUnit="l/min")=0.00025) annotation(Placement(transformation(extent={{180,-95},{215,-60}})));
	Consumer.DHW_demand dHW_demand1(
		Load(tableID "External table object"),
		WeeklyData=WeeklyData,
		File=File,
		Table=Table,
		DHWfactor=DHWfactor,
		THotWaterSet=318.15) annotation(Placement(transformation(extent={{300,-135},{320,-115}})));
	GreenCity.Utilities.Electrical.PhaseTap phaseTap5 annotation(Placement(transformation(extent={{130,-160},{140,-150}})));
	GreenCity.Utilities.Electrical.PhaseTap phaseTap6 annotation(Placement(transformation(extent={{135,-175},{145,-165}})));
	HeatGenerator.DigitalTwins wolfCGB20 annotation(Placement(transformation(extent={{-25,-110},{20,-65}})));
	GreenCity.Interfaces.Thermal.DefineVolumeFlow defineVolumeFlow1 annotation(Placement(transformation(
		origin={125,15},
		extent={{-10,-10},{10,10}},
		rotation=-90)));
	GreenCity.Interfaces.Thermal.ExtractVolumeFlow extractVolumeFlow1 annotation(Placement(transformation(
		origin={95,15},
		extent={{10,-10},{-10,10}},
		rotation=-90)));
	GreenCity.Utilities.Thermal.MeasureThermal measureThermal1 annotation(Placement(transformation(extent={{220,-115},{230,-125}})));
	Modelica.Blocks.Sources.RealExpression TColdWater(y(quantity="Basics.Temp")=288.15) annotation(Placement(transformation(extent={{355,-160},{335,-140}})));
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
		Presence_WeeklyRepetition=WeeklyData,
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
		ceilingInsul=0) "Heated 3-zone-building with changeable heating system" annotation(Placement(transformation(extent={{255,-100},{295,-60}})));
	parameter Real TStartCB(quantity="Basics.Temp")=328.15 "Minimum Temperature, at the top, at which the CB turns on" annotation(Dialog(
		group="Condensing Boiler",
		tab="Standard Control"));
	parameter Real TStopCB(quantity="Basics.Temp")=343.15 "Temperature at the bottom, at which the CB stops" annotation(Dialog(
		group="Condensing Boiler",
		tab="Standard Control"));
	parameter Real SOCminCB(quantity="Basics.RelMagnitude")=0.5 "SOC, at which the CB turns on (SOCmin < SOCmin and T<TStart)" annotation(Dialog(
		group="Condensing Boiler",
		tab="Standard Control"));
	parameter Real SOCmaxCB(quantity="Basics.RelMagnitude")=0.9500000000000001 "SOC, at which the CB turns off" annotation(Dialog(
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
		Modelica.Blocks.Interfaces.BooleanInput StandardControlEH "Standard Control for electric heater" annotation(
			Placement(
				transformation(extent={{-140,-165},{-100,-125}}),
				iconTransformation(
					origin={150,250},
					extent={{-20,-20},{20,20}},
					rotation=270)),
			Dialog(
				group="Electric Heater",
				tab="Standard Control",
				visible=false));
		Modelica.Blocks.Interfaces.BooleanInput StandardControlExcessPV "If true, only excess PV power is used for the electric heater" annotation(
			Placement(
				transformation(extent={{-120,30},{-80,70}}),
				iconTransformation(
					origin={0,250},
					extent={{-20,-20},{20,20}},
					rotation=-90)),
			Dialog(
				group="Electric Heater",
				tab="Standard Control",
				visible=false));
		parameter Real deltaTEHon(quantity="Thermics.TempDiff")=5 "Required temperature difference between storage temperature and max. storage temperature to switch on EH" annotation(Dialog(
			group="Electric Heater",
			tab="Standard Control"));
		parameter Real PGridEHon(quantity="Basics.Power")=500 "Required feed-in power to switch on EH" annotation(Dialog(
			group="Electric Heater",
			tab="Standard Control"));
		Boolean EHon "Electric heater is switched on" annotation(Dialog(
			group="Electric Heater",
			tab="Standard Control",
			visible=false));
		Real EHinStandardControl(quantity="Basics.Power") "Standard control value of the EH modulation" annotation(Dialog(
			group="Electric Heater",
			tab="Standard Control",
			visible=false));
		Modelica.Blocks.Interfaces.RealInput CBIn_TSet(quantity="Basics.Temp") if CBControlMode "Condensing boiler input - set temperature (power is constant)" annotation(
			Placement(
				transformation(extent={{-140,-40},{-100,0}}),
				iconTransformation(extent={{-270,-220},{-230,-180}})),
			Dialog(
				tab="Input Signals",
				visible=false));
		Modelica.Blocks.Interfaces.RealInput ElHeaterIn_P(quantity="Basics.Power") if not CBControlMode "Electric heater power" annotation(
			Placement(
				transformation(extent={{-140,-195},{-100,-155}}),
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
		Modelica.Blocks.Interfaces.RealInput qvDHpump(quantity="Thermics.VolumeFlow") "Reference volume flow of district heating pump - positive: feed in - negative: extraction" annotation(
			Placement(
				transformation(extent={{-140,-10},{-100,30}}),
				iconTransformation(extent={{266.7,-220},{226.7,-180}})),
			Dialog(
				tab="Input Signals",
				visible=false));
		Modelica.Blocks.Interfaces.RealInput CBIn_P(quantity="Basics.Power") "Condensing boiler input - set pwer (DeltaT is constant)" annotation(
			Placement(
				transformation(extent={{-140,-75},{-100,-35}}),
				iconTransformation(extent={{-270,130},{-230,170}})),
			Dialog(
				tab="Input Signals",
				visible=false));
		parameter Boolean CBControlMode=false "If true, flow temperature controlled, else power output is controlled" annotation(Dialog(
			group="Condensing Boiler",
			tab="Heat Generator Parameters"));
		parameter Real CBDeltaT(quantity="Thermics.TempDiff")=20 "Temperature difference between flow and return temperature" annotation(Dialog(
			group="Condensing Boiler",
			tab="Heat Generator Parameters"));
		parameter Real CBPmax(quantity="Basics.Power")=24000 if not CBControlMode "Maximum power of CB" annotation(Dialog(
			group="Condensing Boiler",
			tab="Heat Generator Parameters"));
		parameter Real CBTmax(quantity="Basics.Temp")=356.15 if CBControlMode "Maximum temperature of CB" annotation(Dialog(
			group="Condensing Boiler",
			tab="Heat Generator Parameters"));
		parameter Real CBPmin(quantity="Basics.Power")=2000 if not CBControlMode "Minimum power of CB" annotation(Dialog(
			group="Condensing Boiler",
			tab="Heat Generator Parameters"));
		parameter Real CBTmin(quantity="Basics.Temp")=293.15 if CBControlMode "Minimum temperature of CB" annotation(Dialog(
			group="Condensing Boiler",
			tab="Heat Generator Parameters"));
		parameter Real PElMax(quantity="Basics.Power")=6000 "Maximum power of the electric heater" annotation(Dialog(
			group="Electric Heater",
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
		parameter Real QHeatNormLivingArea(quantity="Thermics.HeatFlowSurf")=20 if not UseStandardHeatNorm "Area-specific heating power - modern radiators: 14 - 15 W/m²; space heating: 15 W/m²" annotation(Dialog(
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
		parameter String PresenceFile=classDirectory()+"Data\\SF4_WholeYear.txt" if UseIndividualPresence "File with presence timeseries (presence in %; 0% - no one is at home; 100% - everyone is at home)" annotation(Dialog(
			group="Additional Yields/Losses",
			tab="Consumption Parameters"));
		parameter Boolean UseIndividualElecConsumption=true "If individual electricity consumption is used, individual consumption data ha to be provided, else standart load profiles are used" annotation(Dialog(
			group="Additional Yields/Losses",
			tab="Consumption Parameters"));
		parameter String ElConsumptionFile=classDirectory()+"Data\\SF4_WholeYear.txt" if UseIndividualElecConsumption "File with electric consumption time series (consumption in kW)" annotation(Dialog(
			group="Additional Yields/Losses",
			tab="Consumption Parameters"));
		parameter String ElConsumptionTable="Pel" "Table with electric consumption time series (consumption in W)" annotation(Dialog(
			group="Additional Yields/Losses",
			tab="Consumption Parameters"));
		parameter Real YearlyElecConsumption_kWh=7000 if UseIndividualElecConsumption "YearlyElecConsumption_kWh" annotation(Dialog(
			group="Additional Yields/Losses",
			tab="Consumption Parameters"));
		parameter Real ElFactor=YearlyElecConsumption_kWh/5149 if UseIndividualElecConsumption "ElFactor" annotation(Dialog(
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
		parameter String File=classDirectory()+"Data\\SF4_WholeYear.txt" "DHW Data File" annotation(Dialog(
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
		Real EH_P_heat_is(quantity="Basics.Power") "Heat output power of the electric heater" annotation(Dialog(
			group="Power",
			tab="Results EH",
			visible=false));
		Real EH_E_heat_produced(
			quantity="Basics.Energy",
			displayUnit="kWh") "Heat output of the electric heater" annotation(Dialog(
			group="Energy",
			tab="Results EH",
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
		GreenCity.Local.Photovoltaic photovoltaic1(
			alphaModule(displayUnit="rad")=alphaPV,
			betaModule(displayUnit="rad")=betaPV,
			PPeak(displayUnit="Nm/s")=PVPeak) annotation(Placement(transformation(extent={{320,-250},{280,-210}})));
		GreenCity.Local.Controller.PV2ACInverter pV2ACInverter1 annotation(Placement(transformation(extent={{270,-210},{230,-250}})));
		Modelica.Blocks.Sources.RealExpression CBControlIn(y=CBIn) annotation(Placement(transformation(extent={{-90,-110},{-70,-90}})));
		Modelica.Blocks.Logical.Switch switch4 annotation(Placement(transformation(extent={{-55,-95},{-35,-75}})));
		Modelica.Blocks.Sources.RealExpression CBin_StandardControl(y=CBinStandardControl) annotation(Placement(transformation(extent={{-90,-80},{-70,-60}})));
		Storage.HeatStorageCombined BSH1000(
			VStorage=0.86,
			dStorage=0.79,
			QlossRate=7,
			LinearProfile=TSLinearProfile,
			TupInit(displayUnit="K")=TSTupInit,
			TlowInit(displayUnit="K")=TSTlowInit,
			UseElHeater=true,
			ElHeaterPower(displayUnit="Nm/s")=PElMax,
			iUp=6,
			iLow=6,
			DeltaTHeater=5,
			TMax(displayUnit="K")=Tmax_TS,
			alphaMedStatic=1,
			use1=true,
			iFlow1=8,
			use2=true,
			iFlow2=8,
			use3=false,
			use4=true,
			iFlow4=8,
			use5=true,
			HE5=false,
			iFlow5=8,
			AHeatExchanger5=7.1,
			VHeatExchanger5=0.06,
			use6=true,
			HE6=true,
			AHeatExchanger6=7.1,
			VHeatExchanger6=0.06) annotation(Placement(transformation(extent={{85,-123},{120,-50}})));
		Distribution.HydraulicSwitch_TS_DH hydraulicSwitch_TS_DH1(
			FeedInPump(PPump(tableID "External table object")),
			ExtractionPump1(PPump(tableID "External table object"))) annotation(Placement(transformation(extent={{65,-30},{135,-15}})));
		Modelica.Blocks.Logical.Switch switch1 annotation(Placement(transformation(extent={{-55,-155},{-35,-135}})));
		Modelica.Blocks.Sources.RealExpression EHin_StandardControl(y=EHinStandardControl) annotation(Placement(transformation(extent={{-90,-140},{-70,-120}})));
		HeatGenerator.DigitalTwins.WolfCGB20_GC wolfCGB20_GC1(wolfCGB1(
			EffHeat_table(tableID "External table object"),
			StartUp_table(tableID "External table object"),
			CoolDown_table(tableID "External table object"),
			PHeat_table(tableID "External table object"),
			DeltaT_table(tableID "External table object"))) annotation(Placement(transformation(extent={{-5,-110},{40,-65}})));
	equation
		// Input Conversion
		// CB
		if CBControlMode then
			CBIn = min(0, 2 + 8*((CBIn_TSet-CBTmin)/(CBTmax-CBTmin)));
		else
			CBIn = min(max(0, 2 + 8 * ((CBIn_P - CBPmin)/(CBPmax - CBPmin))), 10);
		end if;
		
		// Standard Control
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
		
		// Electric heater
		when (((Tmax_TS - TS_S_TM_BT_5) > deltaTEHon) and StandardControlEH) then
			EHon = true;
		elsewhen ((Tmax_TS < TS_S_TM_BT_5) or (not StandardControlEH)) then
			EHon = false;
		end when;
		if EHon and StandardControlExcessPV then
			EHinStandardControl = min(max(0, -grid2.P), PElMax);
		elseif EHon then
			EHinStandardControl = PElMax;
		else
			EHinStandardControl = 0;
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
		
		// Electric heater
		EH_P_heat_is = BSH1000.PStorage[7];
		EH_E_heat_produced = BSH1000.EHeat[7];
		
		//Thermal Storage
		TS_S_TM_HC_HW_VL = BSH1000.FlowOut6.T;
		TS_S_TM_HC_HW_RL = BSH1000.ReturnIn6.T;
		TS_S_TM_BT_1 = BSH1000.TStorage[1];
		TS_S_TM_BT_2 = BSH1000.TStorage[2];
		TS_S_TM_BT_3 = BSH1000.TStorage[3];
		TS_S_TM_BT_4 = BSH1000.TStorage[4];
		TS_S_TM_BT_5 = BSH1000.TStorage[5];
		TS_S_TM_BT_6 = BSH1000.TStorage[6];
		TS_S_TM_BT_7 = BSH1000.TStorage[7];
		TS_S_TM_BT_8 = BSH1000.TStorage[8];
		TS_S_TM_BT_9 = BSH1000.TStorage[9];
		TS_S_TM_BT_10 = BSH1000.TStorage[10];
		TS_E_Storage_BT = BSH1000.cpMed*BSH1000.rhoMed*BSH1000.VStorage*((BSH1000.TLayer[1]+BSH1000.TLayer[2]+BSH1000.TLayer[3]+BSH1000.TLayer[4]+BSH1000.TLayer[5]+BSH1000.TLayer[6]+BSH1000.TLayer[7]+BSH1000.TLayer[8]+BSH1000.TLayer[9]+BSH1000.TLayer[10])/10-T0_TS);
		TS_SOC_BT = TS_E_Storage_BT/(BSH1000.cpMed*BSH1000.rhoMed*BSH1000.VStorage*(Tmax_TS - T0_TS));
		
		// Heat Sink (Heating)
		HS_S_TM_VL_bM = heatingUnitFlowTemperature1.FlowSupply.T;
		HS_S_TM_VL_aM = heatingUnitFlowTemperature1.FlowSink.T;
		HS_S_TM_RL = heatingUnitFlowTemperature1.ReturnSupply.T;
		HS_S_FW_HC_aM = heatingUnitFlowTemperature1.FlowSink.qv;
		HS_S_FW_HC_bM = heatingUnitFlowTemperature1.FlowSupply.qv;
		HS_P_DemHeatHC_is = simpleHeatedBuilding1.QHeat;
		HS_E_DemHeatHC_consumed = simpleHeatedBuilding1.EHeat;
		
		// Heat Sink (Domestic Hot Water)
		HS_S_TM_HW_VL = dHW_demand1.FlowHotWater.T;
		HS_S_TM_HW_RL = dHW_demand1.ReturnHotWater.T;
		HS_S_FW_HW_VL = dHW_demand1.ReturnHotWater.qv;
		HS_P_DemHeatHW_is = dHW_demand1.Q_DHW;
		HS_E_DemHeatHW_consumed = dHW_demand1.E_DHW;
		
		// PV
		PV_P = -grid2.PGrid[3];
		PV_E = -grid2.EGridfeed[3];
	initial equation
		// enter your equations here
		
		// Condensing Boiler
		if ((TS_SOC_BT < SOCminCB) and (TS_S_TM_BT_8 < TStartCB) and StandardCBcontrol) then
			CBon = true;
		else
			CBon = false;
		end if;
		
		// Electric heater
		if (((Tmax_TS - TS_S_TM_BT_5) > deltaTEHon) and StandardControlEH) then
			EHon = true;
		else
			EHon = false;
		end if;
	equation
		connect(environmentConditions1,dHW_demand1.EnvironmentConditions) annotation(Line(
			points={{380,35},{375,35},{324.7,35},{324.7,-120},{319.7,-120}},
			color={192,192,192},
			thickness=0.015625));
		connect(measureThermal1.TMedium,dHW_demand1.TPipe) annotation(
			Line(
				points={{225,-115},{225,-105},{315,-105},{315,-115}},
				color={0,0,127},
				thickness=0.0625),
			__esi_AutoRoute=false);
		connect(extractVolumeFlow1.qvMedium,defineVolumeFlow1.qvMedium) annotation(Line(
			points={{100,25},{100,30},{120,30},{120,25}},
			color={0,0,127},
			thickness=0.0625));
		connect(extractVolumeFlow1.TMedium,DTH_HEXin) annotation(Line(
			points={{90,25},{90,30},{90,40},{-110,40},{-115,40}},
			color={0,0,127},
			thickness=0.0625));
		connect(TDH_HEXout,defineVolumeFlow1.TMedium) annotation(Line(
			points={{-120,90},{-115,90},{130,90},{130,30},{130,25}},
			color={0,0,127},
			thickness=0.0625));
		connect(extractVolumeFlow1.qvMedium,qv_HEX) annotation(Line(
			points={{100,25},{100,30},{100,65},{-110,65},{-115,65}},
			color={0,0,127},
			thickness=0.0625));
		connect(TColdWater.y,dHW_demand1.TColdWater) annotation(Line(
			points={{334,-150},{329,-150},{315,-150},{315,-139.7},{315,-134.7}},
			color={0,0,127},
			thickness=0.0625));
		connect(heatingUnitFlowTemperature1.FlowSink,simpleHeatedBuilding1.PipeIn) annotation(Line(
			points={{215,-68.7},{220,-68.7},{250,-68.7},{250,-70},{255,-70}},
			color={190,30,45}));
		connect(heatingUnitFlowTemperature1.ReturnSink,simpleHeatedBuilding1.PipeOut) annotation(Line(
			points={{215,-86.3},{220,-86.3},{250,-86.3},{250,-85},{255,-85}},
			color={190,30,45},
			thickness=0.0625));
		connect(simpleHeatedBuilding1.qv_Ref,heatingUnitFlowTemperature1.qvRef) annotation(Line(
			points={{260,-60},{260,-55},{206.3,-55},{206.3,-60}},
			color={0,0,127},
			thickness=0.0625));
		connect(simpleHeatedBuilding1.T_Ref,heatingUnitFlowTemperature1.TRef) annotation(
			Line(
				points={{265,-60},{265,-50},{193,-50},{193,-60}},
				color={0,0,127},
				thickness=0.0625),
			__esi_AutoRoute=false);
		connect(simpleHeatedBuilding1.EnvironmentConditions,environmentConditions1) annotation(Line(
			points={{280,-60},{280,-55},{280,35},{375,35},{380,35}},
			color={192,192,192},
			thickness=0.0625));
		connect(photovoltaic1.DC,pV2ACInverter1.DCPV) annotation(Line(
			points={{280,-230},{275,-230},{270,-230}},
			color={247,148,29},
			thickness=0.0625));
		connect(pV2ACInverter1.MPP,photovoltaic1.MPP) annotation(Line(
			points={{250,-250},{250,-255},{300,-255},{300,-250}},
			color={0,0,127},
			thickness=0.0625));
		connect(environmentConditions1,photovoltaic1.EnvironmentConditions) annotation(Line(
			points={{380,35},{375,35},{325,35},{325,-230},{320,-230}},
			color={192,192,192},
			thickness=0.0625));
		connect(CBin_StandardControl.y,switch4.u1) annotation(Line(
			points={{-69,-70},{-64,-70},{-62,-70},{-62,-77},{-57,-77}},
			color={0,0,127},
			thickness=0.0625));
		connect(CBControlIn.y,switch4.u3) annotation(Line(
			points={{-69,-100},{-64,-100},{-62,-100},{-62,-93},{-57,-93}},
			color={0,0,127},
			thickness=0.0625));
		connect(measureThermal1.PipeOut,dHW_demand1.FlowHotWater) annotation(Line(
			points={{230,-120},{235,-120},{295,-120},{300,-120}},
			color={190,30,45}));
		connect(extractVolumeFlow1.Pipe,hydraulicSwitch_TS_DH1.HeatExchangerIn) annotation(Line(
			points={{95,5},{95,0},{95,-10},{95,-15}},
			color={190,30,45},
			thickness=0.0625));
		connect(hydraulicSwitch_TS_DH1.HeatExchangerOut,defineVolumeFlow1.Pipe) annotation(Line(
			points={{105,-15},{105,-10},{105,0},{125,0},{125,5}},
			color={190,30,45},
			thickness=0.0625));
		connect(hydraulicSwitch_TS_DH1.FeedInPumpOut,phaseTap5.Grid1) annotation(Line(
			points={{125,-15},{125,-10},{145,-10},{145,-155},{140,-155}},
			color={247,148,29},
			thickness=0.0625));
		connect(hydraulicSwitch_TS_DH1.ExtractionPumpOut,phaseTap6.Grid1) annotation(
			Line(
				points={{120,-15},{120,-5},{155,-5},{155,-170},{145,-170}},
				color={247,148,29},
				thickness=0.0625),
			__esi_AutoRoute=false);
		connect(phaseTap1.Grid1,heatingUnitFlowTemperature1.Grid1) annotation(Line(
			points={{170,-185},{175,-185},{184.3,-185},{184.3,-100},{184.3,-95}},
			color={247,148,29},
			thickness=0.015625));
		connect(grid1.LVMastGrid,lV3Phase1) annotation(
			Line(
				points={{155,-275},{155,-280},{155,-305}},
				color={247,148,29},
				thickness=0.015625),
			__esi_AutoRoute=false);
		connect(grid1.LVGridA,grid2.LVMastGrid) annotation(Line(
			points={{135,-240},{130,-240},{85,-240},{85,-210},{85,-205}},
			color={247,148,29},
			thickness=0.015625));
		connect(grid2.LVGridC,pV2ACInverter1.LVGrid3) annotation(Line(
			points={{65,-200},{60,-200},{60,-230},{225,-230},{230,-230}},
			color={247,148,29},
			thickness=0.0625));
		connect(grid2.LVGridB,phaseTap5.Grid3) annotation(Line(
			points={{65,-185},{60,-185},{60,-155},{125,-155},{130,-155}},
			color={247,148,29},
			thickness=0.0625));
		connect(grid2.LVGridD,phaseTap6.Grid3) annotation(Line(
			points={{105,-170},{110,-170},{130,-170},{135,-170}},
			color={247,148,29},
			thickness=0.0625));
		connect(grid2.LVGridE,phaseTap1.Grid3) annotation(Line(
			points={{105,-185},{110,-185},{155,-185},{160,-185}},
			color={247,148,29},
			thickness=0.0625));
		connect(grid2.LVGridF,simpleHeatedBuilding1.Grid3) annotation(Line(
			points={{105,-200},{110,-200},{285,-200},{285,-105},{285,-100}},
			color={247,148,29},
			thickness=0.0625));
		connect(ElHeaterIn_P,switch1.u3) annotation(Line(
			points={{-120,-175},{-115,-175},{-62,-175},{-62,-153},{-57,-153}},
			color={0,0,127},
			thickness=0.0625));
		connect(EHin_StandardControl.y,switch1.u1) annotation(Line(
			points={{-69,-130},{-64,-130},{-62,-130},{-62,-137},{-57,-137}},
			color={0,0,127},
			thickness=0.0625));
		connect(hydraulicSwitch_TS_DH1.qvDistrictHeating,qvDHpump) annotation(Line(
			points={{85,-15},{85,-10},{85,10},{-115,10},{-120,10}},
			color={0,0,127},
			thickness=0.0625));
		connect(BSH1000.Grid3,grid1.LVGridB) annotation(Line(
			points={{115,-122.7},{115,-127.7},{115,-255},{130,-255},{135,-255}},
			color={247,148,29},
			thickness=0.0625));
		connect(switch1.y,BSH1000.Pel) annotation(Line(
			points={{-34,-145},{-29,-145},{110,-145},{110,-127.7},{110,-122.7}},
			color={0,0,127},
			thickness=0.0625));
		connect(BSH1000.FlowOut6,measureThermal1.PipeIn) annotation(Line(
			points={{120,-104.7},{125,-104.7},{215,-104.7},{215,-120},{220,-120}},
			color={190,30,45}));
		connect(dHW_demand1.ReturnHotWater,BSH1000.ReturnIn6) annotation(Line(
			points={{300,-130},{295,-130},{125,-130},{125,-114.7},{120,-114.7}},
			color={190,30,45}));
		connect(BSH1000.ReturnIn5,heatingUnitFlowTemperature1.ReturnSupply) annotation(Line(
			points={{120,-89.7},{125,-89.7},{175,-89.7},{175,-86.3},{180,-86.3}},
			color={190,30,45},
			thickness=0.0625));
		connect(heatingUnitFlowTemperature1.FlowSupply,BSH1000.FlowOut5) annotation(Line(
			points={{180,-68.7},{175,-68.7},{125,-68.7},{125,-80},{120,-80}},
			color={190,30,45},
			thickness=0.0625));
		connect(BSH1000.ReturnOut1,hydraulicSwitch_TS_DH1.StorageChargeReturn) annotation(Line(
			points={{85,-65},{80,-65},{70,-65},{70,-34.7},{70,-29.7}},
			color={190,30,45}));
		connect(BSH1000.FlowIn1,hydraulicSwitch_TS_DH1.StorageChargeFlow) annotation(Line(
			points={{85,-55},{80,-55},{75,-55},{75,-34.7},{75,-29.7}},
			color={190,30,45},
			thickness=0.0625));
		connect(BSH1000.ReturnIn4,hydraulicSwitch_TS_DH1.StorageDischargeReturn) annotation(Line(
			points={{120,-65},{125,-65},{130,-65},{130,-34.7},{130,-29.7}},
			color={190,30,45},
			thickness=0.0625));
		connect(BSH1000.FlowOut4,hydraulicSwitch_TS_DH1.StorageDischargeFlow) annotation(Line(
			points={{120,-55},{125,-55},{125,-34.7},{125,-29.7}},
			color={190,30,45}));
		connect(StandardCBcontrol,switch4.u2) annotation(Line(
			points={{-120,-85},{-115,-85},{-62,-85},{-57,-85}},
			color={255,0,255},
			thickness=0.0625));
		connect(StandardControlEH,switch1.u2) annotation(Line(
			points={{-120,-145},{-115,-145},{-62,-145},{-57,-145}},
			color={255,0,255},
			thickness=0.0625));
		connect(wolfCGB20_GC1.ControlIn,switch4.y) annotation(Line(
			points={{-5,-85},{-10,-85},{-29,-85},{-34,-85}},
			color={0,0,127},
			thickness=0.0625));
		connect(grid2.LVGridA,wolfCGB20_GC1.lV3Phase) annotation(Line(
			points={{65,-170},{60,-170},{30,-170},{30,-114.7},{30,-109.7}},
			color={247,148,29},
			thickness=0.0625));
		connect(wolfCGB20_GC1.Return,BSH1000.ReturnOut2) annotation(Line(
			points={{39.7,-90},{44.7,-90},{80,-90},{80,-89.7},{85,-89.7}},
			color={190,30,45},
			thickness=0.0625));
		connect(wolfCGB20_GC1.Flow,BSH1000.FlowIn2) annotation(Line(
			points={{39.7,-80},{44.7,-80},{80,-80},{85,-80}},
			color={190,30,45}));
		connect(environmentConditions1,wolfCGB20_GC1.environmentConditions) annotation(Line(
			points={{380,35},{375,35},{30,35},{30,-60},{30,-65}},
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
							Bitmap(
								imageSource="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
4jbjvZz2AAAAAElFTkSuQmCC",
								extent={{-220.3,-245},{226.5,106.7}}),
							Text(
								textString="SF4",
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
								extent={{164.7,-196.8},{274.7,-260.2}}),
							Bitmap(
								imageSource="iVBORw0KGgoAAAANSUhEUgAAAJYAAACWCAYAAAA8AXHiAAAABGdBTUEAALGPC/xhBQAAAAlwSFlz
AAAScQAAEnEB89x6jgAAAG5JREFUeF7twTEBAAAAwqD1T20LLyAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAABuamA1AAEQKBC2AAAAAElFTkSuQmCC",
								extent={{-250,-250},{250,250}})}),
		Documentation(info="<HTML><HEAD>
<META http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\"> 
<TITLE>House 4 with a StirlingCHP and an electric heater</TITLE> 
<STYLE type=\"text/css\">
table>tbody>tr:hover,th{background-color:#edf1f3}html{font-size:90%}body,table{font-size:1rem}body{font-family:'Open Sans',Arial,sans-serif;color:#465e70}h1,h2{margin:1em 0 .6em;font-weight:600}p{margin-top:.3em;margin-bottom:.2em}table{border-collapse:collapse;margin:1em 0;width:100%;}tr{border:1px solid #beccd3}td,th{padding:.3em 1em; border-width: 1px; border-style: solid; border-color: rgb(190, 204, 211);}td{word-break:break-word}tr:nth-child(even){background-color:#fafafa}th{font-family:'Open Sans Semibold',Arial,sans-serif;font-weight:700;text-align:left;word-break:keep-all}.lib-wrap{width:70%}@media screen and (max-width:800px){.lib-wrap{width:100%}}td p{margin:.2em}
</STYLE>
  
<META name=\"GENERATOR\" content=\"MSHTML 11.00.10570.1001\"></HEAD> 
<BODY>
<H1>House 4 with a StirlingCHP and an electric heater</H1>
<HR>

<P>This model is a digital twin of the House&nbsp;4 in the CoSES laboratory (<A 
href=\"https://doi.org/10.1109/PESGM41954.2020.9281442\">https://doi.org/10.1109/PESGM41954.2020.9281442</A>)</P>
<P><BR></P>
<P>The house consists of the following components and default conditions:</P>
<UL>
  <LI>Condensing Boiler (no stirling model yet): Wolf CGB20, nominal thermal     
  power: 20 kW_th</LI>
  <LI>Electric heater (in the thermal storage): 6 kW_th</LI>
  <LI>PV system of variable size</LI>
  <LI>Thermal Storage: Wolf&nbsp;BSH 1000,&nbsp;content:&nbsp;860 l&nbsp;</LI>
  <LI>Domestic Hot Water (DHW) preparation: combi storage (internal heat     
  exchanger for DHW)</LI>
  <LI>Consumption - House parameters:<BR>Construction year: 2007 to 2009 (EnEv   
          2007)<BR>Additional insulation: roof + walls + floor<BR>Number of   
  floors:         2<BR>Number       of apartements: 2<BR>Number of inhabitants:  
   6<BR>Living         area: 300m²<BR>Heating       
  system:&nbsp;Radiator&nbsp;(supply / return         temperatur:&nbsp;60   
  /&nbsp;45&nbsp;°C)</LI></UL>
<P>Four boolean inputs can activate a predefined standard control for simple     
 simulation results or during a lead time of the simulation. The standard    
 control  of each element is as follows:</P>
<UL>
  <LI>Condensing Boiler:<BR>The condensing boiler should only operate, if the    
         ASHP cannot provide the required heat.<BR>Switched on at 100 %   
  modulation,             when:<BR>&nbsp;&nbsp;&nbsp;&nbsp; T_Storage,top &lt;   
  T_Start,CB and             SOC_Storage &lt; SOCminCB<BR>Switched off,     
  when:<BR>&nbsp;&nbsp;&nbsp;&nbsp;           T_Storage,bottom &gt; T_Stop,CB or 
      SOC_Storage &gt;   SOCmaxCB<BR><BR></LI>
  <LI>Electric heater:<BR>Switched on, when:<BR>&nbsp;&nbsp;&nbsp;&nbsp;   
  (T_Storage,max - T_Storage,EH) &gt; DeltaTEHon<BR>Switched off,   
  when:<BR>&nbsp;&nbsp;&nbsp;&nbsp; T_Storage,max &lt;   
  T_Storage,EH<BR><BR>Power:<BR>&nbsp;&nbsp;&nbsp;&nbsp; only excess PV, or at   
  maximum power<BR><BR></LI></UL>
<DIV class=\"lib-wrap\">
<TABLE class=\"type\">
  <TBODY>
  <TR>
    <TH>Symbol:</TH>
    <TD colspan=\"3\"><IMG width=\"326\" height=\"271\" src=\"data:image/png;base64,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\"></TD></TR>
  <TR>
    <TH>Identifier:</TH>
    <TD colspan=\"3\">CoSES_Models.Houses.SF4</TD></TR>
  <TR>
    <TH>Version:</TH>
    <TD colspan=\"3\">1.0</TD></TR>
  <TR>
    <TH>File:</TH>
    <TD colspan=\"3\">SF4.mo</TD></TR>
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
    <TD>Standard Control for electric heater</TD>
    <TD>StandardControlEH</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>If true, only excess PV power is used for the electric heater</TD>
    <TD>StandardControlExcessPV</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Electric heater power</TD>
    <TD>ElHeaterIn_P</TD>
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
    <TD>Reference volume flow of district heating pump - positive: feed in -   
          negative: extraction</TD>
    <TD>qvDHpump</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Condensing boiler input - set pwer (DeltaT is constant)</TD>
    <TD>CBIn_P</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>Parameters:</TH>
    <TD>Electrical power grid for connection of maximum six 3-phase AC       
      components</TD>
    <TD>grid2</TD>
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
    <TD>phaseTap5</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Connection of 1-phase to 3-phase AC components</TD>
    <TD>phaseTap6</TD>
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
    <TD>Required temperature difference between storage temperature and max.   
          storage temperature to switch on EH</TD>
    <TD>deltaTEHon</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Required feed-in power to switch on EH</TD>
    <TD>PGridEHon</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>If true, flow temperature controlled, else power output is     
      controlled</TD>
    <TD>CBControlMode</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Temperature difference between flow and return temperature</TD>
    <TD>CBDeltaT</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Maximum power of CB</TD>
    <TD>CBPmax</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Maximum temperature of CB</TD>
    <TD>CBTmax</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Minimum power of CB</TD>
    <TD>CBPmin</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Minimum temperature of CB</TD>
    <TD>CBTmin</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Maximum power of the electric heater</TD>
    <TD>PElMax</TD>
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
      storage is linear, if false the profile is defined by a temperature     
      vector</TD>
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
           data ha to be provided, else standart load profiles are used</TD>
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
       people are at home, less rooms are heated and the average temperature 
      will       decrease)</TD>
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
    <TD>Heat storage with variable temperature profile</TD>
    <TD>BSH1000</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>HydraulicSwitch between thermal storage and district heating</TD>
    <TD>hydraulicSwitch_TS_DH1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Switch between two Real signals</TD>
    <TD>switch1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Set output signal to a time varying Real expression</TD>
    <TD>EHin_StandardControl</TD>
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
    <TD>StandardCBcontrol</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Standard control value of the CB modulation</TD>
    <TD>CBinStandardControl</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Standard Control for electric heater</TD>
    <TD>StandardControlEH</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>If true, only excess PV power is used for the electric heater</TD>
    <TD>StandardControlExcessPV</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Electric heater is switched on</TD>
    <TD>EHon</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Standard control value of the EH modulation</TD>
    <TD>EHinStandardControl</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Condensing boiler input - set temperature (power is constant)</TD>
    <TD>CBIn_TSet</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Electric heater power</TD>
    <TD>ElHeaterIn_P</TD>
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
    <TD>Reference volume flow of district heating pump - positive: feed in -   
          negative: extraction</TD>
    <TD>qvDHpump</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Condensing boiler input - set pwer (DeltaT is constant)</TD>
    <TD>CBIn_P</TD>
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
    <TD>Heat output power of the electric heater</TD>
    <TD>EH_P_heat_is</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heat output of the electric heater</TD>
    <TD>EH_E_heat_produced</TD>
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
end SF4;
