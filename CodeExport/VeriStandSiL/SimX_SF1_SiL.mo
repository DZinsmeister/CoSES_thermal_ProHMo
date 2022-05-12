// CP: 65001
// SimulationX Version: 4.2.3.69223
within CoSES_Models.CodeExport.VeriStandSiL;
model SimX_SF1_SiL "Software in the Loop Model of SF1"
	input SignalBlocks.InputPin CHP_CHPon_off "CHP_CHPon_off" annotation(Placement(
		transformation(extent={{-95,-140},{-85,-150}}),
		iconTransformation(extent={{-145,55},{-105,95}})));
	input SignalBlocks.InputPin CHP_elPowerCHP_set "CHP_elPowerCHP" annotation(Placement(
		transformation(extent={{-95,-160},{-85,-170}}),
		iconTransformation(extent={{-145,5},{-105,45}})));
	input SignalBlocks.InputPin EB_EBon_off "EB_EBon_off" annotation(Placement(
		transformation(extent={{-55,-140},{-45,-150}}),
		iconTransformation(extent={{-145,-45},{-105,-5}})));
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
	input SignalBlocks.InputPin TS_S_FW_HC_HW_set "TS_S_FW_HC_HW_set" annotation(Placement(
		transformation(
			origin={20,-145},
			extent={{-5,5},{5,-5}}),
		iconTransformation(
			origin={-75,125},
			extent={{-20,-20},{20,20}},
			rotation=270)));
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
			extent={{-20,20},{20,-20}},
			rotation=180)));
	GreenCity.Interfaces.Thermal.DefineVolumeFlow defineVolumeFlow1 "Specifies a Thermal Volume Flow Connector" annotation(Placement(transformation(extent={{260,-50},{280,-70}})));
	GreenCity.Interfaces.Thermal.ExtractVolumeFlow extractVolumeFlow1 annotation(Placement(transformation(
		origin={270,-85},
		extent={{-10,-10},{10,10}},
		rotation=-180)));
	GreenCity.Interfaces.Thermal.DefineVolumeFlow defineVolumeFlow2 annotation(Placement(transformation(extent={{395,-75},{375,-95}})));
	GreenCity.Interfaces.Thermal.ExtractVolumeFlow extractVolumeFlow2 annotation(Placement(transformation(
		origin={385,-60},
		extent={{10,-10},{-10,10}},
		rotation=180)));
	Modelica.Blocks.Sources.RealExpression qvDHgrid(y=var_qvDHgrid) "Set output signal to a time varying Real expression" annotation(Placement(transformation(extent={{475,-85},{455,-65}})));
	Houses.SF1 sF1(
		simpleHeatedBuilding1(Presence_WeeklyRepetition=not UseTypedays),
		CBControlMode=false,
		CPC=true,
		AModule=SF1_ST_CollectorSurface_m2,
		VAbsorber=SF1_ST_CollectorVolume_m3,
		Tmax_TS(displayUnit="K")=SF1_T_max_BT + 273.15,
		T0_TS(displayUnit="K")=SF1_T_reference_BT + 273.15,
		TSTupInit(displayUnit="K")=SF1_TS_S_TM_BT_10_init + 273.15,
		TSTlowInit(displayUnit="K")=SF1_TS_S_TM_BT_1_init + 273.15,
		Tmax_DHW(displayUnit="K")=SF1_T_max_HWS + 273.15,
		T0_DHW(displayUnit="K")=SF1_T_reference_HWS + 273.15,
		DHWTupInit(displayUnit="K")=SF1_TS_S_TM_HWS_10_init + 273.15,
		DHWTlowInit(displayUnit="K")=SF1_TS_S_TM_HWS_1_init + 273.15,
		nPeople=SF1_nPeople,
		nFloors=SF1_nFloors,
		nApartments=SF1_nApartments,
		ALH=SF1_HeatedArea_m2,
		n=if SF1_HeatingSystem==0 then 1.3 else 1,
		TFlowHeatNorm(displayUnit="K")=if SF1_HeatingSystem==0 then 333.15 else 313.15,
		TReturnHeatNorm(displayUnit="K")=if SF1_HeatingSystem==0 then 318.15 else 303.15,
		TRef(displayUnit="K")=SF1_T_roomSet_degC + 273.15,
		TLiving_Init(displayUnit="K")=TLiving_Init+273.15,
		TRoof_Init(displayUnit="K")=TRoof_Init+273.15,
		TCellar_Init(displayUnit="K")=TCellar_Init+273.15,
		PresenceFile=File,
		ElConsumptionFile=File,
		ElConsumptionTable="Pel",
		YearlyElecConsumption_kWh=SF1_YearlyElecConsumption_kWh,
		ElFactor=ElFactor,
		ActivateNightTimeReduction=true,
		NightTimeReductionStart(displayUnit="h")=SF1_NightTimeReductionStart_h*3600,
		NightTimeReductionEnd(displayUnit="h")=SF1_NightTimeReductionEnd_h*3600,
		Tnight(displayUnit="K")=SF1_T_roomNightSet_degC+273.15,
		File=File,
		V_DHWperDay_l=SF1_V_DHWperDay_l,
		DHWfactor=DHWFactor) "House 1 with ST, CHP and CB" annotation(Placement(transformation(extent={{100,-85},{150,-35}})));
	GreenCity.Utilities.Electrical.Grid grid1(useA=true) annotation(Placement(transformation(extent={{200,-35},{240,5}})));
	Real var_qvDHpump "var_qvDHpump" annotation(Dialog(
		tab="Inputs",
		visible=false));
	Real var_qvDHWpump "var_qvDHWpump" annotation(Dialog(
		tab="Inputs",
		visible=false));
	Real var_qvSTpump "var_qvSTpump" annotation(Dialog(
		tab="Inputs",
		visible=false));
	Real var_CHPIn_P "var_CHPIn_P" annotation(Dialog(
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
	parameter String File=if UseTypedays then classDirectory()+"Data\\SF1_Typeday.txt" else classDirectory()+"Data\\SF1_Wholeyear.txt" "File of all parameters of SF1 (weather, presence, Pel, DHW)" annotation(Dialog(tab="Parameters"));
	parameter Boolean UseTypedays=true "If true, Typedays are used" annotation(Dialog(tab="Parameters"));
	parameter Integer SF1_TypeDay=1 "1 - WSC, 2 - WSS, 3 - WWS, 4 - WWC, 5 - TWC, 6 - SSS, 7 - TWS, 8 - TSS, 9 - SWC, 10 - SSC, 11 - TSC, 12 - SWS, 13 - coldest" annotation(Dialog(tab="Parameters"));
	parameter Integer SF1_InitializationTime_h=1 "Additional time before the experiment in order to reach initial conditions for the experiment" annotation(Dialog(tab="Parameters"));
	parameter Integer InitTime=if UseTypedays then 24-SF1_InitializationTime_h else 0 "Initial time of the day" annotation(Dialog(tab="Parameters"));
	parameter Integer InitDay=if UseTypedays then integer(mod(SF1_TypeDay*3-2, 31)) else 1 "InitialDay" annotation(Dialog(tab="Parameters"));
	parameter Integer InitMonth=if UseTypedays then integer((SF1_TypeDay*3-2)/31)+1 else 1 "Initial Month" annotation(Dialog(tab="Parameters"));
	parameter Real TLiving_Init=if SF1_TypeDay == 1 then 21 elseif SF1_TypeDay == 2 then 21 elseif SF1_TypeDay == 3 then 21 elseif SF1_TypeDay == 4 then 21 elseif SF1_TypeDay == 5 then 21 elseif SF1_TypeDay == 6 then 21 elseif SF1_TypeDay == 7 then 21 elseif SF1_TypeDay == 8 then 21 elseif SF1_TypeDay == 9 then 22.46 elseif SF1_TypeDay == 10 then 23 elseif SF1_TypeDay == 11 then 21.77 elseif SF1_TypeDay == 12 then 22.99 else 21 "Initial Temperature" annotation(Dialog(tab="Parameters"));
	parameter Real TRoof_Init=if SF1_TypeDay == 1 then 5.68 elseif SF1_TypeDay == 2 then 4.52 elseif SF1_TypeDay == 3 then 6.66 elseif SF1_TypeDay == 4 then 6.11 elseif SF1_TypeDay == 5 then 12.65 elseif SF1_TypeDay == 6 then 14.17 elseif SF1_TypeDay == 7 then 16.69 elseif SF1_TypeDay == 8 then 11.78 elseif SF1_TypeDay == 9 then 22.05 elseif SF1_TypeDay == 10 then 22.88 elseif SF1_TypeDay == 11 then 21.03 elseif SF1_TypeDay == 12 then 23.83 else 5.62 "Initial Temperature" annotation(Dialog(tab="Parameters"));
	parameter Real TCellar_Init=if SF1_TypeDay == 1 then 8.66 elseif SF1_TypeDay == 2 then 8.42 elseif SF1_TypeDay == 3 then 11.15 elseif SF1_TypeDay == 4 then 10.56 elseif SF1_TypeDay == 5 then 14.57 elseif SF1_TypeDay == 6 then 11 elseif SF1_TypeDay == 7 then 16.09 elseif SF1_TypeDay == 8 then 9.78 elseif SF1_TypeDay == 9 then 17.44 elseif SF1_TypeDay == 10 then 16.61 elseif SF1_TypeDay == 11 then 17.25 elseif SF1_TypeDay == 12 then 18.15 else 8.00 "Initial Temperature" annotation(Dialog(tab="Parameters"));
	parameter Real SF1_T_roomSet_degC=21 "T_roomSet_degC" annotation(Dialog(tab="Parameters"));
	parameter Real SF1_T_roomNightSet_degC=21 "T_roomNightSet_degC" annotation(Dialog(tab="Parameters"));
	parameter Real SF1_NightTimeReductionStart_h=23 "NightTimeReductionStart_h" annotation(Dialog(tab="Parameters"));
	parameter Real SF1_NightTimeReductionEnd_h=7 "NightTimeReductionEnd_h" annotation(Dialog(tab="Parameters"));
	parameter Integer SF1_HeatingSystem=0 "0 - Radiator Heating, 1 - Space Heating" annotation(Dialog(tab="Parameters"));
	parameter Integer SF1_nPeople=6 "nPeople" annotation(Dialog(tab="Parameters"));
	parameter Integer SF1_nFloors=2 "nFloors" annotation(Dialog(tab="Parameters"));
	parameter Integer SF1_nApartments=1 "nApartments" annotation(Dialog(tab="Parameters"));
	parameter Real SF1_HeatedArea_m2=300 "HeatedArea_m2" annotation(Dialog(tab="Parameters"));
	parameter Real SF1_YearlyElecConsumption_kWh=6500 "YearlyElecConsumption_kWh" annotation(Dialog(tab="Parameters"));
	protected
		parameter Real ElFactor=SF1_YearlyElecConsumption_kWh/5175 "ElFactor" annotation(Dialog(tab="Parameters"));
	public
		parameter Real SF1_V_DHWperDay_l=300 "V_DHWperDay_l" annotation(Dialog(tab="Parameters"));
		parameter Real DHWFactor=SF1_V_DHWperDay_l/300 "DHWFactor" annotation(Dialog(tab="Parameters"));
		parameter Integer SF1_ST_CollectorType=0 "0 - Flat Plate Collector, 1 - Compound Parabolic Collector" annotation(Dialog(tab="Parameters"));
		parameter Real SF1_ST_CollectorSurface_m2=2 "ST_CollectorSurface_m2" annotation(Dialog(tab="Parameters"));
		parameter Real SF1_ST_CollectorVolume_m3=1.7 "ST_CollectorVolume_m3" annotation(Dialog(tab="Parameters"));
		parameter Real SF1_TS_S_TM_BT_1_init=40 "initial temperature of lowest storage layer" annotation(Dialog(tab="Parameters"));
		parameter Real SF1_TS_S_TM_BT_10_init=60 "initial temperature of highest storage layer" annotation(Dialog(tab="Parameters"));
		parameter Real SF1_T_reference_BT=20 "Reference temperature of BT to calculate SOC, T_Sto = T_ref => SOC = 0" annotation(Dialog(tab="Parameters"));
		parameter Real SF1_T_max_BT=95 "Maximum temperature of storage, T_sto = T_max => SOC = 1" annotation(Dialog(tab="Parameters"));
		parameter Real SF1_TS_S_TM_HWS_1_init=40 "initial temperature of lowest storage layer" annotation(Dialog(tab="Parameters"));
		parameter Real SF1_TS_S_TM_HWS_10_init=60 "initial temperature of highest storage layer" annotation(Dialog(tab="Parameters"));
		parameter Real SF1_T_reference_HWS=40 "Reference temperature of HWS to calculate SOC, T_Sto = T_ref => SOC = 0" annotation(Dialog(tab="Parameters"));
		parameter Real SF1_T_max_HWS=80 "Maximum temperature of storage, T_sto = T_max => SOC = 1" annotation(Dialog(tab="Parameters"));
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
		Real CHP_S_TM_VL(quantity="Basics.Real") "CHP flow temperature" annotation(Dialog(
			group="Temperatures",
			tab="Results CHP",
			visible=false));
		Real CHP_S_TM_RL(quantity="Basics.Real") "CHP return temperature" annotation(Dialog(
			group="Temperatures",
			tab="Results CHP",
			visible=false));
		Real CHP_S_FW_HC(quantity="Basics.Real") "Volume flow CHP" annotation(Dialog(
			group="Volume Flow",
			tab="Results CHP",
			visible=false));
		Real CHP_S_FG(quantity="Basics.Real") "Gas flow CHP" annotation(Dialog(
			group="Volume Flow",
			tab="Results CHP",
			visible=false));
		Real CHP_VFuel(quantity="Basics.Real") "Demanded fuel volume" annotation(Dialog(
			group="Volume Flow",
			tab="Results CHP",
			visible=false));
		Real CHP_P_heat_is(quantity="Basics.Real") "Heat output power of CHP" annotation(Dialog(
			group="Power",
			tab="Results CHP",
			visible=false));
		Real CHP_P_el_is(quantity="Basics.Real") "Electric power output of CHP" annotation(Dialog(
			group="Power",
			tab="Results CHP",
			visible=false));
		Real CHP_P_gas_is(quantity="Basics.Real") "Gas power of CHP" annotation(Dialog(
			group="Power",
			tab="Results CHP",
			visible=false));
		Real CHP_E_heat_produced(quantity="Basics.Real") "Heat output of CHP" annotation(Dialog(
			group="Energy",
			tab="Results CHP",
			visible=false));
		Real CHP_E_el_produced(quantity="Basics.Real") "Electricity output of CHP" annotation(Dialog(
			group="Energy",
			tab="Results CHP",
			visible=false));
		Real CHP_E_gas_consumed(quantity="Basics.Real") "Gas input of CHP" annotation(Dialog(
			group="Energy",
			tab="Results CHP",
			visible=false));
		Real CHP_Efficiency_th(quantity="Basics.Real") "Thermal efficiency" annotation(Dialog(
			group="Efficiency",
			tab="Results CHP",
			visible=false));
		Real CHP_Efficiency_el(quantity="Basics.Real") "Electric efficiency" annotation(Dialog(
			group="Efficiency",
			tab="Results CHP",
			visible=false));
		Real CHP_Efficiency_total(quantity="Basics.Real") "Overall efficiency" annotation(Dialog(
			group="Efficiency",
			tab="Results CHP",
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
		Real TS_P_heat_from_to_BT "TS_P_heat_from_to_BT" annotation(Dialog(
			group="Power",
			tab="Results TS",
			visible=false));
		Real TS_P_heat_toHWS(quantity="Basics.Real") "Power transfered to DHW storage" annotation(Dialog(
			group="Power",
			tab="Results TS",
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
		Real TS_S_TM_HWS_1(quantity="Basics.Real") "DHW storage temperature 1" annotation(Dialog(
			group="Storage Temperatures",
			__esi_groupCollapsed=true,
			tab="Results TS",
			visible=false));
		Real TS_S_TM_HWS_2(quantity="Basics.Real") "DHW storage temperature 2" annotation(Dialog(
			group="Storage Temperatures",
			tab="Results TS",
			visible=false));
		Real TS_S_TM_HWS_3(quantity="Basics.Real") "DHW storage temperature 3" annotation(Dialog(
			group="Storage Temperatures",
			tab="Results TS",
			visible=false));
		Real TS_S_TM_BT_1(quantity="Basics.Real") "Thermal storage temperature 1" annotation(Dialog(
			group="Storage Temperatures",
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
		Real TS_S_FW_HC_HW(quantity="Basics.Real") "Volume flow to DHW storage" annotation(Dialog(
			group="Volume Flow",
			tab="Results TS",
			visible=false));
		Real TS_E_Storage_BT(quantity="Basics.Real") "Energy in thermal storage" annotation(Dialog(
			group="Energy",
			tab="Results TS",
			visible=false));
		Real TS_E_Storage_HWS(quantity="Basics.Real") "Energy in DHW storage" annotation(Dialog(
			group="Energy",
			tab="Results TS",
			visible=false));
		Real TS_E_heat_toHWS(quantity="Basics.Real") "Total energy transfered to DHW storage" annotation(Dialog(
			group="Energy",
			tab="Results TS",
			visible=false));
		Real TS_SOC_BT(quantity="Basics.Real") "State of charge of the thermal storage" annotation(Dialog(
			group="State of charge",
			tab="Results TS",
			visible=false));
		Real TS_SOC_HWS(quantity="Basics.Real") "State of charge of the DHW storage" annotation(Dialog(
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
		Real S_TM_ambient "S_TM_ambient" annotation(Dialog(
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
		Modelica.Blocks.Sources.RealExpression qvDHpump(y=var_qvDHpump) "Set output signal to a time varying Real expression" annotation(Placement(transformation(extent={{280,-120},{260,-100}})));
		Modelica.Blocks.Sources.RealExpression qvDHWpump(y=var_qvDHWpump) "Set output signal to a time varying Real expression" annotation(Placement(transformation(extent={{-85,-50},{-65,-30}})));
		Modelica.Blocks.Sources.RealExpression qvSTpump(y=var_qvSTpump) "Set output signal to a time varying Real expression" annotation(Placement(transformation(extent={{-85,-65},{-65,-45}})));
		Modelica.Blocks.Sources.RealExpression CHPIn_P(y=var_CHPIn_P) "Set output signal to a time varying Real expression" annotation(Placement(transformation(extent={{-85,-80},{-65,-60}})));
		Modelica.Blocks.Sources.RealExpression CBIn_P(y=var_CBIn_P) "Set output signal to a time varying Real expression" annotation(Placement(transformation(extent={{-85,-95},{-65,-75}})));
		Modelica.Blocks.Sources.RealExpression TDHgrid_in(y=var_TDHgrid_in) "Set output signal to a time varying Real expression" annotation(Placement(transformation(extent={{475,-100},{455,-80}})));
		GreenCity.Utilities.Thermal.HeatExchanger heatExchanger1(
			AHeatExchanger=0.506,
			Vprim=0.00044,
			Vsec=0.00044,
			k=5820) annotation(Placement(transformation(extent={{315,-85},{335,-65}})));
		Environment.Environment environment1(
			ReferenceDay=false,
			InputFile=if UseTypedays then File else classDirectory()+"Data\\Weather_2021_Munich_15min.txt",
			DefaultInit=false,
			DayTimeInit=InitTime,
			MonthDayInit=InitDay,
			MonthInit=InitMonth) annotation(Placement(transformation(extent={{200,20},{230,50}})));
		Modelica.Blocks.Sources.BooleanExpression StandardControl(y=false) "Standard Control" annotation(Placement(transformation(extent={{65,-30},{85,-10}})));
		Modelica.Blocks.Math.Abs abs1 annotation(Placement(transformation(extent={{210,-60},{230,-40}})));
		Modelica.Blocks.Math.Abs abs2 annotation(Placement(transformation(extent={{440,-85},{420,-65}})));
	equation
		// Inputs
		// Condensing Boiler
		if EB_EBon_off > 0.5 then
			var_CBIn_P = EB_EB_power_kW_set * 1000;
		else
			var_CBIn_P = 0;
		end if;
		
		// CHP
		if CHP_CHPon_off > 0.5 then
			var_CHPIn_P = CHP_elPowerCHP_set * 1000;
		else
			var_CHPIn_P = 0;
		end if;
		
		// Solar Thermal Collectors
		var_qvSTpump = ST_S_FW_ST_VL_set / 60000;
		
		// Hot Water Storage
		var_qvDHWpump = TS_S_FW_HC_HW_set / 60000;
		
		// Connection Heat Network
		var_qvDHpump = CHN_S_FW_HC_set / 60000;
		var_qvDHgrid = CHN_S_FW_TG_set / 60000;
		var_TDHgrid_in = CHN_S_TM_TG + 273.15;
		
		// Results
		// Condensing Boiler
		CB_S_TM_VL = sF1.CB_S_TM_VL - 273.15;
		CB_S_TM_RL = sF1.CB_S_TM_RL - 273.15;
		CB_S_FW_HC = sF1.CB_S_FW_HC * 60000;
		CB_S_FG = sF1.CB_S_FG * 60000;
		CB_VFuel = sF1.CB_VFuel * 1000;
		CB_P_heat_is = sF1.CB_P_heat_is / 1000;
		CB_P_gas_is = sF1.CB_P_gas_is / 1000;
		CB_E_heat_produced = sF1.CB_E_heat_produced / 3600000;
		CB_E_gas_consumed = sF1.CB_E_gas_consumed / 3600000;
		CB_Efficiency = sF1.CB_Efficiency;
		
		// CHP
		CHP_S_TM_VL = sF1.CHP_S_TM_VL - 273.15;
		CHP_S_TM_RL = sF1.CHP_S_TM_RL - 273.15;
		CHP_S_FW_HC = sF1.CHP_S_FW_HC * 60000;
		CHP_S_FG = sF1.CHP_S_FG * 60000;
		CHP_VFuel = sF1.CHP_VFuel * 1000;
		CHP_P_heat_is = sF1.CHP_P_heat_is / 1000;
		CHP_P_el_is = sF1.CHP_P_el_is / 1000;
		CHP_P_gas_is = sF1.CHP_P_gas_is / 1000;
		CHP_E_heat_produced = sF1.CHP_E_heat_produced / 3600000;
		CHP_E_el_produced = sF1.CHP_E_el_produced / 3600000;
		CHP_E_gas_consumed = sF1.CHP_E_gas_consumed / 3600000;
		CHP_Efficiency_th = sF1.CHP_Efficiency_th;
		CHP_Efficiency_el = sF1.CHP_Efficiency_el;
		CHP_Efficiency_total = sF1.CHP_Efficiency_total;
		
		
		// Solar Thermal Collectors
		ST_S_TM_VL = sF1.ST_S_TM_VL - 273.15;
		ST_S_TM_RL = sF1.ST_S_TM_RL - 273.15;
		ST_S_TM_Collector = sF1.ST_S_TM_Collector - 273.15;
		ST_S_FW_HC = sF1.ST_S_FW_HC * 60000;
		ST_E_heat_produced = sF1.ST_E_heat_produced / 3600000;
		ST_P_heat_is = sF1.ST_P_heat_is / 1000;
		
		// Hot Water Storage
		TS_P_heat_toHWS = sF1.TS_P_heat_toHWS / 1000;
		TS_S_TM_HWS_1 = sF1.TS_S_TM_HWS_1 - 273.15;
		TS_S_TM_HWS_2 = sF1.TS_S_TM_HWS_2 - 273.15;
		TS_S_TM_HWS_3 = sF1.TS_S_TM_HWS_3 - 273.15;
		TS_S_FW_HC_HW = sF1.TS_S_FW_HC_HW * 60000;
		TS_E_Storage_HWS = sF1.TS_E_Storage_HWS / 3600000;
		TS_E_heat_toHWS = sF1.TS_E_heat_toHWS / 3600000;
		TS_SOC_HWS = sF1.TS_SOC_HWS;
		
		//Thermal Storage
		TS_S_TM_HC_VL = sF1.TS_S_TM_HC_VL - 273.15;
		TS_S_TM_HC_RL = sF1.TS_S_TM_HC_RL - 273.15;
		TS_S_TM_PS_VL = sF1.TS_S_TM_PS_VL - 273.15;
		TS_S_TM_PS_RL = sF1.TS_S_TM_PS_RL - 273.15;
		TS_S_TM_HC_HW_VL = sF1.TS_S_TM_HC_HW_VL - 273.15;
		TS_S_TM_HC_HW_RL = sF1.TS_S_TM_HC_HW_RL - 273.15;
		TS_S_TM_BT_1 = sF1.TS_S_TM_BT_1 - 273.15;
		TS_S_TM_BT_2 = sF1.TS_S_TM_BT_2 - 273.15;
		TS_S_TM_BT_3 = sF1.TS_S_TM_BT_3 - 273.15;
		TS_S_TM_BT_4 = sF1.TS_S_TM_BT_4 - 273.15;
		TS_S_TM_BT_5 = sF1.TS_S_TM_BT_5 - 273.15;
		TS_S_TM_BT_6 = sF1.TS_S_TM_BT_6 - 273.15;
		TS_S_TM_BT_7 = sF1.TS_S_TM_BT_7 - 273.15;
		TS_S_TM_BT_8 = sF1.TS_S_TM_BT_8 - 273.15;
		TS_S_TM_BT_9 = sF1.TS_S_TM_BT_9 - 273.15;
		TS_S_TM_BT_10 = sF1.TS_S_TM_BT_10 - 273.15;
		TS_P_heat_from_to_BT = CHN_P_HC_TH + CHP_P_heat_is + CB_P_heat_is - HS_P_DemHeatHC_is - TS_P_heat_toHWS;
		TS_E_Storage_BT = sF1.TS_E_Storage_BT / 3600000;
		TS_SOC_BT = sF1.TS_SOC_BT;
		
		// Heat Sink (Heating)
		HS_S_TM_VL_bM = sF1.HS_S_TM_VL_bM - 273.15;
		HS_S_TM_VL_aM = sF1.HS_S_TM_VL_aM - 273.15;
		HS_S_TM_RL = sF1.HS_S_TM_RL - 273.15;
		HS_S_FW_HC_aM = sF1.HS_S_FW_HC_aM * 60000;
		HS_S_FW_HC_bM = sF1.HS_S_FW_HC_bM * 60000;
		HS_P_DemHeatHC_is = sF1.HS_P_DemHeatHC_is / 1000;
		HS_E_DemHeatHC_consumed = sF1.HS_E_DemHeatHC_consumed / 3600000;
		S_TM_ambient = environment1.TAmbient - 273.15;
		S_TM_roof = sF1.simpleHeatedBuilding1.TZone[3] - 273.15;
		S_TM_room = sF1.simpleHeatedBuilding1.TZone[2] - 273.15;
		S_TM_cellar = sF1.simpleHeatedBuilding1.TZone[1] - 273.15;
		
		
		// Heat Sink (Domestic Hot Water)
		HS_S_TM_HW_VL = sF1.HS_S_TM_HW_VL - 273.15;
		HS_S_TM_HW_RL = sF1.HS_S_TM_HW_RL - 273.15;
		HS_S_FW_HW_VL = sF1.HS_S_FW_HW_VL * 60000;
		HS_P_DemHeatHW_is = sF1.HS_P_DemHeatHW_is  / 1000;
		HS_E_DemHeatHW_consumed = sF1.HS_E_DemHeatHW_consumed / 3600000;
		
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
		connect(grid1.LVGridA,sF1.lV3Phase1) annotation(
			Line(
				points={{200,0},{195,0},{190,0},{190,-50},{149.6666564941406,-50}},
				color={247,148,29},
				thickness=0.0625),
			__esi_AutoRoute=false);
		connect(qvSTpump.y,sF1.qvSTpump) annotation(Line(
			points={{-64,-55},{-59,-55},{95,-55},{100,-55}},
			color={0,0,127},
			thickness=0.0625));
		connect(sF1.qvDHWpump,qvDHWpump.y) annotation(Line(
			points={{100,-45},{95,-45},{-59,-45},{-59,-40},{-64,-40}},
			color={0,0,127},
			thickness=0.0625));
		connect(qvDHpump.y,sF1.qvDHpump) annotation(Line(
			points={{259,-110},{254,-110},{154,-110},{154,-80},{149,-80}},
			color={0,0,127},
			thickness=0.0625));
		connect(defineVolumeFlow1.TMedium,sF1.TDH_HEXin) annotation(Line(
			points={{260,-65},{255,-65},{154.7,-65},{149.7,-65}},
			color={0,0,127},
			thickness=0.015625));
		connect(TDHgrid_in.y,defineVolumeFlow2.TMedium) annotation(Line(
			points={{454,-90},{449,-90},{400,-90},{395,-90}},
			color={0,0,127},
			thickness=0.015625));
		connect(defineVolumeFlow1.Pipe,heatExchanger1.PrimaryInPipe) annotation(Line(
			points={{280,-60},{285,-60},{310,-60},{310,-70},{315,-70}},
			color={190,30,45}));
		connect(extractVolumeFlow2.Pipe,heatExchanger1.SecondaryOutPipe) annotation(Line(
			points={{375,-60},{370,-60},{340,-60},{340,-70},{335,-70}},
			color={190,30,45},
			thickness=0.0625));
		connect(defineVolumeFlow2.Pipe,heatExchanger1.SecondaryInPipe) annotation(Line(
			points={{375,-85},{370,-85},{340,-85},{340,-80},{335,-80}},
			color={190,30,45}));
		connect(extractVolumeFlow1.Pipe,heatExchanger1.PrimaryOutPipe) annotation(Line(
			points={{280,-85},{285,-85},{310,-85},{310,-80},{315,-80}},
			color={190,30,45},
			thickness=0.0625));
		connect(environment1.EnvironmentConditions,sF1.environmentConditions1) annotation(Line(
			points={{200,35},{195,35},{154.7,35},{154.7,-40},{149.7,-40}},
			color={192,192,192},
			thickness=0.0625));
		connect(StandardControl.y,sF1.StandardCBcontrol) annotation(Line(
			points={{86,-20},{91,-20},{140,-20},{140,-30},{140,-35}},
			color={255,0,255},
			thickness=0.0625));
		connect(sF1.StandardCHPcontrol,StandardControl.y) annotation(Line(
			points={{130,-35},{130,-30},{130,-20},{91,-20},{86,-20}},
			color={255,0,255},
			thickness=0.0625));
		connect(sF1.StandardSTcontrol,StandardControl.y) annotation(Line(
			points={{120,-35},{120,-30},{120,-20},{91,-20},{86,-20}},
			color={255,0,255},
			thickness=0.0625));
		connect(sF1.StandardDHWcontrol,StandardControl.y) annotation(Line(
			points={{110,-35},{110,-30},{110,-20},{91,-20},{86,-20}},
			color={255,0,255},
			thickness=0.0625));
		connect(sF1.CHPIn_P,CHPIn_P.y) annotation(Line(
			points={{100,-65},{95,-65},{-59,-65},{-59,-70},{-64,-70}},
			color={0,0,127},
			thickness=0.0625));
		connect(CBIn_P.y,sF1.CBIn_P) annotation(Line(
			points={{-64,-85},{-59,-85},{95,-85},{95,-75},{100,-75}},
			color={0,0,127},
			thickness=0.0625));
		connect(defineVolumeFlow1.qvMedium,abs1.y) annotation(Line(
			points={{260,-55},{255,-55},{236,-55},{236,-50},{231,-50}},
			color={0,0,127},
			thickness=0.0625));
		connect(sF1.qv_HEX,abs1.u) annotation(Line(
			points={{149.7,-60},{154.7,-60},{203,-60},{203,-50},{208,-50}},
			color={0,0,127},
			thickness=0.0625));
		connect(sF1.TDH_HEXout,extractVolumeFlow1.TMedium) annotation(Line(
			points={{149.7,-75},{154.7,-75},{255,-75},{255,-80},{260,-80}},
			color={0,0,127},
			thickness=0.0625));
		connect(abs2.u,qvDHgrid.y) annotation(Line(
			points={{442,-75},{447,-75},{449,-75},{454,-75}},
			color={0,0,127},
			thickness=0.0625));
		connect(abs2.y,defineVolumeFlow2.qvMedium) annotation(Line(
			points={{419,-75},{414,-75},{400,-75},{400,-80},{395,-80}},
			color={0,0,127},
			thickness=0.0625));
	annotation(
		statAnaRefVar(flags=2),
		__esi_protocols(transient={
																																																																																																																																																																																																																																																																								Protocol(var=time),
																																																																																																																																																																																																																																																																						Protocol(var=statAnaRefVar)}),
		__esi_solverOptions(
			solver="CVODE",
			typename="ExternalCVODEOptionData"),
		__esi_sF1(hydraulicSwitch2HG1(viewinfo[0](
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
			projectName="SimX_SF1_SiL",
			projectPath="C:\\Users\\gu62xur\\Downloads\\SimX_Veristand",
			projectType=17,
			saveOutputsApproach=1,
			inputs[0](
				port="CHP_CHPon_off",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			inputs[1](
				port="CHP_elPowerCHP_set",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			inputs[2](
				port="EB_EBon_off",
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
				port="TS_S_FW_HC_HW_set",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			inputs[6](
				port="CHN_S_FW_HC_set",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			inputs[7](
				port="CHN_S_FW_TG_set",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			inputs[8](
				port="CHN_S_TM_TG",
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
				port="CHP_S_TM_VL",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[11](
				port="CHP_S_TM_RL",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[12](
				port="CHP_S_FW_HC",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[13](
				port="CHP_S_FG",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[14](
				port="CHP_VFuel",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[15](
				port="CHP_P_heat_is",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[16](
				port="CHP_P_el_is",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[17](
				port="CHP_P_gas_is",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[18](
				port="CHP_E_heat_produced",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[19](
				port="CHP_E_el_produced",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[20](
				port="CHP_E_gas_consumed",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[21](
				port="CHP_Efficiency_th",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[22](
				port="CHP_Efficiency_el",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[23](
				port="CHP_Efficiency_total",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[24](
				port="ST_S_TM_VL",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[25](
				port="ST_S_TM_RL",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[26](
				port="ST_S_TM_Collector",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[27](
				port="ST_S_FW_HC",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[28](
				port="ST_P_heat_is",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[29](
				port="ST_E_heat_produced",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[30](
				port="TS_P_heat_from_to_BT",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[31](
				port="TS_P_heat_toHWS",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[32](
				port="TS_S_TM_HC_VL",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[33](
				port="TS_S_TM_HC_RL",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[34](
				port="TS_S_TM_PS_VL",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[35](
				port="TS_S_TM_PS_RL",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[36](
				port="TS_S_TM_HC_HW_VL",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[37](
				port="TS_S_TM_HC_HW_RL",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[38](
				port="TS_S_TM_HWS_1",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[39](
				port="TS_S_TM_HWS_2",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[40](
				port="TS_S_TM_HWS_3",
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
				port="TS_S_FW_HC_HW",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[52](
				port="TS_E_Storage_BT",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[53](
				port="TS_E_Storage_HWS",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[54](
				port="TS_E_heat_toHWS",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[55](
				port="TS_SOC_BT",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[56](
				port="TS_SOC_HWS",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[57](
				port="Modeltime_s",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[58](
				port="HS_S_TM_VL_bM",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[59](
				port="HS_S_TM_VL_aM",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[60](
				port="HS_S_TM_RL",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[61](
				port="HS_S_TM_HW_VL",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[62](
				port="HS_S_TM_HW_RL",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[63](
				port="S_TM_ambient",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[64](
				port="S_TM_roof",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[65](
				port="S_TM_room",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[66](
				port="S_TM_cellar",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[67](
				port="HS_S_FW_HC_aM",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[68](
				port="HS_S_FW_HC_bM",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[69](
				port="HS_S_FW_HW_VL",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[70](
				port="HS_P_DemHeatHC_is",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[71](
				port="HS_P_DemHeatHW_is",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[72](
				port="HS_E_DemHeatHC_consumed",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[73](
				port="HS_E_DemHeatHW_consumed",
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
				port="SF1_TypeDay",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[1](
				port="SF1_InitializationTime_h",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[2](
				port="SF1_T_roomSet_degC",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[3](
				port="SF1_T_roomNightSet_degC",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[4](
				port="SF1_NightTimeReductionStart_h",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[5](
				port="SF1_NightTimeReductionEnd_h",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[6](
				port="SF1_HeatingSystem",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[7](
				port="SF1_nPeople",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[8](
				port="SF1_nFloors",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[9](
				port="SF1_nApartments",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[10](
				port="SF1_HeatedArea_m2",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[11](
				port="SF1_YearlyElecConsumption_kWh",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[12](
				port="SF1_V_DHWperDay_l",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[13](
				port="SF1_ST_CollectorType",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[14](
				port="SF1_ST_CollectorSurface_m2",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[15](
				port="SF1_ST_CollectorVolume_m3",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[16](
				port="SF1_TS_S_TM_BT_1_init",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[17](
				port="SF1_TS_S_TM_BT_10_init",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[18](
				port="SF1_T_reference_BT",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[19](
				port="SF1_T_max_BT",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[20](
				port="SF1_TS_S_TM_HWS_1_init",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[21](
				port="SF1_TS_S_TM_HWS_10_init",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[22](
				port="SF1_T_reference_HWS",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[23](
				port="SF1_T_max_HWS",
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
								textString="SF1 SiL",
								extent={{-100,126.3},{99.90000000000001,9.9}}),
							Bitmap(
								imageSource="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
/wE+rRa6sslftgAAAABJRU5ErkJggg==",
								extent={{-81.3,-106.2},{77,30}})}),
		Documentation(info="<HTML><HEAD>
<META http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\"> 
<TITLE>Software in the Loop Model of SF1</TITLE> 
<STYLE type=\"text/css\">
table>tbody>tr:hover,th{background-color:#edf1f3}html{font-size:90%}body,table{font-size:1rem}body{font-family:'Open Sans',Arial,sans-serif;color:#465e70}h1,h2{margin:1em 0 .6em;font-weight:600}p{margin-top:.3em;margin-bottom:.2em}table{border-collapse:collapse;margin:1em 0;width:100%;}tr{border:1px solid #beccd3}td,th{padding:.3em 1em; border-width: 1px; border-style: solid; border-color: rgb(190, 204, 211);}td{word-break:break-word}tr:nth-child(even){background-color:#fafafa}th{font-family:'Open Sans Semibold',Arial,sans-serif;font-weight:700;text-align:left;word-break:keep-all}.lib-wrap{width:70%}@media screen and (max-width:800px){.lib-wrap{width:100%}}td p{margin:.2em}
</STYLE>
   
<META name=\"GENERATOR\" content=\"MSHTML 11.00.10570.1001\"></HEAD> 
<BODY>
<H1>Software in the Loop Model of SF1</H1>
<HR>

<P>Software in the Loop model of SF1 for VeriStand. This model can be used to  
test a controller before doing experiments in the laboratory. The model can be 
generated for using Typedays (similar to HiL models) or for  running it 
continuously.</P>
<P>The model  consists  of the same components as SF1:</P>
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
            T_Storage,top &lt; T_Start,CHP and SOC_Storage &lt;     
  SOCminCHP<BR>Switched     off,   when:<BR>&nbsp;&nbsp;&nbsp;&nbsp;     
  T_Storage,bottom &gt; T_Stop,CHP or       SOC_Storage &gt;     
  SOCmaxCHP<BR><BR></LI>
  <LI>Condensing Boiler:<BR>The condensing boiler should only operate, if the    
         CHP cannot provide the required heat.<BR>Switched on at 100 % 
  modulation,           when:<BR>&nbsp;&nbsp;&nbsp;&nbsp; T_Storage,top &lt; 
  T_Start,CB and           SOC_Storage &lt; SOCminCB<BR>Switched off,   
  when:<BR>&nbsp;&nbsp;&nbsp;&nbsp;         T_Storage,bottom &gt; T_Stop,CB or   
  SOC_Storage &gt; SOCmaxCB<BR><BR></LI>
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
        thermal storage.<BR>Switched on at qvMaxDHW,   
  when:<BR>&nbsp;&nbsp;&nbsp;&nbsp;         T_DHWStorage,top &lt; T_onTS_DHW and 
    T_Storage,top &gt;       T_offTS_DHW<BR>Switched off,     
  when:<BR>&nbsp;&nbsp;&nbsp;&nbsp;       T_DHWStorage,top &gt; ToffTS_DHW or   
  T_Storage,top &lt; TDHWStorage,top</LI></UL>
<DIV class=\"lib-wrap\">
<TABLE class=\"type\">
  <TBODY>
  <TR>
    <TH>Symbol:</TH>
    <TD colspan=\"3\"><IMG width=\"264\" height=\"263\" src=\"data:image/png;base64,
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\"></TD></TR>
  <TR>
    <TH>Identifier:</TH>
    <TD colspan=\"3\">CoSES_Models.CodeExport.VeriStandSiL.SimX_SF1_SiL</TD></TR>
  <TR>
    <TH>Version:</TH>
    <TD colspan=\"3\">1.0</TD></TR>
  <TR>
    <TH>File:</TH>
    <TD colspan=\"3\">SimX_SF1_SiL.mo</TD></TR>
  <TR>
    <TH>Connectors:</TH>
    <TD>CHP_CHPon_off</TD>
    <TD>CHP_CHPon_off</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>CHP_elPowerCHP</TD>
    <TD>CHP_elPowerCHP_set</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>EB_EBon_off</TD>
    <TD>EB_EBon_off</TD>
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
    <TD>TS_S_FW_HC_HW_set</TD>
    <TD>TS_S_FW_HC_HW_set</TD>
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
    <TD>House 1 with ST, CHP and CB</TD>
    <TD>sF1</TD>
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
    <TD>sigInDer1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Signal Input to Real Output</TD>
    <TD>i2RO1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Real Input to Signal Output</TD>
    <TD>rI2O1</TD>
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
    <TD>File of all parameters of SF1 (weather, presence, Pel, DHW)</TD>
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
    <TD>TypeDay</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Additional time before the experiment in order to reach initial        
           conditions for the experiment</TD>
    <TD>InitializationTime_h</TD>
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
    <TD>T_roomSet_degC</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>T_roomNightSet_degC</TD>
    <TD>T_roomNightSet_degC</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>NightTimeReductionStart_h</TD>
    <TD>NightTimeReductionStart_h</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>NightTimeReductionEnd_h</TD>
    <TD>NightTimeReductionEnd_h</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>0 - Radiator Heating, 1 - Space Heating</TD>
    <TD>HeatingSystem</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>nPeople</TD>
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
    <TD>HeatedArea_m2</TD>
    <TD>HeatedArea_m2</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>YearlyElecConsumption_kWh</TD>
    <TD>YearlyElecConsumption_kWh</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>V_DHWperDay_l</TD>
    <TD>V_DHWperDay_l</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>DHWFactor</TD>
    <TD>DHWFactor</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>0 - Flat Plate Collector, 1 - Compound Parabolic Collector</TD>
    <TD>ST_CollectorType</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>ST_CollectorSurface_m2</TD>
    <TD>ST_CollectorSurface_m2</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>ST_CollectorVolume_m3</TD>
    <TD>ST_CollectorVolume_m3</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>initial temperature of lowest storage layer</TD>
    <TD>TS_S_TM_BT_1_init</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>initial temperature of highest storage layer</TD>
    <TD>TS_S_TM_BT_10_init</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Reference temperature of BT to calculate SOC, T_Sto = T_ref =&gt; SOC  
                 = 0</TD>
    <TD>T_reference_BT</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Maximum temperature of storage, T_sto = T_max =&gt; SOC = 1</TD>
    <TD>T_max_BT</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>initial temperature of lowest storage layer</TD>
    <TD>TS_S_TM_HWS_1_init</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>initial temperature of highest storage layer</TD>
    <TD>TS_S_TM_HWS_10_init</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Reference temperature of HWS to calculate SOC, T_Sto = T_ref =&gt; SOC 
                  = 0</TD>
    <TD>T_reference_HWS</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Maximum temperature of storage, T_sto = T_max =&gt; SOC = 1</TD>
    <TD>T_max_HWS</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Standard control for DHW pump (input for TS_S_FW_HC_HW_set is ignored  
                 if true)</TD>
    <TD>DHWStandardControl</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Standard control for solar thermal pump (input for ST_S_FW_ST_set is   
                ignored if true)</TD>
    <TD>STStandardControl</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Standard control for the CHP (input for CHP_CHPon_off and             
      CHP_elPowerCHP are ignored if true)</TD>
    <TD>CHPStandardControl</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Standard control for the condensing boiler (input for EB_EBon_off and  
                 EB_EB_power_kW_set are ignored if true)</TD>
    <TD>CBStandardControl</TD>
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
    <TD>qvDHWpump</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Set output signal to a time varying Real expression</TD>
    <TD>qvSTpump</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Set output signal to a time varying Real expression</TD>
    <TD>CHPIn_P</TD>
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
    <TD>Standard control for DHW pump (input for TS_S_FW_HC_HW_set is ignored  
                 if true)</TD>
    <TD>StandardDHWControl</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Standard control for solar thermal pump (input for ST_S_FW_ST_set is   
                ignored if true)</TD>
    <TD>StandardSTControl</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Standard control for the CHP (input for CHP_CHPon_off and             
      CHP_elPowerCHP are ignored if true)</TD>
    <TD>StandardCHPControl</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Standard control for the condensing boiler (input for EB_EBon_off and  
                 EB_EB_power_kW_set are ignored if true)</TD>
    <TD>StandardCBControl</TD>
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
    <TD>var_CHPIn_P</TD>
    <TD>var_CHPIn_P</TD>
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
end SimX_SF1_SiL;
