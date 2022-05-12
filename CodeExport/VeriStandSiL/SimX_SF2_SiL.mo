// CP: 65001
// SimulationX Version: 4.2.3.69223
within CoSES_Models.CodeExport.VeriStandSiL;
model SimX_SF2_SiL "Software in the Loop Model of SF2"
	input SignalBlocks.InputPin EB_EBon_off "EB_EBon_off" annotation(Placement(
		transformation(extent={{-55,-140},{-45,-150}}),
		iconTransformation(extent={{-145,-45},{-105,-5}})));
	input SignalBlocks.InputPin ASHP_ASHP_mode "ASHP_ASHP_mode" annotation(Placement(
		transformation(extent={{20,-180},{30,-190}}),
		iconTransformation(extent={{-145,55},{-105,95}})));
	input SignalBlocks.InputPin ASHP_Modulation_set "ASHP_Modulation_set" annotation(Placement(
		transformation(extent={{20,-160},{30,-170}}),
		iconTransformation(extent={{-145,5},{-105,45}})));
	input SignalBlocks.InputPin EB_EB_power_kW_set "EB_EB_power_kW" annotation(Placement(
		transformation(extent={{-55,-160},{-45,-170}}),
		iconTransformation(extent={{-145,-95},{-105,-55}})));
	input SignalBlocks.InputPin ST_S_FW_ST_VL_set "ST_S_FW_ST" annotation(Placement(
		transformation(
			origin={-15,-145},
			extent={{5,5},{-5,-5}},
			rotation=-180),
		iconTransformation(
			origin={-75,-122},
			extent={{-20,-19.7},{20,20.3}},
			rotation=90)));
	input SignalBlocks.InputPin CHN_S_FW_HC_set "CHN_S_FW_HC_set" annotation(Placement(
		transformation(
			origin={60,-145},
			extent={{5,5},{-5,-5}},
			rotation=-180),
		iconTransformation(
			origin={125,75},
			extent={{-20,-20},{20,20}},
			rotation=180)));
	input SignalBlocks.InputPin CHN_S_FW_TG_set "CHN_S_FW_TG_set" annotation(Placement(
		transformation(
			origin={60,-165},
			extent={{5,5},{-5,-5}},
			rotation=-180),
		iconTransformation(
			origin={125,25},
			extent={{-20,-20},{20,20}},
			rotation=180)));
	input SignalBlocks.InputPin CHN_S_TM_TG "CHN_S_TM_TG" annotation(Placement(
		transformation(
			origin={60,-185},
			extent={{5,5},{-5,-5}},
			rotation=-180),
		iconTransformation(
			origin={125,-25},
			extent={{-20,-20},{20,20}},
			rotation=180)));
	input SignalBlocks.InputPin ASHP_A_V3_TL "ASHP_A_V3_TL" annotation(Placement(
		transformation(
			origin={25,-145},
			extent={{5,5},{-5,-5}},
			rotation=-180),
		iconTransformation(
			origin={-75,125},
			extent={{-20,-20},{20,20}},
			rotation=270)));
	GreenCity.Interfaces.Thermal.DefineVolumeFlow defineVolumeFlow1 "Specifies a Thermal Volume Flow Connector" annotation(Placement(transformation(extent={{240,-50},{260,-70}})));
	GreenCity.Interfaces.Thermal.ExtractVolumeFlow extractVolumeFlow1 annotation(Placement(transformation(
		origin={250,-85},
		extent={{-10,-10},{10,10}},
		rotation=-180)));
	GreenCity.Interfaces.Thermal.DefineVolumeFlow defineVolumeFlow2 annotation(Placement(transformation(extent={{375,-75},{355,-95}})));
	GreenCity.Interfaces.Thermal.ExtractVolumeFlow extractVolumeFlow2 annotation(Placement(transformation(
		origin={365,-60},
		extent={{10,-10},{-10,10}},
		rotation=180)));
	Modelica.Blocks.Sources.RealExpression qvDHgrid(y=var_qvDHgrid) "Set output signal to a time varying Real expression" annotation(Placement(transformation(extent={{455,-90},{435,-70}})));
	GreenCity.Utilities.Electrical.Grid grid1(useA=true) annotation(Placement(transformation(extent={{190,-25},{230,15}})));
	Real var_qvDHpump "var_qvDHpump" annotation(Dialog(
		tab="Inputs",
		visible=false));
	Real var_qvDHWpump "var_qvDHWpump" annotation(Dialog(
		tab="Inputs",
		visible=false));
	Real var_qvSTpump "var_qvSTpump" annotation(Dialog(
		tab="Inputs",
		visible=false));
	Real var_CBIn_P "var_CBIn_P" annotation(Dialog(
		tab="Inputs",
		visible=false));
	Real var_qvDHgrid "var_qvDHgrid" annotation(Dialog(
		tab="Inputs",
		visible=false));
	Real var_TDHgrid_in "var_TDHgrid_in" annotation(Dialog(
		tab="Inputs",
		visible=false));
	Real var_HPModulation "var_HPModulation" annotation(Dialog(
		tab="Inputs",
		visible=false));
	Real var_HPAuxModulation "var_HPAuxModulation" annotation(Dialog(
		tab="Inputs",
		visible=false));
	Boolean var_HPMode "var_HPMode" annotation(Dialog(
		tab="Inputs",
		visible=false));
	Boolean var_SwitchHPTSPort "var_SwitchHPTSPort" annotation(Dialog(
		tab="Inputs",
		visible=false));
	parameter String File=if UseTypedays then classDirectory()+"Data\\SF2_Typeday.txt" else classDirectory()+"Data\\SF2_Wholeyear.txt" "File of all parameters of SF2 (weather, presence, Pel, DHW)" annotation(Dialog(tab="Parameters"));
	parameter Boolean UseTypedays=true "If true, Typedays are used" annotation(Dialog(tab="Parameters"));
	parameter Integer SF2_TypeDay=1 "1 - WSC, 2 - WSS, 3 - WWS, 4 - WWC, 5 - TWC, 6 - SSS, 7 - TWS, 8 - TSS, 9 - SWC, 10 - SSC, 11 - TSC, 12 - SWS, 13 - coldest" annotation(Dialog(tab="Parameters"));
	parameter Integer SF2_InitializationTime_h=1 "Additional time before the experiment in order to reach initial conditions for the experiment" annotation(Dialog(tab="Parameters"));
	parameter Integer InitTime=if UseTypedays then 24-SF2_InitializationTime_h else 0 "Initial time of the day" annotation(Dialog(tab="Parameters"));
	parameter Integer InitDay=if UseTypedays then integer(mod(SF2_TypeDay*3-2, 31)) else 1 "InitialDay" annotation(Dialog(tab="Parameters"));
	parameter Integer InitMonth=if UseTypedays then integer((SF2_TypeDay*3-2)/31)+1 else 1 "Initial Month" annotation(Dialog(tab="Parameters"));
	parameter Real TLiving_Init=if SF2_TypeDay == 1 then 21 elseif SF2_TypeDay == 2 then 21 elseif SF2_TypeDay == 3 then 21 elseif SF2_TypeDay == 4 then 21 elseif SF2_TypeDay == 5 then 21 elseif SF2_TypeDay == 6 then 21 elseif SF2_TypeDay == 7 then 21 elseif SF2_TypeDay == 8 then 21 elseif SF2_TypeDay == 9 then 23.45 elseif SF2_TypeDay == 10 then 23.34 elseif SF2_TypeDay == 11 then 22.62 elseif SF2_TypeDay == 12 then 23.54 else 21 "Initial Temperature" annotation(Dialog(tab="Parameters"));
	parameter Real TRoof_Init=if SF2_TypeDay == 1 then 5.9 elseif SF2_TypeDay == 2 then 4.88 elseif SF2_TypeDay == 3 then 6.99 elseif SF2_TypeDay == 4 then 6.44 elseif SF2_TypeDay == 5 then 12.84 elseif SF2_TypeDay == 6 then 13.79 elseif SF2_TypeDay == 7 then 16.70 elseif SF2_TypeDay == 8 then 11.64 elseif SF2_TypeDay == 9 then 21.87 elseif SF2_TypeDay == 10 then 22.46 elseif SF2_TypeDay == 11 then 20.92 elseif SF2_TypeDay == 12 then 23.33 else 6.11 "Initial Temperature" annotation(Dialog(tab="Parameters"));
	parameter Real TCellar_Init=if SF2_TypeDay == 1 then 7.91 elseif SF2_TypeDay == 2 then 7.60 elseif SF2_TypeDay == 3 then 10.40 elseif SF2_TypeDay == 4 then 9.79 elseif SF2_TypeDay == 5 then 14.20 elseif SF2_TypeDay == 6 then 10.66 elseif SF2_TypeDay == 7 then 15.97 elseif SF2_TypeDay == 8 then 9.43 elseif SF2_TypeDay == 9 then 17.71 elseif SF2_TypeDay == 10 then 16.80 elseif SF2_TypeDay == 11 then 17.50 elseif SF2_TypeDay == 12 then 18.40 else 7.49 "Initial Temperature" annotation(Dialog(tab="Parameters"));
	parameter Real SF2_T_roomSet_degC=21 "T_roomSet_degC" annotation(Dialog(tab="Parameters"));
	parameter Real SF2_T_roomNightSet_degC=21 "T_roomNightSet_degC" annotation(Dialog(tab="Parameters"));
	parameter Real SF2_NightTimeReductionStart_h=23 "NightTimeReductionStart_h" annotation(Dialog(tab="Parameters"));
	parameter Real SF2_NightTimeReductionEnd_h=7 "NightTimeReductionEnd_h" annotation(Dialog(tab="Parameters"));
	parameter Integer SF2_HeatingSystem=1 "0 - Radiator Heating, 1 - Space Heating" annotation(Dialog(tab="Parameters"));
	parameter Integer SF2_nPeople=6 "nPeople" annotation(Dialog(tab="Parameters"));
	parameter Integer SF2_nFloors=2 "nFloors" annotation(Dialog(tab="Parameters"));
	parameter Integer SF2_nApartments=1 "nApartments" annotation(Dialog(tab="Parameters"));
	parameter Real SF2_HeatedArea_m2=300 "HeatedArea_m2" annotation(Dialog(tab="Parameters"));
	parameter Real SF2_YearlyElecConsumption_kWh=6500 "YearlyElecConsumption_kWh" annotation(Dialog(tab="Parameters"));
	protected
		parameter Real ElFactor=SF2_YearlyElecConsumption_kWh/5175 "ElFactor" annotation(Dialog(tab="Parameters"));
	public
		parameter Real SF2_V_DHWperDay_l=300 "V_DHWperDay_l" annotation(Dialog(tab="Parameters"));
		parameter Real DHWFactor=SF2_V_DHWperDay_l/300 "DHWFactor" annotation(Dialog(tab="Parameters"));
		parameter Integer SF2_ST_CollectorType=0 "0 - Flat Plate Collector, 1 - Compound Parabolic Collector" annotation(Dialog(tab="Parameters"));
		parameter Real SF2_ST_CollectorSurface_m2=2 "ST_CollectorSurface_m2" annotation(Dialog(tab="Parameters"));
		parameter Real SF2_ST_CollectorVolume_m3=1.7 "ST_CollectorVolume_m3" annotation(Dialog(tab="Parameters"));
		parameter Real SF2_PV_PeakPower_kW=10 "PV_PeakPower_kW" annotation(Dialog(tab="Parameters"));
		parameter Real SF2_TS_S_TM_BT_1_init=40 "initial temperature of lowest storage layer" annotation(Dialog(tab="Parameters"));
		parameter Real SF2_TS_S_TM_BT_10_init=60 "initial temperature of highest storage layer" annotation(Dialog(tab="Parameters"));
		parameter Real SF2_T_reference_BT=20 "Reference temperature of BT to calculate SOC, T_Sto = T_ref => SOC = 0" annotation(Dialog(tab="Parameters"));
		parameter Real SF2_T_max_BT=95 "Maximum temperature of storage, T_sto = T_max => SOC = 1" annotation(Dialog(tab="Parameters"));
		Real CB_S_TM_VL(quantity="Basics.Real") "Condensing boiler flow temperature" annotation(Dialog(
			group="Temperatures",
			tab="Results CB",
			visible=false));
		Real CB_S_TM_RL(quantity="Basics.Real") "Condensing boiler return temperature" annotation(Dialog(
			group="Temperatures",
			tab="Results CB",
			visible=false));
		Real CB_S_FW_HC(quantity="Basics.Real") "Volume flow condensing boiler" annotation(Dialog(
			group="Volume Flow",
			tab="Results CB",
			visible=false));
		Real CB_S_FG(quantity="Basics.Real") "Gas flow condensing boiler" annotation(Dialog(
			group="Volume Flow",
			tab="Results CB",
			visible=false));
		Real CB_VFuel(quantity="Basics.Real") "Demanded fuel volume" annotation(Dialog(
			group="Volume Flow",
			tab="Results CB",
			visible=false));
		Real CB_P_heat_is(quantity="Basics.Real") "Heat output power of condensing boiler" annotation(Dialog(
			group="Power",
			tab="Results CB",
			visible=false));
		Real CB_P_gas_is(quantity="Basics.Real") "Gas power of condensing boiler" annotation(Dialog(
			group="Power",
			tab="Results CB",
			visible=false));
		Real CB_E_heat_produced(quantity="Basics.Real") "Heat output of condensing boiler" annotation(Dialog(
			group="Energy",
			tab="Results CB",
			visible=false));
		Real CB_E_gas_consumed(quantity="Basics.Real") "Gas input of condensing boiler" annotation(Dialog(
			group="Energy",
			tab="Results CB",
			visible=false));
		Real CB_Efficiency(quantity="Basics.Real") "Heating efficiency" annotation(Dialog(
			group="Efficiency",
			tab="Results CB",
			visible=false));
		Real HP_S_TM_VL(quantity="Basics.Real") "Heat pump flow temperature (output of the outdoor unit)" annotation(Dialog(
			group="Temperatures",
			tab="Results HP",
			visible=false));
		Real HP_S_TM_RL(quantity="Basics.Real") "Heat pump return temperature" annotation(Dialog(
			group="Temperatures",
			tab="Results HP",
			visible=false));
		Real HP_S_TM_HC_TL "Heat pump flow temperature - Low temperature" annotation(Dialog(
			group="Temperatures",
			tab="Results HP",
			visible=false));
		Real HP_S_TM_HW_TH "Heat pump flow temperature - High temperature" annotation(Dialog(
			group="Temperatures",
			tab="Results HP",
			visible=false));
		Real HP_S_FW_HC(quantity="Basics.Real") "Volume flow heat pump" annotation(Dialog(
			group="Volume Flow",
			tab="Results HP",
			visible=false));
		Real HP_P_heat_HP(quantity="Basics.Real") "Heat output power of the heat pump " annotation(Dialog(
			group="Power",
			tab="Results HP",
			visible=false));
		Real HP_P_heat_Aux(quantity="Basics.Real") "Heat output power of the auxiliary heater" annotation(Dialog(
			group="Power",
			tab="Results HP",
			visible=false));
		Real HP_P_heat_Tot(quantity="Basics.Real") "Total heat output power of the heat pump" annotation(Dialog(
			group="Power",
			tab="Results HP",
			visible=false));
		Real HP_P_cooling "Cooling output of the heat pump" annotation(Dialog(
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
		Real HP_E_heat_Aux(quantity="Basics.Real") "Heat output power of the auxiliary heater" annotation(Dialog(
			group="Energy",
			tab="Results HP",
			visible=false));
		Real HP_E_heat_Tot(quantity="Basics.Real") "Total heat output power of the heat pump" annotation(Dialog(
			group="Energy",
			tab="Results HP",
			visible=false));
		Real HP_E_cooling "Cooling output of the heat pump" annotation(Dialog(
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
		Real HP_EER(quantity="Basics.Real") "Energy Efficiency Ratio (Cooling)" annotation(Dialog(
			group="Efficiency",
			tab="Results HP",
			visible=false));
		Real ST_S_TM_VL(quantity="Basics.Real") "Solar thermal flow temperature" annotation(Dialog(
			group="Temperatures",
			tab="Results ST / PV",
			visible=false));
		Real ST_S_TM_RL(quantity="Basics.Real") "Solar thermal return temperature" annotation(Dialog(
			group="Temperatures",
			tab="Results ST / PV",
			visible=false));
		Real ST_S_TM_Collector(quantity="Basics.Real") "ST_S_TM_Collector" annotation(Dialog(
			group="Temperatures",
			tab="Results ST / PV",
			visible=false));
		Real ST_S_FW_HC(quantity="Basics.Real") "Volume flow solar thermal" annotation(Dialog(
			group="Volume Flow",
			tab="Results ST / PV",
			visible=false));
		Real ST_P_heat_is(quantity="Basics.Real") "Heat output power of solar thermal" annotation(Dialog(
			group="Power",
			tab="Results ST / PV",
			visible=false));
		Real PV_P_gen "PV output" annotation(Dialog(
			group="Power",
			tab="Results ST / PV",
			visible=false));
		Real ST_E_heat_produced(quantity="Basics.Real") "Heat output of solar thermal" annotation(Dialog(
			group="Energy",
			tab="Results ST / PV",
			visible=false));
		Real PV_E_gen "PV output" annotation(Dialog(
			group="Energy",
			tab="Results ST / PV",
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
		Real TS_S_TM_HC_HW_VL(quantity="Basics.Real") "Flow temperature to DHW storage" annotation(Dialog(
			group="Temperatures",
			tab="Results TS",
			visible=false));
		Real TS_S_TM_HC_HW_RL(quantity="Basics.Real") "Return temperature to DHW storage" annotation(Dialog(
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
		Real TS_P_heat_from_to_BT "TS_P_heat_from_to_BT" annotation(Dialog(
			group="Power",
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
		Real Modeltime_s "Modeltime_s" annotation(Dialog(
			tab="Results HS",
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
		Real S_TM_roof "S_TM_roof" annotation(Dialog(
			group="Temperatures",
			tab="Results HS",
			visible=false));
		Real S_TM_room "S_TM_room" annotation(Dialog(
			group="Temperatures",
			tab="Results HS",
			visible=false));
		Real S_TM_cellar "S_TM_cellar" annotation(Dialog(
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
		Real S_TM_ambient "S_TM_ambient" annotation(Dialog(
			tab="Results Weather",
			visible=false));
		Real DiffuseRadiation_W_per_m2 "Diffuse radiation" annotation(Dialog(
			tab="Results Weather",
			visible=false));
		Real DirectRadiation_W_per_m2 "Direct radiation" annotation(Dialog(
			tab="Results Weather",
			visible=false));
		Real RelativHumidityAir_percent "Relative humidity of the air" annotation(Dialog(
			tab="Results Weather",
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
		Modelica.Blocks.Sources.RealExpression modeltime_s(y=time) "Set output signal to a time varying Real expression" annotation(Placement(transformation(extent={{120,30},{140,50}})));
		Modelica.Blocks.Sources.RealExpression qvDHpump(y=var_qvDHpump) "Set output signal to a time varying Real expression" annotation(Placement(transformation(extent={{210,-125},{190,-105}})));
		Modelica.Blocks.Sources.RealExpression HPAuxModulation(y=var_HPAuxModulation) "Set output signal to a time varying Real expression" annotation(Placement(transformation(extent={{5,-85},{25,-65}})));
		Modelica.Blocks.Sources.RealExpression qvSTpump(y=var_qvSTpump) "Set output signal to a time varying Real expression" annotation(Placement(transformation(extent={{5,-40},{25,-20}})));
		Modelica.Blocks.Sources.RealExpression HPModulation(y=var_HPModulation) "Set output signal to a time varying Real expression" annotation(Placement(transformation(extent={{5,-100},{25,-80}})));
		Modelica.Blocks.Sources.RealExpression CBIn_P(y=var_CBIn_P) "Set output signal to a time varying Real expression" annotation(Placement(transformation(extent={{5,-115},{25,-95}})));
		Modelica.Blocks.Sources.RealExpression TDHgrid_in(y=var_TDHgrid_in) "Set output signal to a time varying Real expression" annotation(Placement(transformation(extent={{455,-110},{435,-90}})));
		GreenCity.Utilities.Thermal.HeatExchanger heatExchanger1(
			AHeatExchanger=0.506,
			Vprim=0.00044,
			Vsec=0.00044,
			k=5820) annotation(Placement(transformation(extent={{295,-85},{315,-65}})));
		Environment.Environment environment1(
			ReferenceDay=false,
			InputFile=if UseTypedays then File else classDirectory()+"Data\\Weather_2021_Munich_15min.txt",
			DefaultInit=false,
			DayTimeInit=InitTime,
			MonthDayInit=InitDay,
			MonthInit=InitMonth) annotation(Placement(transformation(extent={{190,20},{220,50}})));
		Modelica.Blocks.Sources.BooleanExpression StandardControl(y=false) annotation(Placement(transformation(extent={{65,-30},{85,-10}})));
		Houses.SF2 SF2(
			wolfCHA1(wolfCHA1(
				PElHeatFactor_table(tableID "External table object"),
				PHeatFactor_table(tableID "External table object"),
				PElHeatModulationFactor_table(tableID "External table object"),
				PHeatModulationFactor_table(tableID "External table object"),
				PElCoolingFactor_table(tableID "External table object"),
				PCoolingFactor_table(tableID "External table object"),
				PElCoolingModulationFactor_table(tableID "External table object"),
				PCoolingModulationFactor_table(tableID "External table object"))),
			CPC=SF2_ST_CollectorType==1,
			AModule=SF2_ST_CollectorSurface_m2,
			VAbsorber=SF2_ST_CollectorVolume_m3,
			Tmax_TS(displayUnit="K")=SF2_T_max_BT + 273.15,
			T0_TS(displayUnit="K")=SF2_T_reference_BT + 273.15,
			TSTupInit(displayUnit="K")=SF2_TS_S_TM_BT_10_init + 273.15,
			TSTlowInit(displayUnit="K")=SF2_TS_S_TM_BT_1_init + 273.15,
			nPeople=SF2_nPeople,
			nFloors=SF2_nFloors,
			nApartments=SF2_nApartments,
			ALH=SF2_HeatedArea_m2,
			n=if SF2_HeatingSystem==0 then 1.3 else 1,
			TFlowHeatNorm(displayUnit="K")=if SF2_HeatingSystem==0 then 333.15 else 313.15,
			TReturnHeatNorm(displayUnit="K")=if SF2_HeatingSystem==0 then 318.15 else 303.15,
			TRef(displayUnit="K")=SF2_T_roomSet_degC + 273.15,
			TLiving_Init(displayUnit="K")=TLiving_Init+273.15,
			TRoof_Init(displayUnit="K")=TRoof_Init+273.15,
			TCellar_Init(displayUnit="K")=TCellar_Init+273.15,
			PresenceFile=File,
			ElConsumptionFile=File,
			YearlyElecConsumption_kWh=SF2_YearlyElecConsumption_kWh,
			ElFactor=ElFactor,
			ActivateNightTimeReduction=true,
			NightTimeReductionStart(displayUnit="s")=SF2_NightTimeReductionStart_h*3600,
			NightTimeReductionEnd(displayUnit="s")=SF2_NightTimeReductionEnd_h*3600,
			Tnight(displayUnit="K")=SF2_T_roomNightSet_degC+273.15,
			File=File,
			V_DHWperDay_l=SF2_V_DHWperDay_l,
			DHWfactor=DHWFactor,
			PVPeak(displayUnit="kW"),
			wolfCGB20_GC1(wolfCGB1(
				EffHeat_table(tableID "External table object"),
				PHeat_table(tableID "External table object"),
				DeltaT_table(tableID "External table object")))) annotation(Placement(transformation(extent={{100,-85},{150,-35}})));
		Modelica.Blocks.Sources.BooleanExpression HPMode(y=var_HPMode) "Standard control for DHW pump (input for TS_S_FW_HC_HW_set is ignored if true)" annotation(Placement(transformation(extent={{5,-70},{25,-50}})));
		Modelica.Blocks.Sources.BooleanExpression SwitchHPTSPort(y=var_SwitchHPTSPort) annotation(Placement(transformation(extent={{5,-55},{25,-35}})));
		Modelica.Blocks.Math.Abs abs1 annotation(Placement(transformation(extent={{200,-60},{220,-40}})));
		Modelica.Blocks.Math.Abs abs2 annotation(Placement(transformation(extent={{420,-90},{400,-70}})));
	equation
		// Inputs
		// Condensing Boiler
		if EB_EBon_off > 0.5 then
			var_CBIn_P = EB_EB_power_kW_set * 1000;
		else
			var_CBIn_P = 0;
		end if;
		
		// ASHP
		if ASHP_ASHP_mode > 2.5 then
			var_HPMode = true;
			var_HPModulation = 1;
			var_HPAuxModulation = ASHP_Modulation_set / 100;
		elseif ASHP_ASHP_mode > 1.5 then
			var_HPMode = true;
			var_HPModulation = ASHP_Modulation_set / 100;
			var_HPAuxModulation = 0;
		elseif ASHP_ASHP_mode > 1.5 then
			var_HPMode = false;
			var_HPModulation = ASHP_Modulation_set / 100;
			var_HPAuxModulation = 0;
		else
			var_HPMode = true;
			var_HPModulation = 0;
			var_HPAuxModulation = 0;
		end if;
		if ASHP_A_V3_TL > 0.5 then
			var_SwitchHPTSPort = false;
		else
			var_SwitchHPTSPort = true;
		end if;
		
		// Solar Thermal Collectors
		var_qvSTpump = ST_S_FW_ST_VL_set / 60000;
		
		// Hot Water Storage
		var_qvDHWpump = 0;
		
		// Connection Heat Network
		var_qvDHpump = CHN_S_FW_HC_set / 60000;
		var_qvDHgrid = CHN_S_FW_TG_set / 60000;
		var_TDHgrid_in = CHN_S_TM_TG + 273.15;
		
		// Results
		// Condensing Boiler
		CB_S_TM_VL = SF2.CB_S_TM_VL - 273.15;
		CB_S_TM_RL = SF2.CB_S_TM_RL - 273.15;
		CB_S_FW_HC = SF2.CB_S_FW_HC * 60000;
		CB_S_FG = SF2.CB_S_FG * 60000;
		CB_VFuel = SF2.CB_VFuel * 1000;
		CB_P_heat_is = SF2.CB_P_heat_is / 1000;
		CB_P_gas_is = SF2.CB_P_gas_is / 1000;
		CB_E_heat_produced = SF2.CB_E_heat_produced / 3600000;
		CB_E_gas_consumed = SF2.CB_E_gas_consumed / 3600000;
		CB_Efficiency = SF2.CB_Efficiency;
		
		// ASHP
		HP_S_TM_VL = SF2.HP_S_TM_VL - 273.15;
		HP_S_TM_RL = SF2.HP_S_TM_RL - 273.15;
		HP_S_TM_HC_TL = SF2.HP_S_TM_HC_TL - 273.15;
		HP_S_TM_HW_TH = SF2.HP_S_TM_HW_TH - 273.15;
		HP_S_FW_HC = SF2.HP_S_FW_HC * 60000;
		HP_P_heat_HP = SF2.HP_P_heat_HP / 1000;
		HP_P_heat_Aux = SF2.HP_P_heat_Aux / 1000;
		HP_P_heat_Tot = SF2.HP_P_heat_Tot / 1000;
		HP_P_cooling = SF2.HP_P_cooling / 1000;
		HP_P_elec_is = SF2.HP_P_elec_is / 1000;
		HP_E_heat_HP = SF2.HP_E_heat_HP / 3600000;
		HP_E_heat_Aux = SF2.HP_E_heat_Aux / 3600000;
		HP_E_heat_Tot = SF2.HP_E_heat_Tot / 3600000;
		HP_E_cooling = SF2.HP_E_cooling / 3600000;
		HP_E_elec_consumed = SF2.HP_E_elec_consumed / 3600000;
		HP_COP = SF2.HP_COP;
		HP_EER = SF2.HP_EER;
		
		// Solar Thermal Collectors
		ST_S_TM_VL = SF2.ST_S_TM_VL - 273.15;
		ST_S_TM_RL = SF2.ST_S_TM_RL - 273.15;
		ST_S_TM_Collector = SF2.ST_S_TM_Collector - 273.15;
		ST_S_FW_HC = SF2.ST_S_FW_HC * 60000;
		ST_E_heat_produced = SF2.ST_E_heat_produced / 3600000;
		ST_P_heat_is = SF2.ST_P_heat_is / 1000;
		
		//Thermal Storage
		TS_S_TM_HC_VL = SF2.TS_S_TM_HC_VL - 273.15;
		TS_S_TM_HC_RL = SF2.TS_S_TM_HC_RL - 273.15;
		TS_S_TM_PS_VL = SF2.TS_S_TM_PS_VL - 273.15;
		TS_S_TM_PS_RL = SF2.TS_S_TM_PS_RL - 273.15;
		TS_S_TM_HC_HW_VL = SF2.TS_S_TM_HC_HW_VL - 273.15;
		TS_S_TM_HC_HW_RL = SF2.TS_S_TM_HC_HW_RL - 273.15;
		TS_S_TM_BT_1 = SF2.TS_S_TM_BT_1 - 273.15;
		TS_S_TM_BT_2 = SF2.TS_S_TM_BT_2 - 273.15;
		TS_S_TM_BT_3 = SF2.TS_S_TM_BT_3 - 273.15;
		TS_S_TM_BT_4 = SF2.TS_S_TM_BT_4 - 273.15;
		TS_S_TM_BT_5 = SF2.TS_S_TM_BT_5 - 273.15;
		TS_S_TM_BT_6 = SF2.TS_S_TM_BT_6 - 273.15;
		TS_S_TM_BT_7 = SF2.TS_S_TM_BT_7 - 273.15;
		TS_S_TM_BT_8 = SF2.TS_S_TM_BT_8 - 273.15;
		TS_S_TM_BT_9 = SF2.TS_S_TM_BT_9 - 273.15;
		TS_S_TM_BT_10 = SF2.TS_S_TM_BT_10 - 273.15;
		TS_P_heat_from_to_BT = CHN_P_HC_TH + CB_P_heat_is - HS_P_DemHeatHC_is;
		TS_E_Storage_BT = SF2.TS_E_Storage_BT / 3600000;
		TS_SOC_BT = SF2.TS_SOC_BT;
		
		// Heat Sink (Heating)
		HS_S_TM_VL_bM = SF2.HS_S_TM_VL_bM - 273.15;
		HS_S_TM_VL_aM = SF2.HS_S_TM_VL_aM - 273.15;
		HS_S_TM_RL = SF2.HS_S_TM_RL - 273.15;
		HS_S_FW_HC_aM = SF2.HS_S_FW_HC_aM * 60000;
		HS_S_FW_HC_bM = SF2.HS_S_FW_HC_bM * 60000;
		HS_P_DemHeatHC_is = SF2.HS_P_DemHeatHC_is / 1000;
		HS_E_DemHeatHC_consumed = SF2.HS_E_DemHeatHC_consumed / 3600000;
		S_TM_roof = SF2.simpleHeatedBuilding1.TZone[3] - 273.15;
		S_TM_room = SF2.simpleHeatedBuilding1.TZone[2] - 273.15;
		S_TM_cellar = SF2.simpleHeatedBuilding1.TZone[1] - 273.15;
		
		
		// Heat Sink (Domestic Hot Water)
		HS_S_TM_HW_VL = SF2.HS_S_TM_HW_VL - 273.15;
		HS_S_TM_HW_RL = SF2.HS_S_TM_HW_RL - 273.15;
		HS_S_FW_HW_VL = SF2.HS_S_FW_HW_VL * 60000;
		HS_P_DemHeatHW_is = SF2.HS_P_DemHeatHW_is  / 1000;
		HS_E_DemHeatHW_consumed = SF2.HS_E_DemHeatHW_consumed / 3600000;
		
		// PV
		PV_P_gen = SF2.PV_P / 1000 * SF2_PV_PeakPower_kW / 10;
		PV_E_gen = SF2.PV_E / 3600000 * SF2_PV_PeakPower_kW / 10;
		
		
		// Weather
		S_TM_ambient = environment1.TAmbient - 273.15;
		DiffuseRadiation_W_per_m2 = environment1.RadiationDiffuse;
		DirectRadiation_W_per_m2 = environment1.RadiationDirect;
		RelativHumidityAir_percent = environment1.relHumidityAir * 100;
		Modeltime_s = modeltime_s.y;
		
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
	initial equation
		// enter your equations here
		CHN_E_TH_import = 0;
		CHN_E_TH_export = 0;
	equation
		connect(TDHgrid_in.y,defineVolumeFlow2.TMedium) annotation(Line(
			points={{434,-100},{429,-100},{380,-100},{380,-90},{375,-90}},
			color={0,0,127},
			thickness=0.015625));
		connect(defineVolumeFlow1.Pipe,heatExchanger1.PrimaryInPipe) annotation(Line(
			points={{260,-60},{265,-60},{290,-60},{290,-70},{295,-70}},
			color={190,30,45}));
		connect(extractVolumeFlow2.Pipe,heatExchanger1.SecondaryOutPipe) annotation(Line(
			points={{355,-60},{350,-60},{320,-60},{320,-70},{315,-70}},
			color={190,30,45},
			thickness=0.0625));
		connect(defineVolumeFlow2.Pipe,heatExchanger1.SecondaryInPipe) annotation(Line(
			points={{355,-85},{350,-85},{320,-85},{320,-80},{315,-80}},
			color={190,30,45}));
		connect(extractVolumeFlow1.Pipe,heatExchanger1.PrimaryOutPipe) annotation(Line(
			points={{260,-85},{265,-85},{290,-85},{290,-80},{295,-80}},
			color={190,30,45},
			thickness=0.0625));
		connect(SF2.DTH_HEXin,defineVolumeFlow1.TMedium) annotation(Line(
			points={{149.7,-65},{154.7,-65},{235,-65},{240,-65}},
			color={0,0,127},
			thickness=0.015625));
		connect(SF2.TDH_HEXout,extractVolumeFlow1.TMedium) annotation(Line(
			points={{149.7,-75},{154.7,-75},{235,-75},{235,-80},{240,-80}},
			color={0,0,127},
			thickness=0.015625));
		connect(qvDHpump.y,SF2.qvDHpump) annotation(Line(
			points={{189,-115},{184,-115},{154.7,-115},{154.7,-80},{149.7,-80}},
			color={0,0,127},
			thickness=0.015625));
		connect(environment1.EnvironmentConditions,SF2.environmentConditions1) annotation(Line(
			points={{190,35},{185,35},{154.7,35},{154.7,-40},{149.7,-40}},
			color={192,192,192},
			thickness=0.0625));
		connect(qvSTpump.y,SF2.qvSTpump) annotation(Line(
			points={{26,-30},{31,-30},{95,-30},{95,-45},{100,-45}},
			color={0,0,127},
			thickness=0.0625));
		connect(SF2.HPModulation,HPModulation.y) annotation(
			Line(
				points={{100,-70},{95,-70},{35,-70},{35,-90},{26,-90}},
				color={0,0,127},
				thickness=0.0625),
			__esi_AutoRoute=false);
		connect(SF2.HPAuxModulation,HPAuxModulation.y) annotation(Line(
			points={{100,-65},{95,-65},{31,-65},{31,-75},{26,-75}},
			color={0,0,127},
			thickness=0.0625));
		connect(SF2.HPMode,HPMode.y) annotation(Line(
			points={{100,-60},{95,-60},{31,-60},{26,-60}},
			color={255,0,255},
			thickness=0.0625));
		connect(SF2.SwitchHPTSPort,SwitchHPTSPort.y) annotation(Line(
			points={{100,-55},{95,-55},{31,-55},{31,-45},{26,-45}},
			color={255,0,255},
			thickness=0.0625));
		connect(CBIn_P.y,SF2.CBIn_P) annotation(Line(
			points={{26,-105},{31,-105},{95,-105},{95,-75},{100,-75}},
			color={0,0,127},
			thickness=0.0625));
		connect(StandardControl.y,SF2.StandardControlCB) annotation(Line(
			points={{86,-20},{91,-20},{110,-20},{110,-30},{110,-35}},
			color={255,0,255},
			thickness=0.0625));
		connect(SF2.StandardControlHPSwitch,StandardControl.y) annotation(Line(
			points={{120,-35},{120,-30},{120,-20},{91,-20},{86,-20}},
			color={255,0,255},
			thickness=0.0625));
		connect(SF2.StandardHPcontrol,StandardControl.y) annotation(Line(
			points={{130,-35},{130,-30},{130,-20},{91,-20},{86,-20}},
			color={255,0,255},
			thickness=0.0625));
		connect(SF2.StandardSTcontrol,StandardControl.y) annotation(Line(
			points={{140,-35},{140,-30},{140,-20},{91,-20},{86,-20}},
			color={255,0,255},
			thickness=0.0625));
		connect(abs1.y,defineVolumeFlow1.qvMedium) annotation(Line(
			points={{221,-50},{226,-50},{235,-50},{235,-55},{240,-55}},
			color={0,0,127},
			thickness=0.0625));
		connect(SF2.qv_HEX,abs1.u) annotation(Line(
			points={{149.7,-60},{154.7,-60},{193,-60},{193,-50},{198,-50}},
			color={0,0,127},
			thickness=0.0625));
		connect(SF2.lV3Phase1,grid1.LVGridA) annotation(Line(
			points={{149.7,-50},{154.7,-50},{185,-50},{185,10},{190,10}},
			color={247,148,29},
			thickness=0.0625));
		connect(abs2.u,qvDHgrid.y) annotation(Line(
			points={{422,-80},{427,-80},{429,-80},{434,-80}},
			color={0,0,127},
			thickness=0.0625));
		connect(abs2.y,defineVolumeFlow2.qvMedium) annotation(Line(
			points={{399,-80},{394,-80},{380,-80},{375,-80}},
			color={0,0,127},
			thickness=0.0625));
	annotation(
		statAnaRefVar(flags=2),
		__esi_sF2(hydraulicSwitch_TS_DH_HG1(viewinfo[0](
			fMin=1,
			fMax=100,
			nf=100,
			kindSweep=1,
			expDataFormat=0,
			expNumberFormat="%.7lg",
			expMatrixNames={
																																																																																																																																																																																																						"A","B","C","D","E"},
			typename="AnaLinSysInfo"))),
		__esi_protocols(transient={
																																																																																																																																								Protocol(var=time),
																																																																																																																																								Protocol(var=statAnaRefVar)}),
		__esi_solverOptions(
			solver="CVODE",
			typename="ExternalCVODEOptionData"),
		__esi_SF2(hydraulicSwitch_TS_DH_HG1(viewinfo[0](
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
			projectName="SimX_SF2_SiL",
			projectPath="C:\\Users\\gu62xur\\Downloads\\SimX_Veristand",
			projectType=17,
			saveOutputsApproach=1,
			inputs[0](
				port="EB_EBon_off",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			inputs[1](
				port="ASHP_ASHP_mode",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			inputs[2](
				port="ASHP_Modulation_set",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			inputs[3](
				port="EB_EB_power_kW_set",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			inputs[4](
				port="ST_S_FW_ST_VL_set",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			inputs[5](
				port="CHN_S_FW_HC_set",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			inputs[6](
				port="CHN_S_FW_TG_set",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			inputs[7](
				port="CHN_S_TM_TG",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			inputs[8](
				port="ASHP_A_V3_TL",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[0](
				port="CB_S_TM_VL",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[1](
				port="CB_S_TM_RL",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[2](
				port="CB_S_FW_HC",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[3](
				port="CB_S_FG",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[4](
				port="CB_VFuel",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[5](
				port="CB_P_heat_is",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[6](
				port="CB_P_gas_is",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[7](
				port="CB_E_heat_produced",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[8](
				port="CB_E_gas_consumed",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[9](
				port="CB_Efficiency",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[10](
				port="HP_S_TM_VL",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[11](
				port="HP_S_TM_RL",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[12](
				port="HP_S_TM_HC_TL",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[13](
				port="HP_S_TM_HW_TH",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[14](
				port="HP_S_FW_HC",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[15](
				port="HP_P_heat_HP",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[16](
				port="HP_P_heat_Aux",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[17](
				port="HP_P_heat_Tot",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[18](
				port="HP_P_cooling",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[19](
				port="HP_P_elec_is",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[20](
				port="HP_E_heat_HP",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[21](
				port="HP_E_heat_Aux",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[22](
				port="HP_E_heat_Tot",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[23](
				port="HP_E_cooling",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[24](
				port="HP_E_elec_consumed",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[25](
				port="HP_COP",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[26](
				port="HP_EER",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[27](
				port="ST_S_TM_VL",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[28](
				port="ST_S_TM_RL",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[29](
				port="ST_S_TM_Collector",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[30](
				port="ST_S_FW_HC",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[31](
				port="ST_P_heat_is",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[32](
				port="PV_P_gen",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[33](
				port="ST_E_heat_produced",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[34](
				port="PV_E_gen",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[35](
				port="TS_S_TM_HC_VL",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[36](
				port="TS_S_TM_HC_RL",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[37](
				port="TS_S_TM_PS_VL",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[38](
				port="TS_S_TM_PS_RL",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[39](
				port="TS_S_TM_HC_HW_VL",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[40](
				port="TS_S_TM_HC_HW_RL",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[41](
				port="TS_S_TM_BT_1",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[42](
				port="TS_S_TM_BT_2",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[43](
				port="TS_S_TM_BT_3",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[44](
				port="TS_S_TM_BT_4",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[45](
				port="TS_S_TM_BT_5",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[46](
				port="TS_S_TM_BT_6",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[47](
				port="TS_S_TM_BT_7",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[48](
				port="TS_S_TM_BT_8",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[49](
				port="TS_S_TM_BT_9",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[50](
				port="TS_S_TM_BT_10",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[51](
				port="TS_P_heat_from_to_BT",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[52](
				port="TS_E_Storage_BT",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[53](
				port="TS_SOC_BT",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[54](
				port="Modeltime_s",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[55](
				port="HS_S_TM_VL_bM",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[56](
				port="HS_S_TM_VL_aM",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[57](
				port="HS_S_TM_RL",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[58](
				port="HS_S_TM_HW_VL",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[59](
				port="HS_S_TM_HW_RL",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[60](
				port="S_TM_roof",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[61](
				port="S_TM_room",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[62](
				port="S_TM_cellar",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[63](
				port="HS_S_FW_HC_aM",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[64](
				port="HS_S_FW_HC_bM",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[65](
				port="HS_S_FW_HW_VL",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[66](
				port="HS_P_DemHeatHC_is",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[67](
				port="HS_P_DemHeatHW_is",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[68](
				port="HS_E_DemHeatHC_consumed",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[69](
				port="HS_E_DemHeatHW_consumed",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[70](
				port="S_TM_ambient",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[71](
				port="DiffuseRadiation_W_per_m2",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[72](
				port="DirectRadiation_W_per_m2",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[73](
				port="RelativHumidityAir_percent",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[74](
				port="CHN_S_TM_TG_TH_1",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[75](
				port="CHN_S_TM_TG_TM_1",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[76](
				port="CHN_S_TM_HC_TH_1",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[77](
				port="CHN_S_TM_HC_TM_1",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[78](
				port="CHN_S_FW_HC_TH",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[79](
				port="CHN_S_FW_TG_TH",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[80](
				port="CHN_P_HC_TH",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[81](
				port="CHN_P_TG_TH",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[82](
				port="CHN_E_TH_import",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[83](
				port="CHN_E_TH_export",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[0](
				port="SF2_TypeDay",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[1](
				port="SF2_InitializationTime_h",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[2](
				port="SF2_T_roomSet_degC",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[3](
				port="SF2_T_roomNightSet_degC",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[4](
				port="SF2_NightTimeReductionStart_h",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[5](
				port="SF2_NightTimeReductionEnd_h",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[6](
				port="SF2_HeatingSystem",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[7](
				port="SF2_nPeople",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[8](
				port="SF2_nFloors",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[9](
				port="SF2_nApartments",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[10](
				port="SF2_HeatedArea_m2",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[11](
				port="SF2_YearlyElecConsumption_kWh",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[12](
				port="SF2_V_DHWperDay_l",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[13](
				port="SF2_ST_CollectorType",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[14](
				port="SF2_ST_CollectorSurface_m2",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[15](
				port="SF2_ST_CollectorVolume_m3",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[16](
				port="SF2_PV_PeakPower_kW",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[17](
				port="SF2_TS_S_TM_BT_1_init",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[18](
				port="SF2_TS_S_TM_BT_10_init",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[19](
				port="SF2_T_reference_BT",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[20](
				port="SF2_T_max_BT",
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
								textString="SF2 SiL",
								extent={{-100,126.3},{99.90000000000001,9.9}}),
							Bitmap(
								imageSource="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",
								extent={{-73,-123.3},{92,59.4}})}),
		Documentation(info="<HTML><HEAD>
<META http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\"> 
<TITLE>Software in the Loop Model of SF2</TITLE> 
<STYLE type=\"text/css\">
table>tbody>tr:hover,th{background-color:#edf1f3}html{font-size:90%}body,table{font-size:1rem}body{font-family:'Open Sans',Arial,sans-serif;color:#465e70}h1,h2{margin:1em 0 .6em;font-weight:600}p{margin-top:.3em;margin-bottom:.2em}table{border-collapse:collapse;margin:1em 0;width:100%;}tr{border:1px solid #beccd3}td,th{padding:.3em 1em; border-width: 1px; border-style: solid; border-color: rgb(190, 204, 211);}td{word-break:break-word}tr:nth-child(even){background-color:#fafafa}th{font-family:'Open Sans Semibold',Arial,sans-serif;font-weight:700;text-align:left;word-break:keep-all}.lib-wrap{width:70%}@media screen and (max-width:800px){.lib-wrap{width:100%}}td p{margin:.2em}
</STYLE>
  
<META name=\"GENERATOR\" content=\"MSHTML 11.00.10570.1001\"></HEAD> 
<BODY>
<H1>Software in the Loop Model of SF2</H1>
<HR>

<P>Software in the Loop model of SF2 for VeriStand. This model can be used to   
test a controller before doing experiments in the laboratory. The model can be  
generated for using Typedays (similar to HiL models) or for  running it  
continuously.</P>
<P>The model  consists  of the same components as SF2:</P>
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
       floors:         2<BR>Number       of apartements: 2<BR>Number of 
  inhabitants:         10<BR>Living       area: 500m²<BR>Heating     
  system:&nbsp;floor         heating&nbsp;(supply / return       
  temperatur:&nbsp;40        /&nbsp;30&nbsp;°C)</LI></UL>
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
            is active):<BR>Switch on at 100%, when:<BR>&nbsp;&nbsp;&nbsp;&nbsp;  
   ASHP   =     on     and (T_Storage,top &lt;&nbsp;T_Start,Aux,high&nbsp;or     
    T_Storage,middle   &lt;     T_Start,Aux,low)<BR>Switch off,       
  when:<BR>&nbsp;&nbsp;&nbsp;&nbsp;   ASHP =     off&nbsp;or       
  (T_Storage,top&nbsp;&gt;&nbsp;T_Stop,Aux,high&nbsp;and             
  T_Storage,middle&nbsp;&gt; T_Stop,Aux,low)<BR><BR></LI>
  <LI>ASHP 3way valve:<BR>Domestic hot water should be produced at a higher      
         priority<BR>Switch to the top ports (DHW), when:<BR>&nbsp;&nbsp;&nbsp;  
             T_Storage,top &lt;&nbsp;T_Start,HP,high<BR>Switch to the middle 
  ports             (heating), when:<BR>&nbsp;&nbsp;&nbsp;             
  T_Storage,top&nbsp;&gt;&nbsp;T_Stop,HP,high<BR><BR></LI>
  <LI>Condensing Boiler:<BR>The condensing boiler should only operate, if the    
             ASHP cannot provide the required heat.<BR>Switched on at 100 %      
   modulation,             when:<BR>&nbsp;&nbsp;&nbsp;&nbsp; T_Storage,top &lt;  
       T_Start,CB and             SOC_Storage &lt; SOCminCB<BR>Switched off,     
      when:<BR>&nbsp;&nbsp;&nbsp;&nbsp;           T_Storage,bottom &gt; 
  T_Stop,CB or         SOC_Storage &gt;   SOCmaxCB<BR><BR></LI>
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
         level.<BR>&nbsp;&nbsp;&nbsp;&nbsp; Between the two temperature  
  boundaries the                 reference volume flow is linearly  
  interpolated.</LI></UL>
<DIV class=\"lib-wrap\">
<TABLE class=\"type\">
  <TBODY>
  <TR>
    <TH>Symbol:</TH>
    <TD colspan=\"3\"><IMG width=\"267\" height=\"244\" src=\"data:image/png;base64,
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\"></TD></TR>
  <TR>
    <TH>Identifier:</TH>
    <TD colspan=\"3\">CoSES_Models.CodeExport.VeriStandSiL.SimX_SF2_SiL</TD></TR>
  <TR>
    <TH>Version:</TH>
    <TD colspan=\"3\">1.0</TD></TR>
  <TR>
    <TH>File:</TH>
    <TD colspan=\"3\">SimX_SF2_SiL.mo</TD></TR>
  <TR>
    <TH>Connectors:</TH>
    <TD>EB_EBon_off</TD>
    <TD>EB_EBon_off</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>ASHP_ASHP_mode</TD>
    <TD>ASHP_ASHP_mode</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>ASHP_Modulation_set</TD>
    <TD>ASHP_Modulation_set</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>EB_EB_power_kW</TD>
    <TD>EB_EB_power_kW_set</TD>
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
    <TD>CHN_S_TM_TG_TH</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>WatchDogCount</TD>
    <TD>WatchDogCount</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>ASHP_A_V3_TL</TD>
    <TD>ASHP_A_V3_TL</TD>
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
    <TD>Signal Input with Derivatives</TD>
    <TD>sigInDer2</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Signal Input to Real Output</TD>
    <TD>i2RO2</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Real Input to Signal Output</TD>
    <TD>rI2O2</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>var_HPMode</TD>
    <TD>var_HPMode</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>var_SwitchHPTSPort</TD>
    <TD>var_SwitchHPTSPort</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>File of all parameters of SF2 (weather, presence, Pel, DHW)</TD>
    <TD>File</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>If true, Typedays are used</TD>
    <TD>UseTypedays</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>1 - WSC, 2 - WSS, 3 - WWS, 4 - WWC, 5 - TWC, 6 - SSS, 7 - TWS, 8 -     
        TSS, 9 - SWC, 10 - SSC, 11 - TSC, 12 - SWS, 13 - coldest</TD>
    <TD>SF2_TypeDay</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Additional time before the experiment in order to reach initial       
      conditions for the experiment</TD>
    <TD>SF2_InitializationTime_h</TD>
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
    <TD>SF2_T_roomSet_degC</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>T_roomNightSet_degC</TD>
    <TD>SF2_T_roomNightSet_degC</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>NightTimeReductionStart_h</TD>
    <TD>SF2_NightTimeReductionStart_h</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>NightTimeReductionEnd_h</TD>
    <TD>SF2_NightTimeReductionEnd_h</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>0 - Radiator Heating, 1 - Space Heating</TD>
    <TD>SF2_HeatingSystem</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>nPeople</TD>
    <TD>SF2_nPeople</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>nFloors</TD>
    <TD>SF2_nFloors</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>nApartments</TD>
    <TD>SF2_nApartments</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>HeatedArea_m2</TD>
    <TD>SF2_HeatedArea_m2</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>YearlyElecConsumption_kWh</TD>
    <TD>SF2_YearlyElecConsumption_kWh</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>V_DHWperDay_l</TD>
    <TD>SF2_V_DHWperDay_l</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>DHWFactor</TD>
    <TD>DHWFactor</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>0 - Flat Plate Collector, 1 - Compound Parabolic Collector</TD>
    <TD>SF2_ST_CollectorType</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>ST_CollectorSurface_m2</TD>
    <TD>SF2_ST_CollectorSurface_m2</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>ST_CollectorVolume_m3</TD>
    <TD>SF2_ST_CollectorVolume_m3</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>PV_PeakPower_kW</TD>
    <TD>SF2_PV_PeakPower_kW</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>initial temperature of lowest storage layer</TD>
    <TD>SF2_TS_S_TM_BT_1_init</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>initial temperature of highest storage layer</TD>
    <TD>SF2_TS_S_TM_BT_10_init</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Reference temperature of BT to calculate SOC, T_Sto = T_ref =&gt; SOC  
           = 0</TD>
    <TD>SF2_T_reference_BT</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Maximum temperature of storage, T_sto = T_max =&gt; SOC = 1</TD>
    <TD>SF2_T_max_BT</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Standard control for switching between upper and lower port (input for 
            ASHP_A_V3_TL is ignored if true)</TD>
    <TD>SF2_HPSwitchStandardControl</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Standard control for solar thermal pump (input for ST_S_FW_ST_set is   
          ignored if true)</TD>
    <TD>SF2_STStandardControl</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Standard control for the HP (input for ASHP_ASHP_mode and       
      ASHP_Modulation_set are ignored if true)</TD>
    <TD>SF2_HPStandardControl</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Standard control for the condensing boiler (input for EB_EBon_off and  
           EB_EB_power_kW_set are ignored if true)</TD>
    <TD>SF2_CBStandardControl</TD>
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
    <TD>HPAuxModulation</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Set output signal to a time varying Real expression</TD>
    <TD>qvSTpump</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Set output signal to a time varying Real expression</TD>
    <TD>HPModulation</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Set output signal to a time varying Real expression</TD>
    <TD>CBIn_P</TD>
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
    <TD>Standard control for switching between upper and lower port (input for 
            ASHP_A_V3_TL is ignored if true)</TD>
    <TD>StandardHPSwitchControl</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Standard control for solar thermal pump (input for ST_S_FW_ST_set is   
          ignored if true)</TD>
    <TD>StandardSTControl</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Standard control for the HP (input for ASHP_ASHP_mode and       
      ASHP_Modulation_set are ignored if true)</TD>
    <TD>StandardHPControl</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Standard control for the condensing boiler (input for EB_EBon_off and  
           EB_EB_power_kW_set are ignored if true)</TD>
    <TD>StandardCBControl</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>House 2 with ST, CB and ASHP</TD>
    <TD>SF2</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Standard control for DHW pump (input for TS_S_FW_HC_HW_set is ignored  
           if true)</TD>
    <TD>HPMode</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Set output signal to a time varying Boolean expression</TD>
    <TD>SwitchHPTSPort</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>Results:</TH>
    <TD>var_qvDHpump</TD>
    <TD>var_qvDHpump</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>var_qvDHWpump</TD>
    <TD>var_qvDHWpump</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>var_qvSTpump</TD>
    <TD>var_qvSTpump</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>var_CBIn_P</TD>
    <TD>var_CBIn_P</TD>
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
    <TD>var_HPModulation</TD>
    <TD>var_HPModulation</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>var_HPAuxModulation</TD>
    <TD>var_HPAuxModulation</TD>
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
    <TD>Volume flow heat pump</TD>
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
    <TD>Modeltime_s</TD>
    <TD>Modeltime_s</TD>
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
    <TD>S_TM_ambient</TD>
    <TD>S_TM_ambient</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>S_TM_roof</TD>
    <TD>S_TM_roof</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>S_TM_room</TD>
    <TD>S_TM_room</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>S_TM_cellar</TD>
    <TD>S_TM_cellar</TD>
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
end SimX_SF2_SiL;
