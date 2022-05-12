// CP: 65001
// SimulationX Version: 4.2.3.69223
within CoSES_Models.Distribution;
model SwitchPort "Change between inlet ports of thermal storage"
	GreenCity.Interfaces.Thermal.VolumeFlowIn HeatGeneratorFlow "HeatGeneratorFlow" annotation(Placement(
		transformation(extent={{-105,-55},{-85,-35}}),
		iconTransformation(extent={{-110,90},{-90,110}})));
	GreenCity.Interfaces.Thermal.VolumeFlowIn StorageReturnTop "Return pipe from upper storage outlet" annotation(Placement(
		transformation(extent={{85,-95},{105,-75}}),
		iconTransformation(
			origin={96.7,50},
			extent={{-10,-10},{10,10}},
			rotation=180)));
	GreenCity.Interfaces.Thermal.VolumeFlowIn StorageReturnBottom "Return pipe from lower storage outlet" annotation(Placement(
		transformation(extent={{85,-125},{105,-105}}),
		iconTransformation(extent={{86.7,-110},{106.7,-90}})));
	GreenCity.Interfaces.Thermal.VolumeFlowOut StorageFlowTop "Flow pipe to upper storage inlet" annotation(Placement(
		transformation(extent={{85,-30},{105,-10}}),
		iconTransformation(
			origin={100,100},
			extent={{-10,-10},{10,10}},
			rotation=180)));
	GreenCity.Interfaces.Thermal.VolumeFlowOut StorageFlowBottom "Flow pipe to upper storage inlet" annotation(Placement(
		transformation(extent={{85,-60},{105,-40}}),
		iconTransformation(extent={{86.7,-60},{106.7,-40}})));
	GreenCity.Interfaces.Thermal.VolumeFlowOut HeatGeneratorReturn "HeatGeneratorReturn" annotation(Placement(
		transformation(extent={{-105,-110},{-85,-90}}),
		iconTransformation(extent={{-110,-110},{-90,-90}})));
	GreenCity.Utilities.Thermal.DistributionValve distributionValve1 "Controllable valve for volume flow distribution" annotation(Placement(transformation(extent={{30,-55},{50,-35}})));
	Modelica.Blocks.Logical.Switch switch1 annotation(Placement(transformation(extent={{0,-5},{20,-25}})));
	GreenCity.Utilities.Thermal.MeasureThermal measureThermal1 annotation(Placement(transformation(extent={{-70,-55},{-50,-35}})));
	Modelica.Blocks.Sources.RealExpression realExpression1(y(quantity="Thermics.VolumeFlow")) annotation(Placement(transformation(extent={{-100,5},{-80,25}})));
	GreenCity.Utilities.Thermal.MergingValve mergingValve1(
		VValve(displayUnit="m³")=VValve,
		QlossRate=QlossRate) annotation(Placement(transformation(extent={{-5,-110},{15,-90}})));
	parameter Real VValve(
		quantity="Basics.Volume",
		displayUnit="l")=0.0001 "Valve volume" annotation(Dialog(tab="Parameters"));
	parameter Real QlossRate(quantity="Thermics.HeatCond")=0.2 "Heat loss through the insulation" annotation(Dialog(tab="Parameters"));
	Modelica.Blocks.Interfaces.BooleanInput SwitchPort "True: upper storage connection" annotation(
		Placement(
			transformation(extent={{-120,-35},{-80,5}}),
			iconTransformation(
				origin={0,150},
				extent={{-20,-20},{20,20}},
				rotation=-90)),
		Dialog(
			tab="Results",
			visible=false));
	Real TFlow(quantity="Basics.Temp") "Flow temperature" annotation(Dialog(
		tab="Results",
		visible=false));
	Real TReturn(quantity="Basics.Temp") "Return temperature" annotation(Dialog(
		tab="Results",
		visible=false));
	Real qValve(quantity="Thermics.VolumeFlow") "Volume flow of heat medium in valve" annotation(Dialog(
		tab="Results",
		visible=false));
	equation
		// enter your equations here
		TFlow = HeatGeneratorFlow.T;
		TReturn = HeatGeneratorReturn.T;
		qValve = HeatGeneratorFlow.qv;
	equation
		connect(measureThermal1.PipeIn,HeatGeneratorFlow) annotation(Line(
			points={{-70,-45},{-75,-45},{-90,-45},{-95,-45}},
			color={190,30,45},
			thickness=0.0625));
		connect(switch1.u1,measureThermal1.qvMedium) annotation(Line(
			points={{-2,-23},{-7,-23},{-60,-23},{-60,-30},{-60,-35}},
			color={0,0,127},
			thickness=0.0625));
		connect(switch1.u2,SwitchPort) annotation(Line(
			points={{-2,-15},{-7,-15},{-95,-15},{-100,-15}},
			color={255,0,255},
			thickness=0.0625));
		connect(realExpression1.y,switch1.u3) annotation(Line(
			points={{-79,15},{-74,15},{-7,15},{-7,-7},{-2,-7}},
			color={0,0,127},
			thickness=0.0625));
		connect(distributionValve1.PipeIn,measureThermal1.PipeOut) annotation(Line(
			points={{30,-45},{25,-45},{-45,-45},{-50,-45}},
			color={190,30,45},
			thickness=0.0625));
		connect(distributionValve1.PipeOutRemain,StorageFlowBottom) annotation(Line(
			points={{50,-50},{55,-50},{90,-50},{95,-50}},
			color={190,30,45}));
		connect(StorageFlowTop,distributionValve1.PipeOutRegulated) annotation(Line(
			points={{95,-20},{90,-20},{55,-20},{55,-40},{50,-40}},
			color={190,30,45}));
		connect(StorageReturnTop,mergingValve1.PipeIn1) annotation(Line(
			points={{95,-85},{90,-85},{20,-85},{20,-95},{15,-95}},
			color={190,30,45},
			thickness=0.0625));
		connect(StorageReturnBottom,mergingValve1.PipeIn2) annotation(Line(
			points={{95,-115},{90,-115},{20,-115},{20,-105},{15,-105}},
			color={190,30,45},
			thickness=0.0625));
		connect(mergingValve1.PipeOut,HeatGeneratorReturn) annotation(Line(
			points={{-5,-100},{-10,-100},{-90,-100},{-95,-100}},
			color={190,30,45}));
		connect(distributionValve1.qvRef,switch1.y) annotation(Line(
			points={{40,-35},{40,-30},{40,-15},{26,-15},{21,-15}},
			color={0,0,127},
			thickness=0.0625));
	annotation(
		Icon(
			coordinateSystem(extent={{-100,-150},{100,150}}),
			graphics={
				Line(
					points={{-100,100},{99.7,100}},
					color={165,42,42},
					thickness=8),
				Line(
					points={{0.2,-50.5},{99.2,-50.5}},
					color={165,42,42},
					thickness=8),
				Line(
					points={{-50,-98},{-50,52}},
					color={0,0,255},
					thickness=8),
				Line(
					points={{0,-55},{0,99.3}},
					color={165,42,42},
					thickness=8),
				Line(
					points={{-54,50},{95.7,50}},
					color={0,0,255},
					thickness=8),
				Line(
					points={{-99.8,-99.3},{99.90000000000001,-99.3}},
					color={0,0,255},
					thickness=8),
				Text(
					textString="DZ",
					fontSize=12,
					textStyle={
						TextStyle.Bold},
					lineColor={0,128,255},
					extent={{9.1,-87.40000000000001},{168.6,-200.6}})}),
		Documentation(info="<HTML><HEAD>
<META http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\"> 
<TITLE>Change between inlet ports of thermal storage</TITLE> 
<STYLE type=\"text/css\">
table>tbody>tr:hover,th{background-color:#edf1f3}html{font-size:90%}body,table{font-size:1rem}body{font-family:'Open Sans',Arial,sans-serif;color:#465e70}h1,h2{margin:1em 0 .6em;font-weight:600}p{margin-top:.3em;margin-bottom:.2em}table{border-collapse:collapse;margin:1em 0;width:100%;}tr{border:1px solid #beccd3}td,th{padding:.3em 1em; border-width: 1px; border-style: solid; border-color: rgb(190, 204, 211);}td{word-break:break-word}tr:nth-child(even){background-color:#fafafa}th{font-family:'Open Sans Semibold',Arial,sans-serif;font-weight:700;text-align:left;word-break:keep-all}.lib-wrap{width:70%}@media screen and (max-width:800px){.lib-wrap{width:100%}}td p{margin:.2em}
</STYLE>
 
<META name=\"GENERATOR\" content=\"MSHTML 11.00.10570.1001\"></HEAD> 
<BODY>
<H1>Change between inlet ports of thermal storage</H1>
<HR>

<P>This distribution element can be used if heat generators (e.g. heat pumps or 
solar thermal systems) can be connected to two connections at different heights 
to improve the stratification in the thermal storage. If \"SwitchPort\" is true, 
the upper storage connection is used, else, the lower connection is used.</P>
<DIV class=\"lib-wrap\">
<TABLE class=\"type\">
  <TBODY>
  <TR>
    <TH>Symbol:</TH>
    <TD colspan=\"3\"><IMG width=\"261\" height=\"148\" src=\"data:image/png;base64,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\"></TD></TR>
  <TR>
    <TH>Identifier:</TH>
    <TD colspan=\"3\">CoSES_Models.Distribution.SwitchPort</TD></TR>
  <TR>
    <TH>Version:</TH>
    <TD colspan=\"3\">1.0</TD></TR>
  <TR>
    <TH>File:</TH>
    <TD colspan=\"3\">SwitchPort.mo</TD></TR>
  <TR>
    <TH>Connectors:</TH>
    <TD>HeatGeneratorFlow</TD>
    <TD>HeatGeneratorFlow</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Return pipe from upper storage outlet</TD>
    <TD>StorageReturnTop</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Return pipe from lower storage outlet</TD>
    <TD>StorageReturnBottom</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Flow pipe to upper storage inlet</TD>
    <TD>StorageFlowTop</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Flow pipe to upper storage inlet</TD>
    <TD>StorageFlowBottom</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>HeatGeneratorReturn</TD>
    <TD>HeatGeneratorReturn</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>True: upper storage connection</TD>
    <TD>SwitchPort</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>Parameters:</TH>
    <TD>Controllable valve for volume flow distribution</TD>
    <TD>distributionValve1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Switch between two Real signals</TD>
    <TD>switch1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Measurement of pipe temperature and volume flow</TD>
    <TD>measureThermal1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Set output signal to a time varying Real expression</TD>
    <TD>realExpression1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Valve for volume flow merging</TD>
    <TD>mergingValve1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Valve volume</TD>
    <TD>VValve</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heat loss through the insulation</TD>
    <TD>QlossRate</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>Results:</TH>
    <TD>True: upper storage connection</TD>
    <TD>SwitchPort</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Flow temperature</TD>
    <TD>TFlow</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Return temperature</TD>
    <TD>TReturn</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Volume flow of heat medium in valve</TD>
    <TD>qValve</TD>
    <TD>&nbsp;</TD></TR></TBODY></TABLE></DIV>
<H2>Description:</H2>
<P>&nbsp;</P></BODY></HTML>
"),
		experiment(
			StopTime=1,
			StartTime=0,
			Tolerance=1e-06,
			Interval=0.001,
			__esi_Solver(
				bSplitCodeGen=false,
				typename="CVODE"),
			__esi_MinInterval="9.999999999999999e-10",
			__esi_AbsTolerance="1e-6"));
end SwitchPort;
