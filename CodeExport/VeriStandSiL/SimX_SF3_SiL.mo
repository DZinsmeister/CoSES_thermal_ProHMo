// CP: 65001
// SimulationX Version: 4.2.3.69223
within CoSES_Models.CodeExport.VeriStandSiL;
model SimX_SF3_SiL "Software in the Loop Model of SF3"
	input SignalBlocks.InputPin GSHP_GSHP_on "GSHP_ASHP_mode" annotation(
		Placement(
			transformation(extent={{-95,-140},{-85,-150}}),
			iconTransformation(extent={{-145,5},{-105,45}})),
		Dialog(
			tab="Inputs",
			visible=false));
	input SignalBlocks.InputPin GSHP_AuxModulation_set "GSHP_AuxModulation_set" annotation(
		Placement(
			transformation(extent={{-95,-160},{-85,-170}}),
			iconTransformation(extent={{-145,-45},{-105,-5}})),
		Dialog(
			tab="Inputs",
			visible=false));
	input SignalBlocks.InputPin ST_S_FW_ST_VL_set "ST_S_FW_ST" annotation(
		Placement(
			transformation(
				origin={-40,-145},
				extent={{5,5},{-5,-5}},
				rotation=-180),
			iconTransformation(
				origin={-75,-122},
				extent={{-20,-19.7},{20,20.3}},
				rotation=90)),
		Dialog(
			tab="Inputs",
			visible=false));
	input SignalBlocks.InputPin CHN_S_FW_HC_set "CHN_S_FW_HC_set" annotation(
		Placement(
			transformation(
				origin={0,-145},
				extent={{5,5},{-5,-5}},
				rotation=-180),
			iconTransformation(
				origin={125,75},
				extent={{-20,-20},{20,20}},
				rotation=180)),
		Dialog(
			tab="Inputs",
			visible=false));
	input SignalBlocks.InputPin CHN_S_FW_TG_set "CHN_S_FW_TG_set" annotation(
		Placement(
			transformation(
				origin={0,-165},
				extent={{5,5},{-5,-5}},
				rotation=-180),
			iconTransformation(
				origin={125,25},
				extent={{-20,-20},{20,20}},
				rotation=180)),
		Dialog(
			tab="Inputs",
			visible=false));
	input SignalBlocks.InputPin CHN_S_TM_TG "CHN_S_TM_TG_TH" annotation(
		Placement(
			transformation(
				origin={0,-185},
				extent={{5,5},{-5,-5}},
				rotation=-180),
			iconTransformation(
				origin={125,-25},
				extent={{-20,-20},{20,20}},
				rotation=180)),
		Dialog(
			tab="Inputs",
			visible=false));
	GreenCity.Interfaces.Thermal.DefineVolumeFlow defineVolumeFlow1 "Specifies a Thermal Volume Flow Connector" annotation(Placement(transformation(extent={{260,-55},{280,-75}})));
	GreenCity.Interfaces.Thermal.ExtractVolumeFlow extractVolumeFlow1 annotation(Placement(transformation(
		origin={270,-90},
		extent={{-10,-10},{10,10}},
		rotation=-180)));
	GreenCity.Interfaces.Thermal.DefineVolumeFlow defineVolumeFlow2 annotation(Placement(transformation(extent={{385,-80},{365,-100}})));
	GreenCity.Interfaces.Thermal.ExtractVolumeFlow extractVolumeFlow2 annotation(Placement(transformation(
		origin={375,-65},
		extent={{10,-10},{-10,10}},
		rotation=180)));
	Modelica.Blocks.Sources.RealExpression qvDHgrid(y=var_qvDHgrid) "Set output signal to a time varying Real expression" annotation(Placement(transformation(extent={{455,-95},{435,-75}})));
	GreenCity.Utilities.Electrical.Grid grid1(useA=true) annotation(Placement(transformation(extent={{200,-35},{240,5}})));
	Modelica.Blocks.Sources.RealExpression modeltime_s(y=time) "Set output signal to a time varying Real expression" annotation(Placement(transformation(extent={{120,30},{140,50}})));
	Modelica.Blocks.Sources.RealExpression qvDHpump(y=var_qvDHpump) "Set output signal to a time varying Real expression" annotation(Placement(transformation(extent={{210,-125},{190,-105}})));
	Modelica.Blocks.Sources.RealExpression qvSTpump(y=var_qvSTpump) "Set output signal to a time varying Real expression" annotation(Placement(transformation(extent={{-85,-55},{-65,-35}})));
	Modelica.Blocks.Sources.RealExpression TDHgrid_in(y=var_TDHgrid_in) "Set output signal to a time varying Real expression" annotation(Placement(transformation(extent={{455,-110},{435,-90}})));
	GreenCity.Utilities.Thermal.HeatExchanger heatExchanger1(
		AHeatExchanger=0.506,
		Vprim=0.00044,
		Vsec=0.00044,
		k=5820) annotation(Placement(transformation(extent={{305,-90},{325,-70}})));
	Environment.Environment environment1(
		WeatherData(tableID "External table object"),
		ReferenceDay=false,
		InputFile=if UseTypedays then File else classDirectory()+"Data\\Weather_2021_Munich_15min.txt",
		DefaultInit=false,
		DayTimeInit=InitTime,
		MonthDayInit=InitDay,
		MonthInit=InitMonth,
		Init(tableID "External table object")) annotation(Placement(transformation(extent={{200,20},{230,50}})));
	Modelica.Blocks.Sources.BooleanExpression StandardControl(y=false) annotation(Placement(transformation(extent={{65,-15},{85,5}})));
	input SignalBlocks.InputPin GSHP_A_V3_TL "GSHP_A_V3_TL" annotation(
		Placement(
			transformation(extent={{-95,-180},{-85,-190}}),
			iconTransformation(extent={{-145,-95},{-105,-55}})),
		Dialog(
			tab="Inputs",
			visible=false));
	Modelica.Blocks.Sources.BooleanExpression varSwitchHPTSPort(y=var_SwitchHPTSPort) "SwitchHPTSPort" annotation(Placement(transformation(extent={{-85,-100},{-65,-80}})));
	Modelica.Blocks.Sources.BooleanExpression varHPMode(y=var_HPon) "varHPMode" annotation(Placement(transformation(extent={{-85,-70},{-65,-50}})));
	Modelica.Blocks.Sources.RealExpression varHPAuxModulation(y=var_HPAuxModulation) "varHPAuxModulation" annotation(Placement(transformation(extent={{-85,-85},{-65,-65}})));
	Houses.SF3 sF3(
		pump2(PPump(tableID "External table object")),
		heatingUnitFlowTemperature1(CirculationPump(PPump(tableID "External table object"))),
		dHW_demand1(Load(tableID "External table object")),
		hydraulicSwitch_TS_DH1(
			FeedInPump(PPump(tableID "External table object")),
			ExtractionPump1(PPump(tableID "External table object"))),
		wolfBWS1_10(wolfBWS1(
			PElHeatFactor_table(tableID "External table object"),
			PHeatFactor_table(tableID "External table object"))),
		CPC=SF3_ST_CollectorType==1,
		AModule=SF3_ST_CollectorSurface_m2,
		VAbsorber=SF3_ST_CollectorVolume_m3,
		Tmax_TS(displayUnit="K")=SF3_T_max_BT + 273.15,
		T0_TS(displayUnit="K")=SF3_T_reference_BT + 273.15,
		TSTupInit(displayUnit="K")=SF3_TS_S_TM_BT_10_init + 273.15,
		TSTlowInit(displayUnit="K")=SF3_TS_S_TM_BT_1_init + 273.15,
		nPeople=SF3_nPeople,
		nFloors=SF3_nFloors,
		nApartments=SF3_nApartments,
		ALH=SF3_HeatedArea_m2,
		n=if SF3_HeatingSystem==0 then 1.3 else 1,
		TFlowHeatNorm(displayUnit="K")=if SF3_HeatingSystem==0 then 333.15 else 313.15,
		TReturnHeatNorm(displayUnit="K")=if SF3_HeatingSystem==0 then 318.15 else 303.15,
		TRef(displayUnit="K")=SF3_T_roomSet_degC,
		TLiving_Init(displayUnit="K")=TLiving_Init + 273.15,
		TRoof_Init(displayUnit="K")=TRoof_Init+273.15,
		TCellar_Init(displayUnit="K")=TCellar_Init+273.15,
		PresenceFile=File,
		ElConsumptionFile=File,
		ElConsumptionTable="Pel",
		YearlyElecConsumption_kWh=SF3_YearlyElecConsumption_kWh,
		ElFactor=SF3_YearlyElecConsumption_kWh/6041,
		ActivateNightTimeReduction=true,
		NightTimeReductionStart(displayUnit="s")=SF3_NightTimeReductionStart_h*3600,
		NightTimeReductionEnd(displayUnit="s")=SF3_NightTimeReductionEnd_h*3600,
		Tnight(displayUnit="K")=SF3_T_roomNightSet_degC+273.15,
		WeeklyData=false,
		File=File,
		V_DHWperDay_l=SF3_V_DHWperDay_l,
		DHWfactor=SF3_V_DHWperDay_l/400,
		PVPeak(displayUnit="kW")=10000,
		simpleHeatedBuilding1(
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
			presenceTable(tableID "External table object"))) annotation(Placement(transformation(extent={{105,-85},{155,-35}})));
	Modelica.Blocks.Sources.BooleanExpression varSwitchSTTSPort(y=var_SwitchSTTSPort) "SwitchSTTSPort" annotation(Placement(transformation(extent={{-85,-40},{-65,-20}})));
	input SignalBlocks.InputPin ST_A_V3_TL "ST_A_V3_TL" annotation(
		Placement(
			transformation(extent={{-45,-160},{-35,-170}}),
			iconTransformation(
				origin={-25,-122},
				extent={{-20,-19.7},{20,20.3}},
				rotation=90)),
		Dialog(
			tab="Inputs",
			visible=false));
	Real var_qvDHpump "var_qvDHpump" annotation(Dialog(
		tab="Inputs",
		visible=false));
	Boolean var_SwitchHPTSPort "var_SwitchHPTSPort" annotation(Dialog(
		tab="Inputs",
		visible=false));
	Real var_qvSTpump "var_qvSTpump" annotation(Dialog(
		tab="Inputs",
		visible=false));
	Boolean var_HPon "var_HPon" annotation(Dialog(
		tab="Inputs",
		visible=false));
	Boolean var_SwitchSTTSPort "var_SwitchSTTSPort" annotation(Dialog(
		tab="Inputs",
		visible=false));
	Real var_qvDHgrid "var_qvDHgrid" annotation(Dialog(
		tab="Inputs",
		visible=false));
	Real var_TDHgrid_in "var_TDHgrid_in" annotation(Dialog(
		tab="Inputs",
		visible=false));
	Real var_HPAuxModulation "var_HPAuxModulation" annotation(Dialog(
		tab="Inputs",
		visible=false));
	parameter Boolean UseTypedays=true "If true, Typedays are used" annotation(Dialog(tab="Parameters"));
	parameter String File=classDirectory()+"Data\\SF3_Typeday.txt" "File of all parameters of SF3 (weather, presence, Pel, DHW)" annotation(Dialog(tab="Parameters"));
	parameter Integer SF3_Typeday=1 "1 - WSC, 2 - WSS, 3 - WWS, 4 - WWC, 5 - TWC, 6 - SSS, 7 - TWS, 8 - TSS, 9 - SWC, 10 - SSC, 11 - TSC, 12 - SWS, 13 - coldest" annotation(Dialog(tab="Parameters"));
	parameter Integer SF3_InitializationTime_h=1 "Additional time before the experiment in order to reach initial conditions for the experiment" annotation(Dialog(tab="Parameters"));
	parameter Integer InitTime=24-SF3_InitializationTime_h "Initial time of the day" annotation(Dialog(tab="Parameters"));
	parameter Integer InitDay=integer(mod(SF3_Typeday*3-2, 31)) "InitialDay" annotation(Dialog(tab="Parameters"));
	parameter Integer InitMonth=integer((SF3_Typeday*3-2)/31)+1 "Initial Month" annotation(Dialog(tab="Parameters"));
	parameter Real TLiving_Init=if SF3_Typeday == 1 then 21 elseif SF3_Typeday == 2 then 21 elseif SF3_Typeday == 3 then 21 elseif SF3_Typeday == 4 then 21 elseif SF3_Typeday == 5 then 21 elseif SF3_Typeday == 6 then 21 elseif SF3_Typeday == 7 then 21 elseif SF3_Typeday == 8 then 21 elseif SF3_Typeday == 9 then 22.46 elseif SF3_Typeday == 10 then 23 elseif SF3_Typeday == 11 then 21.77 elseif SF3_Typeday == 12 then 22.99 else 21 "Initial Temperature" annotation(Dialog(tab="Parameters"));
	parameter Real TRoof_Init=if SF3_Typeday == 1 then 5.68 elseif SF3_Typeday == 2 then 4.52 elseif SF3_Typeday == 3 then 6.66 elseif SF3_Typeday == 4 then 6.11 elseif SF3_Typeday == 5 then 12.65 elseif SF3_Typeday == 6 then 14.17 elseif SF3_Typeday == 7 then 16.69 elseif SF3_Typeday == 8 then 11.78 elseif SF3_Typeday == 9 then 22.05 elseif SF3_Typeday == 10 then 22.88 elseif SF3_Typeday == 11 then 21.03 elseif SF3_Typeday == 12 then 23.83 else 5.62 "Initial Temperature" annotation(Dialog(tab="Parameters"));
	parameter Real TCellar_Init=if SF3_Typeday == 1 then 8.66 elseif SF3_Typeday == 2 then 8.42 elseif SF3_Typeday == 3 then 11.15 elseif SF3_Typeday == 4 then 10.56 elseif SF3_Typeday == 5 then 14.57 elseif SF3_Typeday == 6 then 11 elseif SF3_Typeday == 7 then 16.09 elseif SF3_Typeday == 8 then 9.78 elseif SF3_Typeday == 9 then 17.44 elseif SF3_Typeday == 10 then 16.61 elseif SF3_Typeday == 11 then 17.25 elseif SF3_Typeday == 12 then 18.15 else 8.00 "Initial Temperature" annotation(Dialog(tab="Parameters"));
	parameter Real SF3_T_roomSet_degC=21 "T_roomSet_degC" annotation(Dialog(tab="Parameters"));
	parameter Real SF3_T_roomNightSet_degC=21 "T_roomNightSet_degC" annotation(Dialog(tab="Parameters"));
	parameter Real SF3_NightTimeReductionStart_h=23 "NightTimeReductionStart_h" annotation(Dialog(tab="Parameters"));
	parameter Real SF3_NightTimeReductionEnd_h=7 "NightTimeReductionEnd_h" annotation(Dialog(tab="Parameters"));
	parameter Integer SF3_HeatingSystem=1 "0 - Radiator Heating, 1 - Space Heating" annotation(Dialog(tab="Parameters"));
	parameter Integer SF3_nPeople=8 "nPeople" annotation(Dialog(tab="Parameters"));
	parameter Integer SF3_nFloors=2 "nFloors" annotation(Dialog(tab="Parameters"));
	parameter Integer SF3_nApartments=3 "nApartments" annotation(Dialog(tab="Parameters"));
	parameter Real SF3_HeatedArea_m2=400 "HeatedArea_m2" annotation(Dialog(tab="Parameters"));
	parameter Real SF3_YearlyElecConsumption_kWh=9500 "YearlyElecConsumption_kWh" annotation(Dialog(tab="Parameters"));
	parameter Real SF3_V_DHWperDay_l=400 "V_DHWperDay_l" annotation(Dialog(tab="Parameters"));
	parameter Integer SF3_GSHP_horizontalCollector=0 "1 -  horizontal collector, 0 - downhole heat exchanger" annotation(Dialog(tab="Parameters"));
	parameter Integer SF3_GSHP_numberHE=1 "Number of independent heat exchangers" annotation(Dialog(tab="Parameters"));
	parameter Real SF3_GSHP_HoleDepth_m=6 "Depth of hole in meter, for horizontal collectors: laying depth of heat collectors" annotation(Dialog(tab="Parameters"));
	parameter Real SF3_GSHP_rHole_m=0.3 "Radius of hole in meter, for horizontal collectors: equivalent radius of the flat collector field" annotation(Dialog(tab="Parameters"));
	parameter Integer SF3_ST_CollectorType=0 "0 - Flat Plate Collector, 1 - Compound Parabolic Collector" annotation(Dialog(tab="Parameters"));
	parameter Real SF3_ST_CollectorSurface_m2=2 "ST_CollectorSurface_m2" annotation(Dialog(tab="Parameters"));
	parameter Real SF3_ST_CollectorVolume_m3=1.7 "ST_CollectorVolume_m3" annotation(Dialog(tab="Parameters"));
	parameter Real SF3_PV_PeakPower_kW=10 "Installed PV peak Power" annotation(Dialog(tab="Parameters"));
	parameter Real SF3_TS_S_TM_BT_1_init=40 "initial temperature of lowest storage layer" annotation(Dialog(tab="Parameters"));
	parameter Real SF3_TS_S_TM_BT_10_init=60 "initial temperature of highest storage layer" annotation(Dialog(tab="Parameters"));
	parameter Real SF3_T_reference_BT=20 "Reference temperature of BT to calculate SOC, T_Sto = T_ref => SOC = 0" annotation(Dialog(tab="Parameters"));
	parameter Real SF3_T_max_BT=95 "Maximum temperature of storage, T_sto = T_max => SOC = 1" annotation(Dialog(tab="Parameters"));
	Real HP_S_TM_VL(quantity="Basics.Real") "Heat pump flow temperature (output of the outdoor unit)" annotation(Dialog(
		group="Temperatures",
		tab="Results HP",
		visible=false));
	Real HP_S_TM_RL(quantity="Basics.Real") "Heat pump return temperature" annotation(Dialog(
		group="Temperatures",
		tab="Results HP",
		visible=false));
	Real HP_S_TM_BC_VL "Heat pump brine flow temperature" annotation(Dialog(
		group="Temperatures",
		tab="Results HP",
		visible=false));
	Real HP_S_TM_BC_RL "Heat pump brine return temperature" annotation(Dialog(
		group="Temperatures",
		tab="Results HP",
		visible=false));
	Real HP_S_FW_HC(quantity="Basics.Real") "Volume flow heat pump" annotation(Dialog(
		group="Volume Flow",
		tab="Results HP",
		visible=false));
	Real HP_S_FW_BC "Brine volume flow heat pump " annotation(Dialog(
		group="Volume Flow",
		tab="Results HP",
		visible=false));
	Real HP_P_heat_HP(quantity="Basics.Real") "Heat output power of the heat pump " annotation(Dialog(
		group="Power",
		tab="Results HP",
		visible=false));
	Real HP_P_elec_is "Total electricity demand of heat pump" annotation(Dialog(
		group="Power",
		tab="Results HP",
		visible=false));
	Real HP_E_heat_HP(quantity="Basics.Real") "Heat output of the heat pump " annotation(Dialog(
		group="Energy",
		tab="Results HP",
		visible=false));
	Real HP_E_elec_consumed "Consumed electric energy of heat pump" annotation(Dialog(
		group="Energy",
		tab="Results HP",
		visible=false));
	Real HP_COP(quantity="Basics.Real") "Coefficiency of performance" annotation(Dialog(
		group="Efficiency",
		tab="Results HP",
		visible=false));
	Real ST_S_TM_VL(quantity="Basics.Real") "Solar thermal flow temperature" annotation(Dialog(
		group="Temperatures",
		tab="Results ST",
		visible=false));
	Real ST_S_TM_RL(quantity="Basics.Real") "Solar thermal return temperature" annotation(Dialog(
		group="Temperatures",
		tab="Results ST",
		visible=false));
	Real ST_S_TM_Collector(quantity="Basics.Real") "ST_S_TM_Collector" annotation(Dialog(
		group="Temperatures",
		tab="Results ST",
		visible=false));
	Real ST_S_FW_HC(quantity="Basics.Real") "Volume flow solar thermal" annotation(Dialog(
		group="Volume Flow",
		tab="Results ST",
		visible=false));
	Real ST_P_heat_is(quantity="Basics.Real") "Heat output power of solar thermal" annotation(Dialog(
		group="Power",
		tab="Results ST",
		visible=false));
	Real ST_E_heat_produced(quantity="Basics.Real") "Heat output of solar thermal" annotation(Dialog(
		group="Energy",
		tab="Results ST",
		visible=false));
	Real PV_P "PV power" annotation(Dialog(
		tab="Results PV",
		visible=false));
	Real PV_E "Produced energy of the PV system" annotation(Dialog(
		tab="Results PV",
		visible=false));
	Real TS_S_TM_HC_VL(quantity="Basics.Real") "Flow temperature consumption side" annotation(Dialog(
		group="Temperatures",
		tab="Results TS",
		visible=false));
	Real TS_S_TM_HC_RL(quantity="Basics.Real") "Return temperature consumption side" annotation(Dialog(
		group="Temperatures",
		tab="Results TS",
		visible=false));
	Real TS_S_TM_PS_VL(quantity="Basics.Real") "Flow temperature producer side" annotation(Dialog(
		group="Temperatures",
		tab="Results TS",
		visible=false));
	Real TS_S_TM_PS_RL(quantity="Basics.Real") "Return temperature producer side" annotation(Dialog(
		group="Temperatures",
		tab="Results TS",
		visible=false));
	Real TS_S_TM_BT_1(quantity="Basics.Real") "Thermal storage temperature 1" annotation(Dialog(
		group="Storage Temperatures",
		__esi_groupCollapsed=true,
		tab="Results TS",
		visible=false));
	Real TS_S_TM_BT_2(quantity="Basics.Real") "Thermal storage temperature 2" annotation(Dialog(
		group="Storage Temperatures",
		tab="Results TS",
		visible=false));
	Real TS_S_TM_BT_3(quantity="Basics.Real") "Thermal storage temperature 3" annotation(Dialog(
		group="Storage Temperatures",
		tab="Results TS",
		visible=false));
	Real TS_S_TM_BT_4(quantity="Basics.Real") "Thermal storage temperature 4" annotation(Dialog(
		group="Storage Temperatures",
		tab="Results TS",
		visible=false));
	Real TS_S_TM_BT_5(quantity="Basics.Real") "Thermal storage temperature 5" annotation(Dialog(
		group="Storage Temperatures",
		tab="Results TS",
		visible=false));
	Real TS_S_TM_BT_6(quantity="Basics.Real") "Thermal storage temperature 6" annotation(Dialog(
		group="Storage Temperatures",
		tab="Results TS",
		visible=false));
	Real TS_S_TM_BT_7(quantity="Basics.Real") "Thermal storage temperature 7" annotation(Dialog(
		group="Storage Temperatures",
		tab="Results TS",
		visible=false));
	Real TS_S_TM_BT_8(quantity="Basics.Real") "Thermal storage temperature 8" annotation(Dialog(
		group="Storage Temperatures",
		tab="Results TS",
		visible=false));
	Real TS_S_TM_BT_9(quantity="Basics.Real") "Thermal storage temperature 9" annotation(Dialog(
		group="Storage Temperatures",
		tab="Results TS",
		visible=false));
	Real TS_S_TM_BT_10(quantity="Basics.Real") "Thermal storage temperature 10" annotation(Dialog(
		group="Storage Temperatures",
		tab="Results TS",
		visible=false));
	Real TS_E_Storage_BT(quantity="Basics.Real") "Energy in thermal storage" annotation(Dialog(
		group="Energy",
		tab="Results TS",
		visible=false));
	Real TS_SOC_BT(quantity="Basics.Real") "State of charge of the thermal storage" annotation(Dialog(
		group="State of charge",
		tab="Results TS",
		visible=false));
	Real HS_S_TM_VL_bM(quantity="Basics.Real") "Heat Sink flow temperature before mixing unit" annotation(Dialog(
		group="Temperatures",
		tab="Results HS",
		visible=false));
	Real HS_S_TM_VL_aM(quantity="Basics.Real") "Heat Sink flow temperature after mixing unit" annotation(Dialog(
		group="Temperatures",
		tab="Results HS",
		visible=false));
	Real HS_S_TM_RL(quantity="Basics.Real") "Heat sink return temperature" annotation(Dialog(
		group="Temperatures",
		tab="Results HS",
		visible=false));
	Real HS_S_TM_HW_VL(quantity="Basics.Real") "Heat sink flow temperature hot water" annotation(Dialog(
		group="Temperatures",
		tab="Results HS",
		visible=false));
	Real HS_S_TM_HW_RL(quantity="Basics.Real") "Heat sink return temperature hot water" annotation(Dialog(
		group="Temperatures",
		tab="Results HS",
		visible=false));
	Real HS_S_FW_HC_aM(quantity="Basics.Real") "Volume flow after mixing unit" annotation(Dialog(
		group="Volume Flow",
		tab="Results HS",
		visible=false));
	Real HS_S_FW_HC_bM(quantity="Basics.Real") "Volume flow before mixing unit" annotation(Dialog(
		group="Volume Flow",
		tab="Results HS",
		visible=false));
	Real HS_S_FW_HW_VL(quantity="Basics.Real") "Volume flow domestic hot water consumption" annotation(Dialog(
		group="Volume Flow",
		tab="Results HS",
		visible=false));
	Real HS_P_DemHeatHC_is(quantity="Basics.Real") "Heating power" annotation(Dialog(
		group="Power",
		tab="Results HS",
		visible=false));
	Real HS_P_DemHeatHW_is(quantity="Basics.Real") "Domestic hot water power" annotation(Dialog(
		group="Power",
		tab="Results HS",
		visible=false));
	Real HS_E_DemHeatHC_consumed(quantity="Basics.Real") "Heating Energy" annotation(Dialog(
		group="Energy",
		tab="Results HS",
		visible=false));
	Real HS_E_DemHeatHW_consumed(quantity="Basics.Real") "Domestic hot water energy" annotation(Dialog(
		group="Energy",
		tab="Results HS",
		visible=false));
	Real CHN_S_TM_TG_TH_1 "CHN_S_TM_TG_TH_1" annotation(Dialog(
		group="Temperatures",
		tab="Results CHN",
		visible=false));
	Real CHN_S_TM_TG_TM_1 "CHN_S_TM_TG_TM_1" annotation(Dialog(
		group="Temperatures",
		tab="Results CHN",
		visible=false));
	Real CHN_S_TM_HC_TH_1 "CHN_S_TM_HC_TH_1" annotation(Dialog(
		group="Temperatures",
		tab="Results CHN",
		visible=false));
	Real CHN_S_TM_HC_TM_1 "CHN_S_TM_HC_TM_1" annotation(Dialog(
		group="Temperatures",
		tab="Results CHN",
		visible=false));
	Real CHN_S_FW_HC_TH "CHN_S_FW_HC_TH" annotation(Dialog(
		group="Volume Flow",
		tab="Results CHN",
		visible=false));
	Real CHN_S_FW_TG_TH "CHN_S_FW_TG_TH" annotation(Dialog(
		group="Volume Flow",
		tab="Results CHN",
		visible=false));
	Real CHN_P_HC_TH "CHN_P_HC_TH" annotation(Dialog(
		group="Power",
		tab="Results CHN",
		visible=false));
	Real CHN_P_TG_TH "CHN_P_TG_TH" annotation(Dialog(
		group="Power",
		tab="Results CHN",
		visible=false));
	Real CHN_E_TH_import "CHN_E_TH_import" annotation(Dialog(
		group="Energy",
		tab="Results CHN",
		visible=false));
	Real CHN_E_TH_export "CHN_E_TH_export" annotation(Dialog(
		group="Energy",
		tab="Results CHN",
		visible=false));
	Modelica.Blocks.Math.Abs abs1 annotation(Placement(transformation(extent={{205,-65},{225,-45}})));
	Modelica.Blocks.Math.Abs abs2 annotation(Placement(transformation(extent={{420,-95},{400,-75}})));
	equation
		// Inputs
		// GSHP
		if GSHP_GSHP_on > 0.5 then
			var_HPon = true;
		else
			var_HPon = false;
		end if;
		var_HPAuxModulation = GSHP_AuxModulation_set / 100;
		if GSHP_A_V3_TL > 0.5 then
			var_SwitchHPTSPort = true;
		else
			var_SwitchHPTSPort = false;
		end if;
		
		// Solar Thermal Collectors
		var_qvSTpump = ST_S_FW_ST_VL_set / 60000;
		
		if ST_A_V3_TL > 0.5 then
			var_SwitchSTTSPort = true;
		else
			var_SwitchSTTSPort = false;
		end if;
		
		// Connection Heat Network
		var_qvDHpump = CHN_S_FW_HC_set / 60000;
		var_qvDHgrid = CHN_S_FW_TG_set / 60000;
		var_TDHgrid_in = CHN_S_TM_TG + 273.15;
		
		// Results
		// GSHP
		HP_S_TM_VL = sF3.HP_S_TM_VL - 273.15;
		HP_S_TM_RL = sF3.HP_S_TM_RL - 273.15;
		HP_S_TM_BC_VL = sF3.HP_S_TM_BC_VL - 273.15;
		HP_S_TM_BC_RL = sF3.HP_S_TM_BC_RL - 273.15;
		HP_S_FW_HC = sF3.HP_S_FW_HC * 60000;
		HP_S_FW_BC = sF3.HP_S_FW_BC * 60000;
		HP_P_heat_HP = sF3.HP_P_heat_is / 1000;
		HP_P_elec_is = sF3.HP_P_elec_is / 1000;
		HP_E_heat_HP = sF3.HP_E_heat_produced / 3600000;
		HP_E_elec_consumed = sF3.HP_E_elec_consumed / 3600000;
		HP_COP = sF3.HP_COP;
		
		// Solar Thermal Collectors
		ST_S_TM_VL = sF3.ST_S_TM_VL - 273.15;
		ST_S_TM_RL = sF3.ST_S_TM_RL - 273.15;
		ST_S_TM_Collector = sF3.ST_S_TM_Collector - 273.15;
		ST_S_FW_HC = sF3.ST_S_FW_HC * 60000;
		ST_E_heat_produced = sF3.ST_E_heat_produced / 3600000;
		ST_P_heat_is = sF3.ST_P_heat_is / 1000;
		
		// PV
		PV_P = sF3.PV_P / 1000 * SF3_PV_PeakPower_kW / 10;
		PV_E = sF3.PV_E / 3600000 * SF3_PV_PeakPower_kW / 10;
		
		//Thermal Storage
		TS_S_TM_HC_VL = sF3.TS_S_TM_HC_VL - 273.15;
		TS_S_TM_HC_RL = sF3.TS_S_TM_HC_RL - 273.15;
		TS_S_TM_PS_VL = sF3.TS_S_TM_PS_VL - 273.15;
		TS_S_TM_PS_RL = sF3.TS_S_TM_PS_RL - 273.15;
		TS_S_TM_BT_1 = sF3.TS_S_TM_BT_1 - 273.15;
		TS_S_TM_BT_2 = sF3.TS_S_TM_BT_2 - 273.15;
		TS_S_TM_BT_3 = sF3.TS_S_TM_BT_3 - 273.15;
		TS_S_TM_BT_4 = sF3.TS_S_TM_BT_4 - 273.15;
		TS_S_TM_BT_5 = sF3.TS_S_TM_BT_5 - 273.15;
		TS_S_TM_BT_6 = sF3.TS_S_TM_BT_6 - 273.15;
		TS_S_TM_BT_7 = sF3.TS_S_TM_BT_7 - 273.15;
		TS_S_TM_BT_8 = sF3.TS_S_TM_BT_8 - 273.15;
		TS_S_TM_BT_9 = sF3.TS_S_TM_BT_9 - 273.15;
		TS_S_TM_BT_10 = sF3.TS_S_TM_BT_10 - 273.15;
		TS_E_Storage_BT = sF3.TS_E_Storage_BT / 3600000;
		TS_SOC_BT = sF3.TS_SOC_BT;
		
		// Heat Sink (Heating)
		HS_S_TM_VL_bM = sF3.HS_S_TM_VL_bM - 273.15;
		HS_S_TM_VL_aM = sF3.HS_S_TM_VL_aM - 273.15;
		HS_S_TM_RL = sF3.HS_S_TM_RL - 273.15;
		HS_S_FW_HC_aM = sF3.HS_S_FW_HC_aM * 60000;
		HS_S_FW_HC_bM = sF3.HS_S_FW_HC_bM * 60000;
		HS_P_DemHeatHC_is = sF3.HS_P_DemHeatHC_is / 1000;
		HS_E_DemHeatHC_consumed = sF3.HS_E_DemHeatHC_consumed / 3600000;
		
		// Heat Sink (Domestic Hot Water)
		HS_S_TM_HW_VL = sF3.HS_S_TM_HW_VL - 273.15;
		HS_S_TM_HW_RL = sF3.HS_S_TM_HW_RL - 273.15;
		HS_S_FW_HW_VL = sF3.HS_S_FW_HW_VL * 60000;
		HS_P_DemHeatHW_is = sF3.HS_P_DemHeatHW_is  / 1000;
		HS_E_DemHeatHW_consumed = sF3.HS_E_DemHeatHW_consumed / 3600000;
		
		// Connection Heat Network
		CHN_S_FW_HC_TH = CHN_S_FW_HC_set;
		CHN_S_FW_TG_TH = CHN_S_FW_TG_set;
		
		if var_qvDHgrid > 0 then	// grid, feed in
			CHN_S_TM_TG_TH_1 = extractVolumeFlow2.TMedium - 273.15;
			CHN_S_TM_TG_TM_1 = CHN_S_TM_TG;
			CHN_P_TG_TH = heatExchanger1.QHeatSec / 1000;
		else	// grid, extract
			CHN_S_TM_TG_TM_1 = extractVolumeFlow2.TMedium - 273.15;
			CHN_S_TM_TG_TH_1 = CHN_S_TM_TG;
			CHN_P_TG_TH = heatExchanger1.QHeatSec / 1000;
		end if;
		
		if var_qvDHpump > 0 then // house, feed in
			CHN_S_TM_HC_TH_1 = defineVolumeFlow1.TMedium - 273.15;
			CHN_S_TM_HC_TM_1 = extractVolumeFlow1.TMedium - 273.15;
			CHN_P_HC_TH = - heatExchanger1.QHeatPrim / 1000;
			der(CHN_E_TH_import) = - heatExchanger1.QHeatPrim / 3600000;
			der(CHN_E_TH_export) = 0;
		else	// house, extract
			CHN_S_TM_HC_TH_1 = extractVolumeFlow1.TMedium - 273.15;
			CHN_S_TM_HC_TM_1 = defineVolumeFlow1.TMedium - 273.15;
			CHN_P_HC_TH = - heatExchanger1.QHeatPrim / 1000;
			der(CHN_E_TH_export) = heatExchanger1.QHeatPrim / 3600000;
			der(CHN_E_TH_import) = 0;
		end if;
	equation
		connect(TDHgrid_in.y,defineVolumeFlow2.TMedium) annotation(Line(
			points={{434,-100},{429,-100},{390,-100},{390,-95},{385,-95}},
			color={0,0,127},
			thickness=0.015625));
		connect(defineVolumeFlow1.Pipe,heatExchanger1.PrimaryInPipe) annotation(Line(
			points={{280,-65},{285,-65},{300,-65},{300,-75},{305,-75}},
			color={190,30,45}));
		connect(extractVolumeFlow2.Pipe,heatExchanger1.SecondaryOutPipe) annotation(Line(
			points={{365,-65},{360,-65},{330,-65},{330,-75},{325,-75}},
			color={190,30,45},
			thickness=0.0625));
		connect(defineVolumeFlow2.Pipe,heatExchanger1.SecondaryInPipe) annotation(Line(
			points={{365,-90},{360,-90},{330,-90},{330,-85},{325,-85}},
			color={190,30,45}));
		connect(extractVolumeFlow1.Pipe,heatExchanger1.PrimaryOutPipe) annotation(Line(
			points={{280,-90},{285,-90},{300,-90},{300,-85},{305,-85}},
			color={190,30,45},
			thickness=0.0625));
		connect(defineVolumeFlow1.TMedium,sF3.DTH_HEXin) annotation(Line(
			points={{260,-70},{255,-70},{159.7,-70},{159.7,-65},{154.7,-65}},
			color={0,0,127},
			thickness=0.0625));
		connect(sF3.TDH_HEXout,extractVolumeFlow1.TMedium) annotation(Line(
			points={{154.7,-75},{159.7,-75},{255,-75},{255,-85},{260,-85}},
			color={0,0,127},
			thickness=0.0625));
		connect(qvDHpump.y,sF3.qvDHpump) annotation(Line(
			points={{189,-115},{184,-115},{159.7,-115},{159.7,-80},{154.7,-80}},
			color={0,0,127},
			thickness=0.0625));
		connect(varHPMode.y,sF3.HPOn) annotation(Line(
			points={{-64,-60},{-59,-60},{100,-60},{105,-60}},
			color={255,0,255},
			thickness=0.0625));
		connect(sF3.HPAUXIn,varHPAuxModulation.y) annotation(Line(
			points={{105,-65},{100,-65},{-59,-65},{-59,-75},{-64,-75}},
			color={0,0,127},
			thickness=0.0625));
		connect(varSwitchHPTSPort.y,sF3.SwitchHPTSPort) annotation(Line(
			points={{-64,-90},{-59,-90},{100,-90},{100,-70},{105,-70}},
			color={255,0,255},
			thickness=0.0625));
		connect(sF3.qvSTpump,qvSTpump.y) annotation(Line(
			points={{105,-45},{100,-45},{-59,-45},{-64,-45}},
			color={0,0,127},
			thickness=0.0625));
		connect(sF3.lV3Phase1,grid1.LVGridA) annotation(Line(
			points={{154.7,-50},{159.7,-50},{195,-50},{195,0},{200,0}},
			color={247,148,29},
			thickness=0.0625));
		connect(environment1.EnvironmentConditions,sF3.environmentConditions1) annotation(Line(
			points={{200,35},{195,35},{159.7,35},{159.7,-40},{154.7,-40}},
			color={192,192,192},
			thickness=0.0625));
		connect(StandardControl.y,sF3.StandardHPcontrol) annotation(Line(
			points={{86,-5},{91,-5},{125,-5},{125,-30},{125,-35}},
			color={255,0,255},
			thickness=0.0625));
		connect(sF3.StandardControlHPSwitch,StandardControl.y) annotation(Line(
			points={{115,-35},{115,-30},{115,-5},{91,-5},{86,-5}},
			color={255,0,255},
			thickness=0.0625));
		connect(sF3.StandardControlSTSwitch,StandardControl.y) annotation(Line(
			points={{135,-35},{135,-30},{135,-5},{91,-5},{86,-5}},
			color={255,0,255},
			thickness=0.0625));
		connect(sF3.StandardSTcontrol,StandardControl.y) annotation(Line(
			points={{145,-35},{145,-30},{145,-5},{91,-5},{86,-5}},
			color={255,0,255},
			thickness=0.0625));
		connect(abs1.u,sF3.qv_HEX) annotation(Line(
			points={{203,-55},{198,-55},{159.7,-55},{159.7,-60},{154.7,-60}},
			color={0,0,127},
			thickness=0.0625));
		connect(abs1.y,defineVolumeFlow1.qvMedium) annotation(Line(
			points={{226,-55},{231,-55},{255,-55},{255,-60},{260,-60}},
			color={0,0,127},
			thickness=0.0625));
		connect(qvDHgrid.y,abs2.u) annotation(Line(
			points={{434,-85},{429,-85},{427,-85},{422,-85}},
			color={0,0,127},
			thickness=0.0625));
		connect(abs2.y,defineVolumeFlow2.qvMedium) annotation(Line(
			points={{399,-85},{394,-85},{390,-85},{385,-85}},
			color={0,0,127},
			thickness=0.0625));
		connect(sF3.SwitchSTTSPort,varSwitchSTTSPort.y) annotation(Line(
			points={{105,-40},{100,-40},{-59,-40},{-59,-30},{-64,-30}},
			color={255,0,255},
			thickness=0.0625));
	annotation(
		__esi_sF2(
			pump2(
				PumpIn(viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo")),
				PumpOut(viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo")),
				ToPump(Pipe(viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"))),
				FromPump(Pipe(viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo")))),
			heatingUnitFlowTemperature1(
				FlowSupply(viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo")),
				ReturnSupply(viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo")),
				ReturnSink(viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo")),
				FlowSink(viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo")),
				MeasFlow(
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
				MeasReturn(
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
				FlowTempControl(
					SupplyFlow(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
					SupplyReturn(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
					SinkFlow(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
					SinkReturn(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
					ToSuppy(Pipe(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"))),
					FromSupply(Pipe(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"))),
					ToSink(Pipe(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"))),
					FromSink(Pipe(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")))),
				CirculationPump(
					PumpIn(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
					PumpOut(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
					ToPump(Pipe(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"))),
					FromPump(Pipe(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"))))),
			dHW_demand1(
				FlowHotWater(viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo")),
				ReturnHotWater(viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo")),
				FromFlow(Pipe(viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"))),
				ToReturn(Pipe(viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo")))),
			WolfCRK12(
				ReturnST(viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo")),
				FlowST(viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo")),
				ToFlow(Pipe(viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"))),
				FromReturn(Pipe(viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo")))),
			defineVolumeFlow1(Pipe(viewinfo[0](
				tabGroupAlignment=589834,
				typename="ModelInfo"))),
			extractVolumeFlow1(Pipe(viewinfo[0](
				tabGroupAlignment=589834,
				typename="ModelInfo"))),
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
			WolfBSP800(
				FromFlow1(Pipe(viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"))),
				ToReturn1(Pipe(viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"))),
				ToReturn2(Pipe(viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"))),
				FromFlow2(Pipe(viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"))),
				FromFlow3(Pipe(viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"))),
				ToReturn3(Pipe(viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"))),
				FromReturn6(Pipe(viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"))),
				ToFlow6(Pipe(viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"))),
				ToFlow7(Pipe(viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"))),
				FromReturn7(Pipe(viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"))),
				ToFlow8(Pipe(viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"))),
				FromReturn8(Pipe(viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"))),
				FlowIn1(viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo")),
				ReturnOut1(viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo")),
				FlowIn2(viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo")),
				ReturnOut2(viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo")),
				FlowIn3(viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo")),
				ReturnOut3(viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo")),
				FlowOut6(viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo")),
				ReturnIn6(viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo")),
				FlowOut7(viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo")),
				ReturnIn7(viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo")),
				FlowOut8(viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo")),
				ReturnIn8(viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo")),
				ToReturn4(Pipe(viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"))),
				FromFlow4(Pipe(viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"))),
				FromFlow5(Pipe(viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"))),
				ToReturn5(Pipe(viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"))),
				FlowIn4(viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo")),
				ReturnOut4(viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo")),
				FlowIn5(viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo")),
				ReturnOut5(viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"))),
			switchPort1(
				HeatGeneratorFlow(viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo")),
				StorageReturnTop(viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo")),
				StorageReturnBottom(viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo")),
				StorageFlowTop(viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo")),
				StorageFlowBottom(viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo")),
				HeatGeneratorReturn(viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo")),
				distributionValve1(
					PipeIn(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
					PipeOutRegulated(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
					PipeOutRemain(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
					FromPipe(Pipe(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"))),
					ToPipe2(Pipe(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"))),
					ToPipe1(Pipe(viewinfo[0](
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
				mergingValve1(
					PipeOut(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
					PipeIn1(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
					PipeIn2(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
					FromPipe1(Pipe(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"))),
					FromPipe2(Pipe(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"))),
					ToPipe(Pipe(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"))))),
			wolfCHA1(
				greenCityConnector1(
					volumeFlowIn(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
					volumeFlowOut(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
					defineVolumeFlow1(Pipe(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"))),
					extractVolumeFlow1(Pipe(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")))),
				Return(viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo")),
				Flow(viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"))),
			simpleHeatedBuilding1(
				PipeIn(viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo")),
				PipeOut(viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo")),
				cellar(
					ToReturn(Pipe(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"))),
					FromFlow(Pipe(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"))),
					HeatFlow(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
					HeatReturn(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"))),
				roof(
					ToReturn(Pipe(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"))),
					FromFlow(Pipe(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"))),
					HeatFlow(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
					HeatReturn(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"))),
				distributorCellar(
					PipeIn(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
					PipeOutRegulated(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
					PipeOutRemain(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
					FromPipe(Pipe(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"))),
					ToPipe2(Pipe(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"))),
					ToPipe1(Pipe(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")))),
				merge_Cellar(
					PipeOut(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
					PipeIn1(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
					PipeIn2(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
					FromPipe1(Pipe(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"))),
					FromPipe2(Pipe(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"))),
					ToPipe(Pipe(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")))),
				MT_Flow(
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
				MT_Return(
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
				distributorLivingZoneRoof(
					PipeIn(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
					PipeOutRegulated(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
					PipeOutRemain(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
					FromPipe(Pipe(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"))),
					ToPipe2(Pipe(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"))),
					ToPipe1(Pipe(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")))),
				mergeLivingZoneRoof(
					PipeOut(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
					PipeIn1(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
					PipeIn2(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
					FromPipe1(Pipe(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"))),
					FromPipe2(Pipe(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"))),
					ToPipe(Pipe(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")))),
				heatingSystemLivingArea(
					HeatFlow(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
					HeatReturn(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
					ToReturn(Pipe(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"))),
					FromFlow(Pipe(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"))))),
			hydraulicSwitch_TS_DH_HG1(
				HeatExchangerIn(viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo")),
				HeatExchangerOut(viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo")),
				HeatGeneratorSupply(viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo")),
				HeatGeneratorReturn(viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo")),
				StorageChargeReturn(viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo")),
				StorageChargeFlow(viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo")),
				StorageDischargeFlow(viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo")),
				StorageDischargeReturn(viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo")),
				StorageChargeOut(Pipe(viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"))),
				FeedInPump(
					PumpIn(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
					PumpOut(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
					ToPump(Pipe(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"))),
					FromPump(Pipe(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")))),
				FeedInValve(
					PipeIn(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
					PipeOutRegulated(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
					PipeOutRemain(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
					FromPipe(Pipe(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"))),
					ToPipe2(Pipe(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"))),
					ToPipe1(Pipe(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")))),
				mergingValve1(
					PipeOut(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
					PipeIn1(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
					PipeIn2(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
					FromPipe1(Pipe(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"))),
					FromPipe2(Pipe(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"))),
					ToPipe(Pipe(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")))),
				mergingValve2(
					PipeOut(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
					PipeIn1(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
					PipeIn2(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
					FromPipe1(Pipe(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"))),
					FromPipe2(Pipe(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"))),
					ToPipe(Pipe(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")))),
				measureThermal3(
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
				DHFeedIn_Extract(
					PipeIn(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
					PipeOutRegulated(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
					PipeOutRemain(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
					FromPipe(Pipe(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"))),
					ToPipe2(Pipe(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"))),
					ToPipe1(Pipe(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")))),
				mergingValve4(
					PipeOut(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
					PipeIn1(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
					PipeIn2(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
					FromPipe1(Pipe(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"))),
					FromPipe2(Pipe(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"))),
					ToPipe(Pipe(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")))),
				measureMixed(
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
				HeatGeneratorValve(
					PipeIn(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
					PipeOutRegulated(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
					PipeOutRemain(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
					FromPipe(Pipe(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"))),
					ToPipe2(Pipe(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"))),
					ToPipe1(Pipe(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")))),
				mergingValve5(
					PipeOut(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
					PipeIn1(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
					PipeIn2(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
					FromPipe1(Pipe(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"))),
					FromPipe2(Pipe(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"))),
					ToPipe(Pipe(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")))),
				measureHGSupply(
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
				measureDHSupply(
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
				DistrictHeatingValve(
					PipeIn(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
					PipeOutRegulated(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
					PipeOutRemain(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
					FromPipe(Pipe(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"))),
					ToPipe2(Pipe(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"))),
					ToPipe1(Pipe(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")))),
				StorageChargeIn(Pipe(viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"))),
				StorageDischargeIn(Pipe(viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"))),
				StorageDischargeOut(Pipe(viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"))),
				StorageChargeIn1(Pipe(viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"))),
				StorageChargeOut1(Pipe(viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"))),
				StorageDischargeOut1(Pipe(viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"))),
				StorageDischargeIn1(Pipe(viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo"))),
				ExtractionPump1(
					PumpIn(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
					PumpOut(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
					ToPump(Pipe(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"))),
					FromPump(Pipe(viewinfo[0](
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
			wolfCGB20_GC1(
				Return(viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo")),
				Flow(viewinfo[0](
					tabGroupAlignment=589834,
					typename="ModelInfo")),
				greenCityConnector1(
					volumeFlowIn(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
					volumeFlowOut(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")),
					defineVolumeFlow1(Pipe(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo"))),
					extractVolumeFlow1(Pipe(viewinfo[0](
						tabGroupAlignment=589834,
						typename="ModelInfo")))))),
		__esi_connection3(viewinfo[0](
			line[0](
				points(
					x={
																																																																																																																																																																																																																																																																												509,524,555,570},
					y={
																																																																																																																																																																																																																																																																									645,645,645,645}),
				pinSrc=sigInDer2.out1,
				pinDst=i2RO2.x,
				typename="Line"),
			typename="ConnectionInfo")),
		__esi_connection4(viewinfo[0](
			line[0](
				points(
					x={
																																																																																																																																																																																																																																																																												344,359,435,450},
					y={
																																																																																																																																																																																																																																																																									645,645,645,645}),
				pinSrc=rI2O2.y,
				pinDst=sigInDer2.in1,
				typename="Line"),
			typename="ConnectionInfo")),
		statAnaRefVar(flags=2),
		__esi_protocols(transient={
																																																																																																														Protocol(var=time),
																																																																																																														Protocol(var=statAnaRefVar)}),
		__esi_solverOptions(
			solver="CVODE",
			typename="ExternalCVODEOptionData"),
		__esi_sF3(hydraulicSwitch_TS_DH1(viewinfo[0](
			fMin=1,
			fMax=100,
			nf=100,
			kindSweep=1,
			expDataFormat=0,
			expNumberFormat="%.7lg",
			expMatrixNames={
							"A","B","C","D","E"},
			typename="AnaLinSysInfo"))),
		__esi_viewinfo[0](
			staticBlocks[0](
				text="{\\\\rtf1\\\\ansi\\\\ansicpg1252\\\\deff0\\\\nouicompat\\\\deflang1031{\\\\fonttbl{\\\\f0\\\\fnil\\\\fcharset0 Tahoma;}}
{\\\\*\\\\generator Riched20 10.0.18362}\\\\viewkind4\\\\uc1 
\\\\pard\\\\f0\\\\fs20 Typeday:\\\\par
Winter - Transission - Summer\\\\par
Saturday/Sunday/Holiday - Weekday\\\\par
Cloudy - Sunny\\\\par
\\\\par
1 - WSC\\\\par
2 - WSS\\\\par
3 - WWS\\\\par
4 - WWC\\\\par
5 - TWC\\\\par
6 - SSS\\\\par
7 - TWS\\\\par
8 - TSS\\\\par
9 - SWC\\\\par
10 - SSC\\\\par
11 - TSC\\\\par
12 - SWS\\\\par
13 - coldest\\\\par
}
",
				border(
					left=5,
					top=5,
					right=5,
					bottom=5),
				position(
					left=375,
					top=0,
					right=600,
					bottom=315),
				frame(
					style=0,
					width=0,
					color=0),
				clrBack=14806254,
				index=0,
				typename="TextBlock"),
			staticBlocks[1](
				text="{\\\\rtf1\\\\ansi\\\\ansicpg1252\\\\deff0\\\\nouicompat\\\\deflang1031{\\\\fonttbl{\\\\f0\\\\fnil\\\\fcharset0 Tahoma;}}
{\\\\*\\\\generator Riched20 10.0.18362}\\\\viewkind4\\\\uc1 
\\\\pard\\\\f0\\\\fs20 HeatingSystem:\\\\par
0 - Radiator Heating\\\\par
1 - Space Heating\\\\par
}
",
				border(
					left=5,
					top=5,
					right=5,
					bottom=5),
				position(
					left=600,
					top=0,
					right=735,
					bottom=60),
				frame(
					style=0,
					width=0,
					color=0),
				clrBack=14806254,
				index=1,
				typename="TextBlock"),
			staticBlocks[2](
				text="{\\\\rtf1\\\\ansi\\\\ansicpg1252\\\\deff0\\\\nouicompat\\\\deflang1031{\\\\fonttbl{\\\\f0\\\\fnil\\\\fcharset0 Tahoma;}}
{\\\\*\\\\generator Riched20 10.0.18362}\\\\viewkind4\\\\uc1 
\\\\pard\\\\f0\\\\fs20 ST_CollectorType:\\\\par
0 - Flat Plate Collector\\\\par
1 - Compound Parabolic Collector\\\\par
}
",
				border(
					left=5,
					top=5,
					right=5,
					bottom=5),
				position(
					left=735,
					top=0,
					right=945,
					bottom=60),
				frame(
					style=0,
					width=0,
					color=0),
				clrBack=14806254,
				index=2,
				typename="TextBlock"),
			typename="ModelInfo"),
		__esi_viewinfo[1](
			fMin=1,
			fMax=100,
			nf=100,
			kindSweep=1,
			expDataFormat=0,
			expNumberFormat="%.7lg",
			expMatrixNames={
							"A","B","C","D","E"},
			typename="AnaLinSysInfo"),
		__esi_viewinfo[2](
			showAll=false,
			hideInfinity=true,
			fMin=0,
			fMax=1000000,
			TMin=0,
			TMax=1000000,
			animGain=-10,
			animFreq=0,
			formatAbsDev="%.4lf",
			formatArgDev="%.2lf",
			formatEnergy="%.4lf",
			minNormDev=0.0001,
			minNormEnergy=1e-06,
			minAbsEnergy=1e-12,
			scaleEnergy=0.01,
			typename="AnaEFEWInfo"),
		__esi_viewinfo[3](
			projectName="SimX_SF3_SiL",
			projectPath="C:\\Users\\gu62xur\\Downloads\\SimX_Veristand",
			projectType=17,
			saveOutputsApproach=1,
			inputs[0](
				port="GSHP_GSHP_on",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			inputs[1](
				port="GSHP_AuxModulation_set",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			inputs[2](
				port="ST_S_FW_ST_VL_set",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			inputs[3](
				port="CHN_S_FW_HC_set",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			inputs[4](
				port="CHN_S_FW_TG_set",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			inputs[5](
				port="CHN_S_TM_TG",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			inputs[6](
				port="GSHP_A_V3_TL",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			inputs[7](
				port="ST_A_V3_TL",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[0](
				port="HP_S_TM_VL",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[1](
				port="HP_S_TM_RL",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[2](
				port="HP_S_TM_BC_VL",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[3](
				port="HP_S_TM_BC_RL",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[4](
				port="HP_S_FW_HC",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[5](
				port="HP_S_FW_BC",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[6](
				port="HP_P_heat_HP",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[7](
				port="HP_P_elec_is",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[8](
				port="HP_E_heat_HP",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[9](
				port="HP_E_elec_consumed",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[10](
				port="HP_COP",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[11](
				port="ST_S_TM_VL",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[12](
				port="ST_S_TM_RL",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[13](
				port="ST_S_TM_Collector",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[14](
				port="ST_S_FW_HC",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[15](
				port="ST_P_heat_is",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[16](
				port="ST_E_heat_produced",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[17](
				port="PV_P",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[18](
				port="PV_E",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[19](
				port="TS_S_TM_HC_VL",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[20](
				port="TS_S_TM_HC_RL",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[21](
				port="TS_S_TM_PS_VL",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[22](
				port="TS_S_TM_PS_RL",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[23](
				port="TS_S_TM_BT_1",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[24](
				port="TS_S_TM_BT_2",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[25](
				port="TS_S_TM_BT_3",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[26](
				port="TS_S_TM_BT_4",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[27](
				port="TS_S_TM_BT_5",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[28](
				port="TS_S_TM_BT_6",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[29](
				port="TS_S_TM_BT_7",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[30](
				port="TS_S_TM_BT_8",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[31](
				port="TS_S_TM_BT_9",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[32](
				port="TS_S_TM_BT_10",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[33](
				port="TS_E_Storage_BT",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[34](
				port="TS_SOC_BT",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[35](
				port="HS_S_TM_VL_bM",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[36](
				port="HS_S_TM_VL_aM",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[37](
				port="HS_S_TM_RL",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[38](
				port="HS_S_TM_HW_VL",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[39](
				port="HS_S_TM_HW_RL",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[40](
				port="HS_S_FW_HC_aM",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[41](
				port="HS_S_FW_HC_bM",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[42](
				port="HS_S_FW_HW_VL",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[43](
				port="HS_P_DemHeatHC_is",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[44](
				port="HS_P_DemHeatHW_is",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[45](
				port="HS_E_DemHeatHC_consumed",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[46](
				port="HS_E_DemHeatHW_consumed",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[47](
				port="CHN_S_TM_TG_TH_1",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[48](
				port="CHN_S_TM_TG_TM_1",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[49](
				port="CHN_S_TM_HC_TH_1",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[50](
				port="CHN_S_TM_HC_TM_1",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[51](
				port="CHN_S_FW_HC_TH",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[52](
				port="CHN_S_FW_TG_TH",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[53](
				port="CHN_P_HC_TH",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[54](
				port="CHN_P_TG_TH",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[55](
				port="CHN_E_TH_import",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[56](
				port="CHN_E_TH_export",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[0](
				port="SF3_Typeday",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[1](
				port="SF3_InitializationTime_h",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[2](
				port="SF3_T_roomSet_degC",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[3](
				port="SF3_T_roomNightSet_degC",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[4](
				port="SF3_NightTimeReductionStart_h",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[5](
				port="SF3_NightTimeReductionEnd_h",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[6](
				port="SF3_HeatingSystem",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[7](
				port="SF3_nPeople",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[8](
				port="SF3_nFloors",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[9](
				port="SF3_nApartments",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[10](
				port="SF3_HeatedArea_m2",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[11](
				port="SF3_YearlyElecConsumption_kWh",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[12](
				port="SF3_V_DHWperDay_l",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[13](
				port="SF3_GSHP_horizontalCollector",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[14](
				port="SF3_GSHP_numberHE",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[15](
				port="SF3_GSHP_HoleDepth_m",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[16](
				port="SF3_GSHP_rHole_m",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[17](
				port="SF3_ST_CollectorType",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[18](
				port="SF3_ST_CollectorSurface_m2",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[19](
				port="SF3_ST_CollectorVolume_m3",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[20](
				port="SF3_PV_PeakPower_kW",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[21](
				port="SF3_TS_S_TM_BT_1_init",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[22](
				port="SF3_TS_S_TM_BT_10_init",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[23](
				port="SF3_T_reference_BT",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[24](
				port="SF3_T_max_BT",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			showAdditionalLibPage=false,
			useCodeOptimization=true,
			m_x64=false,
			solverMode=1,
			typename="CodeExportInfo"),
		Icon(
			coordinateSystem(extent={{-125,-125},{125,125}}),
			graphics={
							Text(
								textString="SF3 SiL",
								extent={{-100,126.3},{99.90000000000001,9.9}}),
							Bitmap(
								imageSource="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
EUJd3f8B7chaQ/qC6bMAAAAASUVORK5CYII=",
								extent={{-76.3,-112.7},{88.7,31.5}})}),
		Documentation(info="<HTML><HEAD>
<META http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\"> 
<TITLE>Software in the Loop Model of SF3</TITLE> 
<STYLE type=\"text/css\">
table>tbody>tr:hover,th{background-color:#edf1f3}html{font-size:90%}body,table{font-size:1rem}body{font-family:'Open Sans',Arial,sans-serif;color:#465e70}h1,h2{margin:1em 0 .6em;font-weight:600}p{margin-top:.3em;margin-bottom:.2em}table{border-collapse:collapse;margin:1em 0;width:100%;}tr{border:1px solid #beccd3}td,th{padding:.3em 1em; border-width: 1px; border-style: solid; border-color: rgb(190, 204, 211);}td{word-break:break-word}tr:nth-child(even){background-color:#fafafa}th{font-family:'Open Sans Semibold',Arial,sans-serif;font-weight:700;text-align:left;word-break:keep-all}.lib-wrap{width:70%}@media screen and (max-width:800px){.lib-wrap{width:100%}}td p{margin:.2em}
</STYLE>
 
<META name=\"GENERATOR\" content=\"MSHTML 11.00.10570.1001\"></HEAD> 
<BODY>
<H1>Software in the Loop Model of SF3</H1>
<HR>

<P>Software in the Loop model of SF3 for VeriStand. This model can be used to    
test a controller before doing experiments in the laboratory. The model can be   
generated for using Typedays (similar to HiL models) or for  running it   
continuously.</P>
<P>The model  consists  of the same components as SF3:</P>
<UL>
  <LI>Ground Source Heat Pump (GSHP): Wolf BWS-1 10<BR>nominal heating power /   
          COP   (B0/W35):&nbsp;8.4 kW_th&nbsp;/ 4.7<BR>electric auxiliary 
  heater:   6           kW</LI>
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
<DIV class=\"lib-wrap\">
<TABLE class=\"type\">
  <TBODY>
  <TR>
    <TH>Symbol:</TH>
    <TD colspan=\"3\"><IMG width=\"283\" height=\"168\" src=\"data:image/png;base64,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\"></TD></TR>
  <TR>
    <TH>Identifier:</TH>
    <TD colspan=\"3\">CoSES_Models.CodeExport.VeriStandSiL.SimX_SF3_SiL</TD></TR>
  <TR>
    <TH>Version:</TH>
    <TD colspan=\"3\">1.0</TD></TR>
  <TR>
    <TH>File:</TH>
    <TD colspan=\"3\">SimX_SF3_SiL.mo</TD></TR>
  <TR>
    <TH>Connectors:</TH>
    <TD>GSHP_ASHP_mode</TD>
    <TD>GSHP_GSHP_on</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>GSHP_AuxModulation_set</TD>
    <TD>GSHP_AuxModulation_set</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>ST_S_FW_ST</TD>
    <TD>ST_S_FW_ST_VL_set</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>CHN_S_FW_HC_set</TD>
    <TD>CHN_S_FW_HC_set</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>CHN_S_FW_TG_set</TD>
    <TD>CHN_S_FW_TG_set</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>CHN_S_TM_TG_TH</TD>
    <TD>CHN_S_TM_TG</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>GSHP_A_V3_TL</TD>
    <TD>GSHP_A_V3_TL</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>ST_A_V3_TL</TD>
    <TD>ST_A_V3_TL</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>Parameters:</TH>
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
    <TD>Specifies a Thermal Volume Flow Connector</TD>
    <TD>defineVolumeFlow2</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Extracts the characteristics of a Thermal Volume Flow Connector</TD>
    <TD>extractVolumeFlow2</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Set output signal to a time varying Real expression</TD>
    <TD>qvDHgrid</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Electrical power grid for connection of maximum six 3-phase AC 
      components</TD>
    <TD>grid1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Set output signal to a time varying Real expression</TD>
    <TD>modeltime_s</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Set output signal to a time varying Real expression</TD>
    <TD>qvDHpump</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Set output signal to a time varying Real expression</TD>
    <TD>qvSTpump</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Set output signal to a time varying Real expression</TD>
    <TD>TDHgrid_in</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>NTU heat exchanger</TD>
    <TD>heatExchanger1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Environment with user defined weather profiles</TD>
    <TD>environment1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Set output signal to a time varying Boolean expression</TD>
    <TD>StandardControl</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>SwitchHPTSPort</TD>
    <TD>varSwitchHPTSPort</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>varHPMode</TD>
    <TD>varHPMode</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>varHPAuxModulation</TD>
    <TD>varHPAuxModulation</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>House 3 with ST and GSHP</TD>
    <TD>sF3</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>SwitchSTTSPort</TD>
    <TD>varSwitchSTTSPort</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>If true, Typedays are used</TD>
    <TD>UseTypedays</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>File of all parameters of SF3 (weather, presence, Pel, DHW)</TD>
    <TD>File</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>1 - WSC, 2 - WSS, 3 - WWS, 4 - WWC, 5 - TWC, 6 - SSS, 7 - TWS, 8 - 
      TSS, 9 - SWC, 10 - SSC, 11 - TSC, 12 - SWS, 13 - coldest</TD>
    <TD>SF3_Typeday</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Additional time before the experiment in order to reach initial 
      conditions for the experiment</TD>
    <TD>SF3_InitializationTime_h</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Initial time of the day</TD>
    <TD>InitTime</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>InitialDay</TD>
    <TD>InitDay</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Initial Month</TD>
    <TD>InitMonth</TD>
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
    <TD>T_roomSet_degC</TD>
    <TD>SF3_T_roomSet_degC</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>T_roomNightSet_degC</TD>
    <TD>SF3_T_roomNightSet_degC</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>NightTimeReductionStart_h</TD>
    <TD>SF3_NightTimeReductionStart_h</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>NightTimeReductionEnd_h</TD>
    <TD>SF3_NightTimeReductionEnd_h</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>0 - Radiator Heating, 1 - Space Heating</TD>
    <TD>SF3_HeatingSystem</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>nPeople</TD>
    <TD>SF3_nPeople</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>nFloors</TD>
    <TD>SF3_nFloors</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>nApartments</TD>
    <TD>SF3_nApartments</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>HeatedArea_m2</TD>
    <TD>SF3_HeatedArea_m2</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>YearlyElecConsumption_kWh</TD>
    <TD>SF3_YearlyElecConsumption_kWh</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>V_DHWperDay_l</TD>
    <TD>SF3_V_DHWperDay_l</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>1 -  horizontal collector, 0 - downhole heat exchanger</TD>
    <TD>SF3_GSHP_horizontalCollector</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Number of independent heat exchangers</TD>
    <TD>SF3_GSHP_numberHE</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Depth of hole in meter, for horizontal collectors: laying depth of 
      heat collectors</TD>
    <TD>SF3_GSHP_HoleDepth_m</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Radius of hole in meter, for horizontal collectors: equivalent radius 
      of the flat collector field</TD>
    <TD>SF3_GSHP_rHole_m</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>0 - Flat Plate Collector, 1 - Compound Parabolic Collector</TD>
    <TD>SF3_ST_CollectorType</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>ST_CollectorSurface_m2</TD>
    <TD>SF3_ST_CollectorSurface_m2</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>ST_CollectorVolume_m3</TD>
    <TD>SF3_ST_CollectorVolume_m3</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Installed PV peak Power</TD>
    <TD>SF3_PV_PeakPower_kW</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>initial temperature of lowest storage layer</TD>
    <TD>SF3_TS_S_TM_BT_1_init</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>initial temperature of highest storage layer</TD>
    <TD>SF3_TS_S_TM_BT_10_init</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Reference temperature of BT to calculate SOC, T_Sto = T_ref =&gt; SOC 
      = 0</TD>
    <TD>SF3_T_reference_BT</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Maximum temperature of storage, T_sto = T_max =&gt; SOC = 1</TD>
    <TD>SF3_T_max_BT</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Output the absolute value of the input</TD>
    <TD>abs1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Output the absolute value of the input</TD>
    <TD>abs2</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>Results:</TH>
    <TD>var_qvDHpump</TD>
    <TD>var_qvDHpump</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>var_SwitchHPTSPort</TD>
    <TD>var_SwitchHPTSPort</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>var_qvSTpump</TD>
    <TD>var_qvSTpump</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>var_HPon</TD>
    <TD>var_HPon</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>var_SwitchSTTSPort</TD>
    <TD>var_SwitchSTTSPort</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>var_qvDHgrid</TD>
    <TD>var_qvDHgrid</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>var_TDHgrid_in</TD>
    <TD>var_TDHgrid_in</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>var_HPAuxModulation</TD>
    <TD>var_HPAuxModulation</TD>
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
    <TD>Volume flow heat pump</TD>
    <TD>HP_S_FW_HC</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Brine volume flow heat pump </TD>
    <TD>HP_S_FW_BC</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heat output power of the heat pump </TD>
    <TD>HP_P_heat_HP</TD>
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
    <TD>CHN_S_TM_TG_TH_1</TD>
    <TD>CHN_S_TM_TG_TH_1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>CHN_S_TM_TG_TM_1</TD>
    <TD>CHN_S_TM_TG_TM_1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>CHN_S_TM_HC_TH_1</TD>
    <TD>CHN_S_TM_HC_TH_1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>CHN_S_TM_HC_TM_1</TD>
    <TD>CHN_S_TM_HC_TM_1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>CHN_S_FW_HC_TH</TD>
    <TD>CHN_S_FW_HC_TH</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>CHN_S_FW_TG_TH</TD>
    <TD>CHN_S_FW_TG_TH</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>CHN_P_HC_TH</TD>
    <TD>CHN_P_HC_TH</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>CHN_P_TG_TH</TD>
    <TD>CHN_P_TG_TH</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>CHN_E_TH_import</TD>
    <TD>CHN_E_TH_import</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>CHN_E_TH_export</TD>
    <TD>CHN_E_TH_export</TD>
    <TD>&nbsp;</TD></TR></TBODY></TABLE></DIV>
<H2>Description:</H2>
<P>&nbsp;</P></BODY></HTML>
"),
		experiment(
			StopTime=864000,
			StartTime=0,
			Tolerance=1e-06,
			Interval=0.01,
			__esi_Solver(
				iMode=1,
				typename="FixStep"),
			__esi_SolverOptions(
				solver="FixStep",
				typename="ExternalFixStepOptionData"),
			__esi_MinInterval="0.01",
			__esi_AbsTolerance="1e-6"));
end SimX_SF3_SiL;
