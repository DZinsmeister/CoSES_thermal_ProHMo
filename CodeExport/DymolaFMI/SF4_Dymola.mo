// CP: 65001
// SimulationX Version: 4.2.3.69223
within CoSES_Models.CodeExport.DymolaFMI;
model SF4_Dymola "FMU model of SF4 for Dymola"
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
	Modelica.Blocks.Interfaces.RealOutput EH_P_heat(quantity="Basics.Power") "Heat output power of EH" annotation(
		Placement(
			transformation(extent={{135,40},{155,60}}),
			iconTransformation(
				origin={175,125},
				extent={{10,-10},{-10,10}},
				rotation=-180)),
		Dialog(
			tab="Internal Results",
			visible=false));
	Modelica.Blocks.Interfaces.RealOutput EH_E_heat(quantity="Basics.Energy") "Heat output  of EH" annotation(
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
			transformation(extent={{-145,-80},{-105,-40}}),
			iconTransformation(extent={{-195,55},{-155,95}})),
		Dialog(
			tab="Inputs/Outputs",
			visible=false));
	Modelica.Blocks.Interfaces.RealInput CHNpump(quantity="Thermics.VolumeFlow") "Flow rate of the CHN pump on the house side" annotation(
		Placement(
			transformation(extent={{100,-155},{140,-115}}),
			iconTransformation(
				origin={-174,-75},
				extent={{-20,-19.7},{20,20.3}})),
		Dialog(
			tab="Inputs/Outputs",
			visible=false));
	Modelica.Blocks.Interfaces.RealInput TCHN_toStorage(quantity="Basics.Temp") "Temperature of the CHN from the heat exchanger to the storage" annotation(
		Placement(
			transformation(extent={{100,-125},{140,-85}}),
			iconTransformation(
				origin={-174,-125},
				extent={{-20,-19.7},{20,20.3}})),
		Dialog(
			tab="Inputs/Outputs",
			visible=false));
	Modelica.Blocks.Interfaces.RealOutput TCHN_fromStorage(quantity="Basics.Temp") "Temperature of the CHN from the storage to the heat exchanger " annotation(
		Placement(
			transformation(extent={{95,-85},{115,-65}}),
			iconTransformation(
				origin={-125,-171},
				extent={{-10,-9.699999999999999},{10,10.3}},
				rotation=-90)),
		Dialog(
			tab="Inputs/Outputs",
			visible=false));
	SignalBlocks.Connection connection3;
	SignalBlocks.Connection connection4;
	Modelica.Blocks.Interfaces.BooleanInput StandardContolEH "Standard control of the electric heater (P_elHeater will be ignored)" annotation(
		Placement(
			transformation(extent={{-30,25},{10,65}}),
			iconTransformation(
				origin={-25,175},
				extent={{-20,-20},{20,20}},
				rotation=-90)),
		Dialog(
			tab="Inputs/Outputs",
			visible=false));
	Modelica.Blocks.Interfaces.BooleanInput StandardControlCB "Standard control of the CHP (P_CB will be ignored)" annotation(
		Placement(
			transformation(extent={{-30,-40},{10,0}}),
			iconTransformation(
				origin={25,175},
				extent={{-20,-20},{20,20}},
				rotation=-90)),
		Dialog(
			tab="Inputs/Outputs",
			visible=false));
	GreenCity.Utilities.Electrical.Grid grid1(useA=true) "Electrical power grid for connection of maximum six 3-phase AC components" annotation(Placement(transformation(extent={{95,-55},{135,-15}})));
	InterfacesGeneral.PhysicsSignalInterfaces.GeneralElements.SigInDer sigInDer2(kind=InterfacesGeneral.PhysicsSignalInterfaces.DerivationModel.dersDT1) annotation(Placement(transformation(extent={{-65,-75},{-45,-55}})));
	InterfacesGeneral.MSLInterfaces.I2RO i2RO2 annotation(Placement(transformation(extent={{-30,-65},{-20,-55}})));
	InterfacesGeneral.MSLInterfaces.RI2O rI2O2 "Real Input to Signal Output" annotation(Placement(transformation(extent={{-90,-65},{-80,-55}})));
	Houses.SF4 sF4(
		Tmax_TS(displayUnit="K")=T_max_BT,
		T0_TS(displayUnit="K")=T_reference_BT,
		TSTupInit(displayUnit="K")=TS_S_TM_BT_10_init,
		TSTlowInit(displayUnit="K")=TS_S_TM_BT_1_init,
		nPeople=nPeople,
		nFloors=nFloors,
		nApartments=nApartments,
		ALH=HeatedArea,
		QHeatNormLivingArea=if HeatingSystem==0 then 20 else 16,
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
		PVPeak(displayUnit="Nm/s")=PVPeak) annotation(Placement(transformation(extent={{15,-100},{65,-50}})));
	Modelica.Blocks.Interfaces.RealInput P_elHeater(quantity="Basics.Power") "Set Power electric heater" annotation(
		Placement(
			transformation(extent={{-145,-110},{-105,-70}}),
			iconTransformation(extent={{-195,105},{-155,145}})),
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
		parameter String file="C:\Users\Public\Documents\SimulationX 4.2\Modelica\CoSES_Models\Data\SF4_WholeYear.txt" "Path to file for consumption data" annotation(Dialog(tab="Parameters"));
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
			YearInit=2021) annotation(Placement(transformation(extent={{95,-5},{125,25}})));
		Modelica.Blocks.Interfaces.BooleanInput StandardContolExcessPV "Standard control of the electric heater to use excess PV if possible" annotation(
			Placement(
				transformation(extent={{-30,-5},{10,35}}),
				iconTransformation(
					origin={-75,175},
					extent={{-20,-20},{20,20}},
					rotation=-90)),
			Dialog(
				tab="Inputs/Outputs",
				visible=false));
	equation
		// Internal Results
		
		// Condensing Boiler
		CB_S_TM_VL = sF4.CB_S_TM_VL;
		CB_S_TM_RL = sF4.CB_S_TM_RL;
		CB_S_FW_HC = sF4.CB_S_FW_HC;
		CB_S_FG = sF4.CB_S_FG;
		CB_VFuel = sF4.CB_VFuel;
		CB_P_heat = sF4.CB_P_heat_is;
		CB_P_gas = sF4.CB_P_gas_is;
		CB_E_heat = sF4.CB_E_heat_produced;
		CB_E_gas = sF4.CB_E_gas_consumed;
		CB_Efficiency_th = sF4.CB_Efficiency;
		
		// Electric heater
		EH_P_heat = sF4.EH_P_heat_is;
		EH_E_heat = sF4.EH_E_heat_produced;
		
		// Thermal Storage
		TS_S_TM_HC_VL = sF4.TS_S_TM_HC_VL;
		TS_S_TM_HC_RL = sF4.TS_S_TM_HC_RL;
		TS_S_TM_PS_VL = sF4.TS_S_TM_PS_VL;
		TS_S_TM_PS_RL = sF4.TS_S_TM_PS_RL;
		TS_S_TM_HC_HW_VL = sF4.TS_S_TM_HC_HW_VL;
		TS_S_TM_HC_HW_RL = sF4.TS_S_TM_HC_HW_RL;
		TS_S_TM_BT_1 = sF4.TS_S_TM_BT_1;
		TS_S_TM_BT_2 = sF4.TS_S_TM_BT_2;
		TS_S_TM_BT_3 = sF4.TS_S_TM_BT_3;
		TS_S_TM_BT_4 = sF4.TS_S_TM_BT_4;
		TS_S_TM_BT_5 = sF4.TS_S_TM_BT_5;
		TS_S_TM_BT_6 = sF4.TS_S_TM_BT_6;
		TS_S_TM_BT_7 = sF4.TS_S_TM_BT_7;
		TS_S_TM_BT_8 = sF4.TS_S_TM_BT_8;
		TS_S_TM_BT_9 = sF4.TS_S_TM_BT_9;
		TS_S_TM_BT_10 = sF4.TS_S_TM_BT_10;
		TS_E_Storage_BT = sF4.TS_E_Storage_BT;
		TS_SOC_BT = sF4.TS_SOC_BT;
		
		// Heat Sink
		HS_S_TM_VL_bM = sF4.HS_S_TM_VL_bM;
		HS_S_TM_VL_aM = sF4.HS_S_TM_VL_aM;
		HS_S_TM_RL = sF4.HS_S_TM_RL;
		HS_S_TM_HW_VL = sF4.HS_S_TM_HW_VL;
		HS_S_TM_HW_RL = sF4.HS_S_TM_HW_RL;
		HS_S_TM_Room = sF4.HS_S_TM_Room;
		HS_S_FW_HC_aM = sF4.HS_S_FW_HC_aM;
		HS_S_FW_HC_bM = sF4.HS_S_FW_HC_bM;
		HS_S_FW_HW_VL = sF4.HS_S_FW_HW_VL;
		HS_P_DemHeatHC = sF4.HS_P_DemHeatHC_is;
		HS_P_DemHeatHW = sF4.HS_P_DemHeatHW_is;
		HS_E_DemHeatHC = sF4.HS_E_DemHeatHC_consumed;
		HS_E_DemHeatHW = sF4.HS_E_DemHeatHW_consumed;
		
		// PV
		PV_P = sF4.PV_P;
		PV_E = sF4.PV_E;
		
		// outputs
		//TCHN_fromStorage = sF4.DTH_HEXin;
	equation
		connect(rI2O2.u[1],P_CB) annotation(Line(
			points={{-92,-60},{-97,-60},{-120,-60},{-125,-60}},
			color={0,0,127},
			thickness=0.0625));
		connect(sF4.CBIn_P,i2RO2.y) annotation(Line(
			points={{15,-60},{10,-60},{-14,-60},{-19,-60}},
			color={0,0,127},
			thickness=0.0625));
		connect(P_elHeater,sF4.ElHeaterIn_P) annotation(Line(
			points={{-125,-90},{-120,-90},{10,-90},{15,-90}},
			color={0,0,127},
			thickness=0.0625));
		connect(sF4.qv_HEX,TCHN_fromStorage) annotation(Line(
			points={{64.7,-75},{69.7,-75},{100,-75},{105,-75}},
			color={0,0,127},
			thickness=0.0625));
		connect(sF4.TDH_HEXout,TCHN_toStorage) annotation(
			Line(
				points={{64.66667175292969,-90},{69.7,-90},{95,-90},{95,-105},{120,-105}},
				color={0,0,127},
				thickness=0.0625),
			__esi_AutoRoute=false);
		connect(sF4.lV3Phase1,grid1.LVGridA) annotation(Line(
			points={{64.7,-65},{69.7,-65},{90,-65},{90,-20},{95,-20}},
			color={247,148,29},
			thickness=0.0625));
		connect(CHNpump,sF4.qvDHpump) annotation(Line(
			points={{120,-135},{115,-135},{69.7,-135},{69.7,-95},{64.7,-95}},
			color={0,0,127},
			thickness=0.0625));
		connect(environment1.EnvironmentConditions,sF4.environmentConditions1) annotation(Line(
			points={{95,10},{90,10},{69.7,10},{69.7,-55},{64.7,-55}},
			color={192,192,192},
			thickness=0.0625));
		connect(sF4.StandardCBcontrol,StandardControlCB) annotation(Line(
			points={{25,-50},{25,-45},{25,-20},{-5,-20},{-10,-20}},
			color={255,0,255},
			thickness=0.0625));
		connect(sF4.StandardControlEH,StandardContolEH) annotation(Line(
			points={{55,-50},{55,-45},{55,45},{-5,45},{-10,45}},
			color={255,0,255},
			thickness=0.0625));
		connect(sF4.StandardControlExcessPV,StandardContolExcessPV) annotation(Line(
			points={{40,-50},{40,-45},{40,15},{-5,15},{-10,15}},
			color={255,0,255},
			thickness=0.0625));
		connect(connection4,sigInDer2.in1);
		connect(connection3,sigInDer2.out1);
		connect(connection3,i2RO2.x);
		connect(connection4,rI2O2.y);
	annotation(
		__esi_connection3(viewinfo[0](
			line[0](
				points(
					x={
											314,329,345,360},
					y={
											510,510,510,510}),
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
											510,510,510,510}),
				pinSrc=rI2O2.y,
				pinDst=sigInDer2.in1,
				typename="Line"),
			typename="ConnectionInfo")),
		__esi_sF4(hydraulicSwitch_TS_DH1(viewinfo[0](
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
}
",
				border(
					left=5,
					top=5,
					right=5,
					bottom=5),
				position(
					left=60,
					top=0,
					right=285,
					bottom=285),
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
					left=285,
					top=0,
					right=420,
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
					left=420,
					top=0,
					right=630,
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
			projectName="SF4",
			projectPath="C:\\Users\\gu62xur\\Downloads\\FMI Test",
			projectType=20,
			saveOutputsApproach=1,
			inputs[0](
				port="P_CB",
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
				port="StandardContolEH",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			inputs[4](
				port="StandardControlCB",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			inputs[5](
				port="P_elHeater",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			inputs[6](
				port="StandardContolExcessPV",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[0](
				port="PV_P",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[1](
				port="PV_E",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[2](
				port="CB_S_TM_VL",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[3](
				port="CB_S_TM_RL",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[4](
				port="CB_S_FW_HC",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[5](
				port="CB_S_FG",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[6](
				port="CB_VFuel",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[7](
				port="CB_P_heat",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[8](
				port="CB_P_gas",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[9](
				port="CB_E_heat",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[10](
				port="CB_E_gas",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[11](
				port="CB_Efficiency_th",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[12](
				port="EH_P_heat",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[13](
				port="EH_E_heat",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[14](
				port="TS_S_TM_HC_HW_VL",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[15](
				port="TS_S_TM_HC_HW_RL",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[16](
				port="TS_S_TM_BT_1",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[17](
				port="TS_S_TM_BT_2",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[18](
				port="TS_S_TM_BT_3",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[19](
				port="TS_S_TM_BT_4",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[20](
				port="TS_S_TM_BT_5",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[21](
				port="TS_S_TM_BT_6",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[22](
				port="TS_S_TM_BT_7",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[23](
				port="TS_S_TM_BT_8",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[24](
				port="TS_S_TM_BT_9",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[25](
				port="TS_S_TM_BT_10",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[26](
				port="TS_E_Storage_BT",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[27](
				port="TS_SOC_BT",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[28](
				port="HS_S_TM_VL_bM",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[29](
				port="HS_S_TM_VL_aM",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[30](
				port="HS_S_TM_RL",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[31](
				port="HS_S_TM_HW_VL",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[32](
				port="HS_S_TM_HW_RL",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[33](
				port="HS_S_FW_HC_aM",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[34](
				port="HS_S_FW_HC_bM",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[35](
				port="HS_S_FW_HW_VL",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[36](
				port="HS_P_DemHeatHC",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[37](
				port="HS_P_DemHeatHW",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[38](
				port="HS_E_DemHeatHC",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[39](
				port="HS_E_DemHeatHW",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[40](
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
				port="TS_S_TM_BT_1_init",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[17](
				port="TS_S_TM_BT_10_init",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[18](
				port="T_reference_BT",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[19](
				port="T_max_BT",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[20](
				port="PValpha",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[21](
				port="PVbeta",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[22](
				port="PVPeak",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			descriptionProject="SimulationX model of SF4",
			author="Zinsmeister, Daniel",
			fmiIncludeDllWin32=false,
			fmiIncludeDllWin64=true,
			fmiExposeVariables=false,
			fmiIncludeSources=false,
			fmiExposeStates=false,
			fmiLogging=false,
			fmiModelImgFile="C:\\Users\\Public\\Documents\\SimulationX 4.2\\Modelica\\CoSES_Models\\Houses\\SF4.png",
			guid="{56460F60-305E-491E-A68D-D3C4A9008CE1}",
			showAdditionalLibPage=false,
			useCodeOptimization=false,
			m_x64=false,
			solverMode=1,
			checkSum=78597,
			fmiVersion="1.0",
			typename="CodeExportInfo"),
		Icon(
			coordinateSystem(extent={{-175,-175},{175,175}}),
			graphics={
							Text(
								textString="SF4 FMI",
								extent={{-169.5,148.6},{153.8,75.2}}),
							Bitmap(
								imageSource="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
4jbjvZz2AAAAAElFTkSuQmCC",
								extent={{-128.6,-155.2},{123.1,46.7}})}),
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
end SF4_Dymola;
