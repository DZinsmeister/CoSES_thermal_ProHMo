// CP: 65001
// SimulationX Version: 4.2.3.69223
within CoSES_Models.CodeExport.VeriStandPipeModels;
model SimX_GroundTemperature "SimulationX weather model for the ground temperature"
	import CoSES_Models.CodeExport.VeriStandHiL.*;
	output SignalBlocks.OutputPin T_ambient_degC "Ambient temperature" annotation(
		Placement(
			transformation(extent={{250,30},{260,40}}),
			iconTransformation(
				origin={71,25},
				extent={{-19.3,-20},{20.7,20}},
				rotation=180)),
		Dialog(
			tab="Output Signals",
			visible=false));
	output SignalBlocks.OutputPin Modeltime_s "Modeltime_s" annotation(
		Placement(
			transformation(extent={{-105,55},{-95,45}}),
			iconTransformation(extent={{-95,45},{-55,5}})),
		Dialog(
			tab="Output Signals",
			visible=false));
	output SignalBlocks.OutputPin T_ground_degC "Ground temperature" annotation(
		Placement(
			transformation(extent={{250,-205},{260,-195}}),
			iconTransformation(
				origin={71,-25},
				extent={{-19.3,-20},{20.7,20}},
				rotation=180)),
		Dialog(
			tab="Output Signals",
			visible=false));
	Environment.Environment environment1(
		ReferenceDay=false,
		InputFile=File,
		DefaultInit=false,
		DayTimeInit=InitTime,
		MonthDayInit=InitDay,
		MonthInit=InitMonth) "Environment with user defined weather profiles" annotation(Placement(transformation(extent={{140,-10},{170,20}})));
	Modelica.Blocks.Sources.RealExpression modeltime_s(y=time) "Set output signal to a time varying Real expression" annotation(Placement(transformation(extent={{90,45},{110,65}})));
	parameter String File=classDirectory()+"Data\\SF1_Typeday.txt" "File of all parameters of SF1 (weather, presence, Pel, DHW)" annotation(Dialog(tab="Parameters"));
	parameter Integer Ground_TypeDay=1 "1 - WSC, 2 - WSS, 3 - WWS, 4 - WWC, 5 - TWC, 6 - SSS, 7 - TWS, 8 - TSS, 9 - SWC, 10 - SSC, 11 - TSC, 12 - SWS, 13 - coldest" annotation(Dialog(tab="Parameters"));
	parameter Integer Ground_InitializationTime_h=1 "Additional time before the experiment in order to reach initial conditions for the experiment" annotation(Dialog(tab="Parameters"));
	parameter Integer InitTime=24-Ground_InitializationTime_h "Initial time of the day" annotation(Dialog(tab="Parameters"));
	parameter Integer InitDay=integer(mod(Ground_TypeDay*3-2, 31)) "InitialDay" annotation(Dialog(tab="Parameters"));
	parameter Integer InitMonth=integer((Ground_TypeDay*3-2)/31)+1 "Initial Month" annotation(Dialog(tab="Parameters"));
	parameter Real Ground_deepth_m=1 "Deepth of the ground in meter" annotation(Dialog(tab="Parameters"));
	GreenCity.Environment.Ground ground1(depth=Ground_deepth_m) annotation(Placement(transformation(extent={{65,-25},{85,-5}})));
	equation
		// weather
		Modeltime_s = modeltime_s.y;
		T_ambient_degC = environment1.TAmbient - 273.15;
		T_ground_degC = ground1.TGround - 273.15;
	equation
		connect(ground1.EnvironmentConditions,environment1.EnvironmentConditions) annotation(Line(
			points={{75,-5},{75,0},{75,5},{135,5},{140,5}},
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
			projectName="Ground",
			projectPath="C:\\Users\\gu62xur\\Downloads\\SimX_Veristand",
			projectType=17,
			saveOutputsApproach=1,
			outputs[0](
				port="T_ambient_degC",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[1](
				port="Modeltime_s",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[2](
				port="T_ground_degC",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[0](
				port="Ground_deepth_m",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			showAdditionalLibPage=false,
			useCodeOptimization=true,
			m_x64=false,
			solverMode=1,
			typename="CodeExportInfo"),
		Icon(
			coordinateSystem(extent={{-75,-75},{75,75}}),
			graphics={
				Text(
					textString="Ground",
					extent={{-76.59999999999999,80.09999999999999},{80.09999999999999,13.4}}),
				Text(
					textString="Temperature",
					extent={{-76.40000000000001,20.3},{80.3,-46.4}})}),
		Documentation(info="<HTML><HEAD>
<META http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\"> 
<TITLE>SimulationX weather model for the ground temperature</TITLE> 
<STYLE type=\"text/css\">
table>tbody>tr:hover,th{background-color:#edf1f3}html{font-size:90%}body,table{font-size:1rem}body{font-family:'Open Sans',Arial,sans-serif;color:#465e70}h1,h2{margin:1em 0 .6em;font-weight:600}p{margin-top:.3em;margin-bottom:.2em}table{border-collapse:collapse;margin:1em 0;width:100%;}tr{border:1px solid #beccd3}td,th{padding:.3em 1em; border-width: 1px; border-style: solid; border-color: rgb(190, 204, 211);}td{word-break:break-word}tr:nth-child(even){background-color:#fafafa}th{font-family:'Open Sans Semibold',Arial,sans-serif;font-weight:700;text-align:left;word-break:keep-all}.lib-wrap{width:70%}@media screen and (max-width:800px){.lib-wrap{width:100%}}td p{margin:.2em}
</STYLE>
 
<META name=\"GENERATOR\" content=\"MSHTML 11.00.10570.1001\"></HEAD> 
<BODY>
<H1>SimulationX weather model for the ground temperature</H1>
<HR>

<P>Model to calculate the ground temperature for district heating pipes.</P>
<DIV class=\"lib-wrap\">
<TABLE class=\"type\">
  <TBODY>
  <TR>
    <TH>Symbol:</TH>
    <TD colspan=\"3\"><IMG width=\"188\" height=\"53\" src=\"data:image/png;base64,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\"></TD></TR>
  <TR>
    <TH>Identifier:</TH>
    <TD 
      colspan=\"3\">CoSES_Models.CodeExport.VeriStandPipeModels.SimX_GroundTemperature</TD></TR>
  <TR>
    <TH>Version:</TH>
    <TD colspan=\"3\">1.0</TD></TR>
  <TR>
    <TH>File:</TH>
    <TD colspan=\"3\">SimX_GroundTemperature.mo</TD></TR>
  <TR>
    <TH>Connectors:</TH>
    <TD>Ambient temperature</TD>
    <TD>T_ambient_degC</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Modeltime_s</TD>
    <TD>Modeltime_s</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Ground temperature</TD>
    <TD>T_ground_degC</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>Parameters:</TH>
    <TD>Environment with user defined weather profiles</TD>
    <TD>environment1</TD>
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
    <TD>Ground_TypeDay</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Additional time before the experiment in order to reach initial 
      conditions for the experiment</TD>
    <TD>Ground_InitializationTime_h</TD>
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
    <TD>Deepth of the ground in meter</TD>
    <TD>Ground_deepth_m</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Ground</TD>
    <TD>ground1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>Results:</TH>
    <TD>Ambient temperature</TD>
    <TD>T_ambient_degC</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Modeltime_s</TD>
    <TD>Modeltime_s</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Ground temperature</TD>
    <TD>T_ground_degC</TD>
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
end SimX_GroundTemperature;
