// CP: 65001
// SimulationX Version: 4.2.3.69223
within CoSES_Models.CodeExport.VeriStandHiL;
model SimX_SF3_PHIL "Power Hardware in the Loop model for SF3"
	input SignalBlocks.InputPin STM_HCVLaM_degC "Temperature Heating Circuit after the mixing valve" annotation(
		Placement(
			transformation(
				origin={-95,-20},
				extent={{-5,5},{5,-5}}),
			iconTransformation(extent={{-195,80},{-155,120}})),
		Dialog(
			tab="Input Signals",
			visible=false));
	input SignalBlocks.InputPin SFW_HCRLbM_l_per_min "Flow Water Heating Circuit before mixing valve" annotation(
		Placement(
			transformation(
				origin={-95,-40},
				extent={{-5,5},{5,-5}}),
			iconTransformation(extent={{-195,130},{-155,170}})),
		Dialog(
			tab="Input Signals",
			visible=false));
	input SignalBlocks.InputPin STM_CCVL_degC "Temperature Cooling Circuit" annotation(
		Placement(
			transformation(
				origin={-100,-175},
				extent={{-5,5},{5,-5}}),
			iconTransformation(extent={{-195,30},{-155,70}})),
		Dialog(
			tab="Input Signals",
			visible=false));
	input SignalBlocks.InputPin STM_STRL_degC "Return temperature Solar Thermal " annotation(
		Placement(
			transformation(
				origin={-100,-230},
				extent={{-5,5},{5,-5}}),
			iconTransformation(extent={{-195,-120},{-155,-80}})),
		Dialog(
			tab="Input Signals",
			visible=false));
	input SignalBlocks.InputPin SFW_STVL_l_per_min "Flow rate solar thermal" annotation(
		Placement(
			transformation(
				origin={-100,-255},
				extent={{-5,5},{5,-5}}),
			iconTransformation(extent={{-195,-170},{-155,-130}})),
		Dialog(
			tab="Input Signals",
			visible=false));
	input SignalBlocks.InputPin STM_BCVL_degC "Return temperature Solar Thermal " annotation(
		Placement(
			transformation(
				origin={-100,-280},
				extent={{-5,5},{5,-5}}),
			iconTransformation(extent={{-195,-20},{-155,20}})),
		Dialog(
			tab="Input Signals",
			visible=false));
	input SignalBlocks.InputPin SFW_BC_l_per_min "Flow rate solar thermal" annotation(
		Placement(
			transformation(
				origin={-100,-305},
				extent={{-5,5},{5,-5}}),
			iconTransformation(extent={{-195,-70},{-155,-30}})),
		Dialog(
			tab="Input Signals",
			visible=false));
	Real var_STM_CCVL_K "Variable" annotation(Dialog(
		tab="Input Signals",
		visible=false));
	Real var_STM_HCVLaM_K "Variable" annotation(Dialog(
		tab="Input Signals",
		visible=false));
	Real var_SFW_HCRLbM_m3_per_s "Variable" annotation(Dialog(
		tab="Input Signals",
		visible=false));
	Real var_STM_STRL_K "Variable" annotation(Dialog(
		tab="Input Signals",
		visible=false));
	Real var_SFW_STVL_m3_per_s "Variable" annotation(Dialog(
		tab="Input Signals",
		visible=false));
	Real var_SFW_BC_m3_per_s "var_SFW_BC_m3_per_s" annotation(Dialog(
		tab="Input Signals",
		visible=false));
	Real var_STM_BCVL_K "var_STM_BCVL_K" annotation(Dialog(
		tab="Input Signals",
		visible=false));
	output SignalBlocks.OutputPin T_ground_degC "T_ground_degC" annotation(
		Placement(
			transformation(
				origin={255,-295},
				extent={{-5,5},{5,-5}},
				rotation=180),
			iconTransformation(
				origin={125,200},
				extent={{-20,-20},{20,20}},
				rotation=270)),
		Dialog(
			tab="Output Signals",
			visible=false));
	output SignalBlocks.OutputPin STM_HCVLaM_Set_degC "Set temperature Heating Circuit after the mixing valve" annotation(
		Placement(
			transformation(extent={{250,-85},{260,-95}}),
			iconTransformation(
				origin={171,-100},
				extent={{-19.3,-20},{20.7,20}},
				rotation=180)),
		Dialog(
			tab="Output Signals",
			visible=false));
	output SignalBlocks.OutputPin SFW_HCRLbM_Set_l_per_min "SFW_HCRLbM_Set_l_per_min" annotation(
		Placement(
			transformation(
				origin={255,-60},
				extent={{-5,5},{5,-5}},
				rotation=180),
			iconTransformation(
				origin={171,-50},
				extent={{-19.3,-20},{20.7,20}},
				rotation=180)),
		Dialog(
			tab="Output Signals",
			visible=false));
	output SignalBlocks.OutputPin STM_HCRL_Set_degC "STM_HCRL_Set_degC" annotation(
		Placement(
			transformation(
				origin={255,-105},
				extent={{-5,5},{5,-5}},
				rotation=180),
			iconTransformation(
				origin={171,-150},
				extent={{-19.3,-20},{20.7,20}},
				rotation=180)),
		Dialog(
			tab="Output Signals",
			visible=false));
	output SignalBlocks.OutputPin E_DHW_Set_kWh "E_DHW_Set_kWh" annotation(
		Placement(
			transformation(
				origin={255,-135},
				extent={{-5,5},{5,-5}},
				rotation=180),
			iconTransformation(
				origin={75,-197},
				extent={{-20,-19.7},{20,20.3}},
				rotation=90)),
		Dialog(
			tab="Output Signals",
			visible=false));
	output SignalBlocks.OutputPin P_elConsumption_kW "electric consumption of the house" annotation(
		Placement(
			transformation(
				origin={255,-75},
				extent={{-5,5},{5,-5}},
				rotation=180),
			iconTransformation(
				origin={125,-197},
				extent={{-20,-19.7},{20,20.3}},
				rotation=90)),
		Dialog(
			tab="Output Signals",
			visible=false));
	output SignalBlocks.OutputPin STM_STVL_Set_degC "STM_STVL_Set_degC" annotation(
		Placement(
			transformation(
				origin={255,-215},
				extent={{-5,5},{5,-5}},
				rotation=180),
			iconTransformation(
				origin={-125,-197},
				extent={{-20,-19.7},{20,20.3}},
				rotation=90)),
		Dialog(
			tab="Output Signals",
			visible=false));
	output SignalBlocks.OutputPin PEH_ST_Set_kW "Thermal power of the solar thermal module" annotation(
		Placement(
			transformation(
				origin={255,-230},
				extent={{-5,5},{5,-5}},
				rotation=270),
			iconTransformation(
				origin={-25,-197},
				extent={{-20,-19.7},{20,20.3}},
				rotation=90)),
		Dialog(
			tab="Output Signals",
			visible=false));
	output SignalBlocks.OutputPin T_roomIs_degC "T_roomIs_degC" annotation(
		Placement(
			transformation(
				origin={255,-45},
				extent={{-5,5},{5,-5}},
				rotation=90),
			iconTransformation(
				origin={171,50},
				extent={{-19.3,-20},{20.7,20}},
				rotation=180)),
		Dialog(
			tab="Output Signals",
			visible=false));
	output SignalBlocks.OutputPin T_ambient_degC "Ambient temperature" annotation(
		Placement(
			transformation(
				origin={255,35},
				extent={{-5,5},{5,-5}},
				rotation=270),
			iconTransformation(
				origin={75,200},
				extent={{-20,-20},{20,20}},
				rotation=270)),
		Dialog(
			tab="Output Signals",
			visible=false));
	output SignalBlocks.OutputPin T_collector_degC "Solar thermal collector temperature" annotation(
		Placement(
			transformation(
				origin={255,-200},
				extent={{-5,5},{5,-5}},
				rotation=90),
			iconTransformation(
				origin={-75,-197},
				extent={{-20,-19.7},{20,20.3}},
				rotation=90)),
		Dialog(
			tab="Output Signals",
			visible=false));
	output SignalBlocks.OutputPin Modeltime_s "Model time in seconds" annotation(
		Placement(
			transformation(
				origin={255,50},
				extent={{-5,5},{5,-5}},
				rotation=270),
			iconTransformation(
				origin={-125,200},
				extent={{-20,-20},{20,20}},
				rotation=270)),
		Dialog(
			tab="Output Signals",
			visible=false));
	output SignalBlocks.OutputPin DirectRadiation_W_per_m2 "Direct radiation" annotation(
		Placement(
			transformation(
				origin={255,20},
				extent={{-5,5},{5,-5}},
				rotation=270),
			iconTransformation(
				origin={25,200},
				extent={{-20,-20},{20,20}},
				rotation=270)),
		Dialog(
			tab="Output Signals",
			visible=false));
	output SignalBlocks.OutputPin DiffuseRadiation_W_per_m2 "Diffuse radiation" annotation(
		Placement(
			transformation(
				origin={255,5},
				extent={{-5,5},{5,-5}},
				rotation=270),
			iconTransformation(
				origin={-25,200},
				extent={{-20,-20},{20,20}},
				rotation=270)),
		Dialog(
			tab="Output Signals",
			visible=false));
	output SignalBlocks.OutputPin STM_BCRLaM_Set_degC "STM_BCRLaM_Set_degC" annotation(
		Placement(
			transformation(
				origin={255,-310},
				extent={{-5,5},{5,-5}},
				rotation=180),
			iconTransformation(
				origin={25,-197},
				extent={{-20,-19.7},{20,20.3}},
				rotation=90)),
		Dialog(
			tab="Output Signals",
			visible=false));
	output SignalBlocks.OutputPin T_roofIs_degC "Roof temperature" annotation(
		Placement(
			transformation(
				origin={255,-15},
				extent={{-5,5},{5,-5}},
				rotation=270),
			iconTransformation(
				origin={171,100},
				extent={{-19.3,-20},{20.7,20}},
				rotation=180)),
		Dialog(
			tab="Output Signals",
			visible=false));
	output SignalBlocks.OutputPin T_cellarIs_degC "Cellar temperature" annotation(
		Placement(
			transformation(
				origin={255,-30},
				extent={{-5,5},{5,-5}},
				rotation=270),
			iconTransformation(
				origin={171,0},
				extent={{-19.3,-20},{20.7,20}},
				rotation=180)),
		Dialog(
			tab="Output Signals",
			visible=false));
	parameter String File=classDirectory()+"Data\\SF3_Typeday.txt" "File of all parameters of SF3 (weather, presence, Pel, DHW)" annotation(Dialog(tab="Parameters"));
	parameter Integer SF3_Typeday=1 "1 - WSC, 2 - WSS, 3 - WWS, 4 - WWC, 5 - TWC, 6 - SSS, 7 - TWS, 8 - TSS, 9 - SWC, 10 - SSC, 11 - TSC, 12 - SWS, coldest" annotation(Dialog(tab="Parameters"));
	parameter Integer SF3_InitializationTime_h=1 "Additional time before the experiment in order to reach initial conditions for the experiment" annotation(Dialog(tab="Parameters"));
	parameter Integer InitTime=24-SF3_InitializationTime_h "Initial time of the day" annotation(Dialog(tab="Parameters"));
	parameter Integer InitDay=integer(mod(SF3_Typeday*3-2, 31)) "InitialDay" annotation(Dialog(tab="Parameters"));
	parameter Integer InitMonth=integer((SF3_Typeday*3-2)/31)+1 "Initial Month" annotation(Dialog(tab="Parameters"));
	parameter Real TLiving_Init=if SF3_Typeday == 1 then 21
	elseif SF3_Typeday == 2 then 21
	elseif SF3_Typeday == 3 then 21
	elseif SF3_Typeday == 4 then 21
	elseif SF3_Typeday == 5 then 21
	elseif SF3_Typeday == 6 then 21
	elseif SF3_Typeday == 7 then 21
	elseif SF3_Typeday == 8 then 21
	elseif SF3_Typeday == 9 then 23.55
	elseif SF3_Typeday == 10 then 23.87
	elseif SF3_Typeday == 11 then 22.96
	elseif SF3_Typeday == 12 then 24.12
	else 21 "Initial Temperature" annotation(Dialog(tab="Parameters"));
	parameter Real TRoof_Init=if SF3_Typeday == 1 then 4.37
	elseif SF3_Typeday == 2 then 3.34
	elseif SF3_Typeday == 3 then 5.70
	elseif SF3_Typeday == 4 then 5.05
	elseif SF3_Typeday == 5 then 12.48
	elseif SF3_Typeday == 6 then 13.28
	elseif SF3_Typeday == 7 then 16.65
	elseif SF3_Typeday == 8 then 10.93
	elseif SF3_Typeday == 9 then 22.30
	elseif SF3_Typeday == 10 then 23.07
	elseif SF3_Typeday == 11 then 21.23
	elseif SF3_Typeday == 12 then 23.65
	else 4.98 "Initial Temperature" annotation(Dialog(tab="Parameters"));
	parameter Real TCellar_Init=if SF3_Typeday == 1 then 7.85
	elseif SF3_Typeday == 2 then 7.52
	elseif SF3_Typeday == 3 then 10.30
	elseif SF3_Typeday == 4 then 9.69
	elseif SF3_Typeday == 5 then 14.14
	elseif SF3_Typeday == 6 then 10.68
	elseif SF3_Typeday == 7 then 16.01
	elseif SF3_Typeday == 8 then 9.46
	elseif SF3_Typeday == 9 then 17.83
	elseif SF3_Typeday == 10 then 17.02
	elseif SF3_Typeday == 11 then 17.58
	elseif SF3_Typeday == 12 then 18.54
	else 7.47 "Initial Temperature" annotation(Dialog(tab="Parameters"));
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
	parameter Real ElFactor=SF3_YearlyElecConsumption_kWh/6041 "ElFactor" annotation(Dialog(tab="Parameters"));
	parameter Real SF3_V_DHWperDay_l=400 "V_DHWperDay_l" annotation(Dialog(tab="Parameters"));
	parameter Real DHWFactor=SF3_V_DHWperDay_l/300 "Factor, with which the DHW demand gets multiplied" annotation(Dialog(tab="Parameters"));
	parameter Integer SF3_ST_CollectorType=0 "0 - Flat Plate Collector, 1 - Compound Parabolic Collector" annotation(Dialog(tab="Parameters"));
	parameter Real SF3_ST_CollectorSurface_m2=2 "ST_CollectorSurface_m2" annotation(Dialog(tab="Parameters"));
	parameter Real SF3_ST_CollectorVolume_m3=1.7 "ST_CollectorVolume_m3" annotation(Dialog(tab="Parameters"));
	parameter Integer SF3_GSHP_numberHE=4 "Number of individual heat exchanger" annotation(Dialog(tab="Parameters"));
	parameter Integer SF3_GSHP_horizontalCollector=1 "0 - horizontal Collector, 1 - vertical collector" annotation(Dialog(tab="Parameters"));
	parameter Real SF3_GSHP_CollectorDepth_m=1 "Depth of the collector" annotation(Dialog(tab="Parameters"));
	parameter Real SF3_GSHP_CollectorRadius_m=10 "Pipe diameter or collector radius" annotation(Dialog(tab="Parameters"));
	parameter Real SF3_PV_PeakPower_kW=10 "PV_PeakPower_kW" annotation(Dialog(tab="Parameters"));
	GreenCity.Interfaces.Thermal.DefineVolumeFlow defineVolumeFlow3 "Specifies a Thermal Volume Flow Connector" annotation(Placement(transformation(extent={{-10,-245},{10,-225}})));
	GreenCity.Interfaces.Thermal.ExtractVolumeFlow extractVolumeFlow3 annotation(Placement(transformation(
		origin={0,-201},
		extent={{-10,-6},{10,14}},
		rotation=-180)));
	Consumer.SimpleHeatedBuilding simpleHeatedBuilding1(
		vFCtrl_LivingZone(
			deltaTup=if self.ActivateNightTimeReduction then 0.01 else 0.1,
			deltaTlow=if self.ActivateNightTimeReduction then -0.01 else -0.1),
		redeclare replaceable parameter GreenCity.Utilities.BuildingData.ParameterSelectionSCB.AgeOfBuilding.EnEV2016 buildingAge,
		nFloors=SF3_nFloors,
		nAp=SF3_nApartments,
		nPeople=SF3_nPeople,
		ALH=SF3_HeatedArea_m2,
		livingTZoneInit(displayUnit="K")=TLiving_Init+273.15,
		UseStandardHeatNorm=false,
		QHeatNormLivingArea=13,
		n=if SF3_HeatingSystem==0 then 1.3 else 1,
		TFlowHeatNorm(displayUnit="K")=if SF3_HeatingSystem==0 then 338.15 else 313.15,
		TReturnHeatNorm(displayUnit="K")=if SF3_HeatingSystem==0 then 323.15 else 303.15,
		TRef(displayUnit="K")=SF3_T_roomSet_degC + 273.15,
		roofTZoneInit(displayUnit="K")=TRoof_Init+273.15,
		cellarTZoneInit(displayUnit="K")=TCellar_Init+273.15,
		UseIndividualPresence=true,
		PresenceFile=File,
		UseIndividualElecConsumption=true,
		ElConsumptionFile=File,
		ElConsumptionFactor=ElFactor,
		ActivateNightTimeReduction=true,
		Tnight(displayUnit="K")=SF3_T_roomNightSet_degC + 273.15,
		NightTimeReductionStart(displayUnit="s")=SF3_NightTimeReductionStart_h * 3600,
		NightTimeReductionEnd(displayUnit="s")=SF3_NightTimeReductionEnd_h * 3600,
		TZone(displayUnit="°C")) annotation(Placement(transformation(extent={{70,-70},{110,-30}})));
	GreenCity.Utilities.Electrical.Grid grid1(
		useA=true,
		useB=false,
		useC=false) annotation(Placement(transformation(extent={{195,-120},{235,-80}})));
	Environment.Environment environment1(
		ReferenceDay=false,
		InputFile=File,
		DefaultInit=false,
		DayTimeInit=InitTime,
		MonthDayInit=InitDay,
		MonthInit=InitMonth) annotation(Placement(transformation(extent={{140,-10},{170,20}})));
	GreenCity.Interfaces.Thermal.DefineVolumeFlow defineVolumeFlow1 annotation(Placement(transformation(extent={{-10,-50},{10,-30}})));
	GreenCity.Interfaces.Thermal.ExtractVolumeFlow extractVolumeFlow1 annotation(Placement(transformation(
		origin={0,-65},
		extent={{-10,-10},{10,10}},
		rotation=-180)));
	Consumer.DHW_demand dHW_demand1(
		WeeklyData=false,
		File=File,
		DHWfactor=DHWFactor) annotation(Placement(transformation(extent={{70,-140},{90,-120}})));
	GreenCity.Interfaces.Thermal.DefineVolumeFlow defineVolumeFlow2 annotation(Placement(transformation(extent={{-10,-135},{10,-115}})));
	GreenCity.Interfaces.Thermal.ExtractVolumeFlow extractVolumeFlow2 annotation(Placement(transformation(
		origin={0,-150},
		extent={{-10,-10},{10,10}},
		rotation=-180)));
	GreenCity.Local.SolarThermal WolfCRK12(
		CPC=SF3_ST_CollectorType==1,
		alphaModule(displayUnit="°"),
		betaModule(displayUnit="°"),
		nSeries=1,
		nParallel=1,
		AModule=SF3_ST_CollectorSurface_m2,
		VAbsorber(displayUnit="m³")=SF3_ST_CollectorVolume_m3,
		etaOptical(displayUnit="-")=if SF3_ST_CollectorType==1 then 64.2 else 81,
		a1=if SF3_ST_CollectorType==1 then 0.885 else 3.492,
		a2=if SF3_ST_CollectorType==1 then 0.001 else 0.016,
		CCollector=if SF3_ST_CollectorType==1 then 8416 else 5850) annotation(Placement(transformation(extent={{100,-235},{60,-195}})));
	Modelica.Blocks.Sources.RealExpression STM_HCVLaM_K(y=var_STM_HCVLaM_K) "Set output signal to a time varying Real expression" annotation(Placement(transformation(extent={{-50,-25},{-30,-5}})));
	Modelica.Blocks.Sources.RealExpression STM_CCVL_K(y=var_STM_CCVL_K) "Set output signal to a time varying Real expression" annotation(Placement(transformation(extent={{-50,-185},{-30,-165}})));
	Modelica.Blocks.Sources.RealExpression SFW_HCRLbM_m3_per_s(y=var_SFW_HCRLbM_m3_per_s) "Set output signal to a time varying Real expression" annotation(Placement(transformation(extent={{-50,-55},{-30,-35}})));
	Modelica.Blocks.Sources.RealExpression STM_STVL_K(y=var_STM_STRL_K) "Set output signal to a time varying Real expression" annotation(Placement(transformation(extent={{-50,-240},{-30,-220}})));
	Modelica.Blocks.Sources.RealExpression SFW_STVL_m3_per_s(y=var_SFW_STVL_m3_per_s) "Set output signal to a time varying Real expression" annotation(Placement(transformation(extent={{-50,-265},{-30,-245}})));
	Modelica.Blocks.Sources.RealExpression modeltime_s(y=time) annotation(Placement(transformation(extent={{90,45},{110,65}})));
	GreenCity.Local.HeatExchangers.GroundCollector groundCollector1(
		numberHE=SF3_GSHP_numberHE,
		horizontalCollector=SF3_GSHP_horizontalCollector==1,
		rAffected=SF3_GSHP_CollectorRadius_m + 1,
		HoleDepth=SF3_GSHP_CollectorDepth_m,
		rHole=SF3_GSHP_CollectorRadius_m) annotation(Placement(transformation(extent={{65,-375},{80,-335}})));
	GreenCity.Interfaces.Thermal.DefineVolumeFlow defineVolumeFlow4 annotation(Placement(transformation(extent={{-5,-295},{15,-275}})));
	GreenCity.Interfaces.Thermal.ExtractVolumeFlow extractVolumeFlow4 annotation(Placement(transformation(
		origin={5,-321},
		extent={{-10,-6},{10,14}},
		rotation=-180)));
	Modelica.Blocks.Sources.RealExpression STM_BCVL_K(y=var_STM_BCVL_K) "Set output signal to a time varying Real expression" annotation(Placement(transformation(extent={{-50,-290},{-30,-270}})));
	Modelica.Blocks.Sources.RealExpression SFW_BC_m3_per_s(y=var_SFW_BC_m3_per_s) "Set output signal to a time varying Real expression" annotation(Placement(transformation(extent={{-50,-320},{-30,-300}})));
	GreenCity.Local.Photovoltaic photovoltaic1(
		alphaModule(displayUnit="°"),
		betaModule(displayUnit="°"),
		PPeak(displayUnit="kW")) annotation(Placement(transformation(extent={{130,-435},{90,-395}})));
	GreenCity.Local.Controller.PV2ACInverter pV2ACInverter1 annotation(Placement(transformation(extent={{80,-395},{40,-435}})));
	GreenCity.Utilities.Electrical.Grid grid2(useD=true) annotation(Placement(transformation(extent={{-45,-450},{-5,-410}})));
	output SignalBlocks.OutputPin PV_P_gen "PV_P_gen" annotation(Placement(
		transformation(
			origin={255,-415},
			extent={{-5,5},{5,-5}},
			rotation=180),
		iconTransformation(
			origin={175,150},
			extent={{-20,20},{20,-20}},
			rotation=180)));
	equation
		// enter your equations here
		// Heating
		STM_HCRL_Set_degC = extractVolumeFlow1.TMedium - 273.15;
		SFW_HCRLbM_Set_l_per_min = simpleHeatedBuilding1.qv_Ref * 60000;
		P_elConsumption_kW = simpleHeatedBuilding1.Pel / 1000;
		STM_HCVLaM_Set_degC = simpleHeatedBuilding1.T_Ref - 273.15;
		T_roofIs_degC = simpleHeatedBuilding1.TZone[3] - 273.15;
		T_roomIs_degC = simpleHeatedBuilding1.TZone[2] - 273.15;
		T_cellarIs_degC = simpleHeatedBuilding1.TZone[1] - 273.15;
		
		// DHW
		E_DHW_Set_kWh = dHW_demand1.E_DHW / 3600000;
		
		// Solar thermal:
		STM_STVL_Set_degC = extractVolumeFlow3.TMedium - 273.15;
		PEH_ST_Set_kW = WolfCRK12.QSolarThermal / 1000;
		T_collector_degC = WolfCRK12.TCollector - 273.15;
		
		// weather
		Modeltime_s = modeltime_s.y;
		T_ambient_degC = environment1.TAmbient - 273.15;
		DirectRadiation_W_per_m2 = environment1.RadiationDirect;
		DiffuseRadiation_W_per_m2 = environment1.RadiationDiffuse;
		PV_P_gen = - grid2.P / 1000 * SF3_PV_PeakPower_kW / 10;
		
		// Ground Source Heat Pump
		STM_BCRLaM_Set_degC = extractVolumeFlow4.TMedium - 273.15;
		T_ground_degC = groundCollector1.TGround - 273.15;
		
		// Inputs
		var_STM_CCVL_K = STM_CCVL_degC +  273.15;
		var_SFW_HCRLbM_m3_per_s = SFW_HCRLbM_l_per_min / 60000;
		var_STM_HCVLaM_K = STM_HCVLaM_degC + 273.15;
		var_STM_STRL_K = STM_STRL_degC + 273.15;
		var_SFW_STVL_m3_per_s = SFW_STVL_l_per_min / 60000;
		var_STM_BCVL_K = STM_BCVL_degC + 273.15;
		var_SFW_BC_m3_per_s = SFW_BC_l_per_min / 60000;
	equation
		connect(dHW_demand1.EnvironmentConditions,environment1.EnvironmentConditions) annotation(Line(
			points={{89.7,-125},{94.7,-125},{135,-125},{135,5},{140,5}},
			color={192,192,192},
			thickness=0.0625));
		connect(extractVolumeFlow2.Pipe,dHW_demand1.ReturnHotWater) annotation(Line(
			points={{10,-150},{15,-150},{65,-150},{65,-135},{70,-135}},
			color={190,30,45},
			thickness=0.0625));
		connect(defineVolumeFlow2.Pipe,dHW_demand1.FlowHotWater) annotation(Line(
			points={{10,-125},{15,-125},{65,-125},{70,-125}},
			color={190,30,45}));
		connect(extractVolumeFlow1.Pipe,simpleHeatedBuilding1.PipeOut) annotation(Line(
			points={{10,-65},{15,-65},{65,-65},{65,-55},{70,-55}},
			color={190,30,45},
			thickness=0.0625));
		connect(defineVolumeFlow1.Pipe,simpleHeatedBuilding1.PipeIn) annotation(Line(
			points={{10,-40},{15,-40},{65,-40},{70,-40}},
			color={190,30,45}));
		connect(environment1.EnvironmentConditions,simpleHeatedBuilding1.EnvironmentConditions) annotation(Line(
			points={{140,5},{135,5},{95,5},{95,-25},{95,-30}},
			color={192,192,192},
			thickness=0.0625));
		connect(grid1.LVGridA,simpleHeatedBuilding1.Grid3) annotation(Line(
			points={{195,-85},{190,-85},{100,-85},{100,-75},{100,-70}},
			color={247,148,29},
			thickness=0.0625));
		connect(WolfCRK12.FlowST,extractVolumeFlow3.Pipe) annotation(Line(
			points={{60,-205},{55,-205},{15,-205},{10,-205}},
			color={190,30,45}));
		connect(defineVolumeFlow3.Pipe,WolfCRK12.ReturnST) annotation(Line(
			points={{10,-235},{15,-235},{55,-235},{55,-225},{60,-225}},
			color={190,30,45}));
		connect(WolfCRK12.EnvironmentConditions,environment1.EnvironmentConditions) annotation(Line(
			points={{100,-215},{105,-215},{135,-215},{135,5},{140,5}},
			color={192,192,192},
			thickness=0.0625));
		connect(dHW_demand1.TRef,dHW_demand1.TPipe) annotation(
			Line(
				points={{75,-120},{75,-110},{85,-110},{85,-120}},
				color={0,0,127},
				thickness=0.0625),
			__esi_AutoRoute=false);
		connect(dHW_demand1.TRef,defineVolumeFlow2.TMedium) annotation(
			Line(
				points={{75,-120},{75,-110},{-15,-110},{-15,-120},{-10,-120}},
				color={0,0,127},
				thickness=0.0625),
			__esi_AutoRoute=false);
		connect(dHW_demand1.qv_DHW,defineVolumeFlow2.qvMedium) annotation(
			Line(
				points={{80,-120},{80,-105},{-20,-105},{-20,-130},{-10,-130}},
				color={0,0,127},
				thickness=0.0625),
			__esi_AutoRoute=false);
		connect(SFW_STVL_m3_per_s.y,defineVolumeFlow3.qvMedium) annotation(Line(
			points={{-29,-255},{-24,-255},{-15,-255},{-15,-240},{-10,-240}},
			color={0,0,127},
			thickness=0.0625));
		connect(STM_STVL_K.y,defineVolumeFlow3.TMedium) annotation(Line(
			points={{-29,-230},{-24,-230},{-15,-230},{-10,-230}},
			color={0,0,127},
			thickness=0.0625));
		connect(STM_CCVL_K.y,dHW_demand1.TColdWater) annotation(Line(
			points={{-29,-175},{-24,-175},{85,-175},{85,-144.7},{85,-139.7}},
			color={0,0,127},
			thickness=0.0625));
		connect(STM_HCVLaM_K.y,defineVolumeFlow1.TMedium) annotation(Line(
			points={{-29,-15},{-24,-15},{-15,-15},{-15,-35},{-10,-35}},
			color={0,0,127},
			thickness=0.0625));
		connect(SFW_HCRLbM_m3_per_s.y,defineVolumeFlow1.qvMedium) annotation(Line(
			points={{-29,-45},{-24,-45},{-15,-45},{-10,-45}},
			color={0,0,127},
			thickness=0.0625));
		connect(SFW_BC_m3_per_s.y,defineVolumeFlow4.qvMedium) annotation(Line(
			points={{-29,-310},{-24,-310},{-10,-310},{-10,-290},{-5,-290}},
			color={0,0,127},
			thickness=0.0625));
		connect(STM_BCVL_K.y,defineVolumeFlow4.TMedium) annotation(Line(
			points={{-29,-280},{-24,-280},{-10,-280},{-5,-280}},
			color={0,0,127},
			thickness=0.0625));
		connect(extractVolumeFlow4.Pipe,groundCollector1.SourceOut) annotation(Line(
			points={{15,-325},{20,-325},{67.7,-325},{67.7,-330},{67.7,-335}},
			color={190,30,45},
			thickness=0.0625));
		connect(defineVolumeFlow4.Pipe,groundCollector1.SourceIn) annotation(Line(
			points={{15,-285},{20,-285},{77.3,-285},{77.3,-330},{77.3,-335}},
			color={190,30,45}));
		connect(groundCollector1.EnvironmentConditions,environment1.EnvironmentConditions) annotation(Line(
			points={{82.3,-355},{87.3,-355},{135,-355},{135,5},{140,5}},
			color={192,192,192},
			thickness=0.0625));
		connect(grid2.LVGridD,pV2ACInverter1.LVGrid3) annotation(Line(
			points={{-5,-415},{0,-415},{35,-415},{40,-415}},
			color={247,148,29},
			thickness=0.0625));
		connect(photovoltaic1.DC,pV2ACInverter1.DCPV) annotation(Line(
			points={{90,-415},{85,-415},{80,-415}},
			color={247,148,29},
			thickness=0.0625));
		connect(pV2ACInverter1.MPP,photovoltaic1.MPP) annotation(Line(
			points={{60,-435},{60,-440},{110,-440},{110,-435}},
			color={0,0,127},
			thickness=0.0625));
		connect(environment1.EnvironmentConditions,photovoltaic1.EnvironmentConditions) annotation(Line(
			points={{140,5},{135,5},{135,-415},{130,-415}},
			color={192,192,192},
			thickness=0.0625));
	annotation(
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
					left=285,
					top=45,
					right=510,
					bottom=330),
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
					left=510,
					top=45,
					right=645,
					bottom=105),
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
					left=645,
					top=45,
					right=855,
					bottom=105),
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
			projectName="SimX_SF3_PHIL",
			projectPath="C:\\Users\\gu62xur\\Downloads\\SimX_Veristand",
			projectType=17,
			saveOutputsApproach=1,
			inputs[0](
				port="STM_HCVLaM_degC",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			inputs[1](
				port="SFW_HCRLbM_l_per_min",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			inputs[2](
				port="STM_CCVL_degC",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			inputs[3](
				port="STM_STRL_degC",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			inputs[4](
				port="SFW_STVL_l_per_min",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			inputs[5](
				port="STM_BCVL_degC",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			inputs[6](
				port="SFW_BC_l_per_min",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[0](
				port="T_ground_degC",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[1](
				port="STM_HCVLaM_Set_degC",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[2](
				port="SFW_HCRLbM_Set_l_per_min",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[3](
				port="STM_HCRL_Set_degC",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[4](
				port="E_DHW_Set_kWh",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[5](
				port="P_elConsumption_kW",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[6](
				port="STM_STVL_Set_degC",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[7](
				port="PEH_ST_Set_kW",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[8](
				port="T_roomIs_degC",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[9](
				port="T_ambient_degC",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[10](
				port="T_collector_degC",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[11](
				port="Modeltime_s",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[12](
				port="DirectRadiation_W_per_m2",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[13](
				port="DiffuseRadiation_W_per_m2",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[14](
				port="STM_BCRLaM_Set_degC",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[15](
				port="T_roofIs_degC",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[16](
				port="T_cellarIs_degC",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[17](
				port="PV_P_gen",
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
				port="SF3_ST_CollectorType",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[14](
				port="SF3_ST_CollectorSurface_m2",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[15](
				port="SF3_ST_CollectorVolume_m3",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[16](
				port="SF3_GSHP_numberHE",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[17](
				port="SF3_GSHP_horizontalCollector",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[18](
				port="SF3_GSHP_CollectorDepth_m",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[19](
				port="SF3_GSHP_CollectorRadius_m",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[20](
				port="SF3_PV_PeakPower_kW",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			showAdditionalLibPage=false,
			useCodeOptimization=true,
			m_x64=false,
			solverMode=1,
			typename="CodeExportInfo"),
		Icon(
			coordinateSystem(extent={{-175,-200},{175,200}}),
			graphics={
							Bitmap(
								imageSource="iVBORw0KGgoAAAANSUhEUgAAADwAAAA8CAYAAAA6/NlyAAAABGdBTUEAALGPC/xhBQAAAAlwSFlz
AAAOvAAADrwBlbxySQAAACVJREFUaEPtwTEBAAAAwqD1T+1nCiAAAAAAAAAAAAAAAAAAgKsBOHwA
AQdXZHsAAAAASUVORK5CYII=",
								extent={{-100,-100},{100,100}}),
							Text(
								textString="SF3 HiL",
								extent={{-76.59999999999999,100.2},{80.09999999999999,33.5}}),
							Bitmap(
								imageSource="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
EUJd3f8B7chaQ/qC6bMAAAAASUVORK5CYII=",
								extent={{-76.8,-125},{79.90000000000001,53.3}})}),
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
			StopTime=5184000,
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
end SimX_SF3_PHIL;
