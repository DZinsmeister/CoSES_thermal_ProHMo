// CP: 65001
// SimulationX Version: 4.2.3.69223
within CoSES_Models.CodeExport.DymolaFMI;
model SF3_Dymola "FMU model of SF3 for Dymola"
	Modelica.Blocks.Interfaces.RealOutput HP_S_TM_VL(quantity="Basics.Temp") "Heat pump flow temperature (output of the outdoor unit)" annotation(
		Placement(
			transformation(extent={{135,40},{155,60}}),
			iconTransformation(
				origin={175,125},
				extent={{10,-10},{-10,10}},
				rotation=-180)),
		Dialog(
			tab="Internal Results",
			visible=false));
	Modelica.Blocks.Interfaces.RealOutput HP_S_TM_RL(quantity="Basics.Temp") "Heat pump return temperature" annotation(
		Placement(
			transformation(extent={{135,40},{155,60}}),
			iconTransformation(
				origin={175,125},
				extent={{10,-10},{-10,10}},
				rotation=-180)),
		Dialog(
			tab="Internal Results",
			visible=false));
	Modelica.Blocks.Interfaces.RealOutput HP_S_TM_BC_VL(quantity="Basics.Temp") "Heat pump brine flow temperature" annotation(
		Placement(
			transformation(extent={{135,40},{155,60}}),
			iconTransformation(
				origin={175,125},
				extent={{10,-10},{-10,10}},
				rotation=-180)),
		Dialog(
			tab="Internal Results",
			visible=false));
	Modelica.Blocks.Interfaces.RealOutput HP_S_TM_BC_RL(quantity="Basics.Temp") "Heat pump brine return temperature" annotation(
		Placement(
			transformation(extent={{135,40},{155,60}}),
			iconTransformation(
				origin={175,125},
				extent={{10,-10},{-10,10}},
				rotation=-180)),
		Dialog(
			tab="Internal Results",
			visible=false));
	Modelica.Blocks.Interfaces.RealOutput HP_S_FW_HC(quantity="Thermics.VolumeFlow") "Volume flow heat pump" annotation(
		Placement(
			transformation(extent={{135,40},{155,60}}),
			iconTransformation(
				origin={175,125},
				extent={{10,-10},{-10,10}},
				rotation=-180)),
		Dialog(
			tab="Internal Results",
			visible=false));
	Modelica.Blocks.Interfaces.RealOutput HP_P_heat(quantity="Basics.Power") "Heat output power of the heat pump" annotation(
		Placement(
			transformation(extent={{135,40},{155,60}}),
			iconTransformation(
				origin={175,125},
				extent={{10,-10},{-10,10}},
				rotation=-180)),
		Dialog(
			tab="Internal Results",
			visible=false));
	Modelica.Blocks.Interfaces.RealOutput HP_S_FW_BC(quantity="Thermics.VolumeFlow") "Heat output power of the auxiliary heater" annotation(
		Placement(
			transformation(extent={{135,40},{155,60}}),
			iconTransformation(
				origin={175,125},
				extent={{10,-10},{-10,10}},
				rotation=-180)),
		Dialog(
			tab="Internal Results",
			visible=false));
	Modelica.Blocks.Interfaces.RealOutput HP_P_elec(quantity="Basics.Power") "Total electricity demand of heat pump" annotation(
		Placement(
			transformation(extent={{135,40},{155,60}}),
			iconTransformation(
				origin={175,125},
				extent={{10,-10},{-10,10}},
				rotation=-180)),
		Dialog(
			tab="Internal Results",
			visible=false));
	Modelica.Blocks.Interfaces.RealOutput HP_E_heat(quantity="Basics.Energy") "Heat output of the heat pump" annotation(
		Placement(
			transformation(extent={{135,40},{155,60}}),
			iconTransformation(
				origin={175,125},
				extent={{10,-10},{-10,10}},
				rotation=-180)),
		Dialog(
			tab="Internal Results",
			visible=false));
	Modelica.Blocks.Interfaces.RealOutput HP_E_elec(quantity="Basics.Energy") "Consumed electric energy of heat pump" annotation(
		Placement(
			transformation(extent={{135,40},{155,60}}),
			iconTransformation(
				origin={175,125},
				extent={{10,-10},{-10,10}},
				rotation=-180)),
		Dialog(
			tab="Internal Results",
			visible=false));
	Modelica.Blocks.Interfaces.RealOutput HP_COP(quantity="Basics.RelMagnitude") "Coefficiency of performance" annotation(
		Placement(
			transformation(extent={{135,40},{155,60}}),
			iconTransformation(
				origin={175,125},
				extent={{10,-10},{-10,10}},
				rotation=-180)),
		Dialog(
			tab="Internal Results",
			visible=false));
	Modelica.Blocks.Interfaces.RealOutput PV_P(quantity="Basics.Power") "PV power" annotation(
		Placement(
			transformation(extent={{135,40},{155,60}}),
			iconTransformation(
				origin={175,125},
				extent={{10,-10},{-10,10}},
				rotation=-180)),
		Dialog(
			tab="Internal Results",
			visible=false));
	Modelica.Blocks.Interfaces.RealOutput PV_E(quantity="Basics.Energy") "Produced energy of the PV system" annotation(
		Placement(
			transformation(extent={{135,40},{155,60}}),
			iconTransformation(
				origin={175,125},
				extent={{10,-10},{-10,10}},
				rotation=-180)),
		Dialog(
			tab="Internal Results",
			visible=false));
	Modelica.Blocks.Interfaces.RealOutput ST_S_TM_VL(quantity="Basics.Temp") "Solar thermal flow temperature" annotation(
		Placement(
			transformation(extent={{135,40},{155,60}}),
			iconTransformation(
				origin={175,125},
				extent={{10,-10},{-10,10}},
				rotation=-180)),
		Dialog(
			tab="Internal Results",
			visible=false));
	Modelica.Blocks.Interfaces.RealOutput ST_S_TM_RL(quantity="Basics.Temp") "Solar thermal return temperature" annotation(
		Placement(
			transformation(extent={{135,40},{155,60}}),
			iconTransformation(
				origin={175,125},
				extent={{10,-10},{-10,10}},
				rotation=-180)),
		Dialog(
			tab="Internal Results",
			visible=false));
	Modelica.Blocks.Interfaces.RealOutput ST_S_TM_Collector(quantity="Basics.Temp") "Collector temperature" annotation(
		Placement(
			transformation(extent={{135,40},{155,60}}),
			iconTransformation(
				origin={175,125},
				extent={{10,-10},{-10,10}},
				rotation=-180)),
		Dialog(
			tab="Internal Results",
			visible=false));
	Modelica.Blocks.Interfaces.RealOutput ST_S_FW_HC(quantity="Thermics.VolumeFlow") "Volume flow solar thermal" annotation(
		Placement(
			transformation(extent={{135,40},{155,60}}),
			iconTransformation(
				origin={175,125},
				extent={{10,-10},{-10,10}},
				rotation=-180)),
		Dialog(
			tab="Internal Results",
			visible=false));
	Modelica.Blocks.Interfaces.RealOutput ST_P_heat(quantity="Basics.Power") "Heat output power of solar thermal" annotation(
		Placement(
			transformation(extent={{135,40},{155,60}}),
			iconTransformation(
				origin={175,125},
				extent={{10,-10},{-10,10}},
				rotation=-180)),
		Dialog(
			tab="Internal Results",
			visible=false));
	Modelica.Blocks.Interfaces.RealOutput ST_E_heat(quantity="Basics.Energy") "Heat output  of solar thermal" annotation(
		Placement(
			transformation(extent={{135,40},{155,60}}),
			iconTransformation(
				origin={175,125},
				extent={{10,-10},{-10,10}},
				rotation=-180)),
		Dialog(
			tab="Internal Results",
			visible=false));
	Modelica.Blocks.Interfaces.RealOutput TS_S_TM_HC_VL(quantity="Basics.Temp") "Flow temperature consumption side" annotation(
		Placement(
			transformation(extent={{135,40},{155,60}}),
			iconTransformation(
				origin={175,125},
				extent={{10,-10},{-10,10}},
				rotation=-180)),
		Dialog(
			tab="Internal Results",
			visible=false));
	Modelica.Blocks.Interfaces.RealOutput TS_S_TM_HC_RL(quantity="Basics.Temp") "Return temperature consumption side" annotation(
		Placement(
			transformation(extent={{135,40},{155,60}}),
			iconTransformation(
				origin={175,125},
				extent={{10,-10},{-10,10}},
				rotation=-180)),
		Dialog(
			tab="Internal Results",
			visible=false));
	Modelica.Blocks.Interfaces.RealOutput TS_S_TM_PS_VL(quantity="Basics.Temp") "Flow temperature producer side" annotation(
		Placement(
			transformation(extent={{135,40},{155,60}}),
			iconTransformation(
				origin={175,125},
				extent={{10,-10},{-10,10}},
				rotation=-180)),
		Dialog(
			tab="Internal Results",
			visible=false));
	Modelica.Blocks.Interfaces.RealOutput TS_S_TM_PS_RL(quantity="Basics.Temp") "Return temperature producer side" annotation(
		Placement(
			transformation(extent={{135,40},{155,60}}),
			iconTransformation(
				origin={175,125},
				extent={{10,-10},{-10,10}},
				rotation=-180)),
		Dialog(
			tab="Internal Results",
			visible=false));
	Modelica.Blocks.Interfaces.RealOutput TS_S_TM_HC_HW_VL(quantity="Basics.Temp") "Flow temperature to DHW storage" annotation(
		Placement(
			transformation(extent={{135,40},{155,60}}),
			iconTransformation(
				origin={175,125},
				extent={{10,-10},{-10,10}},
				rotation=-180)),
		Dialog(
			tab="Internal Results",
			visible=false));
	Modelica.Blocks.Interfaces.RealOutput TS_S_TM_HC_HW_RL(quantity="Basics.Temp") "Return temperature from DHW storage" annotation(
		Placement(
			transformation(extent={{135,40},{155,60}}),
			iconTransformation(
				origin={175,125},
				extent={{10,-10},{-10,10}},
				rotation=-180)),
		Dialog(
			tab="Internal Results",
			visible=false));
	Modelica.Blocks.Interfaces.RealOutput TS_S_TM_BT_1(quantity="Basics.Temp") "Thermal storage temperature 1" annotation(
		Placement(
			transformation(extent={{135,40},{155,60}}),
			iconTransformation(
				origin={175,125},
				extent={{10,-10},{-10,10}},
				rotation=-180)),
		Dialog(
			tab="Internal Results",
			visible=false));
	Modelica.Blocks.Interfaces.RealOutput TS_S_TM_BT_2(quantity="Basics.Temp") "Thermal storage temperature 2" annotation(
		Placement(
			transformation(extent={{135,40},{155,60}}),
			iconTransformation(
				origin={175,125},
				extent={{10,-10},{-10,10}},
				rotation=-180)),
		Dialog(
			tab="Internal Results",
			visible=false));
	Modelica.Blocks.Interfaces.RealOutput TS_S_TM_BT_3(quantity="Basics.Temp") "Thermal storage temperature 3" annotation(
		Placement(
			transformation(extent={{135,40},{155,60}}),
			iconTransformation(
				origin={175,125},
				extent={{10,-10},{-10,10}},
				rotation=-180)),
		Dialog(
			tab="Internal Results",
			visible=false));
	Modelica.Blocks.Interfaces.RealOutput TS_S_TM_BT_4(quantity="Basics.Temp") "Thermal storage temperature 4" annotation(
		Placement(
			transformation(extent={{135,40},{155,60}}),
			iconTransformation(
				origin={175,125},
				extent={{10,-10},{-10,10}},
				rotation=-180)),
		Dialog(
			tab="Internal Results",
			visible=false));
	Modelica.Blocks.Interfaces.RealOutput TS_S_TM_BT_5(quantity="Basics.Temp") "Thermal storage temperature 5" annotation(
		Placement(
			transformation(extent={{135,40},{155,60}}),
			iconTransformation(
				origin={175,125},
				extent={{10,-10},{-10,10}},
				rotation=-180)),
		Dialog(
			tab="Internal Results",
			visible=false));
	Modelica.Blocks.Interfaces.RealOutput TS_S_TM_BT_6(quantity="Basics.Temp") "Thermal storage temperature 6" annotation(
		Placement(
			transformation(extent={{135,40},{155,60}}),
			iconTransformation(
				origin={175,125},
				extent={{10,-10},{-10,10}},
				rotation=-180)),
		Dialog(
			tab="Internal Results",
			visible=false));
	Modelica.Blocks.Interfaces.RealOutput TS_S_TM_BT_7(quantity="Basics.Temp") "Thermal storage temperature 7" annotation(
		Placement(
			transformation(extent={{135,40},{155,60}}),
			iconTransformation(
				origin={175,125},
				extent={{10,-10},{-10,10}},
				rotation=-180)),
		Dialog(
			tab="Internal Results",
			visible=false));
	Modelica.Blocks.Interfaces.RealOutput TS_S_TM_BT_8(quantity="Basics.Temp") "Thermal storage temperature 8" annotation(
		Placement(
			transformation(extent={{135,40},{155,60}}),
			iconTransformation(
				origin={175,125},
				extent={{10,-10},{-10,10}},
				rotation=-180)),
		Dialog(
			tab="Internal Results",
			visible=false));
	Modelica.Blocks.Interfaces.RealOutput TS_S_TM_BT_9(quantity="Basics.Temp") "Thermal storage temperature 9" annotation(
		Placement(
			transformation(extent={{135,40},{155,60}}),
			iconTransformation(
				origin={175,125},
				extent={{10,-10},{-10,10}},
				rotation=-180)),
		Dialog(
			tab="Internal Results",
			visible=false));
	Modelica.Blocks.Interfaces.RealOutput TS_S_TM_BT_10(quantity="Basics.Temp") "Thermal storage temperature 10" annotation(
		Placement(
			transformation(extent={{135,40},{155,60}}),
			iconTransformation(
				origin={175,125},
				extent={{10,-10},{-10,10}},
				rotation=-180)),
		Dialog(
			tab="Internal Results",
			visible=false));
	Modelica.Blocks.Interfaces.RealOutput TS_E_Storage_BT(quantity="Basics.Energy") "Energy in thermal storage" annotation(
		Placement(
			transformation(extent={{135,40},{155,60}}),
			iconTransformation(
				origin={175,125},
				extent={{10,-10},{-10,10}},
				rotation=-180)),
		Dialog(
			tab="Internal Results",
			visible=false));
	Modelica.Blocks.Interfaces.RealOutput TS_SOC_BT(quantity="Basics.RelMagnitude") "State of charge of the thermal storage" annotation(
		Placement(
			transformation(extent={{135,40},{155,60}}),
			iconTransformation(
				origin={175,125},
				extent={{10,-10},{-10,10}},
				rotation=-180)),
		Dialog(
			tab="Internal Results",
			visible=false));
	Modelica.Blocks.Interfaces.RealOutput HS_S_TM_VL_bM(quantity="Basics.Temp") "Heat Sink flow temperature before mixing unit" annotation(
		Placement(
			transformation(extent={{135,40},{155,60}}),
			iconTransformation(
				origin={175,125},
				extent={{10,-10},{-10,10}},
				rotation=-180)),
		Dialog(
			tab="Internal Results",
			visible=false));
	Modelica.Blocks.Interfaces.RealOutput HS_S_TM_VL_aM(quantity="Basics.Temp") "Heat Sink flow temperature after mixing unit" annotation(
		Placement(
			transformation(extent={{135,40},{155,60}}),
			iconTransformation(
				origin={175,125},
				extent={{10,-10},{-10,10}},
				rotation=-180)),
		Dialog(
			tab="Internal Results",
			visible=false));
	Modelica.Blocks.Interfaces.RealOutput HS_S_TM_RL(quantity="Basics.Temp") "Heat Sink return temperature" annotation(
		Placement(
			transformation(extent={{135,40},{155,60}}),
			iconTransformation(
				origin={175,125},
				extent={{10,-10},{-10,10}},
				rotation=-180)),
		Dialog(
			tab="Internal Results",
			visible=false));
	Modelica.Blocks.Interfaces.RealOutput HS_S_TM_HW_VL(quantity="Basics.Temp") "Heat Sink flow temperature hot water" annotation(
		Placement(
			transformation(extent={{135,40},{155,60}}),
			iconTransformation(
				origin={175,125},
				extent={{10,-10},{-10,10}},
				rotation=-180)),
		Dialog(
			tab="Internal Results",
			visible=false));
	Modelica.Blocks.Interfaces.RealOutput HS_S_TM_HW_RL(quantity="Basics.Temp") "Heat Sink return temperature hot water" annotation(
		Placement(
			transformation(extent={{135,40},{155,60}}),
			iconTransformation(
				origin={175,125},
				extent={{10,-10},{-10,10}},
				rotation=-180)),
		Dialog(
			tab="Internal Results",
			visible=false));
	Modelica.Blocks.Interfaces.RealOutput HS_S_TM_Room(quantity="Basics.Temp") "Heat Sink in the house" annotation(
		Placement(
			transformation(extent={{135,40},{155,60}}),
			iconTransformation(
				origin={175,125},
				extent={{10,-10},{-10,10}},
				rotation=-180)),
		Dialog(
			tab="Internal Results",
			visible=false));
	Modelica.Blocks.Interfaces.RealOutput HS_S_FW_HC_aM(quantity="Thermics.VolumeFlow") "Volume flow after mixing unit" annotation(
		Placement(
			transformation(extent={{135,40},{155,60}}),
			iconTransformation(
				origin={175,125},
				extent={{10,-10},{-10,10}},
				rotation=-180)),
		Dialog(
			tab="Internal Results",
			visible=false));
	Modelica.Blocks.Interfaces.RealOutput HS_S_FW_HC_bM(quantity="Thermics.VolumeFlow") "Volume flow before mixing unit" annotation(
		Placement(
			transformation(extent={{135,40},{155,60}}),
			iconTransformation(
				origin={175,125},
				extent={{10,-10},{-10,10}},
				rotation=-180)),
		Dialog(
			tab="Internal Results",
			visible=false));
	Modelica.Blocks.Interfaces.RealOutput HS_S_FW_HW_VL(quantity="Thermics.VolumeFlow") "Volume flow domestic hot water consumption" annotation(
		Placement(
			transformation(extent={{135,40},{155,60}}),
			iconTransformation(
				origin={175,125},
				extent={{10,-10},{-10,10}},
				rotation=-180)),
		Dialog(
			tab="Internal Results",
			visible=false));
	Modelica.Blocks.Interfaces.RealOutput HS_P_DemHeatHC(quantity="Basics.Power") "Heating power" annotation(
		Placement(
			transformation(extent={{135,40},{155,60}}),
			iconTransformation(
				origin={175,125},
				extent={{10,-10},{-10,10}},
				rotation=-180)),
		Dialog(
			tab="Internal Results",
			visible=false));
	Modelica.Blocks.Interfaces.RealOutput HS_P_DemHeatHW(quantity="Basics.Power") "Domestic hot water power" annotation(
		Placement(
			transformation(extent={{135,40},{155,60}}),
			iconTransformation(
				origin={175,125},
				extent={{10,-10},{-10,10}},
				rotation=-180)),
		Dialog(
			tab="Internal Results",
			visible=false));
	Modelica.Blocks.Interfaces.RealOutput HS_E_DemHeatHC(quantity="Basics.Energy") "Heating Energy" annotation(
		Placement(
			transformation(extent={{135,40},{155,60}}),
			iconTransformation(
				origin={175,125},
				extent={{10,-10},{-10,10}},
				rotation=-180)),
		Dialog(
			tab="Internal Results",
			visible=false));
	Modelica.Blocks.Interfaces.RealOutput HS_E_DemHeatHW(quantity="Basics.Energy") "Domestic hot water Energy" annotation(
		Placement(
			transformation(extent={{135,40},{155,60}}),
			iconTransformation(
				origin={175,125},
				extent={{10,-10},{-10,10}},
				rotation=-180)),
		Dialog(
			tab="Internal Results",
			visible=false));
	Modelica.Blocks.Interfaces.RealInput STpump(quantity="Thermics.VolumeFlow") "Flow rate of the solar thermal pump" annotation(
		Placement(
			transformation(extent={{-145,-90},{-105,-50}}),
			iconTransformation(extent={{-195,-145},{-155,-105}})),
		Dialog(
			tab="Inputs/Outputs",
			visible=false));
	Modelica.Blocks.Interfaces.RealInput CHNpump(quantity="Thermics.VolumeFlow") "Flow rate of the CHN pump on the house side" annotation(
		Placement(
			transformation(extent={{100,-190},{140,-150}}),
			iconTransformation(
				origin={-125,-172},
				extent={{-20,-19.7},{20,20.3}},
				rotation=90)),
		Dialog(
			tab="Inputs/Outputs",
			visible=false));
	Modelica.Blocks.Interfaces.RealInput TCHN_toStorage(quantity="Basics.Temp") "Temperature of the CHN from the heat exchanger to the storage" annotation(
		Placement(
			transformation(extent={{100,-160},{140,-120}}),
			iconTransformation(
				origin={-75,-172},
				extent={{-20,-19.7},{20,20.3}},
				rotation=90)),
		Dialog(
			tab="Inputs/Outputs",
			visible=false));
	Modelica.Blocks.Interfaces.RealOutput TCHN_fromStorage(quantity="Basics.Temp") "Temperature of the CHN from the storage to the heat exchanger " annotation(
		Placement(
			transformation(extent={{95,-125},{115,-105}}),
			iconTransformation(
				origin={-25,-171},
				extent={{-10,-9.699999999999999},{10,10.3}},
				rotation=-90)),
		Dialog(
			tab="Inputs/Outputs",
			visible=false));
	Modelica.Blocks.Interfaces.BooleanInput HPOn "Heat pump on or off" annotation(
		Placement(
			transformation(extent={{-145,-120},{-105,-80}}),
			iconTransformation(
				origin={-175,75},
				extent={{-20,-20},{20,20}})),
		Dialog(
			tab="Inputs/Outputs",
			visible=false));
	Modelica.Blocks.Interfaces.BooleanInput StandardContolST "Standard control of the solar thermal pump (STpump will be ignored)" annotation(
		Placement(
			transformation(extent={{-60,0},{-20,40}}),
			iconTransformation(
				origin={-75,175},
				extent={{-20,-20},{20,20}},
				rotation=-90)),
		Dialog(
			tab="Inputs/Outputs",
			visible=false));
	Modelica.Blocks.Interfaces.BooleanInput StandardControlHP "Standard control of the HP (HPModulation and HPAuxModulation will be ignored)" annotation(
		Placement(
			transformation(extent={{-60,-60},{-20,-20}}),
			iconTransformation(
				origin={-25,175},
				extent={{-20,-20},{20,20}},
				rotation=-90)),
		Dialog(
			tab="Inputs/Outputs",
			visible=false));
	Modelica.Blocks.Interfaces.BooleanInput StandardControlSTSwitch "Standard control of the solar thermal switch (SwitchSTTSPort will be ignored)" annotation(
		Placement(
			transformation(extent={{-60,-30},{-20,10}}),
			iconTransformation(
				origin={25,175},
				extent={{-20,-20},{20,20}},
				rotation=-90)),
		Dialog(
			tab="Inputs/Outputs",
			visible=false));
	Modelica.Blocks.Interfaces.RealInput HPAuxModulation(quantity="Basics.RelMagnitude") "Modulation of the auxiliary heater of the heat pump " annotation(
		Placement(
			transformation(extent={{-145,-150},{-105,-110}}),
			iconTransformation(extent={{-195,5},{-155,45}})),
		Dialog(
			tab="Inputs/Outputs",
			visible=false));
	Modelica.Blocks.Interfaces.BooleanInput StandardControlHPSwitch "Standard control for switching the heat pump port (SwitchHPTSPort will be ignored)" annotation(
		Placement(
			transformation(extent={{-60,-90},{-20,-50}}),
			iconTransformation(
				origin={-125,175},
				extent={{-20,-20},{20,20}},
				rotation=-90)),
		Dialog(
			tab="Inputs/Outputs",
			visible=false));
	Modelica.Blocks.Interfaces.BooleanInput SwitchHPTSPort "Switches between the inlet of the heat pump to the thermal storage (true: upper inlet)" annotation(
		Placement(
			transformation(extent={{-145,-180},{-105,-140}}),
			iconTransformation(
				origin={-175,125},
				extent={{-20,-20},{20,20}})),
		Dialog(
			tab="Inputs/Outputs",
			visible=false));
	Modelica.Blocks.Interfaces.BooleanInput SwitchSTTSPort "Switches between the inlet of thermal storage to the solar thermal module (true: upper inlet)" annotation(
		Placement(
			transformation(extent={{-145,-60},{-105,-20}}),
			iconTransformation(
				origin={-175,-75},
				extent={{-20,-20},{20,20}})),
		Dialog(
			tab="Inputs/Outputs",
			visible=false));
	GreenCity.Utilities.Electrical.Grid grid1(useA=true) "Electrical power grid for connection of maximum six 3-phase AC components" annotation(Placement(transformation(extent={{95,-100},{135,-60}})));
	Houses.SF3 sF3(
		CPC=ST_CollectorType==1,
		alphaModule(displayUnit="rad")=ST_alphaModule,
		betaModule(displayUnit="rad")=ST_betaModule,
		AModule=ST_CollectorSurface,
		VAbsorber=ST_CollectorVolume,
		Tmax_TS(displayUnit="K")=T_max_BT,
		T0_TS(displayUnit="K")=T_reference_BT,
		TSTupInit(displayUnit="K")=TS_S_TM_BT_10_init,
		TSTlowInit(displayUnit="K")=TS_S_TM_BT_1_init,
		nPeople=nPeople,
		nFloors=nFloors,
		nApartments=nApartments,
		ALH=HeatedArea,
		QHeatNormLivingArea=if HeatingSystem==0 then 16 else 13,
		n=if HeatingSystem==0 then 1.3 else 1.1,
		TFlowHeatNorm(displayUnit="K")=if HeatingSystem==0 then 338.15 else 313.15,
		TReturnHeatNorm(displayUnit="K")=if HeatingSystem==0 then 323.15 else 303.15,
		TRef(displayUnit="K")=T_roomSet,
		TLiving_Init=TLiving_Init,
		TRoof_Init(displayUnit="K")=TRoof_Init,
		TCellar_Init(displayUnit="K")=TCellar_Init,
		PresenceFile=file,
		ElConsumptionFile=file,
		YearlyElecConsumption_kWh=YearlyElecConsumption,
		ActivateNightTimeReduction=true,
		NightTimeReductionStart(displayUnit="s")=NightTimeReductionStart_h*3600,
		NightTimeReductionEnd(displayUnit="s")=NightTimeReductionEnd_h*3600,
		Tnight(displayUnit="K")=T_roomNightSet,
		File=file,
		V_DHWperDay_l=V_DHWperDay,
		alphaPV(displayUnit="rad")=PValpha,
		betaPV(displayUnit="rad")=PVbeta,
		PVPeak(displayUnit="Nm/s")=PVPeak) annotation(Placement(transformation(extent={{5,-150},{55,-100}})));
	parameter Integer InitDay=1 "Initial day of the month" annotation(Dialog(tab="Parameters"));
	parameter Integer InitMonth=1 "Inital month" annotation(Dialog(tab="Parameters"));
	protected
		parameter Integer WeekDayInit=if InitMonth == 1 then (mod(InitDay + 3,7) + 1)
		elseif InitMonth == 2 then (mod(InitDay - 1,7) + 1)
		elseif InitMonth == 3 then (mod(InitDay - 1,7) + 1)
		elseif InitMonth == 4 then (mod(InitDay + 2,7) + 1)
		elseif InitMonth == 5 then (mod(InitDay + 4,7) + 1)
		elseif InitMonth == 6 then (mod(InitDay,7) + 1)
		elseif InitMonth == 7 then (mod(InitDay + 2,7) + 1)
		elseif InitMonth == 8 then (mod(InitDay + 5,7) + 1)
		elseif InitMonth == 9 then (mod(InitDay + 1,7) + 1)
		elseif InitMonth == 10 then (mod(InitDay + 3,7) + 1)
		elseif InitMonth == 11 then (mod(InitDay,7) + 1)
		else (mod(InitDay + 1, 7) + 1) "Inital day of the week" annotation(Dialog(tab="Parameters"));
		parameter String file="C:\Users\Public\Documents\SimulationX 4.2\Modelica\CoSES_Models\Data\SF3_WholeYear.txt" "Path to file for consumption data" annotation(Dialog(tab="Parameters"));
		parameter Real TLiving_Init(
			quantity="Basics.Temp",
			displayUnit="°C")=294.15 "Initial Temperature" annotation(Dialog(tab="Parameters"));
		parameter Real TRoof_Init(
			quantity="Basics.Temp",
			displayUnit="°C")=281.15 "Initial Temperature" annotation(Dialog(tab="Parameters"));
		parameter Real TCellar_Init(
			quantity="Basics.Temp",
			displayUnit="°C")=281.15 "Initial Temperature" annotation(Dialog(tab="Parameters"));
		parameter Real T_roomSet(quantity="Basics.Temp")=294.15 "T_roomSet" annotation(Dialog(tab="Parameters"));
		parameter Real T_roomNightSet(quantity="Basics.Temp")=291.15 "T_roomNightSet" annotation(Dialog(tab="Parameters"));
		parameter Real NightTimeReductionStart_h=23 "NightTimeReductionStart_h" annotation(Dialog(tab="Parameters"));
		parameter Real NightTimeReductionEnd_h=7 "NightTimeReductionEnd_h" annotation(Dialog(tab="Parameters"));
		parameter Integer HeatingSystem=1 "0 - Radiator Heating, 1 - Space Heating" annotation(Dialog(tab="Parameters"));
		parameter Integer nPeople=8 "nPeople" annotation(Dialog(tab="Parameters"));
		parameter Integer nFloors=2 "nFloors" annotation(Dialog(tab="Parameters"));
		parameter Integer nApartments=3 "nApartments" annotation(Dialog(tab="Parameters"));
		parameter Real HeatedArea(quantity="Geometry.Area")=400 "HeatedArea" annotation(Dialog(tab="Parameters"));
		parameter Real YearlyElecConsumption(
			quantity="Basics.Energy",
			displayUnit="kWh")=34200000000 "YearlyElecConsumption" annotation(Dialog(tab="Parameters"));
		parameter String ElTable="Pel_15min" "Pel_1min for 1 minute time resolution or Pel_15min for 15 minutes time resolution" annotation(Dialog(tab="Parameters"));
		parameter Real V_DHWperDay(
			quantity="Geometry.Volume",
			displayUnit="m³")=400 "V_DHWperDay" annotation(Dialog(tab="Parameters"));
		parameter Integer ST_CollectorType=0 "0 - Flat Plate Collector, 1 - Compound Parabolic Collector" annotation(Dialog(tab="Parameters"));
		parameter Real ST_CollectorSurface(quantity="Geometry.Area")=2 "ST_CollectorSurface" annotation(Dialog(tab="Parameters"));
		parameter Real ST_CollectorVolume(
			quantity="Geometry.Volume",
			displayUnit="l")=0.0017 "ST_CollectorVolume" annotation(Dialog(tab="Parameters"));
		parameter Real ST_alphaModule(
			quantity="Geometry.Angle",
			displayUnit="°")=0.6108652381980153 "Inclination angle of solar thermal collector" annotation(Dialog(tab="Parameters"));
		parameter Real ST_betaModule(
			quantity="Geometry.Angle",
			displayUnit="°")=3.141592653589793 "Orientation angle of solar thermal collector" annotation(Dialog(tab="Parameters"));
		parameter Real TS_S_TM_BT_1_init(quantity="Basics.Temp")=313.15 "initial temperature of lowest storage layer" annotation(Dialog(tab="Parameters"));
		parameter Real TS_S_TM_BT_10_init(quantity="Basics.Temp")=333.15 "initial temperature of highest storage layer" annotation(Dialog(tab="Parameters"));
		parameter Real T_reference_BT(quantity="Basics.Temp")=293.15 "Reference temperature of BT to calculate SOC, T_Sto = T_ref => SOC = 0" annotation(Dialog(tab="Parameters"));
		parameter Real T_max_BT(quantity="Basics.Temp")=368.15 "Maximum temperature of storage, T_sto = T_max => SOC = 1" annotation(Dialog(tab="Parameters"));
		parameter Real PValpha(
			quantity="Geometry.Angle",
			displayUnit="°")=0.6108652381980153 "Inclination angle of the PV system" annotation(Dialog(tab="Parameters"));
		parameter Real PVbeta(
			quantity="Geometry.Angle",
			displayUnit="°")=3.141592653589793 "Orientation angle of the PV system" annotation(Dialog(tab="Parameters"));
		parameter Real PVPeak(quantity="Basics.Power")=10000 "Installed peak power of the PV system" annotation(Dialog(tab="Parameters"));
	public
		Environment.Environment environment1(
			DefaultInit=false,
			useUnixTimeStamp=false,
			WeekDayInit=WeekDayInit,
			MonthDayInit=InitDay,
			MonthInit=InitMonth,
			YearInit=2021) annotation(Placement(transformation(extent={{95,-50},{125,-20}})));
	equation
		// Internal Results
		// Heat Pump
		HP_S_TM_VL = sF3.HP_S_TM_VL;
		HP_S_TM_RL = sF3.HP_S_TM_RL;
		HP_S_TM_BC_VL = sF3.HP_S_TM_BC_VL;
		HP_S_TM_BC_RL = sF3.HP_S_TM_BC_RL;
		HP_S_FW_HC = sF3.HP_S_FW_HC;
		HP_S_FW_BC = sF3.HP_S_FW_BC;
		HP_P_heat = sF3.HP_P_heat_is;
		HP_P_elec = sF3.HP_P_elec_is;
		HP_E_heat = sF3.HP_E_heat_produced;
		HP_E_elec = sF3.HP_E_elec_consumed;
		HP_COP = sF3.HP_COP;
		
		// Solar Thermal
		ST_S_TM_VL = sF3.ST_S_TM_VL;
		ST_S_TM_RL = sF3.ST_S_TM_RL;
		ST_S_TM_Collector = sF3.TCollectorST;
		ST_S_FW_HC = sF3.ST_S_FW_HC;
		ST_P_heat = sF3.ST_P_heat_is;
		ST_E_heat = sF3.ST_E_heat_produced;
		
		// Thermal Storage
		TS_S_TM_HC_VL = sF3.TS_S_TM_HC_VL;
		TS_S_TM_HC_RL = sF3.TS_S_TM_HC_RL;
		TS_S_TM_PS_VL = sF3.TS_S_TM_PS_VL;
		TS_S_TM_PS_RL = sF3.TS_S_TM_PS_RL;
		TS_S_TM_HC_HW_VL = sF3.TS_S_TM_HC_HW_VL;
		TS_S_TM_HC_HW_RL = sF3.TS_S_TM_HC_HW_RL;
		TS_S_TM_BT_1 = sF3.TS_S_TM_BT_1;
		TS_S_TM_BT_2 = sF3.TS_S_TM_BT_2;
		TS_S_TM_BT_3 = sF3.TS_S_TM_BT_3;
		TS_S_TM_BT_4 = sF3.TS_S_TM_BT_4;
		TS_S_TM_BT_5 = sF3.TS_S_TM_BT_5;
		TS_S_TM_BT_6 = sF3.TS_S_TM_BT_6;
		TS_S_TM_BT_7 = sF3.TS_S_TM_BT_7;
		TS_S_TM_BT_8 = sF3.TS_S_TM_BT_8;
		TS_S_TM_BT_9 = sF3.TS_S_TM_BT_9;
		TS_S_TM_BT_10 = sF3.TS_S_TM_BT_10;
		TS_E_Storage_BT = sF3.TS_E_Storage_BT;
		TS_SOC_BT = sF3.TS_SOC_BT;
		
		// Heat Sink
		HS_S_TM_VL_bM = sF3.HS_S_TM_VL_bM;
		HS_S_TM_VL_aM = sF3.HS_S_TM_VL_aM;
		HS_S_TM_RL = sF3.HS_S_TM_RL;
		HS_S_TM_HW_VL = sF3.HS_S_TM_HW_VL;
		HS_S_TM_HW_RL = sF3.HS_S_TM_HW_RL;
		//HS_S_TM_Room = sF3.HS_S_TM_Room;
		HS_S_FW_HC_aM = sF3.HS_S_FW_HC_aM;
		HS_S_FW_HC_bM = sF3.HS_S_FW_HC_bM;
		HS_S_FW_HW_VL = sF3.HS_S_FW_HW_VL;
		HS_P_DemHeatHC = sF3.HS_P_DemHeatHC_is;
		HS_P_DemHeatHW = sF3.HS_P_DemHeatHW_is;
		HS_E_DemHeatHC = sF3.HS_E_DemHeatHC_consumed;
		HS_E_DemHeatHW = sF3.HS_E_DemHeatHW_consumed;
		
		// PV
		PV_P = sF3.PV_P;
		PV_E = sF3.PV_E;
		
		// outputs
		//TCHN_fromStorage = sF3.DTH_HEXin;
	equation
		connect(SwitchHPTSPort,sF3.SwitchHPTSPort) annotation(Line(
			points={{-125,-160},{-120,-160},{0,-160},{0,-135},{5,-135}},
			color={255,0,255},
			thickness=0.0625));
		connect(HPAuxModulation,sF3.HPAUXIn) annotation(Line(
			points={{-125,-130},{-120,-130},{0,-130},{5,-130}},
			color={0,0,127},
			thickness=0.0625));
		connect(sF3.qvSTpump,STpump) annotation(
			Line(
				points={{5,-110},{0,-110},{-95,-110},{-95,-70},{-125,-70}},
				color={0,0,127},
				thickness=0.0625),
			__esi_AutoRoute=false);
		connect(CHNpump,sF3.qvDHpump) annotation(Line(
			points={{120,-170},{115,-170},{59.7,-170},{59.7,-145},{54.7,-145}},
			color={0,0,127},
			thickness=0.0625));
		connect(sF3.TDH_HEXout,TCHN_toStorage) annotation(Line(
			points={{54.7,-140},{59.7,-140},{115,-140},{120,-140}},
			color={0,0,127},
			thickness=0.0625));
		connect(TCHN_fromStorage,sF3.DTH_HEXin) annotation(
			Line(
				points={{105,-115},{100,-115},{85,-115},{85,-130},{54.66667175292969,-130}},
				color={0,0,127},
				thickness=0.0625),
			__esi_AutoRoute=false);
		connect(grid1.LVGridA,sF3.lV3Phase1) annotation(
			Line(
				points={{95,-65},{90,-65},{65,-65},{65,-115},{54.66667175292969,-115}},
				color={247,148,29},
				thickness=0.0625),
			__esi_AutoRoute=false);
		connect(sF3.SwitchSTTSPort,SwitchSTTSPort) annotation(
			Line(
				points={{5,-105},{0,-105},{-90,-105},{-90,-40},{-125,-40}},
				color={255,0,255},
				thickness=0.0625),
			__esi_AutoRoute=false);
		connect(sF3.HPOn,HPOn) annotation(
			Line(
				points={{5,-125},{0,-125},{-100,-125},{-100,-100},{-125,-100}},
				color={255,0,255},
				thickness=0.0625),
			__esi_AutoRoute=false);
		connect(environment1.EnvironmentConditions,sF3.environmentConditions1) annotation(Line(
			points={{95,-35},{90,-35},{59.7,-35},{59.7,-105},{54.7,-105}},
			color={192,192,192},
			thickness=0.0625));
		connect(sF3.StandardControlHPSwitch,StandardControlHPSwitch) annotation(Line(
			points={{15,-100},{15,-95},{15,-70},{-35,-70},{-40,-70}},
			color={255,0,255},
			thickness=0.0625));
		connect(sF3.StandardHPcontrol,StandardControlHP) annotation(Line(
			points={{25,-100},{25,-95},{25,-40},{-35,-40},{-40,-40}},
			color={255,0,255},
			thickness=0.0625));
		connect(sF3.StandardControlSTSwitch,StandardControlSTSwitch) annotation(Line(
			points={{35,-100},{35,-95},{35,-10},{-35,-10},{-40,-10}},
			color={255,0,255},
			thickness=0.0625));
		connect(sF3.StandardSTcontrol,StandardContolST) annotation(Line(
			points={{45,-100},{45,-95},{45,20},{-35,20},{-40,20}},
			color={255,0,255},
			thickness=0.0625));
	annotation(
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
					left=285,
					top=0,
					right=420,
					bottom=60),
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
					left=420,
					top=0,
					right=630,
					bottom=60),
				frame(
					style=0,
					width=0,
					color=0),
				clrBack=14806254,
				index=1,
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
			projectName="SF3",
			projectPath="C:\\Users\\gu62xur\\Downloads\\FMI Test",
			projectType=20,
			saveOutputsApproach=1,
			inputs[0](
				port="STpump",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			inputs[1](
				port="CHNpump",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			inputs[2](
				port="TCHN_toStorage",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			inputs[3](
				port="HPOn",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			inputs[4](
				port="StandardContolST",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			inputs[5](
				port="StandardControlHP",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			inputs[6](
				port="StandardControlSTSwitch",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			inputs[7](
				port="HPAuxModulation",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			inputs[8](
				port="StandardControlHPSwitch",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			inputs[9](
				port="SwitchHPTSPort",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			inputs[10](
				port="SwitchSTTSPort",
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
				port="HP_P_heat",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[6](
				port="HP_S_FW_BC",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[7](
				port="HP_P_elec",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[8](
				port="HP_E_heat",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[9](
				port="HP_E_elec",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[10](
				port="HP_COP",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[11](
				port="PV_P",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[12](
				port="PV_E",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[13](
				port="ST_S_TM_VL",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[14](
				port="ST_S_TM_RL",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[15](
				port="ST_S_TM_Collector",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[16](
				port="ST_S_FW_HC",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[17](
				port="ST_P_heat",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[18](
				port="ST_E_heat",
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
				port="TS_S_TM_HC_HW_VL",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[24](
				port="TS_S_TM_HC_HW_RL",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[25](
				port="TS_S_TM_BT_1",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[26](
				port="TS_S_TM_BT_2",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[27](
				port="TS_S_TM_BT_3",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[28](
				port="TS_S_TM_BT_4",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[29](
				port="TS_S_TM_BT_5",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[30](
				port="TS_S_TM_BT_6",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[31](
				port="TS_S_TM_BT_7",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[32](
				port="TS_S_TM_BT_8",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[33](
				port="TS_S_TM_BT_9",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[34](
				port="TS_S_TM_BT_10",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[35](
				port="TS_E_Storage_BT",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[36](
				port="TS_SOC_BT",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[37](
				port="HS_S_TM_VL_bM",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[38](
				port="HS_S_TM_VL_aM",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[39](
				port="HS_S_TM_RL",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[40](
				port="HS_S_TM_HW_VL",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[41](
				port="HS_S_TM_HW_RL",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[42](
				port="HS_S_FW_HC_aM",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[43](
				port="HS_S_FW_HC_bM",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[44](
				port="HS_S_FW_HW_VL",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[45](
				port="HS_P_DemHeatHC",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[46](
				port="HS_P_DemHeatHW",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[47](
				port="HS_E_DemHeatHC",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[48](
				port="HS_E_DemHeatHW",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[49](
				port="TCHN_fromStorage",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[0](
				port="InitDay",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[1](
				port="InitMonth",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[2](
				port="TLiving_Init",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[3](
				port="TRoof_Init",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[4](
				port="TCellar_Init",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[5](
				port="T_roomSet",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[6](
				port="T_roomNightSet",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[7](
				port="NightTimeReductionStart_h",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[8](
				port="NightTimeReductionEnd_h",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[9](
				port="HeatingSystem",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[10](
				port="nPeople",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[11](
				port="nFloors",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[12](
				port="nApartments",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[13](
				port="HeatedArea",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[14](
				port="YearlyElecConsumption",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[15](
				port="V_DHWperDay",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[16](
				port="ST_CollectorType",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[17](
				port="ST_CollectorSurface",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[18](
				port="ST_CollectorVolume",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[19](
				port="ST_alphaModule",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[20](
				port="ST_betaModule",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[21](
				port="TS_S_TM_BT_1_init",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[22](
				port="TS_S_TM_BT_10_init",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[23](
				port="T_reference_BT",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[24](
				port="T_max_BT",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[25](
				port="PValpha",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[26](
				port="PVbeta",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[27](
				port="PVPeak",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			descriptionProject="SimulationX model of SF1",
			author="Zinsmeister, Daniel",
			fmiIncludeDllWin32=false,
			fmiIncludeDllWin64=true,
			fmiExposeVariables=false,
			fmiIncludeSources=false,
			fmiExposeStates=false,
			fmiLogging=false,
			fmiModelImgFile="C:\\Users\\Public\\Documents\\SimulationX 4.2\\Modelica\\CoSES_Models\\Houses\\SF3.png",
			guid="{FFDA70D0-F6C7-4F86-8C05-050388D98ACC}",
			showAdditionalLibPage=false,
			useCodeOptimization=false,
			m_x64=false,
			solverMode=1,
			checkSum=103261,
			fmiVersion="1.0",
			typename="CodeExportInfo"),
		Icon(
			coordinateSystem(extent={{-175,-175},{175,175}}),
			graphics={
							Text(
								textString="SF3 FMI",
								extent={{-169.5,148.6},{153.8,75.2}}),
							Bitmap(
								imageSource="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
EUJd3f8B7chaQ/qC6bMAAAAASUVORK5CYII=",
								extent={{-132,-149.2},{143,73.3}})}),
		Documentation(info="MIME-Version: 1.0
Content-Type: multipart/related;boundary=\"--$iti$\";type=\"text/html\"

----$iti$
Content-Type:text/html;charset=\"iso-8859-1\"
Content-Transfer-Encoding: quoted-printable
Content-Location: C:\\Users\\Stefan.Mohr\\AppData\\Local\\Temp\\iti4322.tmp\\hlpB11A.tmp\\Example_C_Complex_Model.htm

<=21DOCTYPE HTML PUBLIC =22-//W3C//DTD HTML 4.0 Transitional//EN=22>
<HTML><HEAD><TITLE>Example_C_Renewable energy system model V1.0</TITLE>
<META content=3D=22text/html; charset=3Diso-8859-1=22 http-equiv=3DContent-T=
ype>
<STYLE type=3Dtext/css>
p, li =7Bfont-family: Verdana, Arial, Helvetica, sans-serif; font-size:12px;=
 color: =23000000;=7D
.Ueberschrift1 =7Bfont-family: Verdana, Arial, Helvetica, sans-serif; font-s=
ize:14px; font-weight:bold; color:=23000000; margin-top:0; margin-bottom:6px=
;=7D
.Ueberschrift2 =7Bfont-family: Verdana, Arial, Helvetica, sans-serif; font-s=
ize:12px; font-weight:bold; color:=23000000; margin-top:6px; margin-bottom:6=
px;=7D
.Ueberschrift3 =7Bfont-family: Verdana, Arial, Helvetica, sans-serif; font-s=
ize:12px; font-weight:bold; font-style:italic; color:=23000000; margin-top:6=
px; margin-bottom:6px;=7D
.SymbolTab =7Bfont-family: Verdana, Arial, Helvetica, sans-serif; font-size:=
12px; font-weight:bold; color:=23000000;=7D
</STYLE>
<LINK rel=3Dstylesheet href=3D=22../format_help.css=22>
<META name=3DGENERATOR content=3D=22MSHTML 9.00.8112.16447=22></HEAD>
<BODY bgColor=3D=23ffffff vLink=3D=23800080 link=3D=230000ff>
<P style=3D=22MARGIN-TOP: 0px; MARGIN-BOTTOM: 0px=22 
class=3DUeberschrift1>Example_C_Renewable energy system model V1.0</P>
<HR style=3D=22MARGIN-TOP: 0px; MARGIN-BOTTOM: 0px=22 SIZE=3D1 noShade>

<TABLE border=3D1 cellSpacing=3D0 borderColor=3D=23ffffff borderColorLight=
=3D=23ffffff 
borderColorDark=3D=23ffffff cellPadding=3D2 width=3D=22100%=22 bgColor=3D=23=
cccccc>
  <TBODY>
  <TR>
    <TD bgColor=3D=2395c9f0 vAlign=3Dtop width=3D=2215%=22>
      <P>Symbol:</P></TD>
    <TD bgColor=3D=23ffffff vAlign=3Dtop colSpan=3D3><IMG 
      src=3D=22Example_C_Complex_Model=5Csymbol.png=22 width=3D65 height=3D3=
5></TD></TR>
  <TR>
    <TD bgColor=3D=2395c9f0 vAlign=3Dtop width=3D=2215%=22>
      <P>Ident:</P></TD>
    <TD bgColor=3D=23efefef vAlign=3Dtop colSpan=3D3>
      <P 
class=3DSymbolTab>GreenBuilding.Examples.Example_C_Complex_Model</P></TD></T=
R>
  <TR>
    <TD bgColor=3D=2395c9f0 vAlign=3Dtop width=3D=2215%=22>
      <P>Version:</P></TD>
    <TD bgColor=3D=23efefef vAlign=3Dtop colSpan=3D3>
      <P class=3DSymbolTab>1.0</P></TD></TR>
  <TR>
    <TD bgColor=3D=2395c9f0 vAlign=3Dtop width=3D=2215%=22>
      <P>File:</P></TD>
    <TD bgColor=3D=23efefef vAlign=3Dtop colSpan=3D3>
      <P class=3DSymbolTab></P></TD></TR></TBODY></TABLE>
<P class=3DUeberschrift2>Description:</P>
<P style=3D=22MARGIN-TOP: 6pt; MARGIN-BOTTOM: 0px=22>This more complex build=
ing energy 
system model includes renewable production systems (photovolatic system, 
micro-wind-turbine), energy storages (li-Ion battery, geat storage) and a 
heating system (heat pump) for a two-zonal building system (one heated zone,=
 one 
non-heated zone). </P>
<P style=3D=22MARGIN-TOP: 6pt; MARGIN-BOTTOM: 0px=22>Especially, it is shown=
 how a 
more complex building architecture can be modeled using several elements of =
the 
'Building'-Package of =22GreenBuilding=22-Library.</P></BODY></HTML>


----$iti$
Content-Type: image/png
Content-Transfer-Encoding: base64
Content-Location: Example_C_Complex_Model\\symbol.png

iVBORw0KGgoAAAANSUhEUgAAAEEAAAAjCAYAAADLy2cUAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAACFSURBVGhD7dlBDoAgEEPRuf+lRwliiBEXLodn4gGs7S/aSFcGDZIIzQScQIQOg1cnRERWvp8cXIpQFZjt5RKBCGf+iUCE3gScQAROGLUoDphwHZGBERiBERinLybtoB20wx0IcRAHcRCH+Z8iJmACJvxjwvbjS9XhZfVcBlmD7Mcgu1scDlKwjERkwRQaAAAAAElFTkSuQmCC

----$iti$--"),
		experiment(
			StopTime=864000,
			StartTime=0,
			Tolerance=1e-06,
			Interval=0.001,
			__esi_SolverOptions(
				solver="CVODE",
				typename="ExternalCVODEOptionData"),
			__esi_MinInterval="9.999999999999999e-10",
			__esi_AbsTolerance="1e-6"));
end SF3_Dymola;
