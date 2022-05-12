// CP: 65001
// SimulationX Version: 4.2.3.69223
within CoSES_Models.CodeExport.VeriStandHiL;
model SimX_MF5_PHIL "Power Hardware in the Loop model for MF5"
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
			transformation(extent={{250,10},{260,20}}),
			iconTransformation(
				origin={-75,175},
				extent={{-20,-20},{20,20}},
				rotation=270)),
		Dialog(
			tab="Output Signals",
			visible=false));
	output SignalBlocks.OutputPin Modeltime_s "Model time in seconds" annotation(
		Placement(
			transformation(extent={{250,25},{260,35}}),
			iconTransformation(
				origin={-125,175},
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
	input SignalBlocks.InputPin STM_CCVL_degC "Temperature Cooling Circuit" annotation(
		Placement(
			transformation(extent={{-105,-180},{-95,-170}}),
			iconTransformation(extent={{-195,5},{-155,45}})),
		Dialog(
			tab="Input Signals",
			visible=false));
	Consumer.SimpleHeatedBuilding simpleHeatedBuilding1(
		vFCtrl_LivingZone(
			deltaTup=if self.ActivateNightTimeReduction then 0.01 else 0.1,
			deltaTlow=if self.ActivateNightTimeReduction then -0.01 else -0.1),
		redeclare replaceable parameter GreenCity.Utilities.BuildingData.ParameterSelectionSCB.AgeOfBuilding.To2001 buildingAge,
		nFloors=nFloors,
		nAp=nApartments,
		nPeople=nPeople,
		ALH=HeatedArea_m2,
		livingTZoneInit(displayUnit="K")=TLiving_Init+273.15,
		UseStandardHeatNorm=false,
		QHeatNormLivingArea=22,
		n=if HeatingSystem==0 then 1.3 else 1,
		TFlowHeatNorm(displayUnit="K")=if HeatingSystem==0 then 333.15 else 313.15,
		TReturnHeatNorm(displayUnit="K")=if HeatingSystem==0 then 318.15 else 303.15,
		TRef(displayUnit="K")=T_roomSet_degC + 273.15,
		qvMaxLivingZone=0.0005,
		roofTZoneInit(displayUnit="K")=self.TRoof_Init+273.15,
		cellarTZoneInit(displayUnit="K")=self.TCellar_Init+273.15,
		UseIndividualPresence=true,
		PresenceFile=File,
		UseIndividualElecConsumption=true,
		ElConsumptionFile=File,
		ElConsumptionFactor=ElFactor,
		ActivateNightTimeReduction=true,
		Tnight(displayUnit="K")=T_roomNightSet_degC + 273.15,
		NightTimeReductionStart(displayUnit="s")=NightTimeReductionStart_h * 3600,
		NightTimeReductionEnd(displayUnit="s")=NightTimeReductionEnd_h * 3600,
		ceilingInsul=0,
		wallInsul=0,
		ceilingInsA=0.8,
		wallInsA=0.6,
		floorInsA=0.8,
		TZone(displayUnit="°C")) "Heated 3-zone-building with changeable heating system" annotation(Placement(transformation(extent={{70,-70},{110,-30}})));
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
	Modelica.Blocks.Sources.RealExpression STM_HCVLaM_K(y=var_STM_HCVLaM_K) "Set output signal to a time varying Real expression" annotation(Placement(transformation(extent={{-50,-25},{-30,-5}})));
	Modelica.Blocks.Sources.RealExpression STM_CCVL_K(y=var_STM_CCVL_K) "Set output signal to a time varying Real expression" annotation(Placement(transformation(extent={{-50,-185},{-30,-165}})));
	Modelica.Blocks.Sources.RealExpression SFW_HCRLbM_m3_per_s(y=var_SFW_HCRLbM_m3_per_s) "Set output signal to a time varying Real expression" annotation(Placement(transformation(extent={{-50,-55},{-30,-35}})));
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
	parameter String File=classDirectory()+"Data\\MF5_Typeday.txt" "File of all parameters of MF5 (weather, presence, Pel, DHW)" annotation(Dialog(tab="Parameters"));
	parameter Integer TypeDay=1 "1 - WSC, 2 - WSS, 3 - WWS, 4 - WWC, 5 - TWC, 6 - SSS, 7 - TWS, 8 - TSS, 9 - SWC, 10 - SSC, 11 - TSC, 12 - SWS, 13 - coldest" annotation(Dialog(tab="Parameters"));
	parameter Integer InitializationTime_h=1 "Additional time before the experiment in order to reach initial conditions for the experiment" annotation(Dialog(tab="Parameters"));
	parameter Integer InitTime=24-InitializationTime_h "Initial time of the day" annotation(Dialog(tab="Parameters"));
	parameter Integer InitDay=integer(mod(TypeDay*3-2, 31)) "InitialDay" annotation(Dialog(tab="Parameters"));
	parameter Integer InitMonth=integer((TypeDay*3-2)/31)+1 "Initial Month" annotation(Dialog(tab="Parameters"));
	parameter Real TLiving_Init=if TypeDay == 1 then 21
	elseif TypeDay == 2 then 21
	elseif TypeDay == 3 then 21
	elseif TypeDay == 4 then 21
	elseif TypeDay == 5 then 21
	elseif TypeDay == 6 then 21
	elseif TypeDay == 7 then 21
	elseif TypeDay == 8 then 21
	elseif TypeDay == 9 then 22.46
	elseif TypeDay == 10 then 23
	elseif TypeDay == 11 then 21.77
	elseif TypeDay == 12 then 22.99
	else 21 "Initial Temperature" annotation(Dialog(tab="Parameters"));
	parameter Real TRoof_Init=if TypeDay == 1 then 5.68
	elseif TypeDay == 2 then 4.52
	elseif TypeDay == 3 then 6.66
	elseif TypeDay == 4 then 6.11
	elseif TypeDay == 5 then 12.65
	elseif TypeDay == 6 then 14.17
	elseif TypeDay == 7 then 16.69
	elseif TypeDay == 8 then 11.78
	elseif TypeDay == 9 then 22.05
	elseif TypeDay == 10 then 22.88
	elseif TypeDay == 11 then 21.03
	elseif TypeDay == 12 then 23.83
	else 5.62 "Initial Temperature" annotation(Dialog(tab="Parameters"));
	parameter Real TCellar_Init=if TypeDay == 1 then 8.66
	elseif TypeDay == 2 then 8.42
	elseif TypeDay == 3 then 11.15
	elseif TypeDay == 4 then 10.56
	elseif TypeDay == 5 then 14.57
	elseif TypeDay == 6 then 11
	elseif TypeDay == 7 then 16.09
	elseif TypeDay == 8 then 9.78
	elseif TypeDay == 9 then 17.44
	elseif TypeDay == 10 then 16.61
	elseif TypeDay == 11 then 17.25
	elseif TypeDay == 12 then 18.15
	else 8.00 "Initial Temperature" annotation(Dialog(tab="Parameters"));
	parameter Real T_roomSet_degC=21 "T_roomSet_degC" annotation(Dialog(tab="Parameters"));
	parameter Real T_roomNightSet_degC=21 "T_roomNightSet_degC" annotation(Dialog(tab="Parameters"));
	parameter Real NightTimeReductionStart_h=23 "NightTimeReductionStart_h" annotation(Dialog(tab="Parameters"));
	parameter Real NightTimeReductionEnd_h=7 "NightTimeReductionEnd_h" annotation(Dialog(tab="Parameters"));
	parameter Integer HeatingSystem=0 "0 - Radiator Heating, 1 - Space Heating" annotation(Dialog(tab="Parameters"));
	parameter Integer nPeople=16 "nPeople" annotation(Dialog(tab="Parameters"));
	parameter Integer nFloors=3 "nFloors" annotation(Dialog(tab="Parameters"));
	parameter Integer nApartments=4 "nApartments" annotation(Dialog(tab="Parameters"));
	parameter Real HeatedArea_m2=800 "HeatedArea_m2" annotation(Dialog(tab="Parameters"));
	parameter Real YearlyElecConsumption_kWh=18000 "YearlyElecConsumption_kWh" annotation(Dialog(tab="Parameters"));
	parameter Real ElFactor=YearlyElecConsumption_kWh/10536 "ElFactor" annotation(Dialog(tab="Parameters"));
	parameter Real V_DHWperDay_l=800 "V_DHWperDay_l" annotation(Dialog(tab="Parameters"));
	parameter Real DHWFactor=V_DHWperDay_l/800 "Factor, with which the DHW demand gets multiplied" annotation(Dialog(tab="Parameters"));
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
		
		// weather
		Modeltime_s = modeltime_s.y;
		T_ambient_degC = environment1.TAmbient - 273.15;
		
		// inputs
		var_STM_CCVL_K = STM_CCVL_degC +  273.15;
		var_SFW_HCRLbM_m3_per_s = SFW_HCRLbM_l_per_min / 60000;
		var_STM_HCVLaM_K = STM_HCVLaM_degC + 273.15;
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
			projectName="SimX_MF5_PHIL",
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
				port="P_elConsumption_kW",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[5](
				port="T_cellarIs_degC",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[6](
				port="T_roomIs_degC",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[7](
				port="T_roofIs_degC",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[8](
				port="T_ambient_degC",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[9](
				port="Modeltime_s",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[0](
				port="TypeDay",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[1](
				port="InitializationTime_h",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[2](
				port="T_roomSet_degC",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[3](
				port="T_roomNightSet_degC",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[4](
				port="NightTimeReductionStart_h",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[5](
				port="NightTimeReductionEnd_h",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[6](
				port="HeatingSystem",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[7](
				port="nPeople",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[8](
				port="nFloors",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[9](
				port="nApartments",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[10](
				port="HeatedArea_m2",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[11](
				port="YearlyElecConsumption_kWh",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[12](
				port="V_DHWperDay_l",
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
							Text(
								textString="MF5 HiL",
								extent={{-76.59999999999999,100.2},{80.09999999999999,33.5}}),
							Bitmap(
								imageSource="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",
								extent={{-96.2,-132.6},{105.5,35.1}})}),
		Documentation(info="<HTML><HEAD>
<META http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\"> 
<TITLE>Power Hardware in the Loop model for MF5</TITLE> 
<STYLE type=\"text/css\">
table>tbody>tr:hover,th{background-color:#edf1f3}html{font-size:90%}body,table{font-size:1rem}body{font-family:'Open Sans',Arial,sans-serif;color:#465e70}h1,h2{margin:1em 0 .6em;font-weight:600}p{margin-top:.3em;margin-bottom:.2em}table{border-collapse:collapse;margin:1em 0;width:100%;}tr{border:1px solid #beccd3}td,th{padding:.3em 1em; border-width: 1px; border-style: solid; border-color: rgb(190, 204, 211);}td{word-break:break-word}tr:nth-child(even){background-color:#fafafa}th{font-family:'Open Sans Semibold',Arial,sans-serif;font-weight:700;text-align:left;word-break:keep-all}.lib-wrap{width:70%}@media screen and (max-width:800px){.lib-wrap{width:100%}}td p{margin:.2em}
</STYLE>
 
<META name=\"GENERATOR\" content=\"MSHTML 11.00.10570.1001\"></HEAD> 
<BODY>
<H1>Power Hardware in the Loop model for MF5</H1>
<HR>

<P>Power Hardware in the Loop&nbsp;model for house 5 of the CoSES laboratory.  
The&nbsp;models and standard parameters are the same as for the&nbsp;simulation  
model of&nbsp;MF5. </P>
<P>The model consits of the following parts:</P>
<UL>
  <LI>Weather:<BR>Outputs:<BR>&nbsp;&nbsp;&nbsp;&nbsp; Ambient temperature:      
   T_ambient_degC<BR>&nbsp;&nbsp;&nbsp;&nbsp; Internal model time:       
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
   heating circuit pump: SFW_HCRLbM_Set_l_per_min<BR>&nbsp;&nbsp;&nbsp;&nbsp; 
  Set       temperature for the supply line of the heating circuit:       
  STM_HCVLaM_Set_degC<BR>&nbsp;&nbsp;&nbsp;&nbsp; Set temperature for the return 
        line of the heating circuit: 
  STM_HCRL_Set_degC<BR>&nbsp;&nbsp;&nbsp;&nbsp;       
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
        temperature during night time reduction in 
  °C<BR>&nbsp;&nbsp;&nbsp;&nbsp;       Yearly electric consumption<BR><BR></LI>
  <LI>Domestic Hot Water Consumption:<BR>Inputs:<BR>&nbsp;&nbsp;&nbsp;&nbsp;     
    Actual temperature of the return line of the domestic hot water circuit:     
    STM_CCVL_degC<BR>Outputs:<BR>&nbsp;&nbsp;&nbsp;&nbsp; Cumulative energy of 
  the       domestic hot water consumption:       
  E_DHW_kWh<BR>Parameters:<BR>&nbsp;&nbsp;&nbsp;&nbsp; Daily domestic hot water  
       consumption of the whole house: V_DHWperDay_l</LI></UL>
<P><BR></P>
<DIV class=\"lib-wrap\">
<TABLE class=\"type\">
  <TBODY>
  <TR>
    <TH>Symbol:</TH>
    <TD colspan=\"3\"><IMG width=\"349\" height=\"284\" src=\"data:image/png;base64,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\"></TD></TR>
  <TR>
    <TH>Identifier:</TH>
    <TD colspan=\"3\">CoSES_Models.CodeExport.VeriStandHiL.SimX_MF5_PHIL</TD></TR>
  <TR>
    <TH>Version:</TH>
    <TD colspan=\"3\">1.0</TD></TR>
  <TR>
    <TH>File:</TH>
    <TD colspan=\"3\">SimX_MF5_PHIL.mo</TD></TR>
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
    <TD>Model time in seconds</TD>
    <TD>Modeltime_s</TD>
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
    <TD>Temperature Cooling Circuit</TD>
    <TD>STM_CCVL_degC</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>Parameters:</TH>
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
    <TD>modeltime_s</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>File of all parameters of MF5 (weather, presence, Pel, DHW)</TD>
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
    <TD>Factor, with which the DHW demand gets multiplied</TD>
    <TD>DHWFactor</TD>
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
    <TD>Model time in seconds</TD>
    <TD>Modeltime_s</TD>
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
end SimX_MF5_PHIL;
