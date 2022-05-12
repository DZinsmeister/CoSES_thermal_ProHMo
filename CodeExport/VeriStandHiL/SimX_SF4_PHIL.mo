// CP: 65001
// SimulationX Version: 4.2.3.69223
within CoSES_Models.CodeExport.VeriStandHiL;
model SimX_SF4_PHIL "Power Hardware in the Loop model for SF4"
	input SignalBlocks.InputPin STM_HCVLaM_degC "Temperature Heating Circuit after the mixing valve" annotation(
		Placement(
			transformation(
				origin={-95,-20},
				extent={{-5,5},{5,-5}}),
			iconTransformation(extent={{-195,105},{-155,145}})),
		Dialog(
			tab="Input Signals",
			visible=false));
	output SignalBlocks.OutputPin STM_HCVLaM_Set_degC "Set temperature Heating Circuit after the mixing valve" annotation(Placement(
		transformation(extent={{250,-100},{260,-110}}),
		iconTransformation(
			origin={171,-75},
			extent={{-19.3,-20},{20.7,20}},
			rotation=180)));
	input SignalBlocks.InputPin SFW_HCRLbM_l_per_min "Flow Water Heating Circuit before mixing valve" annotation(
		Placement(
			transformation(
				origin={-95,-40},
				extent={{-5,5},{5,-5}}),
			iconTransformation(extent={{-195,55},{-155,95}})),
		Dialog(
			tab="Input Signals",
			visible=false));
	input SignalBlocks.InputPin STM_CCVL_degC "Temperature Cooling Circuit" annotation(
		Placement(
			transformation(
				origin={-100,-175},
				extent={{-5,5},{5,-5}}),
			iconTransformation(extent={{-195,5},{-155,45}})),
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
	output SignalBlocks.OutputPin SFW_HCRLbM_Set_l_per_min "SFW_HCRLbM_Set_l_per_min" annotation(
		Placement(
			transformation(
				origin={255,-75},
				extent={{-5,5},{5,-5}},
				rotation=180),
			iconTransformation(
				origin={171,-125},
				extent={{-19.3,-20},{20.7,20}},
				rotation=180)),
		Dialog(
			tab="Output Signals",
			visible=false));
	output SignalBlocks.OutputPin STM_HCRL_Set_degC "STM_HCRL_Set_degC" annotation(
		Placement(
			transformation(
				origin={255,-120},
				extent={{-5,5},{5,-5}},
				rotation=180),
			iconTransformation(
				origin={171,-25},
				extent={{-19.3,-20},{20.7,20}},
				rotation=180)),
		Dialog(
			tab="Output Signals",
			visible=false));
	output SignalBlocks.OutputPin E_DHW_Set_kWh "E_DHW_kWh" annotation(
		Placement(
			transformation(
				origin={255,-155},
				extent={{-5,5},{5,-5}},
				rotation=180),
			iconTransformation(
				origin={75,-172},
				extent={{-20,-19.7},{20,20.3}},
				rotation=90)),
		Dialog(
			tab="Output Signals",
			visible=false));
	output SignalBlocks.OutputPin P_elConsumption_kW "electric consumption of the house" annotation(
		Placement(
			transformation(
				origin={255,-90},
				extent={{-5,5},{5,-5}},
				rotation=180),
			iconTransformation(
				origin={125,-172},
				extent={{-20,-19.7},{20,20.3}},
				rotation=90)),
		Dialog(
			tab="Output Signals",
			visible=false));
	output SignalBlocks.OutputPin T_roomIs_degC "T_roomIs_degC" annotation(
		Placement(
			transformation(
				origin={255,-60},
				extent={{-5,5},{5,-5}},
				rotation=90),
			iconTransformation(
				origin={171,75},
				extent={{-19.3,-20},{20.7,20}},
				rotation=180)),
		Dialog(
			tab="Output Signals",
			visible=false));
	output SignalBlocks.OutputPin T_ambient_degC "Ambient temperature" annotation(
		Placement(
			transformation(
				origin={255,20},
				extent={{-5,5},{5,-5}},
				rotation=270),
			iconTransformation(
				origin={-75,175},
				extent={{-20,-20},{20,20}},
				rotation=270)),
		Dialog(
			tab="Output Signals",
			visible=false));
	output SignalBlocks.OutputPin Modeltime_s "Model time in seconds" annotation(
		Placement(
			transformation(
				origin={255,55},
				extent={{-5,5},{5,-5}},
				rotation=270),
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
	output SignalBlocks.OutputPin DiffuseRadiation_W_per_m2 "Diffuse radiation" annotation(
		Placement(
			transformation(
				origin={255,-10},
				extent={{-5,5},{5,-5}},
				rotation=270),
			iconTransformation(
				origin={25,175},
				extent={{-20,-20},{20,20}},
				rotation=270)),
		Dialog(
			tab="Output Signals",
			visible=false));
	output SignalBlocks.OutputPin T_roofIs_degC "Roof temperature" annotation(
		Placement(
			transformation(
				origin={255,-30},
				extent={{-5,5},{5,-5}},
				rotation=270),
			iconTransformation(
				origin={171,125},
				extent={{-19.3,-20},{20.7,20}},
				rotation=180)),
		Dialog(
			tab="Output Signals",
			visible=false));
	output SignalBlocks.OutputPin T_cellarIs_degC "Cellar temperature" annotation(
		Placement(
			transformation(
				origin={255,-45},
				extent={{-5,5},{5,-5}},
				rotation=270),
			iconTransformation(
				origin={171,25},
				extent={{-19.3,-20},{20.7,20}},
				rotation=180)),
		Dialog(
			tab="Output Signals",
			visible=false));
	parameter String File=classDirectory()+"Data\\SF4_Typeday.txt" "File of all parameters of SF4 (weather, presence, Pel, DHW)" annotation(Dialog(tab="Parameters"));
	parameter Integer TypeDay=1 "1 - WSC, 2 - WSS, 3 - WWS, 4 - WWC, 5 - TWC, 6 - SSS, 7 - TWS, 8 - TSS, 9 - SWC, 10 - SSC, 11 - TSC, 12 - SWS, coldest" annotation(Dialog(tab="Parameters"));
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
	elseif TypeDay == 9 then 23.45
	elseif TypeDay == 10 then 23.34
	elseif TypeDay == 11 then 22.62
	elseif TypeDay == 12 then 23.54
	else 21 "Initial Temperature" annotation(Dialog(tab="Parameters"));
	parameter Real TRoof_Init=if TypeDay == 1 then 5.9
	elseif TypeDay == 2 then 4.88
	elseif TypeDay == 3 then 6.99
	elseif TypeDay == 4 then 6.44
	elseif TypeDay == 5 then 12.84
	elseif TypeDay == 6 then 13.79
	elseif TypeDay == 7 then 16.70
	elseif TypeDay == 8 then 11.64
	elseif TypeDay == 9 then 21.87
	elseif TypeDay == 10 then 22.46
	elseif TypeDay == 11 then 20.92
	elseif TypeDay == 12 then 23.33
	else 6.11 "Initial Temperature" annotation(Dialog(tab="Parameters"));
	parameter Real TCellar_Init=if TypeDay == 1 then 7.91
	elseif TypeDay == 2 then 7.60
	elseif TypeDay == 3 then 10.40
	elseif TypeDay == 4 then 9.79
	elseif TypeDay == 5 then 14.20
	elseif TypeDay == 6 then 10.66
	elseif TypeDay == 7 then 15.97
	elseif TypeDay == 8 then 9.43
	elseif TypeDay == 9 then 17.71
	elseif TypeDay == 10 then 16.80
	elseif TypeDay == 11 then 17.50
	elseif TypeDay == 12 then 18.40
	else 7.49 "Initial Temperature" annotation(Dialog(tab="Parameters"));
	parameter Real T_roomSet_degC=21 "T_roomSet_degC" annotation(Dialog(tab="Parameters"));
	parameter Real T_roomNightSet_degC=21 "T_roomNightSet_degC" annotation(Dialog(tab="Parameters"));
	parameter Real NightTimeReductionStart_h=23 "NightTimeReductionStart_h" annotation(Dialog(tab="Parameters"));
	parameter Real NightTimeReductionEnd_h=7 "NightTimeReductionEnd_h" annotation(Dialog(tab="Parameters"));
	parameter Integer HeatingSystem=0 "0 - Radiator Heating, 1 - Space Heating" annotation(Dialog(tab="Parameters"));
	parameter Integer nPeople=6 "nPeople" annotation(Dialog(tab="Parameters"));
	parameter Integer nFloors=2 "nFloors" annotation(Dialog(tab="Parameters"));
	parameter Integer nApartments=2 "nApartments" annotation(Dialog(tab="Parameters"));
	parameter Real HeatedArea_m2=300 "HeatedArea_m2" annotation(Dialog(tab="Parameters"));
	parameter Real YearlyElecConsumption_kWh=7000 "YearlyElecConsumption_kWh" annotation(Dialog(tab="Parameters"));
	parameter Real ElFactor=YearlyElecConsumption_kWh/5149 "ElFactor" annotation(Dialog(tab="Parameters"));
	parameter Real V_DHWperDay_l=300 "V_DHWperDay_l" annotation(Dialog(tab="Parameters"));
	parameter Real DHWFactor=V_DHWperDay_l / 300 "DHWFactor" annotation(Dialog(tab="Parameters"));
	Consumer.SimpleHeatedBuilding simpleHeatedBuilding1(
		vFCtrl_LivingZone(
			deltaTup=if self.ActivateNightTimeReduction then 0.01 else 0.1,
			deltaTlow=if self.ActivateNightTimeReduction then -0.01 else -0.1),
		redeclare replaceable parameter GreenCity.Utilities.BuildingData.ParameterSelectionSCB.AgeOfBuilding.EnEV2007 buildingAge,
		nFloors=nFloors,
		nAp=nApartments,
		nPeople=nPeople,
		ALH=HeatedArea_m2,
		livingTZoneInit(displayUnit="K")=self.TLiving_Init+273.15,
		UseStandardHeatNorm=false,
		QHeatNormLivingArea=20,
		n=if HeatingSystem==0 then 1.3 else 1,
		TFlowHeatNorm(displayUnit="K")=if HeatingSystem==0 then 338.15 else 313.15,
		TReturnHeatNorm(displayUnit="K")=if HeatingSystem==0 then 323.15 else 303.15,
		TRef(displayUnit="K")=T_roomSet_degC + 273.15,
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
	Modelica.Blocks.Sources.RealExpression STM_HCVLaM_K(y=var_STM_HCVLaM_K) "Set output signal to a time varying Real expression" annotation(Placement(transformation(extent={{-50,-25},{-30,-5}})));
	Modelica.Blocks.Sources.RealExpression STM_CCVL_K(y=var_STM_CCVL_K) "Set output signal to a time varying Real expression" annotation(Placement(transformation(extent={{-50,-185},{-30,-165}})));
	Modelica.Blocks.Sources.RealExpression SFW_HCRLbM_m3_per_s(y=var_SFW_HCRLbM_m3_per_s) "Set output signal to a time varying Real expression" annotation(Placement(transformation(extent={{-50,-55},{-30,-35}})));
	Modelica.Blocks.Sources.RealExpression modeltime_s(y=time) annotation(Placement(transformation(extent={{90,45},{110,65}})));
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
		DirectRadiation_W_per_m2 = environment1.RadiationDirect;
		DiffuseRadiation_W_per_m2 = environment1.RadiationDiffuse;
		
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
			projectName="SimX_SF4_PHIL",
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
				port="T_roomIs_degC",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[6](
				port="T_ambient_degC",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[7](
				port="Modeltime_s",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[8](
				port="DirectRadiation_W_per_m2",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[9](
				port="DiffuseRadiation_W_per_m2",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[10](
				port="T_roofIs_degC",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[11](
				port="T_cellarIs_degC",
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
								textString="SF4 HiL",
								extent={{-76.59999999999999,100.2},{80.09999999999999,33.5}}),
							Bitmap(
								imageSource="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
4jbjvZz2AAAAAElFTkSuQmCC",
								extent={{-85.8,-149.1},{89.2,46.2}})}),
		Documentation(info="<HTML><HEAD>
<META http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\"> 
<TITLE>Power Hardware in the Loop model for SF4</TITLE> 
<STYLE type=\"text/css\">
table>tbody>tr:hover,th{background-color:#edf1f3}html{font-size:90%}body,table{font-size:1rem}body{font-family:'Open Sans',Arial,sans-serif;color:#465e70}h1,h2{margin:1em 0 .6em;font-weight:600}p{margin-top:.3em;margin-bottom:.2em}table{border-collapse:collapse;margin:1em 0;width:100%;}tr{border:1px solid #beccd3}td,th{padding:.3em 1em; border-width: 1px; border-style: solid; border-color: rgb(190, 204, 211);}td{word-break:break-word}tr:nth-child(even){background-color:#fafafa}th{font-family:'Open Sans Semibold',Arial,sans-serif;font-weight:700;text-align:left;word-break:keep-all}.lib-wrap{width:70%}@media screen and (max-width:800px){.lib-wrap{width:100%}}td p{margin:.2em}
</STYLE>
 
<META name=\"GENERATOR\" content=\"MSHTML 11.00.10570.1001\"></HEAD> 
<BODY>
<H1>Power Hardware in the Loop model for SF4</H1>
<HR>

<P>Power Hardware in the Loop&nbsp;model for house&nbsp;4 of the CoSES  
laboratory.  The&nbsp;models and standard parameters are the same as for  
the&nbsp;simulation  model of&nbsp;SF4. </P>
<P>The model consits of the following parts:</P>
<UL>
  <LI>Weather:<BR>Outputs:<BR>&nbsp;&nbsp;&nbsp;&nbsp; Ambient temperature:      
     T_ambient_degC<BR>&nbsp;&nbsp;&nbsp;&nbsp; Direct solar     radiation:     
  DirectRadiation_W_per_m2<BR>&nbsp;&nbsp;&nbsp;&nbsp; Diffuse     solar 
  radiation:     DiffuseRadiation_W_per_m2<BR>&nbsp;&nbsp;&nbsp;&nbsp;     
  Internal model time:         
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
    reduction (hour, e.g. 23)<BR>&nbsp;&nbsp;&nbsp;&nbsp; End time for night 
  time         temperature reduction (hour, e.g. 7)<BR>&nbsp;&nbsp;&nbsp;&nbsp; 
  Set room         temperature during night time reduction in   
  °C<BR>&nbsp;&nbsp;&nbsp;&nbsp;       Yearly electric consumption<BR><BR></LI>
  <LI>Domestic Hot Water Consumption:<BR>Inputs:<BR>&nbsp;&nbsp;&nbsp;&nbsp;     
      Actual temperature of the return line of the domestic hot water circuit:   
        STM_CCVL_degC<BR>Outputs:<BR>&nbsp;&nbsp;&nbsp;&nbsp; Cumulative energy 
  of   the       domestic hot water consumption:         
  E_DHW_kWh<BR>Parameters:<BR>&nbsp;&nbsp;&nbsp;&nbsp; Daily domestic hot water  
         consumption of the whole house: V_DHWperDay_l<BR></LI></UL>
<P><BR></P>
<DIV class=\"lib-wrap\">
<TABLE class=\"type\">
  <TBODY>
  <TR>
    <TH>Symbol:</TH>
    <TD colspan=\"3\"><IMG width=\"349\" height=\"332\" src=\"data:image/png;base64,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\"></TD></TR>
  <TR>
    <TH>Identifier:</TH>
    <TD colspan=\"3\">CoSES_Models.CodeExport.VeriStandHiL.SimX_SF4_PHIL</TD></TR>
  <TR>
    <TH>Version:</TH>
    <TD colspan=\"3\">1.0</TD></TR>
  <TR>
    <TH>File:</TH>
    <TD colspan=\"3\">SimX_SF4_PHIL.mo</TD></TR>
  <TR>
    <TH>Connectors:</TH>
    <TD>Temperature Heating Circuit after the mixing valve</TD>
    <TD>STM_HCVLaM_degC</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Set temperature Heating Circuit after the mixing valve</TD>
    <TD>STM_HCVLaM_Set_degC</TD>
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
    <TD>T_roomIs_degC</TD>
    <TD>T_roomIs_degC</TD>
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
    <TD>Roof temperature</TD>
    <TD>T_roofIs_degC</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Cellar temperature</TD>
    <TD>T_cellarIs_degC</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>Parameters:</TH>
    <TD>File of all parameters of SF4 (weather, presence, Pel, DHW)</TD>
    <TD>File</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>1 - WSC, 2 - WSS, 3 - WWS, 4 - WWC, 5 - TWC, 6 - SSS, 7 - TWS, 8 - 
      TSS, 9 - SWC, 10 - SSC, 11 - TSC, 12 - SWS, coldest</TD>
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
    <TD>DHWFactor</TD>
    <TD>DHWFactor</TD>
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
    <TH>Results:</TH>
    <TD>Set temperature Heating Circuit after the mixing valve</TD>
    <TD>STM_HCVLaM_Set_degC</TD>
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
    <TD>T_roomIs_degC</TD>
    <TD>T_roomIs_degC</TD>
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
    <TD>Roof temperature</TD>
    <TD>T_roofIs_degC</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Cellar temperature</TD>
    <TD>T_cellarIs_degC</TD>
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
end SimX_SF4_PHIL;
