// CP: 65001
// SimulationX Version: 4.2.3.69223
within CoSES_Models.CodeExport.VeriStandHiL;
model SimX_SF1_PHIL "Power Hardware in the Loop model for SF1"
	output SignalBlocks.OutputPin STM_HCVLaM_Set_degC "Set temperature Heating Circuit after the mixing valve" annotation(
		Placement(
			transformation(extent={{250,-95},{260,-85}}),
			iconTransformation(
				origin={171,-75},
				extent={{-19.3,-20},{20.7,20}},
				rotation=180)),
		Dialog(
			tab="Output Signals",
			visible=false));
	output SignalBlocks.OutputPin SFW_HCRLbM_Set_l_per_min "SFW_HCRLbM_Set_l_per_min" annotation(
		Placement(
			transformation(extent={{250,-65},{260,-55}}),
			iconTransformation(
				origin={171,-125},
				extent={{-19.3,-20},{20.7,20}},
				rotation=180)),
		Dialog(
			tab="Output Signals",
			visible=false));
	output SignalBlocks.OutputPin STM_HCRL_Set_degC "STM_HCRL_Set_degC" annotation(
		Placement(
			transformation(extent={{250,-145},{260,-135}}),
			iconTransformation(
				origin={171,-25},
				extent={{-19.3,-20},{20.7,20}},
				rotation=180)),
		Dialog(
			tab="Output Signals",
			visible=false));
	output SignalBlocks.OutputPin E_DHW_Set_kWh "E_DHW_kWh" annotation(
		Placement(
			transformation(extent={{250,-160},{260,-150}}),
			iconTransformation(
				origin={75,-172},
				extent={{-20,-19.7},{20,20.3}},
				rotation=90)),
		Dialog(
			tab="Output Signals",
			visible=false));
	output SignalBlocks.OutputPin STM_STVL_Set_degC "STM_STVL_Set_degC" annotation(
		Placement(
			transformation(extent={{250,-220},{260,-210}}),
			iconTransformation(
				origin={-25,-172},
				extent={{-20,-19.7},{20,20.3}},
				rotation=90)),
		Dialog(
			tab="Output Signals",
			visible=false));
	output SignalBlocks.OutputPin PEH_ST_Set_kW "Thermal power of the solar thermal module" annotation(
		Placement(
			transformation(extent={{250,-235},{260,-225}}),
			iconTransformation(
				origin={-75,-172},
				extent={{-20,-19.7},{20,20.3}},
				rotation=90)),
		Dialog(
			tab="Output Signals",
			visible=false));
	output SignalBlocks.OutputPin P_elConsumption_kW "electric consumption of the house" annotation(
		Placement(
			transformation(extent={{250,-80},{260,-70}}),
			iconTransformation(
				origin={125,-172},
				extent={{-20,-19.7},{20,20.3}},
				rotation=90)),
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
				origin={171,25},
				extent={{-19.3,-20},{20.7,20}},
				rotation=180)),
		Dialog(
			tab="Output Signals",
			visible=false));
	output SignalBlocks.OutputPin T_roomIs_degC "T_roomIs_degC" annotation(
		Placement(
			transformation(extent={{250,-50},{260,-40}}),
			iconTransformation(
				origin={171,75},
				extent={{-19.3,-20},{20.7,20}},
				rotation=180)),
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
				origin={171,125},
				extent={{-19.3,-20},{20.7,20}},
				rotation=180)),
		Dialog(
			tab="Output Signals",
			visible=false));
	output SignalBlocks.OutputPin T_ambient_degC "Ambient temperature" annotation(
		Placement(
			transformation(extent={{250,30},{260,40}}),
			iconTransformation(
				origin={-75,175},
				extent={{-20,-20},{20,20}},
				rotation=270)),
		Dialog(
			tab="Output Signals",
			visible=false));
	output SignalBlocks.OutputPin T_collector_degC "Solar thermal collector temperature" annotation(
		Placement(
			transformation(extent={{250,-205},{260,-195}}),
			iconTransformation(
				origin={-125,-172},
				extent={{-20,-19.7},{20,20.3}},
				rotation=90)),
		Dialog(
			tab="Output Signals",
			visible=false));
	output SignalBlocks.OutputPin Modeltime_s "Model time in seconds" annotation(
		Placement(
			transformation(extent={{250,45},{260,55}}),
			iconTransformation(
				origin={-125,175},
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
				origin={25,175},
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
				origin={-25,175},
				extent={{-20,-20},{20,20}},
				rotation=270)),
		Dialog(
			tab="Output Signals",
			visible=false));
	input SignalBlocks.InputPin STM_HCVLaM_degC "Temperature Heating Circuit after the mixing valve" annotation(
		Placement(
			transformation(extent={{-100,-25},{-90,-15}}),
			iconTransformation(extent={{-195,105},{-155,145}})),
		Dialog(
			tab="Input Signals",
			visible=false));
	input SignalBlocks.InputPin SFW_HCRLbM_l_per_min "Flow Water Heating Circuit before mixing valve" annotation(
		Placement(
			transformation(extent={{-100,-45},{-90,-35}}),
			iconTransformation(extent={{-195,55},{-155,95}})),
		Dialog(
			tab="Input Signals",
			visible=false));
	input SignalBlocks.InputPin STM_STRL_degC "Return temperature Solar Thermal " annotation(
		Placement(
			transformation(extent={{-105,-235},{-95,-225}}),
			iconTransformation(extent={{-195,-45},{-155,-5}})),
		Dialog(
			tab="Input Signals",
			visible=false));
	input SignalBlocks.InputPin STM_CCVL_degC "Temperature Cooling Circuit" annotation(
		Placement(
			transformation(extent={{-105,-180},{-95,-170}}),
			iconTransformation(extent={{-195,5},{-155,45}})),
		Dialog(
			tab="Input Signals",
			visible=false));
	input SignalBlocks.InputPin SFW_STVL_l_per_min "Flow rate solar thermal" annotation(
		Placement(
			transformation(extent={{-105,-260},{-95,-250}}),
			iconTransformation(extent={{-195,-95},{-155,-55}})),
		Dialog(
			tab="Input Signals",
			visible=false));
	GreenCity.Interfaces.Thermal.DefineVolumeFlow defineVolumeFlow3 "Specifies a Thermal Volume Flow Connector" annotation(Placement(transformation(extent={{-10,-245},{10,-225}})));
	GreenCity.Interfaces.Thermal.ExtractVolumeFlow extractVolumeFlow3 annotation(Placement(transformation(
		origin={0,-201},
		extent={{-10,-6},{10,14}},
		rotation=-180)));
	Consumer.SimpleHeatedBuilding simpleHeatedBuilding1(
		vFCtrl_LivingZone(
			deltaTup=if self.ActivateNightTimeReduction then 0.01 else 0.1,
			deltaTlow=if self.ActivateNightTimeReduction then -0.01 else -0.1),
		redeclare replaceable parameter GreenCity.Utilities.BuildingData.ParameterSelectionSCB.AgeOfBuilding.To2001 buildingAge,
		nFloors=SF1_nFloors,
		nAp=SF1_nApartments,
		nPeople=SF1_nPeople,
		ALH=SF1_HeatedArea_m2,
		livingTZoneInit(displayUnit="K")=TLiving_Init+273.15,
		UseStandardHeatNorm=false,
		QHeatNormLivingArea=22,
		n=if SF1_HeatingSystem==0 then 1.3 else 1,
		TFlowHeatNorm(displayUnit="K")=if SF1_HeatingSystem==0 then 333.15 else 313.15,
		TReturnHeatNorm(displayUnit="K")=if SF1_HeatingSystem==0 then 318.15 else 303.15,
		TRef(displayUnit="K")=SF1_T_roomSet_degC + 273.15,
		roofTZoneInit(displayUnit="K")=TRoof_Init+273.15,
		cellarTZoneInit(displayUnit="K")=TCellar_Init+273.15,
		UseIndividualPresence=true,
		PresenceFile=File,
		UseIndividualElecConsumption=true,
		ElConsumptionFile=File,
		ElConsumptionFactor=ElFactor,
		ActivateNightTimeReduction=true,
		Tnight(displayUnit="K")=SF1_T_roomNightSet_degC + 273.15,
		NightTimeReductionStart(displayUnit="s")=SF1_NightTimeReductionStart_h * 3600,
		NightTimeReductionEnd(displayUnit="s")=SF1_NightTimeReductionEnd_h * 3600,
		ceilingInsul=0,
		wallInsul=0,
		ceilingInsA=0.8,
		wallInsA=0.6,
		floorInsA=0.8,
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
		CPC=SF1_ST_CollectorType==1,
		alphaModule(displayUnit="°"),
		betaModule(displayUnit="°"),
		nSeries=1,
		nParallel=1,
		AModule=SF1_ST_CollectorSurface_m2,
		VAbsorber(displayUnit="m³")=SF1_ST_CollectorVolume_m3,
		etaOptical(displayUnit="-")=if SF1_ST_CollectorType==1 then 64.2 else 81,
		a1=if SF1_ST_CollectorType==1 then 0.885 else 3.492,
		a2=if SF1_ST_CollectorType==1 then 0.001 else 0.016,
		CCollector=if SF1_ST_CollectorType==1 then 8416 else 5850) annotation(Placement(transformation(extent={{100,-235},{60,-195}})));
	Modelica.Blocks.Sources.RealExpression STM_HCVLaM_K(y=var_STM_HCVLaM_K) "Set output signal to a time varying Real expression" annotation(Placement(transformation(extent={{-50,-25},{-30,-5}})));
	Modelica.Blocks.Sources.RealExpression STM_CCVL_K(y=var_STM_CCVL_K) "Set output signal to a time varying Real expression" annotation(Placement(transformation(extent={{-50,-185},{-30,-165}})));
	Modelica.Blocks.Sources.RealExpression SFW_HCRLbM_m3_per_s(y=var_SFW_HCRLbM_m3_per_s) "Set output signal to a time varying Real expression" annotation(Placement(transformation(extent={{-50,-55},{-30,-35}})));
	Modelica.Blocks.Sources.RealExpression STM_STVL_K(y=var_STM_STRL_K) "Set output signal to a time varying Real expression" annotation(Placement(transformation(extent={{-50,-240},{-30,-220}})));
	Modelica.Blocks.Sources.RealExpression SFW_STVL_m3_per_s(y=var_SFW_STVL_m3_per_s) "Set output signal to a time varying Real expression" annotation(Placement(transformation(extent={{-50,-265},{-30,-245}})));
	Modelica.Blocks.Sources.RealExpression modeltime_s(y=time) annotation(Placement(transformation(extent={{90,45},{110,65}})));
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
	parameter String File=classDirectory()+"Data\\SF1_Typeday.txt" "File of all parameters of SF1 (weather, presence, Pel, DHW)" annotation(Dialog(tab="Parameters"));
	parameter Integer SF1_TypeDay=1 "1 - WSC, 2 - WSS, 3 - WWS, 4 - WWC, 5 - TWC, 6 - SSS, 7 - TWS, 8 - TSS, 9 - SWC, 10 - SSC, 11 - TSC, 12 - SWS, 13 - coldest" annotation(Dialog(tab="Parameters"));
	parameter Integer SF1_InitializationTime_h=1 "Additional time before the experiment in order to reach initial conditions for the experiment" annotation(Dialog(tab="Parameters"));
	parameter Integer InitTime=24-SF1_InitializationTime_h "Initial time of the day" annotation(Dialog(tab="Parameters"));
	parameter Integer InitDay=integer(mod(SF1_TypeDay*3-2, 31)) "InitialDay" annotation(Dialog(tab="Parameters"));
	parameter Integer InitMonth=integer((SF1_TypeDay*3-2)/31)+1 "Initial Month" annotation(Dialog(tab="Parameters"));
	parameter Real TLiving_Init=if SF1_TypeDay == 1 then 21
	elseif SF1_TypeDay == 2 then 21
	elseif SF1_TypeDay == 3 then 21
	elseif SF1_TypeDay == 4 then 21
	elseif SF1_TypeDay == 5 then 21
	elseif SF1_TypeDay == 6 then 21
	elseif SF1_TypeDay == 7 then 21
	elseif SF1_TypeDay == 8 then 21
	elseif SF1_TypeDay == 9 then 22.46
	elseif SF1_TypeDay == 10 then 23
	elseif SF1_TypeDay == 11 then 21.77
	elseif SF1_TypeDay == 12 then 22.99
	else 21 "Initial Temperature" annotation(Dialog(tab="Parameters"));
	parameter Real TRoof_Init=if SF1_TypeDay == 1 then 5.68
	elseif SF1_TypeDay == 2 then 4.52
	elseif SF1_TypeDay == 3 then 6.66
	elseif SF1_TypeDay == 4 then 6.11
	elseif SF1_TypeDay == 5 then 12.65
	elseif SF1_TypeDay == 6 then 14.17
	elseif SF1_TypeDay == 7 then 16.69
	elseif SF1_TypeDay == 8 then 11.78
	elseif SF1_TypeDay == 9 then 22.05
	elseif SF1_TypeDay == 10 then 22.88
	elseif SF1_TypeDay == 11 then 21.03
	elseif SF1_TypeDay == 12 then 23.83
	else 5.62 "Initial Temperature" annotation(Dialog(tab="Parameters"));
	parameter Real TCellar_Init=if SF1_TypeDay == 1 then 8.66
	elseif SF1_TypeDay == 2 then 8.42
	elseif SF1_TypeDay == 3 then 11.15
	elseif SF1_TypeDay == 4 then 10.56
	elseif SF1_TypeDay == 5 then 14.57
	elseif SF1_TypeDay == 6 then 11
	elseif SF1_TypeDay == 7 then 16.09
	elseif SF1_TypeDay == 8 then 9.78
	elseif SF1_TypeDay == 9 then 17.44
	elseif SF1_TypeDay == 10 then 16.61
	elseif SF1_TypeDay == 11 then 17.25
	elseif SF1_TypeDay == 12 then 18.15
	else 8.00 "Initial Temperature" annotation(Dialog(tab="Parameters"));
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
	parameter Real ElFactor=SF1_YearlyElecConsumption_kWh/5175 "ElFactor" annotation(Dialog(tab="Parameters"));
	parameter Real SF1_V_DHWperDay_l=300 "V_DHWperDay_l" annotation(Dialog(tab="Parameters"));
	parameter Real DHWFactor=SF1_V_DHWperDay_l/300 "Factor, with which the DHW demand gets multiplied" annotation(Dialog(tab="Parameters"));
	parameter Integer SF1_ST_CollectorType=0 "0 - Flat Plate Collector, 1 - Compound Parabolic Collector" annotation(Dialog(tab="Parameters"));
	parameter Real SF1_ST_CollectorSurface_m2=2 "ST_CollectorSurface_m2" annotation(Dialog(tab="Parameters"));
	parameter Real SF1_ST_CollectorVolume_m3=1.7 "ST_CollectorVolume_m3" annotation(Dialog(tab="Parameters"));
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
		
		// inputs
		var_STM_CCVL_K = STM_CCVL_degC +  273.15;
		var_SFW_HCRLbM_m3_per_s = SFW_HCRLbM_l_per_min / 60000;
		var_STM_HCVLaM_K = STM_HCVLaM_degC + 273.15;
		var_STM_STRL_K = STM_STRL_degC + 273.15;
		var_SFW_STVL_m3_per_s = SFW_STVL_l_per_min / 60000;
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
1 - WSS\\\\par
2 - WWS\\\\par
3 - WSC\\\\par
4 - WWC\\\\par
5 - TSS\\\\par
6 - TWS\\\\par
7 - TWC\\\\par
8 - TSC\\\\par
9 - SWC\\\\par
10 - SSC\\\\par
11 - SWS\\\\par
12 - SSS\\\\par
13 - coldest\\\\par
}
",
				border(
					left=5,
					top=5,
					right=5,
					bottom=5),
				position(
					left=285,
					top=30,
					right=510,
					bottom=345),
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
					top=30,
					right=645,
					bottom=90),
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
					top=30,
					right=855,
					bottom=90),
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
			projectName="SimX_SF1_PHIL",
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
				port="STM_STRL_degC",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			inputs[3](
				port="STM_CCVL_degC",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			inputs[4](
				port="SFW_STVL_l_per_min",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[0](
				port="STM_HCVLaM_Set_degC",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[1](
				port="SFW_HCRLbM_Set_l_per_min",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[2](
				port="STM_HCRL_Set_degC",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[3](
				port="E_DHW_Set_kWh",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[4](
				port="STM_STVL_Set_degC",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[5](
				port="PEH_ST_Set_kW",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[6](
				port="P_elConsumption_kW",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[7](
				port="T_cellarIs_degC",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[8](
				port="T_roomIs_degC",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[9](
				port="T_roofIs_degC",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[10](
				port="T_ambient_degC",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[11](
				port="T_collector_degC",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[12](
				port="Modeltime_s",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[13](
				port="DirectRadiation_W_per_m2",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[14](
				port="DiffuseRadiation_W_per_m2",
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
			showAdditionalLibPage=false,
			useCodeOptimization=true,
			m_x64=false,
			solverMode=1,
			typename="CodeExportInfo"),
		Icon(
			coordinateSystem(extent={{-175,-175},{175,175}}),
			graphics={
							Bitmap(
								imageSource="iVBORw0KGgoAAAANSUhEUgAAADwAAAA8CAYAAAA6/NlyAAAABGdBTUEAALGPC/xhBQAAAAlwSFlz
AAAOvAAADrwBlbxySQAAACVJREFUaEPtwTEBAAAAwqD1T+1nCiAAAAAAAAAAAAAAAAAAgKsBOHwA
AQdXZHsAAAAASUVORK5CYII=",
								extent={{-100,-100},{100,100}}),
							Bitmap(
								imageSource="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
/wE+rRa6sslftgAAAABJRU5ErkJggg==",
								extent={{-80.2,-92.5},{83.09999999999999,36.7}}),
							Text(
								textString="SF1 HiL",
								extent={{-76.59999999999999,100.2},{80.09999999999999,33.5}})}),
		Documentation(info="<HTML><HEAD>
<META http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\"> 
<TITLE>SimX models for SF1</TITLE> 
<STYLE type=\"text/css\">
table>tbody>tr:hover,th{background-color:#edf1f3}html{font-size:90%}body,table{font-size:1rem}body{font-family:'Open Sans',Arial,sans-serif;color:#465e70}h1,h2{margin:1em 0 .6em;font-weight:600}p{margin-top:.3em;margin-bottom:.2em}table{border-collapse:collapse;margin:1em 0;width:100%;}tr{border:1px solid #beccd3}td,th{padding:.3em 1em; border-width: 1px; border-style: solid; border-color: rgb(190, 204, 211);}td{word-break:break-word}tr:nth-child(even){background-color:#fafafa}th{font-family:'Open Sans Semibold',Arial,sans-serif;font-weight:700;text-align:left;word-break:keep-all}.lib-wrap{width:70%}@media screen and (max-width:800px){.lib-wrap{width:100%}}td p{margin:.2em}
</STYLE>
   
<META name=\"GENERATOR\" content=\"MSHTML 11.00.10570.1001\"></HEAD> 
<BODY>
<H1>Power Hardware in the Loop model for SF1</H1>
<HR>

<P>Power Hardware in the Loop&nbsp;model for house 1 of the CoSES laboratory. 
 The&nbsp;models and standard parameters are the same as for the&nbsp;simulation 
 model of&nbsp;SF1. </P>
<P>The model consits of the following parts:</P>
<UL>
  <LI>Weather:<BR>Outputs:<BR>&nbsp;&nbsp;&nbsp;&nbsp; Ambient temperature:     
  T_ambient_degC<BR>&nbsp;&nbsp;&nbsp;&nbsp; Direct solar radiation:     
  DirectRadiation_W_per_m2<BR>&nbsp;&nbsp;&nbsp;&nbsp; Diffuse solar radiation:  
     DiffuseRadiation_W_per_m2<BR>&nbsp;&nbsp;&nbsp;&nbsp; Internal model time:  
     Modeltime_s<BR>Parameters:<BR>&nbsp;&nbsp;&nbsp;&nbsp;     
  Typeday<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Season:     
  Winter - Transission -     
  Summer<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Presence:     
  Saturday/Sunday/Holiday -     
  Weekday<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Radiation:   
    Cloudy - Sunny<BR><BR></LI>
  <LI>Heating system:<BR>Inputs:<BR>&nbsp; &nbsp;&nbsp; Actual flow rate of the  
     heating circuit pump: SFW_HCRLbM_l_per_min<BR>&nbsp;&nbsp;&nbsp;&nbsp; 
  Actual     temperature of the supply line of the heating circuit:     
  STM_HCVLaM_degC<BR>Outputs:<BR>&nbsp;&nbsp;&nbsp;&nbsp; Set flow rate for     
  heating circuit pump: SFW_HCRLbM_Set_l_per_min<BR>&nbsp;&nbsp;&nbsp;&nbsp; Set 
      temperature for the supply line of the heating circuit:     
  STM_HCVLaM_Set_degC<BR>&nbsp;&nbsp;&nbsp;&nbsp; Set temperature for the return 
      line of the heating circuit: STM_HCRL_Set_degC<BR>&nbsp;&nbsp;&nbsp;&nbsp; 
      Current&nbsp;indoor&nbsp;temperatures: T_roomIs_degC, T_roofIs_degC,     
  T_cellarIs_degC<BR>&nbsp;&nbsp;&nbsp;&nbsp; Electric power of the house:     
  P_elConsumption_kW<BR>Parameters:<BR>&nbsp;&nbsp;&nbsp;&nbsp; Set room     
  temperature in °C<BR>&nbsp;&nbsp;&nbsp;&nbsp; Heated area in     
  m²<BR>&nbsp;&nbsp;&nbsp;&nbsp; Heating     
  system:<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0 - Radiator 
      Heating<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1 - 
  Space     Heating<BR>&nbsp;&nbsp;&nbsp;&nbsp; Number of     
  apartments<BR>&nbsp;&nbsp;&nbsp;&nbsp; Number of     
  floors<BR>&nbsp;&nbsp;&nbsp;&nbsp; Start time for night time temperature     
  reduction (hour, e.g. 23)<BR>&nbsp;&nbsp;&nbsp;&nbsp; End time for night time  
     temperature reduction (hour, e.g. 7)<BR>&nbsp;&nbsp;&nbsp;&nbsp; Set room   
    temperature during night time reduction in °C<BR>&nbsp;&nbsp;&nbsp;&nbsp;    
   Yearly electric consumption<BR><BR></LI>
  <LI>Domestic Hot Water Consumption:<BR>Inputs:<BR>&nbsp;&nbsp;&nbsp;&nbsp;     
  Actual temperature of the return line of the domestic hot water circuit:     
  STM_CCVL_degC<BR>Outputs:<BR>&nbsp;&nbsp;&nbsp;&nbsp; Cumulative energy of the 
      domestic hot water consumption:     
  E_DHW_kWh<BR>Parameters:<BR>&nbsp;&nbsp;&nbsp;&nbsp; Daily domestic hot water  
     consumption of the whole house: V_DHWperDay_l<BR><BR></LI>
  <LI>Solar Thermal Unit:<BR>Inputs:<BR>&nbsp;&nbsp;&nbsp;&nbsp; Actual     
  temperature of the return line of the solar thermal unit:     
  STM_STRL_degC<BR>&nbsp;&nbsp;&nbsp;&nbsp; Actual flow rate of the solar     
  thermal unit: SFW_STVL_l_per_min<BR>Outputs:<BR>&nbsp;&nbsp;&nbsp;&nbsp; Set   
    temperature of the supply line of the solar thermal unit:     
  STM_STVL_Set_degC<BR>&nbsp;&nbsp;&nbsp;&nbsp; Set power of the solar thermal   
    unit: PEH_ST_Set_kW<BR>Parameters:<BR>&nbsp;&nbsp;&nbsp;&nbsp; Collector     
  surface in m²<BR>&nbsp;&nbsp;&nbsp;&nbsp; Volume of the heating medium within  
     the collector in m³<BR>&nbsp;&nbsp;&nbsp;&nbsp; Collector     
  type:<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0 - Flat Plate 
      Collector<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1 -    
   Compound Parabolic Collector</LI></UL>
<DIV class=\"lib-wrap\">
<TABLE class=\"type\">
  <TBODY>
  <TR>
    <TH>Symbol:</TH>
    <TD colspan=\"3\"><IMG width=\"349\" height=\"332\" src=\"data:image/png;base64,
iVBORw0KGgoAAAANSUhEUgAAAV0AAAFMCAYAAABoAm+JAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAAEnQAABJ0Ad5mH3gAADMrSURBVHhe7Z151CZFfe/JufkjekwuKNfEcSHGkxyXaLw3nmiiJHqDBBO9ctSAyBU8wgATZRl4BZRVQBEQXAAZhhdZRQZkE0QQmHfefZ0NUBRRBhfQiyjux43frV91dXd1dXVX79vz/ZxTZ955umvpfqo/z++prq5nJwIASCbGdqKddoqmvcZ3qK0AVAOkC0aCHeNjlObPHeN7QbCgESBdMBK4pCvCXBqbUH8DUCOQLhgJskS65tAChhdAHUC6YCRwRroANASkC0aCMtKFsEGVQLpgMPAQQR3jspAuqBJIFwyHHeO0Vw3WhXRBlUC6YDDUdTMM0gVVAukC4ADSBVUC6YJBETxVJocZdtD4XntlEmZd48EAmEC6YDhMjKmhhAka8w0avOagpvFgAEwgXTAYwmg1v3TxcARoCkgXDAeOVvcapx2BdLMPLwDQFJAuGBYistUj1TwjBkXHgwHIA6QLAFNmPBiAHEC6YFCYa+JmlWaZ8WAA8gDpguHAQwuR8QQeIsg4xIDxYNAQkC4YDNa5tnmiVZa2FiVnkjUAOYF0wYDQhgYUE2OIVkG3gHTBYEiaa+snV8RbdDwYgDxAugAwZcaDAcgBpAtGAteiNaXHgwHICKQLRgL3SmEYDwbNAOmCkSBLpKuP55oJES+oCkgXjARYExd0BUgXjARlpAthgyqBdEHv8YcG6pppAOmCKoF0wWCIzrMdo6ocDOmCKoF0wUCZoLGKboJBuqBKIF0wMLyHGvyIt4pZB5AuqBJIF/Se6HSvfHNr6x4PBsAE0gUDIBxKKDqWW9d4MAAmkC4YGLqARZJr5OaluvFgAEwgXTBQwrHd7OKsfjwYABNIFwyG6BBBtrHdMuPBABQB0gW9p9zNsPLjwQDkAdIFI0G2aV9VjAcDkA6kC0aCfHNti4wHA5ANSBeMBC7pFhkPBqAIkC4YCZKki4cjQNNAumAkKPMob5m8AJhAugA4gHRBlUC6oBuk/Agkj7dm+/pvzD5QqezNMEgXVAmkCzoBj60mijXjr/KmllECSBdUCaQLukGaWLP+FPqOcRqrwY6QLqgSSBd0BG9ubEyuQrhZnxSLPtJb3fACAFUC6YJOEZ0vK1JjT4XVMx4MgAmkC4CgrvFgAEwgXdApkoYIOGWJOmORclaT1jQeDIAJpAu6hZDfXoYoJ8a8Md2JsfTHc1nYpphtr9nAeDBoCkgXdArr13x/9oJrFoNle1bpAtAUkC7oFjxbwbh5Fjwc4ZKuoPDwAgANAemCzhH7qq/Emf3JtGJA2KAJIF0ABLZhCAxNgDqAdEHnCCJOGWnyQxNpN9B4fq23PRYhq5RJnBgPBg0B6YJuEchPyNT/ep9hLLcKMLwAmgDSBZ2Co0vPdc1LF4AmgHRBt+B5unL2gi9d1/BCSChsDQgbdAxIF3QPIUr9a777W7593QQ/JeevaDwYgBxAumAwWCNdADoGpAs6QVKk6SdEnGAoQLqgW6SsveDGPsyQRdgYDwZNAemCTlFGfpxX7qeJ2/2rD0XHgwEoBqQLugXfREtae8FBKGwhUr+MHMKGYEETQLqgexizFzI/pBBMN/Mk6uXPNt0MgKaAdAGQFB8PBiAPkC7oDXX+Km+x8WAA8gPpgt5gl2A1DziUGQ8GIA+QLugNtUaeGA8GDQHpgt6QJN2kCNdPiFZBl4B0QW9wRrqlHqwAoBkgXTAYwnFZjdRx2WrGgwHIA6QLOkV+cWrw/N6CD1YA0BSQLugI9nmyfsoszpwPVmA8GDQNpAs6hTXSbQKMB4OGgHQBEJQa1gAgB5Au6BhlHsctkRfjwaAhIF3QKcoML3BeKdiij/LmHA8GoAiQLugWQphjBb/Sh8LGo7ygu0C6oFOwOCPRpkqZxIlHeUEPgHQBkJQZSwYgO5Au6Bx8A0tKT44V7KDxvUpEqxmHF0qPBwOQEUgXdItAkiLy9G9kOcXJYvajU39urYpcjRkJSWA8GDQFpAs6RUR+WaUb2c75xoRwcz7YgPFg0BCQLugWgfx86bqHF0JRe0yMQZagu0C6oHuIyNW/kcVJF6qNuHQrenwXwwugBiBd0HvC4QB7qns8GIA8QLpgtKliPBiAHEC6oANwZOmNwyZFrVm/5uedbobxYNA0kC4YDkHU6t+E01+zU9t4MAAJQLqgcwTRas4oNxRoPunqdZkpa90AZAXSBd1CSDK6upd3oyvyUhIFppsB0DSQLugU5td9iSNajcDS1iLVTLIGoEEgXdAxtKEBRRM3t0rLHoCMQLqgE7Q3tsozJ+x1ckKkDKoG0gWDgcUdyJnHd1mcGR9wsEa6ANQApAsGQyhOvoGmpn5lHSKw7IffSAN1AOmCzmFOGeOUbXghHCrw988qTozpgqaAdEGnaO1rvra0o0eOqWoA5ADSBd1CRJetiU7UnT+6BiAfkC7oHEWHFzhKNvNlzQtAU0C6oFOwOKuUZJ7fOQtkL0NtPM0G6gHSBd2i6uGFrDfDgv2yr9sAQBEgXdApygwR2PNmWzUsvIEH6YJ6gXRB7/GFGYqzAFgsBzQEpAt6TyXSZURkq0fJpcoCIAFIF3QM+1oI6V/z7Xn8hCEC0CUgXdApOFqVkuSv+yrUdM1A8CNcfpihqGBLR8kAZATSBZ0ilJ+IXv0nxBw3tPw8pcSpSR6AOoF0QbfQHsdliXpDBK4bWuWHF8K68ucFIA+QLhgMpSJdABoC0gW9Ic/TZQB0FUgX9Aa7dHlowRt+yD9EUCYvAMWAdEFvQKQLhgCkC3oDpAuGAKQLOkGWm2Dp0vUWHS82NFAmLwD5gHRBJyg388CbMmbml+O0zkLL5AUgP5Au6ASlpJvy8ISz3DJ5ASgApAs6gYwsta/3Zkr7up8qx4xPs1lx5AWgCJAu6ARlokpIF/QJSBd0grLStUXHfnJJ15bHT5AuqBpIF3SCMtIFoE9AugAA0CCQLgAANAikC1rh4YeJdt6ZaH5evZCDtvICUAWQLmiFiQnR+UTvu+wy9UIO2soLQBVAuqAVIF0wqkC6oBUgXTCqQLqgFSBdMKrkkm50Ijkv/hxfnUkmOeHSW0jENrncK2dM7JEE5zW2a7+d5WNObOdqJ8bii5fwk0Vhm9Lq1SnTfgNL2/NgO86+A+mCUSW7dB3iYDFEBeVJKy4nX9TlpMtyta4CFQg2ZGLM/2HD/NIt1n6DEtJNPM6es3WrJ7+bblIv5KCtvABUQXbpssxyS3eMxsXrEWfI59nHHfJzSDdVYmZe8f9gX0u58jWWqJfCY/D2LdZ+73wEkanYP9JePpd+narwyP5j6lyXkDUAoJtkl65ARl0JP4edJN2JWITK+W3y04mKMEiqnHhdUfQhhui+jnq5rcH2Eu2PlOO1J/jAipWnpGzZf8JxnACA/pFLuh5KiJo4mETp8l/+13sWjrShQ1q27ZqsXNIVFaoIkocC9A8Je71cXih3f3vx9sfap31LiNYVJtv+kC4Aw6OAdD30aJJJk64vwTBPurSs2/UIUZOYHZXfiCqt5QaClv/Rtmt/52y/S7qmSBP3dx4nAKBvNCNdoQ158ykQSLq0rNsjAlXl6Q0Qgor+V0SPIspNbpNHpN0suWB7ifZHyuH/ann5OMy8ifu7jxMA0C/y3UjTvxIbV366dAUif7jdIS3b9ljUqoSU0B6vvfrQAsPlanlkHdprY0JoQb1l2s+7h/UEN8bUNj5X0TZY9g+Ox3GcAIBeUTjSBfUho/TopwUAYCC0LF0z8uybbCpqvxxy0MpBNAvAYEGk22P23BNPVgHQNyDdHiOCYnrGM4h23RXyBaAvQLo9hqXrJ8i3e/BC6bzWg5l+/Wu1AxhJIN0eo0vXT3/8x0SveY3aAbQGr+1ge384rV6tdgIjiegCoK+YFzNHu+94h/eTNKBdOJo980yiU06JJ150B4wuO42NRR9ykPNbI/Nh0+akWrbF5tOa81L1p7q0O/auOi3lhnhl2WYOeHWnzalNO742cbdLHLJMkC0A/WE
n86EGb5K+drE7ZZcuR1medQpUNG90bqq73Ci8v9Fuif9ggfm6jltuXQWy7TPGQy9+amK6oP+gU+RhoIKkXpdu7AHZsNkpetK4I4xFljM0pRzFIUenKLW83BGCM55cLi8C471B8YVsKltGUie1XoHfgTmFJ03mGecPHNvx69v9fEE5fvmqXbH6044F9JH0a6xqPNl7XdXR97Og+meR1icHZMNGfDn1RCsPnU+gLwB1MsIFwG3wm6bEoSf1JuQRNr8B4fm3dAZumyg7KI/bGLzZUUH5NWZfRjJle1q9sfrUMag8if0psp3rF+dM7RyeM+2YtPqj3wjAEMgkXdXXIh/k+ge+2YcTtknRqdejAYkeeadcDwJur18G1orOj5Cu90bw+eGTE4hAnpACwtJOZnpnUrLx34xIIenleuj7hH9XsoykTkq9emfykzxeV4eKbNcjDwF3Wr3dZlnBdjAU0q8TBfcD/TqR/w/7reyL/sa0bZH+Fu3LmT7MjbKlxP3+afRV6RWsFR1DSte/kMOolt8Y8feEOGHBm2XDIiz9xHO5ujAiaHmNN8tZrkTfR/s7OJZ4x7Lj2J5Sb2JHjeUxiGyHdEedzNLV+kE8T1q/1Pu4XbqyfF3qCcTK1q5x3mYGIUEg4qP2h3T55PMyiOabKl5LfxP0N1NhEUpEEuKkx95wQfTNTChXvIF+UfINDurR91d1WrfZcGxPq1dus+SNnAMLlnMUnCJId+SI9v0EjH4QzxP247Rt0f4W7/syErX1aUWsbEO65nEk7q/lGzWUdL03InJypFDSxnMZi7BiwlES9D/5QrsYec3OoOXh/VS5wc2nSF6jLPGGhsdiaWMEx/bUenmz/umutsXOgUFkO6Q76thkFcPsB/x/rS/Kfuj3i7Rtkf5m7/vht0QL3P+0PP5wgWyXUa8kcX/lBb0isW9ivQNCSRckYnZ2ACqmkHQZKTT1gZ95m126keDB0d+9aNhLWCs6Pxmly2+OdnJEcnaSzuE6hoTtpaU7hHMHQDWwgEe9/yPS7TF7YmnHAdKVD+mK2iGHHLRyRiSaTQPS7TGiD3dvdTH9a21wT8D4GilS9NrzLvDk65Hzx+8vRL+W62XY9wegC0C6PUY4JkidkG/sRsoEjUvzJUvQG+8bo9gaIBGySFenG9LF0o7ABqTbY3Tp+qnVpR05yrWa0y1Blu+QpIulHUESoguAvmJezO0vgON9xY+LsAnpct1+lN2+dLG0I0iicelGp5TwhcEXSDjWFyR5BSZdxH45+ldZO9H6ohe2bZv14g8iOP3CzkEF085sbRX/yNSt1cbC9zM8j+Z7HBeiW7p6/jB1VboAJNGsdB3yYbFEBetJNy5X/yJMF6AcL0y4khO3Wb4ih49HtyPdpLZ2e2lH773zmu2WoFu68fzR/tI36fp92EjJJ6FhCvZ1nRL9Pi1Y6jvNSpeFllu6Y8WWbEx7w1M7g9nZxP+DfbN3RL3TZFmJiYnkGcJqTMEHGKSbRrzfd4HsfT2Rgn03LVgaAo0PL8gTmvB4cZJ0zUdhsyzZmNaRXZ1cF0DyhZ0Ct1fbTx6z3/7Ysai6EvL0amEQIVn9WuFzB+m6cfVHieo3ZZd2jJTD2/ikB/vq58w8n5ayLMj3XNUbCTb09qg3OrLvCC352Lh0PfgNFSfbOLnxzhe+8XmXbEzryM5Ozh3EKov0On1i5XN56lj1juYn3jcpT79WY9IvTpGC99ctweqlq7VDneOu4uyPjPxQ1s6R/H/YF2W/8jc6t/nlqOtQbUs6n5naxxj1BsEGv65d6/K9HuElH1uSrod5ocXfXO1CUiIM8zgEqIkuRto2iSrb6CzOOhWx4zCka+tUiXmcbQV9J5PUjL6Ydq2kbYuW4304Bdcg97XwP9E8uvATSOrDLFL9A9D6Qajt6zwXPac/0lUdJBSQS4Bqf70C8cZ6/03b5sFt46Utk9uTAncgbT//U1yWJDuwpYzEPO62gn7TeekqZJ+09V1FmnTN40vadxSCjOZvpOmfdoY5UjsLI/KH27MIUAnLWl/aNoFsq/mVluvU8qTU73VQL2VZiYmJ5Qna5Ggr6DXxfm/BkK78v9Z3ZJ/y+4VrW1BOPuky3EcTu5+8Zoz+zHUZ7ZEk7ev3db0SsW9inT2k1UgXJMOd0HkhgkFQSLqMFJf6IM66rYB0I0GCWY9BLHBQ+0fKUOXG9g3qHnaQMQDpmtFnk7KqsG4ZDWhlDayjAZDGKAUZiHR7zJ4dWNrxqaeeUn9Vy1VXXSVTXdTV7vK0GURkpYI2jnCQAen2GNFXW19drGp5/eEPf6BTTz2VjjrqKJlOO+20WgTZXemCoQPp9hiWrp/akm+V8nr00UfpkEMOkdLdvn07bdu2jU455RQ69NBD6fEf/5gevOpauu/z16m9y9GEdLG0I7AB6fYYXbp+anppx6rktbS0RO985ztp/fr1UrjT09My8d/rLr6YDlx9MF3+vqPo/F1W0dTpH1O5ilO3dLG0I0hCdAHQV8yLuY0FcKqQ1/XXX0/77LMP3XLLLbR161aampoKpMt/82s333wzHbDmULpg7Hi6+Pkvphv3PYB+/5vfqBLyU7d0sbQjSKI16UankPB8WGOaiJ/kALs3cG8brPfKMeYAGhSpK3gtMkWGt6XXZcU23ScH0faHU3zEnzK1udpYWXmdffbZ9N73vlcKdnl5OSJcXbz+tsOOXktnHHs8XfH3r6PL/v619OSO76iS8lG3dAFIoh3pOiTEkokK1hehKTxfnikiLFRXWF50Kkvz0pVzGRPu7HZhacei8nryySfpyCOPpGOPPZY2b95C8/PzQrBx4eqJ91lZWaEPffjDdMwxY3TNW/6TLlj1Inr4nklVanbal27aB39Z9H5apM8W7Oc6Jfp8UpAxFNqRLk/CLiDCQks8FqwrKC9hwrgLveNkWdoxsn+PVlwqIq8HHniA3v3uA+gTn/gkbdv+NZqemafJaU5LVtnqaWZmhrZv20afvOACOuSIw+nqg9fQ+c98Li1fsE6Vno0uRbrxPlgWvZ8WEWiRPAYF+25akDEUWhte8J5Gsa88lShC443MssQjU6gu/38ib9gHMnZGbqdRRiD+2DEoKVv278PiH3nldeedd9K++76TNlx7tZDnFtoyNU73T32cNk9dSVunx2nT9LKQ6yTNzM7Rlq1b5Y20leUlmp2bE4LeLv/P6VsPfZOu3XAtved9/0WXHH0sXfScF9KX1xxJv//tb1VN6fRSupYPa+trkX5q/q32FSmoU/XJcNlIPY8ekYd91EYkcMCyjom0Jl0P1QmME50mwrxLPIbkqUt1EO4QkYKz1RUrkzudqlfvbHqy7T806a5bt44OOODd9JW7N9H2lY30tcnT6fH519Ovl1fRL1deSI8vvEFI+HKaml2meSHej512Mh1yyKF0/vrL6I7bbqL3HXYoHXnUWjri8PfTkcccT3NLW+juu75Cq486ks794Al06YtfSTe+ff9MbeqddOUHuRE42D7AZefU+2lCn5Xlqdfl33pfD/NkahujlycIAg1bG0d4WUemZel6hJ3Fwy5C9SaxkMTO9g7mJlddRofJWlesTEO6ZsdK3F/L11WyyOtXv/oVHX/88fJhh8XFJVpYWKBtUxfSkwuvJLpfdMGHRPqmSNt2om/PvJ++tm2CVu/777TbS19NJ37wA/Ta3f+Zzj3/Ijr5+GPoebs+nV74CvH6qWfQXRPTMgrmsd5jTvgQHXPIYfSNW25TtabTN+km9Rv7h7feT6N9NponQz+PCdlOUh9mkert81PSvq7zMAT6J13RNeTXnaCTZBOhT766zO0Z6+JOpO3HdQbtNSICSeL+6lj1Bot9XRdAk7jktWPHDjk74cwzz5QPO8zOztLk1ALdN30e/XbzLkTf3omeeviP6Kkdf0T0jZ3oJ/Ovoq9tuZ0+cNj/pVW7/SW9fb/96KTTP0obZxZox0Nfpze99iX0tjUfooe/9RDNzHgzG7jMrVu20EfO+hi97+i19L3vfU/VnsxQpGvPp/dT7W/uZ0Hn0V7PEFzIPmm8phNrS4pIk/YdlbWj25Eun1z9k8+wSLwzGZ1A5A+3xztIhLJ1KfF52X
ibVlZKvV4n9ZK+2hLDdZplxPYP2mnc5Tba3zZp8mIh8gMPl19+uRSudzNsRqb7p86hXy7v5klXCFdK9+s70RMLr6PtU+vo1tu+RJdftp6OW7uGVj3zv9Pq4z5CD339ftrjNX9Db3nv0fJmmnmTjcd6L7nkEtpPiJoftkijb9IVO8U/rG2vSfQ+HP4dqUdeF2qfDNJluI8mdj+9PPlf0Ve5zIEFGVXQiUgXROFO6LwIO0KSvK644gp617veRbfffjttEVGoPv92anqeFqZuox8v/gPRdtEFhWw5PbX9v9G3Zo+m5aUttPce/0hvePO76LOXXEgvecFf0EHHnEHf+sb99E8vX0V77P9+ulcIVheuLFfUwQ9S3HrrrVL2GzZsUK2J0zvpCiIf1spEtg9w0YOs0vX+9vMLmfmvp0g3Un5knzixwEHtb2tjbN/ArN0OMqpgQNLVOpRK9YurojplNKCV06OOZsrrd7/7nVykhtdLmJubkxGnLlwpx+k5mpu+g7ZNXUQPzxxGP5h9M/1s6WX0/YW305bpy2l+fpbuvO1mWnPwe2nvvfemD556Jk3PLdLK4jydfNwRdPp5Fwkx26eXcV1cJ/998MEH01lnnaVaFqVL0h11+hRkVAEi3R6zZ8eWduQFa1i2J598soxuWbqmFL00RZPTCzQ7vVGO7/J0seWp62jz9NU0Mb1NiJMfhFiQQxKctm7dQrMzM1KoK5u30srSYkzkZuKba5s3b5Y38I444gh64oknVCs9uivdNoKHPFTQvh4HGVUA6fYY0V87s7Tj4uIiHXbYYXIdBRYuP8Rgk6GepqZnVZqXaXJ6UbyeLtM8idvAww3XXHMNrVmzhu69917ZVgaRLmgLSLfHsHT91JZ8f//739ONN94opfbd735XPt57zz33WCXYRpqYmKBf/OIX9M1vfpNWr14tx3uZJqSLpR2BDUi3x+jS9VPTSzvy+CmPm/5amYSniG3cuNEqwDYSS5c/DBj+QDjppJPowQcfrF26WNoRJCG6AOgr5sXcxgI4vzGWV3zkkUdalO6MHK7QX2PpmvN2+WZf3dLF0o4giUzSjU758B9FNAfUx2hszJjHx/PxEqai2IjXY0wf8ZOohO94xsbfuT75Yno9IVn3awN328SpkKlLSzumSXdpcYYWF6ZpcXGaZmd5TDe+T9E0JYQ7Nz1By1O3R8Rrky6DMV3QFm7pxubw+cSlwNLU72R6c/G0fRLLEqRtE5hlh4INCdZlyCAsjy5L100Xl3a0SZefHJucnKLPXr6JPn/tJF1+5RR96XYhyblwn7JpYmaF7tt4GX3njhNoYnYlfL3j0s0TaHj91T5bwCsnrS9b+rrlmou2xw9svHqD13MEUjrxY1UbrPB5cO1j4HBIGvbjrge3dGPRqo/rTeSTNhZZjpEPLHF6SWI9HvG8Zv3i/0H+rB3BsZ86nvD5caMTcJv9Nyo8SJknXLHJgr6Pnzcoy/jgiLUhy3E1Rzbp8nSvTXTKGXfTSR+epBNPnaCbb5mhlZVwn+JpiiZnFmlqdpF+ecNe9IMvHkITc1uD7Z2WbuR6iWPv87Y+4Is6rW9Y+rpRvwySrLaJ5o3Oq3VcQz6OY43TnHSTj7seMg0veBGreQL8DqCSbLQnWtl8PgG+TNQBhZGoHXs9HjZh8/7+uYpuz9gRXPvxMYhjC8rVPxgsHdY7BV4ev11WIvuo86gyhMeh2ma0gesxz0ObpEl3YcFLK8szdN31M3Tx+KwQ7hyd+6lpuuKqWbpmA4uX104oPtQwOTNH00LqP/zC/kSffT7d/5WLaOPs5mB7p6VbMNAotK6035/U/yR6Hzb6cxQjr3ZNW8u1kXasvI2vgeA68D9EvJTW3/kc+fv1ZTnJTNL14JMrGhw00H6yffnwAXrHKvaTeTK+OXI/vR6PeAcUBG+++amYp66U/WJvSLi//gb6SbYvy5sY2cfrYKpfaMek6jLLC7Z3gyTp8tDBlZ+bow3XTdK69Rvp/M8sSLleevkMfX7DnBxy+Og583T4MYtyqGG+0FDDDE2KCPexa/Yl+vTT6Ykr3kgT81tpZm5eipj36frwQr5Aw94nsq0rzduj/VUmVY71+gqIlq0HO+a2NKzHGjsWv+wMkS7nNdplE6kss0PLSeaQrkd4UhJOtpJCGNWqkzchDjqHLMJ6POydQrXBFFNS22I49kspN7GTxvJYiOwzPOlOCOmyYNetn6MPfGieLrl0mrZumabbvzxDb3vXHN14E0e/UyLanaP3H71IV149S8uLNqmmp6mZeZrbdBf9/NyX0W9Pfxb99OOvoJW7b6QdXziBFibuENtne3Ijjd/rUIA+idLlv3KvK23ZrvUtt3RZmF6Kdj9XvSaqLK3eyIeASF473NKNtZmvDVFuOBRnK1eh7Zt83PVQvXT5dXGydFHIkyNey+OKbNL19uOyo9uydgTHftwpxZvlt0N2EP+45DZLXlOSNiL7DFO6LMWrr5ml/zpqka65do7u3TZFt942S+9bu0Qbrp+hbVunaPyzm+jYE+aldJcKSXeWpmbn6PGPvpF+dtL/pCfOeD395gO70S9P+FtauudWEQUv9ES6Hu4+r/VX1Q/c16OPZbvet5SE7P1Wyxvr36567fjtTrquveuiuHTNMpP2bWM5yWw30vRPjKBXJJ1sTyKRA+Q3KuErVEBiPR6Jb47MZ5bNbdPKSuwUjg6jOlhww8vYl9sUqyPWKS1E9hmmdHl44YKL5uisj8/TZy6eozvu5DVvp+immyflDTSOej90ygIdsHqJbrx5Ro792sSanmZocmGZvn/yvvT9U/ajr37uAvrF6pfTzw56Ga3cci1Nzi8NV7qq34TCcPRl23ZLP4z0LdHXvP9G80bb5arXTnCs3AZrfrd05bWg5eUy5fmwlZm0b+px10PuSHekMIUHYtiky2O6PGb7lbtmaOOEJ9hzzpuhi9ZP0+VXztD4ZbN09nlzYr8Z2rRphmasQs2WpuYXaOULn6MHTzqclm+6jr568Xn0vX13p8XrrqSpxY5LV4pAXPB+Mq70dOkKRP7s8nNJl1ECirXHzOvt523mbVqepDakHKs1eNFetwZbCilPlbcvy0m2IF3zTUo/qdXgqjNhe2nptnGszWKX7gStbN5C9923ne67dxttXpmjyal5uuKqbfTpC+Zo3fiiiHa30NLSHN17b/hjk8sZVg/zE+83p1Yi2/rAN2jb9BRNTU7R8r1fpXuFaLdtv5e2b9sqXttE3/1uPyJd0Bws4LauRUS6PWbPji3tyDzyyHdoYX6OLjzvDNp77zfT/getoVvv3EQ3fW49Hbn2KFrevkIbv3Q1rVlzBN1www106Hv2F/u9ld62z340fs0NtLS4YJWsmeYXFmny7i/T4WveQ29561vphI99Woh8mU774FpR1r70VvHa+9ceR1++ayM99tijqnUhw5Vu2x/0ddRfQZlyyEEro+ZoNg1It8eIvtOZpR19Hv/RE/SJU9fSs5/zAjr1zLNpn712p3/5j/3p3FOPpp13fSHN3fcQ3TB+Nu2883Ppwgs/Rbv8ydPoAx8+h4488O206oWvpK9ML9L8XPqykPzz7Mvzk/Rv//RK+sc930bnfPQUetELdqMzz19Pb3j5X9Gr9/hP+swnz6BnPv1pdNK5l9JPfxJdS5dBpAvaAtLtMSxdP7UlX1NeP/nRY/TalzyP9j74WPr2ww/T5uVlml9cpAs/ehz9ydP+lP75DXvQP7zyZfQ/nvdSumT9Z+gFz/5zOlFEqWsP2of+/Pl/m0m6iytb6PpLz6Vddt6Vrr9zlr7+tftpbnaGFuen6I2vegnt9jd/R29507/Sc1b9NX12w230o//3Q9W6kCaki6UdgQ1It8fo0vVT00s7xqT7xA/odS99Lv3b/ofTd773KE3ddSud9pGz6KyT1tJfCAledu1NdO4pR9Oq57+Y1q+/iJ73zD+j171hT9r7HfvQuiuvo6UlXsjcLls/LS5vphsu+yT96TP+jK6+bZIe+faDtO5T59C6Sy6lf/1fL6G9D1xLC3Ob6HWv+Gv6PwespZ///KeqdSF1SxdLO4IkRBcAfcW8mNtYAMeU1w8f/xFd/
PGTadWq59JhRx5N//Kql9Jr/30/+sRpx9DOu/4Vzd3/LbpRDS+cf/4n6FnP2IWu+uIEPfSNB2hlOduNtJmZWVpZnKF93rQ7vfw1r6e1hx9Gu+7yLDr7M+P0v//uRfSyV+9Bp516Av3lc55N7znqNPrZz55UrQupW7pY2hEkAen2mDZl62PKa8eOR2hhYZE2XHUJrT7oQBo78TSaW9pMX7zuSjrx5NNpam6J7vji9XTSyafRLbfcRCefeBJ98ct309xsdB3ctMRinp2bp8W5afrIqcfRgQcdROuuuJa2b9tMnzr7DDrs0EPowAPfQ6ef/SnaJAT96PcxewF0B0i3x3RxaUf+5Yi77rpLzi7g6VxbNm+m6alJmpmdpy1bNtPkpgmaFiLkv3n1Mfl7atNTtGnTJpqcnMyceH9eJIenpnE9Swvz8rWl5ZXgBy03ryzTxnvuCX45Qqcr0o3OJ+WHAYw5o36Sd9u9u/i2O/deOQlzZCWc19humRIZbY83F5enV8Vu9vO826BNafXqlGm/7VypDVb4PLr2MSgxRdR23pKAdMFI0gnpOi5yvpCjgvKnTply8kVdTrry4QGbLQLBhuRfu5op0f7cQmxOuonnLQFIF5SC5dXX1Doss9zSHWt/aUf+f7CvpVz5GkvUS+ExePsWan/aueJtfn2y4Oi3BVtk7aNHqE0tDQnpAtAi3qOp9ogsSbrNL+3otdMXZXRfR73c1mB7mfZ7bRjC0pCQLgCto4SoXehMonT5r0aXdhRw5BdEkbrM7PVyeaHc/e1l2u/D+4XnKlqPl7zjcEs3dswqmq57aUhIF4COEEZpHmnS9SUY5nFJy7Jdj+iURJL1ofIbUaC13EDQ8j/adu3v3O2P4udL/rAoJ12zzKR9iywNCekC0BFySVdKRURgwQXvkpZle0Sgqjy9AUIo0f+KaE+ILLlNHpF2s5SC7WXaHyU4V3wM1nxu6Ubb5pUp22MrM2nfDOfNBNIFoC3khSwuWD8ZV2q6dAUif7jdJS3L9ljUqgSS0B6vvabIuFwtj6xDe21MCCiot0T7U84Vn6dwW1iG/3r0HEaR8lR5m1oaEtIFAICcsIDTZJ4GpAvAoDAjz+JyaIc62l9BmXLIQSvDEc2mAekCAECDQLoA1ASWdgQ2IF0AagBLO4IkRBcAAFQNlnYESUC6AADQIJAuAC0SnQ/qz4E177aP0dhY9MEJOW81Msc2bZ6rZVtsjq7ZFr8+oy2uOi3lhnhl2WYOeHUntd/Dfq6SyPBwhK39DQDpAtAWiYKKy4CFo8vKm6iv7eOUXbocZXnWaVDRvNH5qe5yo/D+Rrsl/sMF5usaqeXagHQBACaxaNXHJTMWylhkiURTylEc5TlFqeXlNgdyTi43XDRGF5+3f3eWdrS0Xyf1WASxegUqzzh/iJntVdsgXQBaxItYzYiMZaAu5uCC9kQrL22+ePk1TYDhouI2jPL8pKSQR9jcXt8v5jYJt02UHZQXkaXaX8nHr7G1pR1t7ddJO5akelWe8BxpqG2QLgCtwxd/KMEkGfgXNkvSu6jFfjKPS1iW7Zo03NJVko7JJL1cD32f8O8uLO3orDPlWBLrjeXRUNsgXQA6QhilJchARbZhVKvEMuGLKwlLebocItGoiZY3RUIBqftofwfH4jjmBPQPIPsHRv3StdYby6OhtkG6AHQEt4DE60Ik+kUtL37xWqpzbeVF5MCCEtGaXoiQoq0tUdkklCuiPr8oGREG9ej7qzqt29wE50rWZ8tXkXSTjiWp3sh5NVDbIF0A2oKjPe3raSi9JBl4oopEWPLiLyCXmByUBJ1t8fbzNvM2LQ/vp8qVN5L812Q+xihLHH+qwHUSzxUfiv5VPyzDf90eCTOOOlOPJaHe2HnVUNsg3RHngQeIdt+d6LHH1As5QF4waNIEWgJId8S57DLRCUQv4IVY8oK8XcOMPNOivK5SxzG4ykzYXkq6yXWKLgRGGYgzO2XyAuAjuhAYZSDO7JTJC4CP6EJglIE4s1MmLwA+oguBUQbizE6ZvAD4iC4ERpnPf94TCf/KQV6QF4D8iC4ERp0yEgnzqru1Oe72VlNvftpqMwAMpDtYWCjhZG5+goenrWhzyi3wxPeEyeJZp8/wfiwylbJN96mgXkF0srqfEsrVKdRmAIoB6Q4WIV1fVsGTPylyk2h5Yrjy2glFWHe9aWXkI1ubASgGpDtgYvJwRo1pgssp3chjm6581dQ7MZajfTZytRmAYkC6IIoUjykcFp/razcPZ/jCEil9HCNOVfXGUpo8S7YZgAJAuiOJkE2aYIwxTk5ZfKSPqRYaFy1YbxlKtxmAnEC6I4lDuhWgy6xeeapotYLx3ObaDEYZSHckcUnX+NodSTnHOoNx0iz5StRb5QyEXG0GIB+Q7kjijnRjv7klpDbGL7Dc0vKaQwQ5w8XC9RrEbiKmUbLNAOQB0h1JMkS6sa/r/iyCpNkEKkot9TW/SL0GuWYgVNFmAPIB6Q6ZIIJT0SMLKVMU580aiOzKZUk5ueRnE3pGYRaqV4nTT5mOz6RMmwHIB6Q7WEJp7BgfU1/Z84jEkJkv7kCCyXhf7TXRi/zZx1jz11vFDIRybQYgO5DuYBHyUpIqJt2yKHk6BF015WYgtNNmMFpAugMm/JlqJd3MwwuC3EMTZoRqpoyyz11vAipaTa+3ojYDkANId9BwZKtJJHMEV3Zooigl6g1krVIRUQPQAJAusFDX0IQo1xUt565XRau1DQm42gxAPiBdYKXU0EQiboEVr9dWdhMfFADkA9IdMuZXbpmySoiFpeWrJJLMIrDi9dYzAwHSBdUC6Q4WIYvavnIXpQmBiToq+5BgIF1QLZDuYBER41he8ShhJaa6vqqXqbetNgNQDEh3yJQYXkhcA6Fm2qoXgKaAdAcLR4BFozyRN/b1POtNqbbypuGOVs2HKvJ8QAGQB0h3sBQZXvBh0SWtgZCMXVwqZRpjLVavG5d0bbIHoB4g3cEiRGKTX+bozRNgmM/42p9IWYEVrTcNd6Rb+vfVAMgIpAuqJxhL1qZvOaRXLxki3UDyeoKIQfVAuiAnLoFxpOrJqtmn2dIokxeAaoF0B4YcV5WCqSt6cwlMbFfDC92RLgDdAdIFOXHLr51HiEPZh+SQfTAk4qcqxpIBiAPpgpxkiTiNm2GVzAxIrrf8rAlRduwbgO01AMoD6Q6WkpFfIlmkWweuem3HmxXbeYF0QT1AugOkksivkui0YcrMmsDwAmgISHewlBNn7HHcIgQiyxox2tqcNToP96v2Bh4A1QLpAgv81VqP+vyUJjDOo4laCtff3/0BUGV0DumCLgPpDo4kYfqpLgnpYmXZ6ZFyVvm55ZxG3lkT9U+vAyAOpAsqQ49WI4uHs/yyyrTMuKyUuybNEgIHoC4g3SHTuxtLYUSMIQIwVCDdwVJGYPx129zP9lpeRBmp0g+HF5qVblhvCGQP6gHSHSxlBGbbrwnpij2qeJotx6yJ8jfwAMgHpDtgSgmsluEFt3RFxUL4Wr1O8fGHgdY22W5ftuEHTzpZ9wOgPJDuoMkrsLrJIt286MLk49U/HLJG9oLYh0zZqB4AO5AuqIgs0WId0mVflp01YcpakDkvAPmAdAeHEFskYjNTlgjOJlBX1JhFujnIMS5bniLHC0AxIN0BU+SXdYvfWCojXf6gKDsum4YowxFhhzcbFdyGGqJyACDdwVImeisiOhanRdRByholm1/1q4g4XdIt03YA8gHpDhaWVdFf1rWIzpm3iKhDKnmaLRGXdAFoDkh30HjiDSM2Y7ghEZtAXRFnOenWC6QLugOkC6z4c3wDnBFn3dItI84MeeU4sv4BxQnDCqB6IF2QgBklty2gJHGK17l9pYRf9wcGACGQ7pCJRW9ZhxcqIqi/CmE7olXjWCPjwk7EB8wYpAuaAdIdLBwBmrKzvZZAIDElaucjxFx2u9O+dMIbc3mPV09VfFgAEAXSHSy2G19ZpRvmzb5Yji5W3rfpaV8K/nDILc2s5wWA8kC6QyYWveWfvZBnhbJ6p30lwcLUjjFHNBwijg3DC6AhIF1gpZIlFiuhhOwzY4g7SIh+QfVAuiABlp0moEoi
1YxDBBHyDU2YjzG38jkBQAqQ7uBIitr81Gb0liTdGtocjO0iWgXdAtIdIko4xb5q10mRSDcj5vh1rnqSpA9hg+qBdAdM8FU789BA3VGyI9ItJGSVt/IbdUltBaAckO4oYM65bQ2HyIIhgbbbyeQbSwYgK5DuiJA/6m0T7Saes70q0k1MWcRpL6N7wzNgCEC6A4enfmUXSBmBVSE/C5En29zwhwtGBUCXgXQHSSjAtgRUVn7+h0XeyBzSBV0H0h0cNUWcOSkkv2BMt/iHRTHp8jkLz4svfMgb1AGkC+wUfoTYI5f8RF2yjgosV1i6fkQtxO8NxeBGGqgHSBdYiEZ+HrbXksknP016ueF26R8OZsrWZm5vZH/+0OnFTUfQNyBdYMEW5bmkW0Z+ZaQLQL+AdIGdksML+agmWgWgD0C6oANUEOlqN+GKiDocXiheBgBZgHSBBcvwgnOMMyrO6Jiu66ZUOelKYcbyc/Scf/1gAOoG0gUWbBLKJ87mpJtWdvZyJ8bS2gdAdUC6wErZn2DPJ90ypIk1a72ijNjQAoYXQD1AuiABFlYeASWJy085BRbcyMtQb2npAtAckC7oACxsbfxVCteXZZpUmYplD0DNQLogJ0JySU896NPMUkVpoouVo1P9BlhD0WqjU+TAKAPpgpwkSdeQJY8BJ8nZgj5lK7IimnMsOQspHxQSjpZNsdteA6A8kC7ISZLAxOsROQoJd+ZnzV3StUXTkC6oB0gX5KQt6brEmUaGvBheAA0B6QINU5w2UqQbkZaZykaNNUsXgIaAdIFGFum2BaQLhgGkCzSGKt0kUmZG8HBDZ88F6DOQLtAQYrMODfipzRtLSdKNflBU9/ixKy8AxYB0gUaahLpKGemmbYd0QT1AukCjLemKeq2RtZ+yR6u513yQS0Ka+3A+/AQ7qAdIF2i0GOmq9XDzi66MsBWx6WL4UUpQH5Au6BTBk2m9G+YAIBuQLugmQfSJhxTAsIB0QWepP+qtYGgCgJxAuqBz8ALqLD3cyAJDBNIFHSGMOlu5iWUOZ+RcJQ2ArEC6oAO0/TU/nFq2Y3xMjSFjni6oB0gXdIAWp6pJwvohXVA3kC7oAG1Ll0cTvGGNQLoYXgA1AemCDtC+dL3IVhvSaL09YKhAuqADtD2mC0BzQLqgA3Qh0k1CtA3DDKBCIF3QASBdMDpAuqADQLpgVCD6/xHK5W5qpJAOAAAAAElFTkSuQmCC\"></TD></TR>
  <TR>
    <TH>Identifier:</TH>
    <TD colspan=\"3\">CoSES_Models.CodeExport.VeriStandHiL.SimX_SF1_PHIL</TD></TR>
  <TR>
    <TH>Version:</TH>
    <TD colspan=\"3\">1.0</TD></TR>
  <TR>
    <TH>File:</TH>
    <TD colspan=\"3\">SimX_SF1.mo</TD></TR>
  <TR>
    <TH>Connectors:</TH>
    <TD>Set temperature Heating Circuit after the mixing valve</TD>
    <TD>STM_HCVLaM_Set_degC</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>SFW_HCRLbM_Set_l_per_min</TD>
    <TD>SFW_HCRLbM_Set_l_per_min</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>STM_HCRL_Set_degC</TD>
    <TD>STM_HCRL_Set_degC</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>E_DHW_kWh</TD>
    <TD>E_DHW_Set_kWh</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>STM_STVL_Set_degC</TD>
    <TD>STM_STVL_Set_degC</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Thermal power of the solar thermal module</TD>
    <TD>PEH_ST_Set_kW</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>electric consumption of the house</TD>
    <TD>P_elConsumption_kW</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Cellar temperature</TD>
    <TD>T_cellarIs_degC</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>T_roomIs_degC</TD>
    <TD>T_roomIs_degC</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Roof temperature</TD>
    <TD>T_roofIs_degC</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Ambient temperature</TD>
    <TD>T_ambient_degC</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Solar thermal collector temperature</TD>
    <TD>T_collector_degC</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Model time in seconds</TD>
    <TD>Modeltime_s</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Direct radiation</TD>
    <TD>DirectRadiation_W_per_m2</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Diffuse radiation</TD>
    <TD>DiffuseRadiation_W_per_m2</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Temperature Heating Circuit after the mixing valve</TD>
    <TD>STM_HCVLaM_degC</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Flow Water Heating Circuit before mixing valve</TD>
    <TD>SFW_HCRLbM_l_per_min</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Return temperature Solar Thermal </TD>
    <TD>STM_STRL_degC</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Temperature Cooling Circuit</TD>
    <TD>STM_CCVL_degC</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Flow rate solar thermal</TD>
    <TD>SFW_STVL_l_per_min</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>Parameters:</TH>
    <TD>Specifies a Thermal Volume Flow Connector</TD>
    <TD>defineVolumeFlow3</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Extracts the characteristics of a Thermal Volume Flow Connector</TD>
    <TD>extractVolumeFlow3</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heated 3-zone-building with changeable heating system</TD>
    <TD>simpleHeatedBuilding1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Electrical power grid for connection of maximum six 3-phase AC         
          components</TD>
    <TD>grid1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Environment with user defined weather profiles</TD>
    <TD>environment1</TD>
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
    <TD>DHW_demand</TD>
    <TD>dHW_demand1</TD>
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
    <TD>Solar Thermal</TD>
    <TD>WolfCRK12</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Set output signal to a time varying Real expression</TD>
    <TD>STM_HCVLaM_K</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Set output signal to a time varying Real expression</TD>
    <TD>STM_CCVL_K</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Set output signal to a time varying Real expression</TD>
    <TD>SFW_HCRLbM_m3_per_s</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Set output signal to a time varying Real expression</TD>
    <TD>STM_STVL_K</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Set output signal to a time varying Real expression</TD>
    <TD>SFW_STVL_m3_per_s</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Set output signal to a time varying Real expression</TD>
    <TD>modeltime_s</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>File of all parameters of SF1 (weather, presence, Pel, DHW)</TD>
    <TD>File</TD>
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
    <TD>ElFactor</TD>
    <TD>ElFactor</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>V_DHWperDay_l</TD>
    <TD>V_DHWperDay_l</TD>
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
    <TH>Results:</TH>
    <TD>Set temperature Heating Circuit after the mixing valve</TD>
    <TD>STM_HCVLaM_Set_degC</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>SFW_HCRLbM_Set_l_per_min</TD>
    <TD>SFW_HCRLbM_Set_l_per_min</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>STM_HCRL_Set_degC</TD>
    <TD>STM_HCRL_Set_degC</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>E_DHW_kWh</TD>
    <TD>E_DHW_Set_kWh</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>STM_STVL_Set_degC</TD>
    <TD>STM_STVL_Set_degC</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Thermal power of the solar thermal module</TD>
    <TD>PEH_ST_Set_kW</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>electric consumption of the house</TD>
    <TD>P_elConsumption_kW</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Cellar temperature</TD>
    <TD>T_cellarIs_degC</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>T_roomIs_degC</TD>
    <TD>T_roomIs_degC</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Roof temperature</TD>
    <TD>T_roofIs_degC</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Ambient temperature</TD>
    <TD>T_ambient_degC</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Solar thermal collector temperature</TD>
    <TD>T_collector_degC</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Model time in seconds</TD>
    <TD>Modeltime_s</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Direct radiation</TD>
    <TD>DirectRadiation_W_per_m2</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Diffuse radiation</TD>
    <TD>DiffuseRadiation_W_per_m2</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Variable</TD>
    <TD>var_STM_CCVL_K</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Variable</TD>
    <TD>var_STM_HCVLaM_K</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Variable</TD>
    <TD>var_SFW_HCRLbM_m3_per_s</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Variable</TD>
    <TD>var_STM_STRL_K</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Variable</TD>
    <TD>var_SFW_STVL_m3_per_s</TD>
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
end SimX_SF1_PHIL;
