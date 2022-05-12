// CP: 65001
// SimulationX Version: 4.2.3.69223
within CoSES_Models.CodeExport.DymolaFMI;
model SF2_Dymola "FMU model of SF2 for Dymola"
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
	Modelica.Blocks.Interfaces.RealOutput HP_S_TM_HC_TL(quantity="Basics.Temp") "Heat pump flow temperature - Low temperature" annotation(
		Placement(
			transformation(extent={{135,40},{155,60}}),
			iconTransformation(
				origin={175,125},
				extent={{10,-10},{-10,10}},
				rotation=-180)),
		Dialog(
			tab="Internal Results",
			visible=false));
	Modelica.Blocks.Interfaces.RealOutput HP_S_TM_HW_TH(quantity="Basics.Temp") "Heat pump flow temperature - High temperature" annotation(
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
	Modelica.Blocks.Interfaces.RealOutput HP_P_heat_HP(quantity="Basics.Power") "Heat output power of the heat pump" annotation(
		Placement(
			transformation(extent={{135,40},{155,60}}),
			iconTransformation(
				origin={175,125},
				extent={{10,-10},{-10,10}},
				rotation=-180)),
		Dialog(
			tab="Internal Results",
			visible=false));
	Modelica.Blocks.Interfaces.RealOutput HP_P_heat_Aux(quantity="Basics.Power") "Heat output power of the auxiliary heater" annotation(
		Placement(
			transformation(extent={{135,40},{155,60}}),
			iconTransformation(
				origin={175,125},
				extent={{10,-10},{-10,10}},
				rotation=-180)),
		Dialog(
			tab="Internal Results",
			visible=false));
	Modelica.Blocks.Interfaces.RealOutput HP_P_heat_Tot(quantity="Basics.Power") "Total heat output power of the heat pump" annotation(
		Placement(
			transformation(extent={{135,40},{155,60}}),
			iconTransformation(
				origin={175,125},
				extent={{10,-10},{-10,10}},
				rotation=-180)),
		Dialog(
			tab="Internal Results",
			visible=false));
	Modelica.Blocks.Interfaces.RealOutput HP_P_cooling(quantity="Basics.Power") "Cooling output of the heat pump" annotation(
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
	Modelica.Blocks.Interfaces.RealOutput HP_E_heat_HP(quantity="Basics.Energy") "Heat output of the heat pump" annotation(
		Placement(
			transformation(extent={{135,40},{155,60}}),
			iconTransformation(
				origin={175,125},
				extent={{10,-10},{-10,10}},
				rotation=-180)),
		Dialog(
			tab="Internal Results",
			visible=false));
	Modelica.Blocks.Interfaces.RealOutput HP_E_heat_Aux(quantity="Basics.Energy") "Heat output power of the auxiliary heater" annotation(
		Placement(
			transformation(extent={{135,40},{155,60}}),
			iconTransformation(
				origin={175,125},
				extent={{10,-10},{-10,10}},
				rotation=-180)),
		Dialog(
			tab="Internal Results",
			visible=false));
	Modelica.Blocks.Interfaces.RealOutput HP_E_heat_Tot(quantity="Basics.Energy") "Total heat output power of the heat pump" annotation(
		Placement(
			transformation(extent={{135,40},{155,60}}),
			iconTransformation(
				origin={175,125},
				extent={{10,-10},{-10,10}},
				rotation=-180)),
		Dialog(
			tab="Internal Results",
			visible=false));
	Modelica.Blocks.Interfaces.RealOutput HP_E_cooling(quantity="Basics.Energy") "Cooling output of the heat pump" annotation(
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
	Modelica.Blocks.Interfaces.RealOutput HP_EER(quantity="Basics.RelMagnitude") "Energy Efficiency Ratio (Cooling)" annotation(
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
	Modelica.Blocks.Interfaces.RealOutput CB_S_TM_VL(quantity="Basics.Temp") "CB flow temperature" annotation(
		Placement(
			transformation(extent={{135,40},{155,60}}),
			iconTransformation(
				origin={175,125},
				extent={{10,-10},{-10,10}},
				rotation=-180)),
		Dialog(
			tab="Internal Results",
			visible=false));
	Modelica.Blocks.Interfaces.RealOutput CB_S_TM_RL(quantity="Basics.Temp") "CB return temperature" annotation(
		Placement(
			transformation(extent={{135,40},{155,60}}),
			iconTransformation(
				origin={175,125},
				extent={{10,-10},{-10,10}},
				rotation=-180)),
		Dialog(
			tab="Internal Results",
			visible=false));
	Modelica.Blocks.Interfaces.RealOutput CB_S_FW_HC(quantity="Thermics.VolumeFlow") "Volume flow CB" annotation(
		Placement(
			transformation(extent={{135,40},{155,60}}),
			iconTransformation(
				origin={175,125},
				extent={{10,-10},{-10,10}},
				rotation=-180)),
		Dialog(
			tab="Internal Results",
			visible=false));
	Modelica.Blocks.Interfaces.RealOutput CB_S_FG(quantity="Thermics.VolumeFlow") "Gas flow CB" annotation(
		Placement(
			transformation(extent={{135,40},{155,60}}),
			iconTransformation(
				origin={175,125},
				extent={{10,-10},{-10,10}},
				rotation=-180)),
		Dialog(
			tab="Internal Results",
			visible=false));
	Modelica.Blocks.Interfaces.RealOutput CB_VFuel(quantity="Basics.Volume") "Demanded fuel volume" annotation(
		Placement(
			transformation(extent={{135,40},{155,60}}),
			iconTransformation(
				origin={175,125},
				extent={{10,-10},{-10,10}},
				rotation=-180)),
		Dialog(
			tab="Internal Results",
			visible=false));
	Modelica.Blocks.Interfaces.RealOutput CB_P_heat(quantity="Basics.Power") "Heat output power of CB" annotation(
		Placement(
			transformation(extent={{135,40},{155,60}}),
			iconTransformation(
				origin={175,125},
				extent={{10,-10},{-10,10}},
				rotation=-180)),
		Dialog(
			tab="Internal Results",
			visible=false));
	Modelica.Blocks.Interfaces.RealOutput CB_P_gas(quantity="Basics.Power") "Gas power of CB" annotation(
		Placement(
			transformation(extent={{135,40},{155,60}}),
			iconTransformation(
				origin={175,125},
				extent={{10,-10},{-10,10}},
				rotation=-180)),
		Dialog(
			tab="Internal Results",
			visible=false));
	Modelica.Blocks.Interfaces.RealOutput CB_E_heat(quantity="Basics.Energy") "Heat output  of CB" annotation(
		Placement(
			transformation(extent={{135,40},{155,60}}),
			iconTransformation(
				origin={175,125},
				extent={{10,-10},{-10,10}},
				rotation=-180)),
		Dialog(
			tab="Internal Results",
			visible=false));
	Modelica.Blocks.Interfaces.RealOutput CB_E_gas(quantity="Basics.Energy") "Gas input of CB" annotation(
		Placement(
			transformation(extent={{135,40},{155,60}}),
			iconTransformation(
				origin={175,125},
				extent={{10,-10},{-10,10}},
				rotation=-180)),
		Dialog(
			tab="Internal Results",
			visible=false));
	Modelica.Blocks.Interfaces.RealOutput CB_Efficiency_th(quantity="Basics.RelMagnitude") "Thermal efficiency" annotation(
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
	Modelica.Blocks.Interfaces.RealInput P_CB(quantity="Basics.Power") "Set Power Condensing Boiler" annotation(
		Placement(
			transformation(extent={{-145,-210},{-105,-170}}),
			iconTransformation(extent={{-195,105},{-155,145}})),
		Dialog(
			tab="Inputs/Outputs",
			visible=false));
	Modelica.Blocks.Interfaces.RealInput HPModulation(quantity="Basics.RelMagnitude") "Modulation of the heat pump" annotation(
		Placement(
			transformation(extent={{-145,-180},{-105,-140}}),
			iconTransformation(extent={{-195,-45},{-155,-5}})),
		Dialog(
			tab="Inputs/Outputs",
			visible=false));
	Modelica.Blocks.Interfaces.RealInput STpump(quantity="Thermics.VolumeFlow") "Flow rate of the solar thermal pump" annotation(
		Placement(
			transformation(extent={{-145,-60},{-105,-20}}),
			iconTransformation(extent={{-195,-145},{-155,-105}})),
		Dialog(
			tab="Inputs/Outputs",
			visible=false));
	Modelica.Blocks.Interfaces.RealInput CHNpump(quantity="Thermics.VolumeFlow") "Flow rate of the CHN pump on the house side" annotation(
		Placement(
			transformation(extent={{100,-215},{140,-175}}),
			iconTransformation(
				origin={-125,-172},
				extent={{-20,-19.7},{20,20.3}},
				rotation=90)),
		Dialog(
			tab="Inputs/Outputs",
			visible=false));
	Modelica.Blocks.Interfaces.RealInput TCHN_toStorage(quantity="Basics.Temp") "Temperature of the CHN from the heat exchanger to the storage" annotation(
		Placement(
			transformation(extent={{100,-185},{140,-145}}),
			iconTransformation(
				origin={-75,-172},
				extent={{-20,-19.7},{20,20.3}},
				rotation=90)),
		Dialog(
			tab="Inputs/Outputs",
			visible=false));
	Modelica.Blocks.Interfaces.RealOutput TCHN_fromStorage(quantity="Basics.Temp") "Temperature of the CHN from the storage to the heat exchanger " annotation(
		Placement(
			transformation(extent={{95,-150},{115,-130}}),
			iconTransformation(
				origin={-25,-171},
				extent={{-10,-9.699999999999999},{10,10.3}},
				rotation=-90)),
		Dialog(
			tab="Inputs/Outputs",
			visible=false));
	SignalBlocks.Connection connection3;
	SignalBlocks.Connection connection4;
	Modelica.Blocks.Interfaces.BooleanInput HPMode "Heating mode (true) or cooling more (false)" annotation(
		Placement(
			transformation(extent={{-145,-120},{-105,-80}}),
			iconTransformation(
				origin={-175,25},
				extent={{-20,-20},{20,20}})),
		Dialog(
			tab="Inputs/Outputs",
			visible=false));
	Modelica.Blocks.Interfaces.BooleanInput StandardContolST "Standard control of the solar thermal pump (STpump will be ignored)" annotation(
		Placement(
			transformation(extent={{-60,-30},{-20,10}}),
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
	Modelica.Blocks.Interfaces.BooleanInput StandardControlCB "Standard control of the CHP (P_CB will be ignored)" annotation(
		Placement(
			transformation(extent={{-60,-120},{-20,-80}}),
			iconTransformation(
				origin={25,175},
				extent={{-20,-20},{20,20}},
				rotation=-90)),
		Dialog(
			tab="Inputs/Outputs",
			visible=false));
	GreenCity.Utilities.Electrical.Grid grid1(useA=true) "Electrical power grid for connection of maximum six 3-phase AC components" annotation(Placement(transformation(extent={{95,-100},{135,-60}})));
	InterfacesGeneral.PhysicsSignalInterfaces.GeneralElements.SigInDer sigInDer2(kind=InterfacesGeneral.PhysicsSignalInterfaces.DerivationModel.dersDT1) annotation(Placement(transformation(extent={{-65,-205},{-45,-185}})));
	InterfacesGeneral.MSLInterfaces.I2RO i2RO2 annotation(Placement(transformation(extent={{-30,-195},{-20,-185}})));
	InterfacesGeneral.MSLInterfaces.RI2O rI2O2 "Real Input to Signal Output" annotation(Placement(transformation(extent={{-90,-195},{-80,-185}})));
	Houses.SF2 sF2(
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
		QHeatNormLivingArea=if HeatingSystem==0 then 22 else 16,
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
		PVPeak(displayUnit="Nm/s")=PVPeak) annotation(Placement(transformation(extent={{10,-200},{60,-150}})));
	Modelica.Blocks.Interfaces.RealInput HPAuxModulation(quantity="Basics.RelMagnitude") "Modulation of the auxiliary heater of the heat pump " annotation(
		Placement(
			transformation(extent={{-145,-150},{-105,-110}}),
			iconTransformation(extent={{-195,-95},{-155,-55}})),
		Dialog(
			tab="Inputs/Outputs",
			visible=false));
	Modelica.Blocks.Interfaces.BooleanInput StandardControlHPSwitch "Standard control for switching the heat pump port (SwitchHPTSPort will be ignored)" annotation(
		Placement(
			transformation(extent={{-60,-90},{-20,-50}}),
			iconTransformation(
				origin={-175,75},
				extent={{-20,-20},{20,20}})),
		Dialog(
			tab="Inputs/Outputs",
			visible=false));
	Modelica.Blocks.Interfaces.BooleanInput SwitchHPTSPort "Switches between the inlet of the heat pump to the thermal storage (true: upper inlet)" annotation(
		Placement(
			transformation(extent={{-145,-90},{-105,-50}}),
			iconTransformation(
				origin={-125,175},
				extent={{-20,-20},{20,20}},
				rotation=-90)),
		Dialog(
			tab="Inputs/Outputs",
			visible=false));
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
		parameter String file="C:\Users\Public\Documents\SimulationX 4.2\Modelica\CoSES_Models\Data\SF2_WholeYear.txt" "Path to file for consumption data" annotation(Dialog(tab="Parameters"));
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
		parameter Integer HeatingSystem=0 "0 - Radiator Heating, 1 - Space Heating" annotation(Dialog(tab="Parameters"));
		parameter Integer nPeople=6 "nPeople" annotation(Dialog(tab="Parameters"));
		parameter Integer nFloors=2 "nFloors" annotation(Dialog(tab="Parameters"));
		parameter Integer nApartments=2 "nApartments" annotation(Dialog(tab="Parameters"));
		parameter Real HeatedArea(quantity="Geometry.Area")=300 "HeatedArea" annotation(Dialog(tab="Parameters"));
		parameter Real YearlyElecConsumption(
			quantity="Basics.Energy",
			displayUnit="kWh")=25200000000 "YearlyElecConsumption" annotation(Dialog(tab="Parameters"));
		parameter String ElTable="Pel_15min" "Pel_1min for 1 minute time resolution or Pel_15min for 15 minutes time resolution" annotation(Dialog(tab="Parameters"));
		parameter Real V_DHWperDay(
			quantity="Geometry.Volume",
			displayUnit="m³")=300 "V_DHWperDay" annotation(Dialog(tab="Parameters"));
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
		HP_S_TM_VL = sF2.HP_S_TM_VL;
		HP_S_TM_RL = sF2.HP_S_TM_RL;
		HP_S_TM_HC_TL = sF2.HP_S_TM_HC_TL;
		HP_S_TM_HW_TH = sF2.HP_S_TM_HW_TH;
		HP_S_FW_HC = sF2.HP_S_FW_HC;
		HP_P_heat_HP = sF2.HP_P_heat_HP;
		HP_P_heat_Aux = sF2.HP_P_heat_Aux;
		HP_P_heat_Tot = sF2.HP_P_heat_Tot;
		HP_P_cooling = sF2.HP_P_cooling;
		HP_P_elec = sF2.HP_P_elec_is;
		HP_E_heat_HP = sF2.HP_E_heat_HP;
		HP_E_heat_Aux = sF2.HP_E_heat_Aux;
		HP_E_heat_Tot = sF2.HP_E_heat_Tot;
		HP_E_cooling = sF2.HP_E_cooling;
		HP_E_elec = sF2.HP_E_elec_consumed;
		HP_COP = sF2.HP_COP;
		HP_EER = sF2.HP_EER;
		
		// Condensing Boiler
		CB_S_TM_VL = sF2.CB_S_TM_VL;
		CB_S_TM_RL = sF2.CB_S_TM_RL;
		CB_S_FW_HC = sF2.CB_S_FW_HC;
		CB_S_FG = sF2.CB_S_FG;
		CB_VFuel = sF2.CB_VFuel;
		CB_P_heat = sF2.CB_P_heat_is;
		CB_P_gas = sF2.CB_P_gas_is;
		CB_E_heat = sF2.CB_E_heat_produced;
		CB_E_gas = sF2.CB_E_gas_consumed;
		CB_Efficiency_th = sF2.CB_Efficiency;
		
		// Solar Thermal
		ST_S_TM_VL = sF2.ST_S_TM_VL;
		ST_S_TM_RL = sF2.ST_S_TM_RL;
		ST_S_TM_Collector = sF2.TCollectorST;
		ST_S_FW_HC = sF2.ST_S_FW_HC;
		ST_P_heat = sF2.ST_P_heat_is;
		ST_E_heat = sF2.ST_E_heat_produced;
		
		// Thermal Storage
		TS_S_TM_HC_VL = sF2.TS_S_TM_HC_VL;
		TS_S_TM_HC_RL = sF2.TS_S_TM_HC_RL;
		TS_S_TM_PS_VL = sF2.TS_S_TM_PS_VL;
		TS_S_TM_PS_RL = sF2.TS_S_TM_PS_RL;
		TS_S_TM_HC_HW_VL = sF2.TS_S_TM_HC_HW_VL;
		TS_S_TM_HC_HW_RL = sF2.TS_S_TM_HC_HW_RL;
		TS_S_TM_BT_1 = sF2.TS_S_TM_BT_1;
		TS_S_TM_BT_2 = sF2.TS_S_TM_BT_2;
		TS_S_TM_BT_3 = sF2.TS_S_TM_BT_3;
		TS_S_TM_BT_4 = sF2.TS_S_TM_BT_4;
		TS_S_TM_BT_5 = sF2.TS_S_TM_BT_5;
		TS_S_TM_BT_6 = sF2.TS_S_TM_BT_6;
		TS_S_TM_BT_7 = sF2.TS_S_TM_BT_7;
		TS_S_TM_BT_8 = sF2.TS_S_TM_BT_8;
		TS_S_TM_BT_9 = sF2.TS_S_TM_BT_9;
		TS_S_TM_BT_10 = sF2.TS_S_TM_BT_10;
		TS_E_Storage_BT = sF2.TS_E_Storage_BT;
		TS_SOC_BT = sF2.TS_SOC_BT;
		
		// Heat Sink
		HS_S_TM_VL_bM = sF2.HS_S_TM_VL_bM;
		HS_S_TM_VL_aM = sF2.HS_S_TM_VL_aM;
		HS_S_TM_RL = sF2.HS_S_TM_RL;
		HS_S_TM_HW_VL = sF2.HS_S_TM_HW_VL;
		HS_S_TM_HW_RL = sF2.HS_S_TM_HW_RL;
		HS_S_TM_Room = sF2.HS_S_TM_Room;
		HS_S_FW_HC_aM = sF2.HS_S_FW_HC_aM;
		HS_S_FW_HC_bM = sF2.HS_S_FW_HC_bM;
		HS_S_FW_HW_VL = sF2.HS_S_FW_HW_VL;
		HS_P_DemHeatHC = sF2.HS_P_DemHeatHC_is;
		HS_P_DemHeatHW = sF2.HS_P_DemHeatHW_is;
		HS_E_DemHeatHC = sF2.HS_E_DemHeatHC_consumed;
		HS_E_DemHeatHW = sF2.HS_E_DemHeatHW_consumed;
		
		// PV
		PV_P = sF2.PV_P;
		PV_E = sF2.PV_E;
		
		// outputs
		//TCHN_fromStorage = sF2.DTH_HEXin;
	equation
		connect(rI2O2.u[1],P_CB) annotation(Line(
			points={{-92,-190},{-97,-190},{-120,-190},{-125,-190}},
			color={0,0,127},
			thickness=0.0625));
		connect(i2RO2.y,sF2.CBIn_P) annotation(Line(
			points={{-19,-190},{-14,-190},{5,-190},{10,-190}},
			color={0,0,127},
			thickness=0.0625));
		connect(CHNpump,sF2.qvDHpump) annotation(Line(
			points={{120,-195},{115,-195},{64.7,-195},{59.7,-195}},
			color={0,0,127},
			thickness=0.0625));
		connect(TCHN_toStorage,sF2.TDH_HEXout) annotation(
			Line(
				points={{120,-165},{115,-165},{95,-165},{95,-190},{59.66667175292969,-190}},
				color={0,0,127},
				thickness=0.0625),
			__esi_AutoRoute=false);
		connect(sF2.DTH_HEXin,TCHN_fromStorage) annotation(
			Line(
				points={{59.66667175292969,-180},{64.7,-180},{90,-180},{90,-140},{105,-140}},
				color={0,0,127},
				thickness=0.0625),
			__esi_AutoRoute=false);
		connect(HPModulation,sF2.HPModulation) annotation(
			Line(
				points={{-125,-160},{-120,-160},{-100,-160},{-100,-185},{10,-185}},
				color={0,0,127},
				thickness=0.0625),
			__esi_AutoRoute=false);
		connect(HPAuxModulation,sF2.HPAuxModulation) annotation(
			Line(
				points={{-125,-130},{-120,-130},{-95,-130},{-95,-180},{10,-180}},
				color={0,0,127},
				thickness=0.0625),
			__esi_AutoRoute=false);
		connect(STpump,sF2.qvSTpump) annotation(
			Line(
				points={{-125,-40},{-120,-40},{-80,-40},{-80,-160},{10,-160}},
				color={0,0,127},
				thickness=0.0625),
			__esi_AutoRoute=false);
		connect(sF2.SwitchHPTSPort,SwitchHPTSPort) annotation(
			Line(
				points={{10,-170},{5,-170},{-85,-170},{-85,-70},{-125,-70}},
				color={255,0,255},
				thickness=0.0625),
			__esi_AutoRoute=false);
		connect(HPMode,sF2.HPMode) annotation(
			Line(
				points={{-125,-100},{-120,-100},{-90,-100},{-90,-175},{10,-175}},
				color={255,0,255},
				thickness=0.0625),
			__esi_AutoRoute=false);
		connect(grid1.LVGridA,sF2.lV3Phase1) annotation(
			Line(
				points={{95,-65},{90,-65},{70,-65},{70,-165},{59.66667175292969,-165}},
				color={247,148,29},
				thickness=0.0625),
			__esi_AutoRoute=false);
		connect(connection4,sigInDer2.in1);
		connect(connection3,sigInDer2.out1);
		connect(connection3,i2RO2.x);
		connect(connection4,rI2O2.y);
		connect(environment1.EnvironmentConditions,sF2.environmentConditions1) annotation(Line(
			points={{95,-35},{90,-35},{64.7,-35},{64.7,-155},{59.7,-155}},
			color={192,192,192},
			thickness=0.0625));
		connect(sF2.StandardControlCB,StandardControlCB) annotation(Line(
			points={{20,-150},{20,-145},{20,-100},{-35,-100},{-40,-100}},
			color={255,0,255},
			thickness=0.0625));
		connect(sF2.StandardControlHPSwitch,StandardControlHPSwitch) annotation(Line(
			points={{30,-150},{30,-145},{30,-70},{-35,-70},{-40,-70}},
			color={255,0,255},
			thickness=0.0625));
		connect(sF2.StandardHPcontrol,StandardControlHP) annotation(Line(
			points={{40,-150},{40,-145},{40,-40},{-35,-40},{-40,-40}},
			color={255,0,255},
			thickness=0.0625));
		connect(sF2.StandardSTcontrol,StandardContolST) annotation(Line(
			points={{50,-150},{50,-145},{50,-10},{-35,-10},{-40,-10}},
			color={255,0,255},
			thickness=0.0625));
	annotation(
		__esi_connection3(viewinfo[0](
			line[0](
				points(
					x={
											314,329,345,360},
					y={
											900,900,900,900}),
				pinSrc=sigInDer2.out1,
				pinDst=i2RO2.x,
				typename="Line"),
			typename="ConnectionInfo")),
		__esi_connection4(viewinfo[0](
			line[0](
				points(
					x={
											209,224,240,255},
					y={
											900,900,900,900}),
				pinSrc=rI2O2.y,
				pinDst=sigInDer2.in1,
				typename="Line"),
			typename="ConnectionInfo")),
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
			projectName="SF2",
			projectPath="C:\\Users\\gu62xur\\Downloads\\FMI Test",
			projectType=20,
			saveOutputsApproach=1,
			inputs[0](
				port="P_CB",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			inputs[1](
				port="HPModulation",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			inputs[2](
				port="STpump",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			inputs[3](
				port="CHNpump",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			inputs[4](
				port="TCHN_toStorage",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			inputs[5](
				port="HPMode",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			inputs[6](
				port="StandardContolST",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			inputs[7](
				port="StandardControlHP",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			inputs[8](
				port="StandardControlCB",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			inputs[9](
				port="HPAuxModulation",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			inputs[10](
				port="StandardControlHPSwitch",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			inputs[11](
				port="SwitchHPTSPort",
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
				port="HP_S_TM_HC_TL",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[3](
				port="HP_S_TM_HW_TH",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[4](
				port="HP_S_FW_HC",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[5](
				port="HP_P_heat_HP",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[6](
				port="HP_P_heat_Aux",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[7](
				port="HP_P_heat_Tot",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[8](
				port="HP_P_cooling",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[9](
				port="HP_P_elec",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[10](
				port="HP_E_heat_HP",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[11](
				port="HP_E_heat_Aux",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[12](
				port="HP_E_heat_Tot",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[13](
				port="HP_E_cooling",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[14](
				port="HP_E_elec",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[15](
				port="HP_COP",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[16](
				port="HP_EER",
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
				port="CB_S_TM_VL",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[20](
				port="CB_S_TM_RL",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[21](
				port="CB_S_FW_HC",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[22](
				port="CB_S_FG",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[23](
				port="CB_VFuel",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[24](
				port="CB_P_heat",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[25](
				port="CB_P_gas",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[26](
				port="CB_E_heat",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[27](
				port="CB_E_gas",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[28](
				port="CB_Efficiency_th",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[29](
				port="ST_S_TM_VL",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[30](
				port="ST_S_TM_RL",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[31](
				port="ST_S_TM_Collector",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[32](
				port="ST_S_FW_HC",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[33](
				port="ST_P_heat",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[34](
				port="ST_E_heat",
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
				port="TS_E_Storage_BT",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[52](
				port="TS_SOC_BT",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[53](
				port="HS_S_TM_VL_bM",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[54](
				port="HS_S_TM_VL_aM",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[55](
				port="HS_S_TM_RL",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[56](
				port="HS_S_TM_HW_VL",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[57](
				port="HS_S_TM_HW_RL",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[58](
				port="HS_S_TM_Room",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[59](
				port="HS_S_FW_HC_aM",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[60](
				port="HS_S_FW_HC_bM",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[61](
				port="HS_S_FW_HW_VL",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[62](
				port="HS_P_DemHeatHC",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[63](
				port="HS_P_DemHeatHW",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[64](
				port="HS_E_DemHeatHC",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[65](
				port="HS_E_DemHeatHW",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[66](
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
			descriptionProject="SimulationX model of SF2",
			author="Zinsmeister, Daniel",
			fmiIncludeDllWin32=false,
			fmiIncludeDllWin64=true,
			fmiExposeVariables=false,
			fmiIncludeSources=false,
			fmiExposeStates=false,
			fmiLogging=false,
			fmiModelImgFile="C:\\Users\\Public\\Documents\\SimulationX 4.2\\Modelica\\CoSES_Models\\Houses\\SF2.png",
			guid="{C9CD5993-93D8-421F-A84E-FB36259EBF54}",
			showAdditionalLibPage=false,
			useCodeOptimization=false,
			m_x64=false,
			solverMode=1,
			checkSum=120879,
			fmiVersion="1.0",
			typename="CodeExportInfo"),
		Icon(
			coordinateSystem(extent={{-175,-175},{175,175}}),
			graphics={
							Text(
								textString="SF2 FMI",
								extent={{-169.5,148.6},{153.8,75.2}}),
							Bitmap(
								imageSource="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",
								extent={{-130.9,-153.3},{144.1,77.09999999999999}})}),
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
end SF2_Dymola;
