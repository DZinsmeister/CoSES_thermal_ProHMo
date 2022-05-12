// CP: 65001
// SimulationX Version: 4.2.3.69223
within CoSES_Models.CodeExport.DymolaFMI;
model SF1_Dymola "FMU model of SF1 for Dymola"
	Modelica.Blocks.Interfaces.RealOutput CHP_S_TM_VL(quantity="Basics.Temp") "CHP flow temperature" annotation(
		Placement(
			transformation(extent={{135,40},{155,60}}),
			iconTransformation(
				origin={175,125},
				extent={{10,-10},{-10,10}},
				rotation=-180)),
		Dialog(
			tab="Internal Results",
			visible=false));
	Modelica.Blocks.Interfaces.RealOutput CHP_S_TM_RL(quantity="Basics.Temp") "CHP return temperature" annotation(
		Placement(
			transformation(extent={{135,40},{155,60}}),
			iconTransformation(
				origin={175,125},
				extent={{10,-10},{-10,10}},
				rotation=-180)),
		Dialog(
			tab="Internal Results",
			visible=false));
	Modelica.Blocks.Interfaces.RealOutput CHP_S_FW_HC(quantity="Thermics.VolumeFlow") "Volume flow CHP" annotation(
		Placement(
			transformation(extent={{135,40},{155,60}}),
			iconTransformation(
				origin={175,125},
				extent={{10,-10},{-10,10}},
				rotation=-180)),
		Dialog(
			tab="Internal Results",
			visible=false));
	Modelica.Blocks.Interfaces.RealOutput CHP_S_FG(quantity="Thermics.VolumeFlow") "Gas flow CHP" annotation(
		Placement(
			transformation(extent={{135,40},{155,60}}),
			iconTransformation(
				origin={175,125},
				extent={{10,-10},{-10,10}},
				rotation=-180)),
		Dialog(
			tab="Internal Results",
			visible=false));
	Modelica.Blocks.Interfaces.RealOutput CHP_VFuel(quantity="Basics.Volume") "Demanded fuel volume" annotation(
		Placement(
			transformation(extent={{135,40},{155,60}}),
			iconTransformation(
				origin={175,125},
				extent={{10,-10},{-10,10}},
				rotation=-180)),
		Dialog(
			tab="Internal Results",
			visible=false));
	Modelica.Blocks.Interfaces.RealOutput CHP_P_heat(quantity="Basics.Power") "Heat output power of CHP" annotation(
		Placement(
			transformation(extent={{135,40},{155,60}}),
			iconTransformation(
				origin={175,125},
				extent={{10,-10},{-10,10}},
				rotation=-180)),
		Dialog(
			tab="Internal Results",
			visible=false));
	Modelica.Blocks.Interfaces.RealOutput CHP_P_el(quantity="Basics.Power") "Electric output power of CHP" annotation(
		Placement(
			transformation(extent={{135,40},{155,60}}),
			iconTransformation(
				origin={175,125},
				extent={{10,-10},{-10,10}},
				rotation=-180)),
		Dialog(
			tab="Internal Results",
			visible=false));
	Modelica.Blocks.Interfaces.RealOutput CHP_P_gas(quantity="Basics.Power") "Gas power of CHP" annotation(
		Placement(
			transformation(extent={{135,40},{155,60}}),
			iconTransformation(
				origin={175,125},
				extent={{10,-10},{-10,10}},
				rotation=-180)),
		Dialog(
			tab="Internal Results",
			visible=false));
	Modelica.Blocks.Interfaces.RealOutput CHP_E_heat(quantity="Basics.Energy") "Heat output of CHP" annotation(
		Placement(
			transformation(extent={{135,40},{155,60}}),
			iconTransformation(
				origin={175,125},
				extent={{10,-10},{-10,10}},
				rotation=-180)),
		Dialog(
			tab="Internal Results",
			visible=false));
	Modelica.Blocks.Interfaces.RealOutput CHP_E_el(quantity="Basics.Energy") "Electric output of CHP" annotation(
		Placement(
			transformation(extent={{135,40},{155,60}}),
			iconTransformation(
				origin={175,125},
				extent={{10,-10},{-10,10}},
				rotation=-180)),
		Dialog(
			tab="Internal Results",
			visible=false));
	Modelica.Blocks.Interfaces.RealOutput CHP_E_gas(quantity="Basics.Energy") "Gas input of CHP" annotation(
		Placement(
			transformation(extent={{135,40},{155,60}}),
			iconTransformation(
				origin={175,125},
				extent={{10,-10},{-10,10}},
				rotation=-180)),
		Dialog(
			tab="Internal Results",
			visible=false));
	Modelica.Blocks.Interfaces.RealOutput CHP_Efficiency_th(quantity="Basics.RelMagnitude") "Thermal efficiency" annotation(
		Placement(
			transformation(extent={{135,40},{155,60}}),
			iconTransformation(
				origin={175,125},
				extent={{10,-10},{-10,10}},
				rotation=-180)),
		Dialog(
			tab="Internal Results",
			visible=false));
	Modelica.Blocks.Interfaces.RealOutput CHP_Efficiency_el(quantity="Basics.RelMagnitude") "Electric efficiency" annotation(
		Placement(
			transformation(extent={{135,40},{155,60}}),
			iconTransformation(
				origin={175,125},
				extent={{10,-10},{-10,10}},
				rotation=-180)),
		Dialog(
			tab="Internal Results",
			visible=false));
	Modelica.Blocks.Interfaces.RealOutput CHP_Efficiency_tot(quantity="Basics.RelMagnitude") "Total efficiency" annotation(
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
	Modelica.Blocks.Interfaces.RealOutput TS_P_heat_toHWS(quantity="Basics.Power") "Power transfered to DHW storage" annotation(
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
	Modelica.Blocks.Interfaces.RealOutput TS_S_TM_HWS_1(quantity="Basics.Temp") "DHW storage temperature 1" annotation(
		Placement(
			transformation(extent={{135,40},{155,60}}),
			iconTransformation(
				origin={175,125},
				extent={{10,-10},{-10,10}},
				rotation=-180)),
		Dialog(
			tab="Internal Results",
			visible=false));
	Modelica.Blocks.Interfaces.RealOutput TS_S_TM_HWS_2(quantity="Basics.Temp") "DHW storage temperature 2" annotation(
		Placement(
			transformation(extent={{135,40},{155,60}}),
			iconTransformation(
				origin={175,125},
				extent={{10,-10},{-10,10}},
				rotation=-180)),
		Dialog(
			tab="Internal Results",
			visible=false));
	Modelica.Blocks.Interfaces.RealOutput TS_S_TM_HWS_3(quantity="Basics.Temp") "DHW storage temperature 3" annotation(
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
	Modelica.Blocks.Interfaces.RealOutput TS_S_FW_HC_HW(quantity="Thermics.VolumeFlow") "Volume flow to DHW storage" annotation(
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
	Modelica.Blocks.Interfaces.RealOutput TS_E_Storage_HWS(quantity="Basics.Energy") "Energy in DHW storage" annotation(
		Placement(
			transformation(extent={{135,40},{155,60}}),
			iconTransformation(
				origin={175,125},
				extent={{10,-10},{-10,10}},
				rotation=-180)),
		Dialog(
			tab="Internal Results",
			visible=false));
	Modelica.Blocks.Interfaces.RealOutput TS_E_heat_toHWS(quantity="Basics.Energy") "Total energy transfered to DHW storage" annotation(
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
	Modelica.Blocks.Interfaces.RealOutput TS_SOC_HWS(quantity="Basics.RelMagnitude") "State of charge of the DHW storage" annotation(
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
			transformation(extent={{-145,-155},{-105,-115}}),
			iconTransformation(extent={{-195,105},{-155,145}})),
		Dialog(
			tab="Inputs/Outputs",
			visible=false));
	Modelica.Blocks.Interfaces.RealInput Pel_CHP(quantity="Basics.Power") "Set electric Power CHP" annotation(
		Placement(
			transformation(extent={{-145,-125},{-105,-85}}),
			iconTransformation(extent={{-195,55},{-155,95}})),
		Dialog(
			tab="Inputs/Outputs",
			visible=false));
	Modelica.Blocks.Interfaces.RealInput STpump(quantity="Thermics.VolumeFlow") "Flow rate of the solar thermal pump" annotation(
		Placement(
			transformation(extent={{-145,-95},{-105,-55}}),
			iconTransformation(extent={{-195,5},{-155,45}})),
		Dialog(
			tab="Inputs/Outputs",
			visible=false));
	Modelica.Blocks.Interfaces.RealInput DHWpump(quantity="Thermics.VolumeFlow") "Flow rate of the DHW pump" annotation(
		Placement(
			transformation(extent={{-145,-65},{-105,-25}}),
			iconTransformation(extent={{-195,-45},{-155,-5}})),
		Dialog(
			tab="Inputs/Outputs",
			visible=false));
	Modelica.Blocks.Interfaces.RealInput CHNpump(quantity="Thermics.VolumeFlow") "Flow rate of the CHN pump on the house side" annotation(
		Placement(
			transformation(extent={{100,-180},{140,-140}}),
			iconTransformation(extent={{-195,-95},{-155,-55}})),
		Dialog(
			tab="Inputs/Outputs",
			visible=false));
	Modelica.Blocks.Interfaces.RealInput TCHN_toStorage(quantity="Basics.Temp") "Temperature of the CHN from the heat exchanger to the storage" annotation(
		Placement(
			transformation(extent={{100,-150},{140,-110}}),
			iconTransformation(extent={{-195,-145},{-155,-105}})),
		Dialog(
			tab="Inputs/Outputs",
			visible=false));
	Modelica.Blocks.Interfaces.RealOutput TCHN_fromStorage(quantity="Basics.Temp") "Temperature of the CHN from the storage to the heat exchanger " annotation(
		Placement(
			transformation(extent={{95,-115},{115,-95}}),
			iconTransformation(
				origin={-125,-172},
				extent={{-10,-9.699999999999999},{10,10.3}},
				rotation=-90)),
		Dialog(
			tab="Inputs/Outputs",
			visible=false));
	SignalBlocks.Connection connection1;
	SignalBlocks.Connection connection2;
	SignalBlocks.Connection connection3;
	SignalBlocks.Connection connection4;
	Modelica.Blocks.Interfaces.BooleanInput StandardControlDHW "Standard control of the DHW pump (DHWpump will be ignored)" annotation(
		Placement(
			transformation(extent={{-75,-40},{-35,0}}),
			iconTransformation(
				origin={-125,175},
				extent={{-20,-20},{20,20}},
				rotation=-90)),
		Dialog(
			tab="Inputs/Outputs",
			visible=false));
	Modelica.Blocks.Interfaces.BooleanInput StandardContolST "Standard control of the solar thermal pump (STpump will be ignored)" annotation(
		Placement(
			transformation(extent={{-75,-10},{-35,30}}),
			iconTransformation(
				origin={-75,175},
				extent={{-20,-20},{20,20}},
				rotation=-90)),
		Dialog(
			tab="Inputs/Outputs",
			visible=false));
	Modelica.Blocks.Interfaces.BooleanInput StandardControlCHP "Standard control of the CHP (Pel_CHP will be ignored)" annotation(
		Placement(
			transformation(extent={{-75,20},{-35,60}}),
			iconTransformation(
				origin={-25,175},
				extent={{-20,-20},{20,20}},
				rotation=-90)),
		Dialog(
			tab="Inputs/Outputs",
			visible=false));
	Modelica.Blocks.Interfaces.BooleanInput StandardControlCB "Standard control of the CHP (P_CB will be ignored)" annotation(
		Placement(
			transformation(extent={{-75,50},{-35,90}}),
			iconTransformation(
				origin={25,175},
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
	public
		parameter String file="C:\Users\Public\Documents\SimulationX 4.2\Modelica\CoSES_Models\Data\SF1_WholeYear.txt" "Path to file for consumption data" annotation(Dialog(tab="Parameters"));
		Houses.SF1 sF1(
			CBControlMode=false,
			CPC=ST_CollectorType==1,
			alphaModule(displayUnit="rad")=ST_alphaModule,
			betaModule(displayUnit="rad")=ST_betaModule,
			AModule=ST_CollectorSurface,
			VAbsorber=ST_CollectorVolume,
			Tmax_TS(displayUnit="K")=T_max_BT,
			T0_TS(displayUnit="K")=T_reference_BT,
			TSTupInit(displayUnit="K")=TS_S_TM_BT_10_init,
			TSTlowInit(displayUnit="K")=TS_S_TM_BT_1_init,
			Tmax_DHW(displayUnit="K")=T_max_HWS,
			T0_DHW(displayUnit="K")=T_reference_HWS,
			DHWTupInit(displayUnit="K")=TS_S_TM_HWS_10_init,
			DHWTlowInit(displayUnit="K")=TS_S_TM_HWS_1_init,
			nPeople=nPeople,
			nFloors=nFloors,
			nApartments=nApartments,
			ALH=HeatedArea,
			QHeatNormLivingArea=if HeatingSystem==0 then 22 else 16,
			n=if HeatingSystem==0 then 1.3 else 1,
			TFlowHeatNorm(displayUnit="K")=if HeatingSystem==0 then 338.15 else 313.15,
			TReturnHeatNorm(displayUnit="K")=if HeatingSystem==0 then 323.15 else 303.15,
			TRef(displayUnit="K")=T_roomSet,
			TLiving_Init(displayUnit="K")=TLiving_Init,
			TRoof_Init(displayUnit="K")=TRoof_Init,
			TCellar_Init(displayUnit="K")=TCellar_Init,
			PresenceFile=file,
			UseIndividualElecConsumption=true,
			ElConsumptionFile=file,
			YearlyElecConsumption_kWh=YearlyElecConsumption,
			ActivateNightTimeReduction=true,
			NightTimeReductionStart(displayUnit="h")=NightTimeReductionStart_h*3600,
			NightTimeReductionEnd(displayUnit="h")=NightTimeReductionEnd_h*3600,
			Tnight(displayUnit="K")=T_roomNightSet,
			File=file,
			V_DHWperDay_l=V_DHWperDay) "House 1 with ST, CHP and CB" annotation(Placement(transformation(extent={{-5,-125},{45,-75}})));
		GreenCity.Utilities.Electrical.Grid grid1(useA=true) annotation(Placement(transformation(extent={{95,-75},{135,-35}})));
		InterfacesGeneral.PhysicsSignalInterfaces.GeneralElements.SigInDer sigInDer1(kind=InterfacesGeneral.PhysicsSignalInterfaces.DerivationModel.dersDT1) annotation(Placement(transformation(extent={{-65,-120},{-45,-100}})));
		InterfacesGeneral.MSLInterfaces.I2RO i2RO1 annotation(Placement(transformation(extent={{-30,-110},{-20,-100}})));
		InterfacesGeneral.MSLInterfaces.RI2O rI2O1 annotation(Placement(transformation(extent={{-90,-110},{-80,-100}})));
		InterfacesGeneral.PhysicsSignalInterfaces.GeneralElements.SigInDer sigInDer2(kind=InterfacesGeneral.PhysicsSignalInterfaces.DerivationModel.dersDT1) annotation(Placement(transformation(extent={{-65,-150},{-45,-130}})));
		InterfacesGeneral.MSLInterfaces.I2RO i2RO2 annotation(Placement(transformation(extent={{-30,-140},{-20,-130}})));
		InterfacesGeneral.MSLInterfaces.RI2O rI2O2 "Real Input to Signal Output" annotation(Placement(transformation(extent={{-90,-140},{-80,-130}})));
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
		parameter Integer nApartments=1 "nApartments" annotation(Dialog(tab="Parameters"));
		parameter Real HeatedArea(quantity="Geometry.Area")=300 "HeatedArea" annotation(Dialog(tab="Parameters"));
		parameter Real YearlyElecConsumption(
			quantity="Basics.Energy",
			displayUnit="kWh")=23400000000 "YearlyElecConsumption" annotation(Dialog(tab="Parameters"));
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
		parameter Real TS_S_TM_HWS_1_init(quantity="Basics.Temp")=313.15 "initial temperature of lowest storage layer" annotation(Dialog(tab="Parameters"));
		parameter Real TS_S_TM_HWS_10_init(quantity="Basics.Temp")=333.15 "initial temperature of highest storage layer" annotation(Dialog(tab="Parameters"));
		parameter Real T_reference_HWS(quantity="Basics.Temp")=313.15 "Reference temperature of HWS to calculate SOC, T_Sto = T_ref => SOC = 0" annotation(Dialog(tab="Parameters"));
		parameter Real T_max_HWS(quantity="Basics.Temp")=353.15 "Maximum temperature of storage, T_sto = T_max => SOC = 1" annotation(Dialog(tab="Parameters"));
		Environment.Environment environment1(
			DefaultInit=false,
			useUnixTimeStamp=false,
			WeekDayInit=WeekDayInit,
			MonthDayInit=InitDay,
			MonthInit=InitMonth,
			YearInit=2021) annotation(Placement(transformation(extent={{95,-20},{125,10}})));
	equation
		// Internal Results
		// CHP
		CHP_S_TM_VL = sF1.CHP_S_TM_VL;
		CHP_S_TM_RL = sF1.CHP_S_TM_RL;
		CHP_S_FW_HC = sF1.CHP_S_FW_HC;
		CHP_S_FG = sF1.CHP_S_FG;
		CHP_VFuel = sF1.CHP_VFuel;
		CHP_P_heat = sF1.CHP_P_heat_is;
		CHP_P_el = sF1.CHP_P_el_is;
		CHP_P_gas = sF1.CHP_P_gas_is;
		CHP_E_heat = sF1.CHP_E_heat_produced;
		CHP_E_el = sF1.CHP_E_el_produced;
		CHP_E_gas = sF1.CHP_E_gas_consumed;
		CHP_Efficiency_th = sF1.CHP_Efficiency_th;
		CHP_Efficiency_el = sF1.CHP_Efficiency_el;
		CHP_Efficiency_tot = sF1.CHP_Efficiency_total;
		
		// Condensing Boiler
		CB_S_TM_VL = sF1.CB_S_TM_VL;
		CB_S_TM_RL = sF1.CB_S_TM_RL;
		CB_S_FW_HC = sF1.CB_S_FW_HC;
		CB_S_FG = sF1.CB_S_FG;
		CB_VFuel = sF1.CB_VFuel;
		CB_P_heat = sF1.CB_P_heat_is;
		CB_P_gas = sF1.CB_P_gas_is;
		CB_E_heat = sF1.CB_E_heat_produced;
		CB_E_gas = sF1.CB_E_gas_consumed;
		CB_Efficiency_th = sF1.CB_Efficiency;
		
		// Solar Thermal
		ST_S_TM_VL = sF1.ST_S_TM_VL;
		ST_S_TM_RL = sF1.ST_S_TM_RL;
		ST_S_TM_Collector = sF1.ST_S_TM_Collector;
		ST_S_FW_HC = sF1.ST_S_FW_HC;
		ST_P_heat = sF1.ST_P_heat_is;
		ST_E_heat = sF1.ST_E_heat_produced;
		
		// Thermal Storage
		TS_P_heat_toHWS = sF1.TS_P_heat_toHWS;
		TS_S_TM_HC_VL = sF1.TS_S_TM_HC_VL;
		TS_S_TM_HC_RL = sF1.TS_S_TM_HC_RL;
		TS_S_TM_PS_VL = sF1.TS_S_TM_PS_VL;
		TS_S_TM_PS_RL = sF1.TS_S_TM_PS_RL;
		TS_S_TM_HC_HW_VL = sF1.TS_S_TM_HC_HW_VL;
		TS_S_TM_HC_HW_RL = sF1.TS_S_TM_HC_HW_RL;
		TS_S_TM_HWS_1 = sF1.TS_S_TM_HWS_1;
		TS_S_TM_HWS_2 = sF1.TS_S_TM_HWS_2;
		TS_S_TM_HWS_3 = sF1.TS_S_TM_HWS_3;
		TS_S_TM_BT_1 = sF1.TS_S_TM_BT_1;
		TS_S_TM_BT_2 = sF1.TS_S_TM_BT_2;
		TS_S_TM_BT_3 = sF1.TS_S_TM_BT_3;
		TS_S_TM_BT_4 = sF1.TS_S_TM_BT_4;
		TS_S_TM_BT_5 = sF1.TS_S_TM_BT_5;
		TS_S_TM_BT_6 = sF1.TS_S_TM_BT_6;
		TS_S_TM_BT_7 = sF1.TS_S_TM_BT_7;
		TS_S_TM_BT_8 = sF1.TS_S_TM_BT_8;
		TS_S_TM_BT_9 = sF1.TS_S_TM_BT_9;
		TS_S_TM_BT_10 = sF1.TS_S_TM_BT_10;
		TS_S_FW_HC_HW = sF1.TS_S_FW_HC_HW;
		TS_E_Storage_BT = sF1.TS_E_Storage_BT;
		TS_E_Storage_HWS = sF1.TS_E_Storage_HWS;
		TS_E_heat_toHWS = sF1.TS_E_heat_toHWS;
		TS_SOC_BT = sF1.TS_SOC_BT;
		TS_SOC_HWS = sF1.TS_SOC_HWS;
		
		// Heat Sink
		HS_S_TM_VL_bM = sF1.HS_S_TM_VL_bM;
		HS_S_TM_VL_aM = sF1.HS_S_TM_VL_aM;
		HS_S_TM_RL = sF1.HS_S_TM_RL;
		HS_S_TM_HW_VL = sF1.HS_S_TM_HW_VL;
		HS_S_TM_HW_RL = sF1.HS_S_TM_HW_RL;
		HS_S_TM_Room = sF1.HS_S_TM_Room;
		HS_S_FW_HC_aM = sF1.HS_S_FW_HC_aM;
		HS_S_FW_HC_bM = sF1.HS_S_FW_HC_bM;
		HS_S_FW_HW_VL = sF1.HS_S_FW_HW_VL;
		HS_P_DemHeatHC = sF1.HS_P_DemHeatHC_is;
		HS_P_DemHeatHW = sF1.HS_P_DemHeatHW_is;
		HS_E_DemHeatHC = sF1.HS_E_DemHeatHC_consumed;
		HS_E_DemHeatHW = sF1.HS_E_DemHeatHW_consumed;
		
		// Heat Sink
		
		// outputs
		//TCHN_fromStorage = sF1.TDH_HEXin;
	equation
		connect(i2RO1.y,sF1.CHPIn_P) annotation(Line(
			points={{-19,-105},{-14,-105},{-10,-105},{-5,-105}},
			color={0,0,127},
			thickness=0.0625));
		connect(grid1.LVGridA,sF1.lV3Phase1) annotation(
			Line(
				points={{95,-40},{90,-40},{85,-40},{85,-90},{44.66667175292969,-90}},
				color={247,148,29},
				thickness=0.0625),
			__esi_AutoRoute=false);
		connect(i2RO2.y,sF1.CBIn_P) annotation(Line(
			points={{-19,-135},{-14,-135},{-10,-135},{-10,-115},{-5,-115}},
			color={0,0,127},
			thickness=0.0625));
		connect(DHWpump,sF1.qvDHWpump) annotation(Line(
			points={{-125,-45},{-120,-45},{-10,-45},{-10,-85},{-5,-85}},
			color={0,0,127},
			thickness=0.0625));
		connect(STpump,sF1.qvSTpump) annotation(
			Line(
				points={{-125,-75},{-120,-75},{-100,-75},{-100,-95},{-5,-95}},
				color={0,0,127},
				thickness=0.0625),
			__esi_AutoRoute=false);
		connect(rI2O2.u[1],P_CB) annotation(Line(
			points={{-92,-135},{-97,-135},{-120,-135},{-125,-135}},
			color={0,0,127},
			thickness=0.0625));
		connect(Pel_CHP,rI2O1.u[1]) annotation(Line(
			points={{-125,-105},{-120,-105},{-97,-105},{-92,-105}},
			color={0,0,127},
			thickness=0.0625));
		connect(CHNpump,sF1.qvDHpump) annotation(Line(
			points={{120,-160},{115,-160},{49.7,-160},{49.7,-120},{44.7,-120}},
			color={0,0,127},
			thickness=0.0625));
		connect(sF1.TDH_HEXout,TCHN_toStorage) annotation(
			Line(
				points={{44.66667175292969,-115},{49.7,-115},{80,-115},{80,-130},{120,-130}},
				color={0,0,127},
				thickness=0.0625),
			__esi_AutoRoute=false);
		connect(sF1.TDH_HEXin,TCHN_fromStorage) annotation(Line(
			points={{44.7,-105},{49.7,-105},{100,-105},{105,-105}},
			color={0,0,127},
			thickness=0.0625));
		connect(environment1.EnvironmentConditions,sF1.environmentConditions1) annotation(
			Line(
				points={{95,-5},{90,-5},{70,-5},{70,-80},{44.66667175292969,-80}},
				color={192,192,192},
				thickness=0.0625),
			__esi_AutoRoute=false);
		connect(connection2,sigInDer1.in1);
		connect(connection1,sigInDer1.out1);
		connect(connection1,i2RO1.x);
		connect(connection2,rI2O1.y);
		connect(connection4,sigInDer2.in1);
		connect(connection3,sigInDer2.out1);
		connect(connection3,i2RO2.x);
		connect(connection4,rI2O2.y);
		connect(sF1.StandardDHWcontrol,StandardControlDHW) annotation(Line(
			points={{5,-75},{5,-70},{5,-20},{-50,-20},{-55,-20}},
			color={255,0,255},
			thickness=0.0625));
		connect(sF1.StandardSTcontrol,StandardContolST) annotation(Line(
			points={{15,-75},{15,-70},{15,10},{-50,10},{-55,10}},
			color={255,0,255},
			thickness=0.0625));
		connect(sF1.StandardCHPcontrol,StandardControlCHP) annotation(Line(
			points={{25,-75},{25,-70},{25,40},{-50,40},{-55,40}},
			color={255,0,255},
			thickness=0.0625));
		connect(sF1.StandardCBcontrol,StandardControlCB) annotation(Line(
			points={{35,-75},{35,-70},{35,70},{-50,70},{-55,70}},
			color={255,0,255},
			thickness=0.0625));
	annotation(
		__esi_connection1(viewinfo[0](
			line[0](
				points(
					x={
											314,329,345,360},
					y={
											645,645,645,645}),
				pinSrc=sigInDer1.out1,
				pinDst=i2RO1.x,
				typename="Line"),
			typename="ConnectionInfo")),
		__esi_connection2(viewinfo[0](
			line[0](
				points(
					x={
											209,224,240,255},
					y={
											645,645,645,645}),
				pinSrc=rI2O1.y,
				pinDst=sigInDer1.in1,
				typename="Line"),
			typename="ConnectionInfo")),
		__esi_connection3(viewinfo[0](
			line[0](
				points(
					x={
											314,329,345,360},
					y={
											735,735,735,735}),
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
											735,735,735,735}),
				pinSrc=rI2O2.y,
				pinDst=sigInDer2.in1,
				typename="Line"),
			typename="ConnectionInfo")),
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
			projectName="SF1",
			projectPath="C:\\Users\\gu62xur\\Downloads\\FMI Test",
			projectType=20,
			saveOutputsApproach=1,
			inputs[0](
				port="P_CB",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			inputs[1](
				port="Pel_CHP",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			inputs[2](
				port="STpump",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			inputs[3](
				port="DHWpump",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			inputs[4](
				port="CHNpump",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			inputs[5](
				port="TCHN_toStorage",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			inputs[6](
				port="StandardControlDHW",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			inputs[7](
				port="StandardContolST",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			inputs[8](
				port="StandardControlCHP",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			inputs[9](
				port="StandardControlCB",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[0](
				port="CHP_S_TM_VL",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[1](
				port="CHP_S_TM_RL",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[2](
				port="CHP_S_FW_HC",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[3](
				port="CHP_S_FG",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[4](
				port="CHP_VFuel",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[5](
				port="CHP_P_heat",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[6](
				port="CHP_P_el",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[7](
				port="CHP_P_gas",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[8](
				port="CHP_E_heat",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[9](
				port="CHP_E_el",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[10](
				port="CHP_E_gas",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[11](
				port="CHP_Efficiency_th",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[12](
				port="CHP_Efficiency_el",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[13](
				port="CHP_Efficiency_tot",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[14](
				port="CB_S_TM_VL",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[15](
				port="CB_S_TM_RL",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[16](
				port="CB_S_FW_HC",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[17](
				port="CB_S_FG",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[18](
				port="CB_VFuel",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[19](
				port="CB_P_heat",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[20](
				port="CB_P_gas",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[21](
				port="CB_E_heat",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[22](
				port="CB_E_gas",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[23](
				port="CB_Efficiency_th",
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
				port="ST_P_heat",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[29](
				port="ST_E_heat",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[30](
				port="TS_P_heat_toHWS",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[31](
				port="TS_S_TM_HC_VL",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[32](
				port="TS_S_TM_HC_RL",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[33](
				port="TS_S_TM_PS_VL",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[34](
				port="TS_S_TM_PS_RL",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[35](
				port="TS_S_TM_HC_HW_VL",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[36](
				port="TS_S_TM_HC_HW_RL",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[37](
				port="TS_S_TM_HWS_1",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[38](
				port="TS_S_TM_HWS_2",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[39](
				port="TS_S_TM_HWS_3",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[40](
				port="TS_S_TM_BT_1",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[41](
				port="TS_S_TM_BT_2",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[42](
				port="TS_S_TM_BT_3",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[43](
				port="TS_S_TM_BT_4",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[44](
				port="TS_S_TM_BT_5",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[45](
				port="TS_S_TM_BT_6",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[46](
				port="TS_S_TM_BT_7",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[47](
				port="TS_S_TM_BT_8",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[48](
				port="TS_S_TM_BT_9",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[49](
				port="TS_S_TM_BT_10",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[50](
				port="TS_S_FW_HC_HW",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[51](
				port="TS_E_Storage_BT",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[52](
				port="TS_E_Storage_HWS",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[53](
				port="TS_E_heat_toHWS",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[54](
				port="TS_SOC_BT",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[55](
				port="TS_SOC_HWS",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[56](
				port="HS_S_TM_VL_bM",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[57](
				port="HS_S_TM_VL_aM",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[58](
				port="HS_S_TM_RL",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[59](
				port="HS_S_TM_HW_VL",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[60](
				port="HS_S_TM_HW_RL",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[61](
				port="HS_S_TM_Room",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[62](
				port="HS_S_FW_HC_aM",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[63](
				port="HS_S_FW_HC_bM",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[64](
				port="HS_S_FW_HW_VL",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[65](
				port="HS_P_DemHeatHC",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[66](
				port="HS_P_DemHeatHW",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[67](
				port="HS_E_DemHeatHC",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[68](
				port="HS_E_DemHeatHW",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[69](
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
				port="TS_S_TM_HWS_1_init",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[26](
				port="TS_S_TM_HWS_10_init",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[27](
				port="T_reference_HWS",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[28](
				port="T_max_HWS",
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
			fmiModelImgFile="C:\\Users\\Public\\Documents\\SimulationX 4.2\\Modelica\\CoSES_Models\\Houses\\SF1.png",
			guid="{D36C1EEA-CF55-43FE-A252-693F295181CC}",
			showAdditionalLibPage=false,
			useCodeOptimization=false,
			m_x64=false,
			solverMode=1,
			checkSum=127250,
			fmiVersion="1.0",
			typename="CodeExportInfo"),
		Icon(
			coordinateSystem(extent={{-175,-175},{175,175}}),
			graphics={
							Text(
								textString="SF1 FMI",
								extent={{-169.5,148.6},{153.8,75.2}}),
							Bitmap(
								imageSource="iVBORw0KGgoAAAANSUhEUgAAALEAAACSCAIAAACFc7wKAAAABGdBTUEAALGPC/xhBQAAAAlwSFlz
AAAScQAAEnEB89x6jgAAJZJJREFUeF7tnQdYFEcbgO/oUgSkSVN6t2AXFVGMAlGDoKjRKCpRY8HI
bwU1iNQoEkBBA6JIEaQqRUDa3dkLGmKLJRoTjYpKUXr7v70Zjn4ehHJ33PvMw7M7O3ssO+99883u
3kFq5MGjNTwnGt+8eVNSUoJXePCcOH369IwZMxYsWJCZmYmrBjwD14ny8nJ/f38NDQ0SiSQoKGhs
bBwbG9vQ0IA3D2AGqBOvXr3atGmTsrIymUy2sbGxsLDg4+PT09P7+eefS0tLcaOBykB0oqCgACSQ
lJQUExNbv359bm5uamqqra2tgICAkpKSg4PD8+fPcdMByYBzIi0tDYYJISEhVVXVAwcOXL58+Sqd
7OxsiBwyMjISEhKzZ8++ffs23mHgMbCcCAgI0NXVhWFCX18/LCwMVLhy5QqNDlrw9vaGUAHGTJgw
IT4+Hu82wBgoThQXFzs5OUECAUJAGEhISLh27RoECSQEAlYvXboUEhICgQTGEbDn8OHDdXV1+CUG
DAPCiYcPH65YsWLIkCHQ05AuZGVlgRDQ/diFFkAlBA+IEPPmzQN7YHxxdnZ+/fo1fqEmqopLH8Ql
5e5x/efKDVzFRXC/E3l5eVOmTIF0Ulpa2tXVlUqlwjDRoRAIpEV6erq9vb2IiAhkGIsXLy4sLMQv
19hYW1F5Pzo+YLi++2DJ0CmmD84m1dfU4m1cATc70dDQEBERYWBgAOEBEgh/f38ID4wEggmgBTSj
UCguLi6QXoAZU6dOhXr0sm/v3ou2WLCfPMiLJOMpKBWobXjd90jNp89oKxfAtU5UVlbCtGLYsGEw
BEyfPj0mJqaz8aIzQAvAz89PW1sbrBo1ahQYBp59/ONZ0rerXEmCXiRpb5KcB5/UYUW17G3OJS9e
4t/N4XCnE5ABrF69GsI+9KW1tXVmZmZXhUCgmWpUVJSJiQk/P//w4cPd3NzKP30quv8ozcHRU0DK
nTTYhyTnSZbylpBLWPjd6xsF+Ag4GS504saNG7NmzRIVFRUXF9+yZQskENCv3RCCAfgE6YWdnZ2g
oKCcnNyGDRue//lnyZ9/5Tu7/SyrdIAkCtHCizTEXVAywtzqRR6tkcOvj3ObEzBGGBoawntaRUXl
0KFDLa9AdBuUdebn52/duhVyVeDruXOvXrlaXVJaeDLqiLaRG2mQN0kWygF+iaBRY38Lj675VI4P
iAPhHidqamqOHj2qrq5OJpPHjBkTGRkJAeO/hIc2gFswlHh6esIIAs7Br0hOTq6vq3uenX9ysvkB
kpgnaQgEjAN84ocUhlF/8v787zt8ZJwGlzjx6tUrJycneXl5EMLKygp6q2eFQIAT8LJhYWETJkyA
X6SjoxMSGlJVVfWmoDDOeilo4UFknfIeJEkYR9IcNhc/e4GPj6PgBieePHmycOFCmDEKCQk5ODjk
5eVBz+Fu7GnAs5s3byYkJJibm5NIJEhjd+7cWVRUVPrynyzHXV6DZCDrBC08SdKgSPRs61fXbuGj
5Bw42wmYGcIwP3nyZJhwQgLh6uoKAz+khLgDewekRXZ29sqVKyUkJISFhZcuXfrHH39UFpfe8Av2
U9F0I4vRs04ZyDOOj5zwODm9vroGHzEnwMFOQAJx6tQpdE9LT08vMDAQuuq/Z5Qscv36dRhKduzY
ISsrCzNeMzOznJycmvKKBzGJx0aPO8AnBk6AGW4k0cNK6jd+Ca54/xEUxofO3nCkE/X19cXFxfv3
71dQUID+QJekbt26BZ2Ee6xPAP8gJvn6+oKRkHXCfCc6OhpM/YtyOXLWPA9BSRhBYByBQcRHUiFn
+97iP1801Nfjv4GN4Twn6urqHj58uG7dOmlpaYjbdnZ2GRkZECF6PKNkBbAQfnVERAR4KSgoqKmp
6efn9/bdu7eF91NWb/CRHupBliKudZIkD5DEE+1WvrlTWF/L7jdHOMyJ6upqSCBgZjFo0CAI2ps3
b87Nze3tBII5KL1ITEycP3++qKjokCFDHB0dIb0oe/Um39ntsKKaBx+hBQwl+0nCJ01nPbuQDUMM
O48jHOMEpJMVFRVxcXFjxoyBd6S+vr6XlxeK3rhz+hWUdf7www+KiopweIsWLYKaitKyO8dOBRmO
9hSUQunFfpJIoIbRvYjYyo/FDfVsqgVnOAEJxLt3744cOQIZJYwXpqamoaGhkOX1WUbJCijrhCwH
fIUsZ+rUqSkpKeDx0/SLp8y+8hIZgi9qkcQPSitfOnCw9MXfDWz5wA4HOFFbW/vkyZPt27fLycmJ
i4vDwBEbGwvvwj7OKFkBZsJwYAEBAePGjQN3dXR0wk6GQTr87+3f4m2W+0jIe5KJW6nupMHuAoNT
Vm14V3ifDdMLdneisrLyxo0by5YtgwQCwvKaNWv6MaNkBTgwmAHBBGTOnDliYmKqqqpubm7Pnj0r
evgky3HHYRU1D35pL5KcJ0kK5iMxXy/858r12opKtkov2NqJT58+nT9/fsaMGSIiIvCec3FxoVKp
EKLx6WdXUNaZnp4OKkMiLCUlBSpDTcnrN9cPHz1qNMpTEAYRWZR1/jrG5EFcUsX7j+yTXrCpE5BA
FBUVnTx5csSIERAhIBTDHA9sgOCMTzzbA0cLc6KtW7dqaWlB1mlhYXHx4sXy8vKHcclhJjO8hGVQ
egFZp5+K1rWDAWV/v2KTqxfs6AQkEE+fPoVkDQKvhIQEnM3w8HAYQZgnEJdpOXiJbUBZsI+PD8yV
IL2YNGnS2bi4jx8//pmVd8bKxkdiqCcZZ52eQkNydu57/+hxPRtknWznRFVVFYzHMKmTkZGBwLt0
6VIYPtrf5HxA9cRLdG7S4mooUniFnQAnYNQIDg6GuRIkyGpqar6+vn+9fPn2/qNUh82+CmqefETW
SU8vRBMWr3h17WZdVTU+F/0EezkBCQQE2G+++QbeVRByHR0dMzMz4ZziE9yCCqrqE8r/8AqNBsuN
+aRb1Ei8TqeYOqGQGoBX+o/Lly7dvn377Nmztra2ILqkpOS2bdsKCwtLXr+l7PEI0Nb3FICsE6UX
ImETpz9Jzagu+9SPWSe7ONHQ0PD+/fvIyMjJkydDRjl27Fh3d3c4oZ1llJ9p2pVURbxCo5XRDBto
/I+ornidRntD+7qBwtfvTly9cvnKZSLCgdlZWVkODg4qKioQMOzs7PLy8sref7gbGv7rxMleQjL0
i1qybiTRX1S07544/en1Gzgn+Oz0LWzhRF1d3cuXLyGLVFdXh/nbzJkzjx8/jgZjdGaha2F0QMuI
IppZI4WMRpCrtAt11EENv5GhEm39k7ap9qZEHU2sTeToe65fvQJaoOVr167BvMnZ2dnIyAgC4bRp
02BYLC0tfXrhYuTsuT7iCujqBcxRD8ko5+12+/DoSb9o0f9OQAJx584dCKfy8vIQWq2trc+cOQPB
tmUCcZd6rJoi07KD/6EubSwgVV+SBVdg4Ki7KdLwhFxLHQyZ5n2ad+3VwQ1/kuspgqALag/1/RIz
6HGiOTVGj3cEBASYmJjAfMrY2PjXkJBXr1+/unnn3PK1B2WViUfAiXtmEp58UknL17y+WVBbWYXP
VF/Rz05UVFTAhG3hwoUQTocPH7527VqY1nf4lNQ/tCX1FCGQA63+RVnVeIfU8Ae5kqYIg0jDIzJI
UHdL5C11Ts1lyYZn5Ian4IQwagwyVVKVX1JXoNX2UDMzk6JP+Pv7w4BFx9PTM+BIUFB4XEJaNm5D
kJuZHBmEm7BAwImY1Ja704HgB3/gqVOn5syZIyUlpaSktGfv3sePH394+jxnx15/NR2wAQYRmKm6
kUROzrD4t88/H9BvTkBULC4uTkpKmjVrFiQQo0aN2rNnD4VC6SyBACCHgBQBft6jHnpOWddQwA8e
NBSS628Kgh+NN0kQORpu8CE/QJdqKhFFXtHsIGCU0fTxq7QjI8rvp82blsweo6ysTMIICAioqmtp
TbG2XbvL+3hkAu7ZlAif1RNxExYwmu8YEI/2bAWEQAiE586dW7lyJaQXEDDWr18P8aO8uPRmwLFj
o8fTs07iMT4vxWFPktP7ON/sHycggfj777+PHj06evRoUVFRGFkDAwPhpDC/JHWddq6OKtZwn1x7
VbyOIlJ3XaTxFqnxCt0GiBm/kwkzrpMaL9HluE/EiTraIFAHnIB98au0JvHYnh++YqjQAUKikiNn
L//p13hCix5yAgFZZ05Ozo4dO3R0dISEhKysrNLS0iorKx/Fn48wtyIeyRGXprn61Hzu648F9IMT
tbW1jx492rlzp6qqqrS09Ny5c8PDw1tmlEz4lza//q4AEQbukhsvkyBIEMvtC2y9QoKfsAwDyp/U
DXj/NmRGrB2Nuo/Mxy+rZmRmBj0DWFjMnjrJUGMw2kYSklSbviYoBdonnfTahJogZkweMXwIbkWS
GKo5xhRvoPO98+HIVPyrOgTeBgAMVOPHjwctIL2IiIyA+dera7diFiy8sH5rxfsP+Kz1IX3tRHV1
9eXLl2FKBvMLRUXFVatWQe5969atNpekGEDwh9yQUWC2WU8VaXhAbrxGgoyhlQdtyh90LR7hxBO/
XGsyAhYp0XuTzCcwdMzq/UdScQ9SKLkJZ/z22I1QpG8mkcRUDOy8QYq2JATtsh2F25C0pi/3iMYb
WAalFyEhIbNnz4aQOWzYMB8fn+fPn79/9KT83ft+uUrRp05ARpmcnGxpaQnvCQiYTk5O2dnZHV6S
YvCO+lVjPqmByl97RQKVuiuiRIT4o50E7cs9cuNVUi1F/C3NAnJSVMpohn9Q96AXD12NRw2ygLDW
ujBUySDnQnLgjgWY5Q6Ov7SaDCP+uxMAumcGqZWtra0snQ0bNhQUFPTX16H0kRPoklRoaCiER5ia
T5w40dvbGwIGRE58YjoHwgPklbXXBqPAQOQK9EGBlQKpRsMdcsNv9FTjKgn0KqGNYVzqOPadHO5O
PgHhMTZO7h6B4fGJmZloKyv0iBMIiBYZGRkbN27U0NAQFBS0sbHJy8vrFy36won6+vpnz555eHhA
AgE5Ngy0J06cgFPASgLB4CHNrfqyTMNjPCK06ftOC9hwmxhlam+IQ4QooLYKBqlHl2ji/gQt+PiV
VUaazbdesWKjo+NWd/fA8PCkL/nRg04AcE6oVCpMYo2MjPj5+c3MzGJjYyG44vPYV/S6E2A6BEZI
INAlqcWLFycmJkJNZwkEE6BHqy7JNVJJxOWHNn3fWXlEpKK1tMFPqDvwq7Qiyn3+WE1Z3KfN8PML
qaqOMjOzXm6/xckzKDKpMzV61gkAZl6QbsMsDOZiEC1ghPXz8ysqKsJns0/oXSdACJhuzZs3DxII
LS2tLVu2ZGZmMrkCwQQI+B9ok+uuihPJRJuOZ1KekRsppJqrUp04QaOmBXtss/5mhpZsezMIBETE
1cfOsdtw8FgS3qMVPe4EAEMqelIL0hgR+pcn7dq16+HDh/ic9j696ARMtSMiIkxNTQUEBMaNG+fl
5dW9p6RuUSOLaGbElYbfiW4m4gTzGUfL0jRDgbGjkqr4D3Up40poM9TUlCivnTtXrbK3tTE3H6et
KSODexkjOEjaePba4ETcvgW94QQCQml6ejrMyyC+ontmUInPbC/TW068e/cOskhtbW0IgDAuQgIB
UZH5JakOeUudA4khFGLScU2cuPBwlQQ93bbvOyvQHnJSWACNYJlCvFQdRZRxH6QFVColLSUqKtjH
a9cuB4dV1vOmajS7MUhe9+vtEe2GkN5zAoAEPD8/f/fu3Xp6emQy2dzcPC0traam1z962itO3L9/
H/JnCHog+KJFi2JiYsD67j1mDUGCcXHiAdWzmDK+/ooA7mYWChEkbpNrL4nXU4Qhx4S5KLxI60yz
w7SGQslLTgh1c7Sapo47XHCo3szd7W6y9qoTAGgBmXhAQMCUKVNAiwkTJgQFBfX2f5boeSdgBmVt
bQ0TTjk5OUggLly4AELgP/E/g253ET3NSqiAwHCDVEUd2ma6gYk6AAmvnd1iu8VLvv1fUBqubQEl
O/n4vrlNsUJWa6xjCN7CoLedAMAJGHDPnDkzZ84cmLUNHz4c0osXL3rxmy160ona2loICZAw89G/
vHjfvn3wJ7FyBYJF4C1ODB/Q2U/oF7aZz0jv00eZZ+Tay+Id5BDAiTXKZDLRl2SyoOL43VG4ugXZ
yaddLCXp/U0SUtT7as8ZvIFBHzgBoItaycnJkF6gJ7VWrFgBE1d83nuaHnPi7du3hw8fhok1hDjI
KyHEgeDdSCA6AzKAKppcw2NiegkBoP6KEGhBDCLt56VgzE3iZhgsEKuPydXUIR1c3s4I/3403Qmw
gl9Qx3SzW2BkGg4XFEpu4tljbpvsRuKr22JDDWz2nr2ItjbTN04gQIKLFy86OzurqKjAPM7S0jIl
JQWf/R6lZ5yAULZp0yY4VhgybGxsYmNjITx0L4HoDOJG+RV+mH3A8PGaattA4SdsQGkjyHGDuDWK
b4rSiHukDfeIZ2qIZ20ekuvvC5bSjNprkRBk19ShZD5+GfURk2bOnEvHysrCdMpoTUV8F0xMTmu+
U3iv3O/oEug9Bsk7+tDsxIkTIXn/9OkT7oYeogecgO6HmdLgwYMhrDk4OGRkZMD4141LUkx4Q7Es
o+o/o2xGl6UhP4C0EWJAXYFwFU2hjiLWUEhcva6/KVh3RxhHi0JyMXXCE8r/yqnDQY4GqsAnml47
LRKDnX8wH83sXjlJSFR2hMXmn053eIOzj50A4J0GARhUgPSCn59fV1fXw8Pj1atXuDN6gv/qRHx8
PMyRIJSpq6vv3bs3Ozu7e5ekugTxsN0N4drrEq9pttDNL6gO9QVC6CGaD7Qpdb+JICcYj2fCuAO5
CESXjh7PzIw87rt34wa7r4yVlNBdUgIBAQE1NS0TU5vV29x9jkW0f1wK0fdOAKAFBAw48wsXLoTc
QllZee3atffu3cNd8p/pvhMVFRXHjh1D/9Zg/PjxR44cQd9Oig+8N3lNs26k8DFub0LwIK5o3SX/
Q10Kq1iLFk58EWpmZmJUiJ+fn1sTxJNzAUdOnY7vzAZEdurZMH+8i9vh4PDELtw/+y9AGIbwnJ6e
7ujoCEM2BGkYsikUCu6b/0Y3nYAEwsXFRUtLC8IXDL/R0dEQ0Ho2gWDCZ6rWC+o6vEIHIkT9JSH0
GDdQRjOENJN1JzgR0ALegTk5OTB2aGtrwzR1xowZMGWF2R/upO7SHScgAf7uu+/k5eUlJCTs7e1h
jgTO9mwCwZwqytA2FyKJyNHiMz8QOSAJ5W4nEPBWhPB89OjRyZMnwwg+cuRIX1/f4uJi3FXdostO
gJiQ3aDHrHfv3p2VlQW29qUQQPsZBEQIcKJl/b+0+UU0c7zC1UB4BqKiohYsWADRAhK7nTt3Pn36
FHdY1+mCE5WVleHh4SYmJjDhNDIyOnjwIAxg4Ck+tH4FwsZnigZeoQN+dPZcLvcB70noiPPnzzM+
Z7t48WJI9nHPdRFWnXj37t1PP/0EMx8IUDBuhYURV4v7LIHg8UWQFuiiFqQXYmJilpaWEMW78Uky
lpx4/Pjx6tWrFRQU0Je6ZWRk9GVGyYN1UKcwbo5MnDgxJCSkvLxrnwb4shN5eXnz58+H2c7QoUMD
AgJevnwJU+E+TiB4sAjkm5Dv//333yDHwoULIVpoamru27fv33//xd3JAsycqK+vj4mJgQRCRERk
9OjRYN/Hjx/r6up+//13+N34KHiwE9AvEMLBgOrqanjrbt++HT0IDmEeeg3365fo1IkPHz4cOnTI
wMBAUFBw3rx5kE5WVFTA4ASi8JxgW5AT6J9fwrsXFiC0q6qqwjxx7ty5+fn5qHOZ07ETL168cHJy
UlFRgQgBqSxIwHi8h+cEO9PSCQDewyUlJbGxsRMmTICuhJAPy1VVX/igegdOFBQUwFAkISGhqKgI
Q9GzZ89afsqA5wQ708YJRGVlJdRDsIeQD4EfIgfkAHhbR7R1AmYvM2fOFBYWhp1PnjxZVFQEEuBt
dHhOsDMdOgFAmIe3ur29PcwV5OXlYRBg8qRWsxOQlYAEI0eOBJtgaguvDn61n93ynGBnOnMCgGAP
Hri6uiopKYmKii5ZsuTu3bt4W2uwE2/fvoXWkEBA6zVr1kCvd3YrhecEO8PECQD6rqysLDw8HAYB
ISEhMzOzzMzMlokBAjsRFRWlp6cHTri7u8Psts140RKeE+wMcycQMI7ABGTWrFn8/PwrVqx4/Pgx
3tAEdgK62d/fH6z5/Pkz86uhPCfYGVacAKAT7927d/DgQZiGlJaW4tomsBPgAcQQJuGBAc8JdoZF
JwAmPd6cY7IIzwl2hnUnmMBzgqvgOcG1XO3uLWeeEzzawnOCm2m444eXugLPCW6mPrE7DxjznOBm
ahOm46WuwHOCa7l7Lbs2cXpF9ia8zjI8J7iW2oSptQnT6hKm4XWW4QYnfvzxx+kWt5gX+CNx64HB
JRq1Ln4KlOr4ybiKZbjBCdtlN6HXYzoHtuKmA4aas5Nq40yg1MWZ4CqW4R4n8EpHDDQnypOt62In
1+Ji8rCwax/S5wYnjMctgV5nlDUbiP/m0rIGCmo5ECh6mF0bM7E6ZmINKrET8AaW4QYngKwmoPvt
lhMf+ISFtRvP4tqsLNRsIFAbPa4uenxN9LimMgZvYBkucYJBSyc2bungC0q5m5oo4+YSObY2ckxl
5Fi8jWW4wYmcXGpuLg0VUMF2aRZaWLshllHPKL0hIptQEzGq6vTo6tOjmopxdcQovK0rcLYT+fn5
0PfdKHh/buHqpfyakyNqwtsUw6qs9bhFV+BsJ7rXwbBLatM/4+ECnuX9Wn1SvypMrzrMoGWpCTPA
LboIBzvR7Xd89/ZiTx6k+lSG6laHdFAqTozHjboIpzrRbSEAtOPmbXfRi0DJvHgHbeI4Ko9rVR3X
bF+qj2viFl2HfZ1gdBgUVGO9wL59ZXvMreKYt0H1jDaooE2cRcVRtc5KZZA6btR12NqJyOjLeXmX
UIddukQsbHL0hUoocNCoWXtQH0O50dG/IgbQC6I2LRc4i2vXrlb6q1cGqHVYKgKG43YtqKEdwEtM
YWsnWi5kZGA5mDPDkoL6mEljtInRhnljtuXBxVMVh9U6Lb4dOFGVsuEj7She6RxucwJ1MPOWjDao
GWOBs7if9HOFjwaTUuZrhJs2Uf7z8AofNbzSOZzhBKOgms5gNNu5cyeuYgFWXpkNuZ8WUuGuybRo
3LlwGrem0R5lR9ErtZ7cysdVncCdTuB11ujGLmxCxX4tKOWumqh83q8NPytcNT656rao1KkrTK06
NKn8Jw1i1VXn7S9z8f6dwAFOIL44dqCubVPwNqaw3pLd+OyiTRRnLVTKnbU/ueh+ctEqd9FpWfkZ
Vl20iQWiRvuN73y8fydwVZxAXL9ZzLyx7ZLjqEFCQgKsMm/MzpTv0Cvfrl2+QxeVzzt0KrbrXqXm
le3UY1S2L+8pHfw3opZwoROoZU5O269OZsB4NSiMVbSJ4/i8VfezU1PZqlPpT/xTgX+D1jdXtilb
dcvdvvBt0ZzhBPxkcd4BQLO5NsxuZ0CD8PBw+IlekLHAiXzaqPd5oz4qsIxrwZWNuk2V+mWbmtuU
bdR9vf8b3KgTuM0J+GOYN7t27Ro0+O233+AnaslY4CzuRf1yiZJf4ru6bK0eLuuab3q9/3U7qqzJ
PFG2rqkB0UYft+gcjnECxgJWeu6LbaABaoMWGAVt5SxK7fXvhXnDz7JVRPnkMg9voIMqy7ZM/evQ
Bry8Sr9ktX5J8DbcohPY2ok2HdayhlHZhtDQULzUEfQd8QXvBw8ezF14ExVUw4mUfmtUsly/7FuD
0m8Ny5Y2jx3PAveWQc23hkXfm8IqbC2mr0L59K1+ifMi1KxD2NcJ5nSoRXJyMl7qCCYmcS4PIoJK
FuiX2BiU2hgU2zSPC+XB+6ASysOQg7BKXyaaET8XGDza1CqitIFTnQC61MdcKQTiysWM4q91Pyww
vkyjFc9t1uKjlS7Uo+ViK91SK116jd5dC0Pm333PwU5kZmZCN69Zn47XO4eLhWBQbKpTPNMQr7Sj
ZLpOialu+d7Nd80M7q2wxLWdwMFOAEeCs1F/f7HgHbiahxP1Xn/TwZcL/HX/91uJ8bBwx0T/jgmO
HEzgbCeAhIQEk5kZbQxoWVz2feGyHTdxc+HXVy52+mGWAuMvCwFwvBM8WOT2AVe89CV4TjTDcxTB
c4JHW3hO8GgL2zmRnBzq4bjI1sbY2Hg0gbHxGNuFdlu8Qttfjsq7EH/UyYreavToyXNstwal4S3N
XIwNdLY3x23Mljr6RKJ/Bp5x6sD6Raa4viMsLb/b6X0qLSuP3px9SE+P8d//w6qlU0xM8JHCoVp9
v+vn8PSL7Y812XvJpPFjcLsOGDdu3KIly7b7njyPdyBgJyeSQ3+0G2+or64kIyYmiv/NP4GomJiM
srrBmIlLnE60/AewuSmRHos1cCOxYaPsvNp7kxHuvspMEbeRm2C74zi6nJF61NFy9BBc3xEiIoPl
lTX0Zi1zizt/kb5Lv5Me87PTQtPxWsMUpSUl+Pn58ZHCoYpIwbHqG8xZ4RmWmt3yybqz28eLCvPh
dh1AJpPFxCXkVHQnmK8+3OQF2zgBRhvryonxkcn4cNtCJvOLy+uP+9aHoUWvOoERllAw3RiYkNHv
4SI9xHmpuY6MmBBDhfaISAwdPnPr8XNZDC2+5EQTZAFx1XErfJEV7OFEsvdiY3VJfj7sg8ZUO0eP
E4hQjwMbp6qjehKZT0BGd8LWE2ivHnNCfpLdVo8g/AsB372bpqkqDMJbhaXnu0T3b6wghDBTFxfB
Pgw1mLZkq88vwehgfV2sTRQHC6NNJOEhKos9EtJz0Y6tnNBc6k3fAxNy/Ijzmkl4G4k8WNnohxD6
TmzhRMhGw6EQIdDBaSxyj4hLycR/FPR8zoX4024bp6CtJD4Rac0F3vTO7zEnlGdvPBTV4kpPfnZG
YrDTLHV5EbRdzGJP5LlsvLEfiPH+zkyHIcSU7/YGnknNzMtHZy8vL/t8wlFXOxUFcdSAJD5+07GU
i/RY0coJoy0x9D2aoFIuxP36fZMVIvJq89zpMZgNnEj2nKchLdxkxOKDCVmUFmMKnfzMc76LcO+T
xWQ0HYKJ2l5zgiA/aO1INSncQG+l39kLX3gCvtdID9n2zbihguhIhk5ddSAsNa/dCco+vXWWqjQO
FkIWexLS6Y8eMnWCRstJi3eZhbeKK2rZB9L/xv53IsntaxWpJiVMt8VfaPcHA1RqTnoC/ha72LPx
afQ3ba86QTu+YZS6NG6gtexQbHo/pRTpx/4311ge96uh9c4jcR2dIFp+1vn4uFh8is5l5qP3FTMn
KLmZJw7YSqMhUkhKaaZTBHqEtd+dSNpvNZyhhNbq4MwcCv3AWKCVE2QBIVEpuaFtkZeVYgzDXXLi
nJetvrIYbjB168nETu8i9C7pwf+bz1BC0Xy9b2QG3sIKrZwQlJDFZ4WOgoL8EElidBQUlZy4+MeQ
VDTcsIETwWvU5cWwEqSv9p7rYJLdGa2cYAVWnTh38tCSMbpDBPjxcU3edCIxo6M3Zx8QfWCJqUZT
r46ycz6e2JUDaeVEZwgJi0+Z9X1wEt6n/504Yj9MjnExwsI1pdX0mjk95gSf0CDxwVLSDCQlxIQZ
kyCSmo3b6ZScflKCFrl/0bSmaRfJeMmeX9uPj0xgyQkymSwoJDnMyNYdacE1ToipGFrvi0xvS3yQ
y7KpCrhNZ04wQc1kXciZtHZJb9/Rg07orzuBzwoi5Vyc3//MtNBGMll0qI4N3Yp+dyLOeYaipBA6
LpLButCs3O7lEz19zWr48ElLHX3PJF3IoxCH2W+kBmy2HNF0oKpzNvpFdyWxYZZjAtTc9PhDy7AV
pEFy2vPdQIp+d4IauFJ1SFOgIFvuv9BhoKDkXghdP0IIIaWsuSYIKnvMCaVZ67xOpea0Ijc3D3L3
/rQBE7F/kYkaPlDymKWuIZ0EikS3udpKEvgUWexFl62+4AQxy0/85bsmKSRV9dcdYwMnCCmUmqUw
WB+W1X6uRcnNClmrjwd4URnVlYFEkx5zosO5KNsQsX9BsxSqFo5+Zzo61ETXuWpy+BobyXwXnq6z
4ESS/0pt3EBSVW8tWzhBo8U7z1CQwNdkiFHvVHZrKyh5mSfW6eHNJDEZZfsj9PoB4gQMH5vmGDHG
OdU5P/q3HT+oCa5fazRddSWRZu2ORZesvuhEfuY5/5U6eDs7OQFWuMxQYCQVoIXlDx6ncyF65+Xl
5lw86WbJEIIkJKlo7kJ8GhwYKE7A0QZunD1ShnF7UHWs1Uaf6MQLcH6As0fXzx6GLz1BJOHXWxmY
lIEH4FZOGG6KRHtgsjNTgnaZNwUJEllSxXA9KMEmTgDxLmYKUozD7xA+AXGFYfbN38c0cJwAUgM2
fDVKVqDz+8aEDgJCwrN3nzlPHzbotHKCGWR+6WEGdCPYyAkg/sgKU3lJCRFhwRYPBwCwJigsLiVr
Zt8UIRADygkgJWKv/RQtxUEiQgIC/ORmOfj4+ECGQWIj5tgHJae1uub3ZSfIxMmVlFOxXO/W9I31
7OQEnfj4wJ3Lpk6eLCWJkJKSnmwybfnuI8QHFFqTmxr9s/0o3E7J0GTFoZZP3CAyI3x+sNLBbTRm
LNtz4gK9Pu3Ydtsparhe75utv8SwvxN0UlLCPZ0WfT1TRVkZH73kyJGjrNftPd7iXjIDiL6KctK4
XQfIyg41M1+9Nzix5X8wYDsnePQ7PCd4tIXnBI+28Jzg0ZZ+doKnBRvSb04UFhbynGBPKBRK/zjx
9OnTOzzYkoKCAnjHFhUV4d7qFl12Aqitra3hwcbA+xZ3VbfojhM8uBueEzzawnOCR1t4TvBoTWPj
/wE+rRa6sslftgAAAABJRU5ErkJggg==",
								extent={{-125.2,-150.9},{126.6,59.9}})}),
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
end SF1_Dymola;
