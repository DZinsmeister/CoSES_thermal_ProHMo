// CP: 65001
// SimulationX Version: 4.2.3.69223
within CoSES_Models.CodeExport.VeriStandPipeModels;
model SimX_Pipe_SF1toSF2_high "Pipe model"
	input SignalBlocks.InputPin TInHouseX_degC "Temperature measured at house x" annotation(
		Placement(
			transformation(extent={{-145,55},{-105,95}}),
			iconTransformation(extent={{-145,55},{-105,95}})),
		Dialog(
			group="Inports",
			visible=false));
	input SignalBlocks.InputPin TInHouseY_degC "Temperature measured at house y" annotation(
		Placement(
			transformation(extent={{-145,5},{-105,45}}),
			iconTransformation(extent={{-145,5},{-105,45}})),
		Dialog(
			group="Inports",
			visible=false));
	input SignalBlocks.InputPin V_XY_l_per_min "Volume flow, positive, if from house x to y, negative if from house y to x" annotation(
		Placement(
			transformation(extent={{-145,-95},{-105,-55}}),
			iconTransformation(extent={{-145,-95},{-105,-55}})),
		Dialog(
			group="Inports",
			visible=false));
	input SignalBlocks.InputPin TEnv_degC "Soil temperature of the pipe" annotation(
		Placement(
			transformation(extent={{-145,-45},{-105,-5}}),
			iconTransformation(extent={{-145,-45},{-105,-5}})),
		Dialog(
			group="Inports",
			visible=false));
	GreenCity.Interfaces.Thermal.ExtractVolumeFlow extractVolumeFlow1(qvMedium(displayUnit="l/min")) "Extracts the characteristics of a Thermal Volume Flow Connector" annotation(Placement(transformation(extent={{35,5},{55,25}})));
	GreenCity.Utilities.Thermal.Pipe pipe1(
		QLossCoefficient(displayUnit="W/(m·K)")=Pipe_SF1toSF2_high_QLossCoefficient_W_per_mK,
		lPipe=Pipe_SF1toSF2_high_lPipe_m,
		dPipe(displayUnit="m")=Pipe_SF1toSF2_high_dPipe_cm/100,
		TPipeInit(displayUnit="K")=Pipe_SF1toSF2_high_TPipeInit_degC+273.15) annotation(Placement(transformation(extent={{-5,10},{15,20}})));
	GreenCity.Interfaces.Thermal.DefineVolumeFlow FlowIn(qvMedium(displayUnit="l/min")) annotation(Placement(transformation(extent={{-40,5},{-20,25}})));
	Modelica.Blocks.Sources.RealExpression modeltime_s1(y=time) "Set output signal to a time varying Real expression" annotation(Placement(transformation(extent={{-5,-30},{15,-10}})));
	parameter Real Pipe_SF1toSF2_high_dPipe_cm=10 "Pipe diameter" annotation(Dialog(group="Parameters"));
	parameter Real Pipe_SF1toSF2_high_lPipe_m=20 "Pipe length" annotation(Dialog(group="Parameters"));
	parameter Real Pipe_SF1toSF2_high_QLossCoefficient_W_per_mK=0.19 "Heat loss coefficient through insulation" annotation(Dialog(group="Parameters"));
	parameter Real Pipe_SF1toSF2_high_TPipeInit_degC=30 "Initial water temperature in the pipe" annotation(Dialog(group="Parameters"));
	output SignalBlocks.OutputPin TOut_degC "Temperature at the end of the pipe" annotation(
		Placement(
			transformation(
				origin={170,40},
				extent={{-19.3,-20},{20.7,20}},
				rotation=180),
			iconTransformation(
				origin={121,25},
				extent={{-19.3,-20},{20.7,20}},
				rotation=180)),
		Dialog(
			group="Outports",
			visible=false));
	output SignalBlocks.OutputPin modeltime_s "Model time" annotation(
		Placement(
			transformation(
				origin={170,-10},
				extent={{-19.3,-20},{20.7,20}},
				rotation=180),
			iconTransformation(
				origin={121,-25},
				extent={{-19.3,-20},{20.7,20}},
				rotation=180)),
		Dialog(
			group="Outports",
			visible=false));
	equation
		// enter your equations here
		if V_XY_l_per_min > 0 then
			FlowIn.TMedium = TInHouseX_degC + 273.15;
			FlowIn.qvMedium = V_XY_l_per_min / 60000;
		else
			FlowIn.TMedium = TInHouseY_degC + 273.15;
			FlowIn.qvMedium = - V_XY_l_per_min / 60000;
		end if;
		pipe1.TEnvironment = TEnv_degC + 273.15;
		TOut_degC = extractVolumeFlow1.TMedium - 273.15;
		modeltime_s = modeltime_s1.y;
	equation
		connect(pipe1.PipeOut,extractVolumeFlow1.Pipe) annotation(Line(
			points={{15,15},{20,15},{30,15},{35,15}},
			color={190,30,45},
			thickness=0.0625));
		connect(FlowIn.Pipe,pipe1.PipeIn) annotation(Line(
			points={{-20,15},{-15,15},{-10,15},{-5,15}},
			color={190,30,45},
			thickness=0.0625));
	annotation(
		__esi_viewinfo[0](
			fMin=1,
			fMax=100,
			nf=100,
			kindSweep=1,
			expDataFormat=0,
			expNumberFormat="%.7lg",
			expMatrixNames={
							"A","B","C","D","E"},
			typename="AnaLinSysInfo"),
		__esi_viewinfo[1](
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
		__esi_viewinfo[2](
			projectName="Pipe_SF1toSF2_high",
			projectPath="C:\\Users\\gu62xur\\Downloads\\SimX_Veristand",
			projectType=17,
			saveOutputsApproach=1,
			inputs[0](
				port="CoSES_Models.CodeExport.VeriStandPipeModels.SimX_Pipe_SF1toSF2_high.TInHouseX_degC",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			inputs[1](
				port="CoSES_Models.CodeExport.VeriStandPipeModels.SimX_Pipe_SF1toSF2_high.TInHouseY_degC",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			inputs[2](
				port="CoSES_Models.CodeExport.VeriStandPipeModels.SimX_Pipe_SF1toSF2_high.V_XY_l_per_min",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			inputs[3](
				port="CoSES_Models.CodeExport.VeriStandPipeModels.SimX_Pipe_SF1toSF2_high.TEnv_degC",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[0](
				port="CoSES_Models.CodeExport.VeriStandPipeModels.SimX_Pipe_SF1toSF2_high.TOut_degC",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			outputs[1](
				port="CoSES_Models.CodeExport.VeriStandPipeModels.SimX_Pipe_SF1toSF2_high.modeltime_s",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[0](
				port="CoSES_Models.CodeExport.VeriStandPipeModels.SimX_Pipe_SF1toSF2_high.Pipe_SF1toSF2_high_dPipe_cm",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[1](
				port="CoSES_Models.CodeExport.VeriStandPipeModels.SimX_Pipe_SF1toSF2_high.Pipe_SF1toSF2_high_lPipe_m",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[2](
				port="CoSES_Models.CodeExport.VeriStandPipeModels.SimX_Pipe_SF1toSF2_high.Pipe_SF1toSF2_high_QLossCoefficient_W_per_mK",
				interpolation=true,
				paramTypeSPCK=3,
				typename="CEPort"),
			parameters[3](
				port="CoSES_Models.CodeExport.VeriStandPipeModels.SimX_Pipe_SF1toSF2_high.Pipe_SF1toSF2_high_TPipeInit_degC",
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
				textString="Pipe HiL",
				extent={{-106.3,99.59999999999999},{110.3,-100.4}})}),
		Documentation(info="<HTML><HEAD>
<META http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\"> 
<TITLE>Pipe model</TITLE> 
<STYLE type=\"text/css\">
table>tbody>tr:hover,th{background-color:#edf1f3}html{font-size:90%}body,table{font-size:1rem}body{font-family:'Open Sans',Arial,sans-serif;color:#465e70}h1,h2{margin:1em 0 .6em;font-weight:600}p{margin-top:.3em;margin-bottom:.2em}table{border-collapse:collapse;margin:1em 0;width:100%;}tr{border:1px solid #beccd3}td,th{padding:.3em 1em; border-width: 1px; border-style: solid; border-color: rgb(190, 204, 211);}td{word-break:break-word}tr:nth-child(even){background-color:#fafafa}th{font-family:'Open Sans Semibold',Arial,sans-serif;font-weight:700;text-align:left;word-break:keep-all}.lib-wrap{width:70%}@media screen and (max-width:800px){.lib-wrap{width:100%}}td p{margin:.2em}
</STYLE>
 
<META name=\"GENERATOR\" content=\"MSHTML 11.00.10570.1001\"></HEAD> 
<BODY>
<H1>Pipe model</H1>
<P>
<HR>
</P>
<P>Veristand model of a pipe for Power Hardware In the Loop and Software in the 
Loop applications. The model is based on Green City's pipe model, but can be 
used as a bidirectional model.</P>
<P>Inputs:</P>
<UL style=\"list-style-type: square;\">
  <LI>Actual inlet temperature from house X: TInHouseX_degC</LI>
  <LI>Actual inlet temperature from house Y: TInHouseY_degC</LI>
  <LI>Water flow between house X and Y (positive or negativ): 
V_XY_l_per_min</LI>
  <LI>Ground tempererature: TEnv_degC</LI></UL>
<P>Outputs:</P>
<UL style=\"list-style-type: square;\">
  <LI>Set outlet temperature of the pipe: TOut_degC</LI></UL>
<P>Parameters:</P>
<UL style=\"list-style-type: square;\">
  <LI>Pipe diameter in cm</LI>
  <LI>Pipe length in m</LI>
  <LI>Heat loss coefficient of the pipe in W/mK</LI>
  <LI>Initial pipe temperature</LI></UL>
<HR>

<DIV class=\"lib-wrap\">
<TABLE class=\"type\">
  <TBODY>
  <TR>
    <TH>Symbol:</TH>
    <TD colspan=\"3\"><IMG width=\"220\" height=\"83\" src=\"data:image/png;base64,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\"></TD></TR>
  <TR>
    <TH>Identifier:</TH>
    <TD 
      colspan=\"3\">CoSES_Models.CodeExport.VeriStandPipeModels.SimX_Pipe_SF1toSF2_high</TD></TR>
  <TR>
    <TH>Version:</TH>
    <TD colspan=\"3\">1.0</TD></TR>
  <TR>
    <TH>File:</TH>
    <TD colspan=\"3\">SimX_Pipe_SF1toSF2_high.mo</TD></TR>
  <TR>
    <TH>Connectors:</TH>
    <TD>Temperature measured at house x</TD>
    <TD>TInHouseX_degC</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Temperature measured at house y</TD>
    <TD>TInHouseY_degC</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Volume flow, positive, if from house x to y, negative if from house y 
      to x</TD>
    <TD>V_XY_l_per_min</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Soil temperature of the pipe</TD>
    <TD>TEnv_degC</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Temperature at the end of the pipe</TD>
    <TD>TOut_degC</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Model time</TD>
    <TD>modeltime_s</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>Parameters:</TH>
    <TD>Extracts the characteristics of a Thermal Volume Flow Connector</TD>
    <TD>extractVolumeFlow1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Temperature drop in pipes</TD>
    <TD>pipe1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Specifies a Thermal Volume Flow Connector</TD>
    <TD>FlowIn</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Set output signal to a time varying Real expression</TD>
    <TD>modeltime_s1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Pipe diameter</TD>
    <TD>Pipe_SF1toSF2_high_dPipe_cm</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Pipe length</TD>
    <TD>Pipe_SF1toSF2_high_lPipe_m</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heat loss coefficient through insulation</TD>
    <TD>Pipe_SF1toSF2_high_QLossCoefficient_W_per_mK</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Initial water temperature in the pipe</TD>
    <TD>Pipe_SF1toSF2_high_TPipeInit_degC</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>Results:</TH>
    <TD>Temperature at the end of the pipe</TD>
    <TD>TOut_degC</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Model time</TD>
    <TD>modeltime_s</TD>
    <TD>&nbsp;</TD></TR></TBODY></TABLE></DIV>
<H2>Description:</H2>
<P>&nbsp;</P></BODY></HTML>
"),
		experiment(
			StopTime=432000,
			StartTime=0,
			Tolerance=1e-06,
			Interval=0.01,
			__esi_Solver(
				iMode=1,
				typename="FixStep"),
			__esi_MinInterval="0.01",
			__esi_AbsTolerance="1e-6"));
end SimX_Pipe_SF1toSF2_high;
