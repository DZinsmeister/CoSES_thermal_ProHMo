// CP: 65001
// SimulationX Version: 4.2.3.69223
within CoSES_Models.HeatGenerator.LaboratoryModels;
model GreenCityConnector "Adapter to Green City connectors"
	GreenCity.Interfaces.Electrical.LV3Phase lV3Phase "Electrical Low-Voltage AC Three-Phase Connector" annotation(Placement(
		transformation(extent={{60,-80},{80,-60}}),
		iconTransformation(extent={{111.7,15},{131.7,35}})));
	GreenCity.Interfaces.Thermal.VolumeFlowIn volumeFlowIn "Thermal Volume Flow Input Connector" annotation(Placement(
		transformation(extent={{59.9,55},{79.90000000000001,75}}),
		iconTransformation(extent={{111.7,-85},{131.7,-65}})));
	GreenCity.Interfaces.Thermal.VolumeFlowOut volumeFlowOut "Thermal Volume Flow Output Connector" annotation(Placement(
		transformation(extent={{60.1,15},{80.09999999999999,35}}),
		iconTransformation(extent={{111.7,-35},{131.7,-15}})));
	Modelica.Blocks.Interfaces.RealInput VWater(quantity="Thermics.VolumeFlow") "Water flow" annotation(
		Placement(
			transformation(extent={{-105,-10},{-65,30}}),
			iconTransformation(extent={{-145,-95},{-105,-55}})),
		Dialog(
			group="Thermal",
			tab="Results",
			visible=false));
	Modelica.Blocks.Interfaces.RealInput TSup(quantity="Basics.Temp") "Supply temperature" annotation(
		Placement(
			transformation(extent={{-105,20},{-65,60}}),
			iconTransformation(extent={{-145,-45},{-105,-5}})),
		Dialog(
			group="Thermal",
			tab="Results",
			visible=false));
	Modelica.Blocks.Interfaces.RealOutput TRet(quantity="Basics.Temp") "Return temperature" annotation(
		Placement(
			transformation(extent={{-75,60},{-95,80}}),
			iconTransformation(extent={{-115,15},{-135,35}})),
		Dialog(
			group="Thermal",
			tab="Results",
			visible=false));
	Modelica.Blocks.Interfaces.RealInput PEl_phase[3](quantity="Basics.Power") "Electric power of the three phases" annotation(
		Placement(
			transformation(extent={{-105,-50},{-65,-10}}),
			iconTransformation(
				origin={-25,-121},
				extent={{-20,20},{20,-20}},
				rotation=90)),
		Dialog(
			group="Electric",
			tab="Results",
			visible=false));
	Modelica.Blocks.Interfaces.RealInput QEl_phase[3](quantity="Basics.Power") "Reactive power of the three phases" annotation(
		Placement(
			transformation(extent={{-105,-90},{-65,-50}}),
			iconTransformation(
				origin={-75,-121},
				extent={{-20,20},{20,-20}},
				rotation=90)),
		Dialog(
			group="Electric",
			tab="Results",
			visible=false));
	GreenCity.Interfaces.Thermal.DefineVolumeFlow defineVolumeFlow1 "Specifies a Thermal Volume Flow Connector" annotation(Placement(transformation(extent={{10,15},{30,35}})));
	GreenCity.Interfaces.Thermal.ExtractVolumeFlow extractVolumeFlow1 annotation(Placement(transformation(
		origin={20,65},
		extent={{-10,-10},{10,10}},
		rotation=-180)));
	GreenCity.Utilities.Electrical.PowerOutput powerOutput1(n=3) annotation(Placement(transformation(extent={{10,-75},{30,-55}})));
	GreenCity.Interfaces.Environment.EnvironmentConditions environmentConditions "Environment Conditions Connector" annotation(Placement(
		transformation(extent={{65,-120},{85,-100}}),
		iconTransformation(extent={{111.7,65},{131.7,85}})));
	Modelica.Blocks.Interfaces.RealOutput TAmb "Ambient temperature" annotation(Placement(
		transformation(extent={{150,-120},{170,-100}}),
		iconTransformation(
			origin={-25,125},
			extent={{-10,-10},{10,10}},
			rotation=90)));
	Modelica.Blocks.Interfaces.RealOutput HumidityAmb "Ambient air humidity (relative)" annotation(Placement(
		transformation(extent={{150,-140},{170,-120}}),
		iconTransformation(
			origin={-75,125},
			extent={{-10,-10},{10,10}},
			rotation=90)));
	Modelica.Blocks.Sources.RealExpression realExpression1(y=environmentConditions.TAmbient) annotation(Placement(transformation(extent={{110,-120},{130,-100}})));
	Modelica.Blocks.Sources.RealExpression realExpression2(y=environmentConditions.relHumidityAir) annotation(Placement(transformation(extent={{110,-140},{130,-120}})));
	Modelica.Blocks.Math.Gain gain1(k=-1) annotation(Placement(transformation(extent={{-40,-15},{-20,5}})));
	Modelica.Blocks.Math.Gain gain2(k=-1) annotation(Placement(transformation(extent={{-40,-40},{-20,-20}})));
	Modelica.Blocks.Math.Gain gain3(k=-1) annotation(Placement(transformation(extent={{-40,-65},{-20,-45}})));
	equation
		connect(extractVolumeFlow1.TMedium,TRet) annotation(Line(
			points={{10,70},{5,70},{-80,70},{-85,70}},
			color={0,0,127},
			thickness=0.0625));
		connect(TSup,defineVolumeFlow1.TMedium) annotation(Line(
			points={{-85,40},{-80,40},{5,40},{5,30},{10,30}},
			color={0,0,127},
			thickness=0.0625));
		connect(VWater,defineVolumeFlow1.qvMedium) annotation(Line(
			points={{-85,10},{-80,10},{5,10},{5,20},{10,20}},
			color={0,0,127},
			thickness=0.0625));
		connect(extractVolumeFlow1.Pipe,volumeFlowIn) annotation(Line(
			points={{30,65},{35,65},{65,65},{70,65}},
			color={190,30,45},
			thickness=0.0625));
		connect(defineVolumeFlow1.Pipe,volumeFlowOut) annotation(Line(
			points={{30,25},{35,25},{65,25},{70,25}},
			color={190,30,45}));
		connect(powerOutput1.LVGrid3,lV3Phase) annotation(Line(
			points={{30,-70},{35,-70},{65,-70},{70,-70}},
			color={247,148,29},
			thickness=0.0625));
		connect(QEl_phase[:],powerOutput1.Qout[:]) annotation(Line(
			points={{-85,-70},{-80,-70},{5,-70},{10,-70}},
			color={0,0,127},
			thickness=0.0625));
		connect(realExpression1.y,TAmb) annotation(Line(
			points={{131,-110},{136,-110},{155,-110},{160,-110}},
			color={0,0,127},
			thickness=0.0625));
		connect(realExpression2.y,HumidityAmb) annotation(Line(
			points={{131,-130},{136,-130},{155,-130},{160,-130}},
			color={0,0,127},
			thickness=0.0625));
		connect(PEl_phase[1],gain1.u) annotation(Line(
			points={{-85,-30},{-80,-30},{-47,-30},{-47,-5},{-42,-5}},
			color={0,0,127},
			thickness=0.0625));
		connect(PEl_phase[2],gain2.u) annotation(Line(
			points={{-85,-30},{-80,-30},{-47,-30},{-42,-30}},
			color={0,0,127},
			thickness=0.0625));
		connect(PEl_phase[3],gain3.u) annotation(Line(
			points={{-85,-30},{-80,-30},{-47,-30},{-47,-55},{-42,-55}},
			color={0,0,127},
			thickness=0.0625));
		connect(gain3.y,powerOutput1.Pout[3]) annotation(Line(
			points={{-19,-55},{-14,-55},{5,-55},{5,-60},{10,-60}},
			color={0,0,127},
			thickness=0.0625));
		connect(gain2.y,powerOutput1.Pout[2]) annotation(Line(
			points={{-19,-30},{-14,-30},{5,-30},{5,-60},{10,-60}},
			color={0,0,127},
			thickness=0.0625));
		connect(gain1.y,powerOutput1.Pout[1]) annotation(Line(
			points={{-19,-5},{-14,-5},{5,-5},{5,-60},{10,-60}},
			color={0,0,127},
			thickness=0.0625));
	annotation(
		Icon(
			coordinateSystem(extent={{-125,-125},{125,125}}),
			graphics={
				Text(
					textString="Green",
					fontSize=12,
					textStyle={
						TextStyle.Bold},
					lineColor={0,147,0},
					extent={{-103,146.5},{83.7,-33.5}}),
				Text(
					textString="City",
					fontSize=12,
					textStyle={
						TextStyle.Bold},
					lineColor={0,147,0},
					extent={{-163.4,59.6},{149.9,-57.1}}),
				Text(
					textString="Con.",
					fontSize=12,
					textStyle={
						TextStyle.Bold},
					lineColor={0,147,0},
					extent={{-179.8,-13.5},{176.8,-93.5}})}),
		Documentation(info="<HTML><HEAD>
<META http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\"> 
<TITLE>Adapter to Green City connectors</TITLE> 
<STYLE type=\"text/css\">
table>tbody>tr:hover,th{background-color:#edf1f3}html{font-size:90%}body,table{font-size:1rem}body{font-family:'Open Sans',Arial,sans-serif;color:#465e70}h1,h2{margin:1em 0 .6em;font-weight:600}p{margin-top:.3em;margin-bottom:.2em}table{border-collapse:collapse;margin:1em 0;width:100%;}tr{border:1px solid #beccd3}td,th{padding:.3em 1em; border-width: 1px; border-style: solid; border-color: rgb(190, 204, 211);}td{word-break:break-word}tr:nth-child(even){background-color:#fafafa}th{font-family:'Open Sans Semibold',Arial,sans-serif;font-weight:700;text-align:left;word-break:keep-all}.lib-wrap{width:70%}@media screen and (max-width:800px){.lib-wrap{width:100%}}td p{margin:.2em}
</STYLE>
 
<META name=\"GENERATOR\" content=\"MSHTML 11.00.10570.1001\"></HEAD> 
<BODY>
<H1>Adapter to Green City connectors</H1>
<HR>

<P>This adapter is designed to integrate general modelica models into the green 
city library and its ports for 'environment', 'electric' and 'thermal'.</P>
<DIV class=\"lib-wrap\">
<TABLE class=\"type\">
  <TBODY>
  <TR>
    <TH>Symbol:</TH>
    <TD colspan=\"3\"><IMG width=\"224\" height=\"195\" src=\"data:image/png;base64,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\"></TD></TR>
  <TR>
    <TH>Identifier:</TH>
    <TD 
      colspan=\"3\">CoSES_Models.HeatGenerator.LaboratoryModels.GreenCityConnector</TD></TR>
  <TR>
    <TH>Version:</TH>
    <TD colspan=\"3\">1.0</TD></TR>
  <TR>
    <TH>File:</TH>
    <TD colspan=\"3\">GreenCityConnector.mo</TD></TR>
  <TR>
    <TH>Connectors:</TH>
    <TD>Electrical Low-Voltage AC Three-Phase Connector</TD>
    <TD>lV3Phase</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Thermal Volume Flow Input Connector</TD>
    <TD>volumeFlowIn</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Thermal Volume Flow Output Connector</TD>
    <TD>volumeFlowOut</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Water flow</TD>
    <TD>VWater</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Supply temperature</TD>
    <TD>TSup</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Return temperature</TD>
    <TD>TRet</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Electric power of the three phases</TD>
    <TD>PEl_phase</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Reactive power of the three phases</TD>
    <TD>QEl_phase</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Environment Conditions Connector</TD>
    <TD>environmentConditions</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Ambient temperature</TD>
    <TD>TAmb</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Ambient air humidity (relative)</TD>
    <TD>HumidityAmb</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>Parameters:</TH>
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
    <TD>Variable effective and reactive power supply and consumption</TD>
    <TD>powerOutput1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Set output signal to a time varying Real expression</TD>
    <TD>realExpression1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Set output signal to a time varying Real expression</TD>
    <TD>realExpression2</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>Results:</TH>
    <TD>Water flow</TD>
    <TD>VWater</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Supply temperature</TD>
    <TD>TSup</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Return temperature</TD>
    <TD>TRet</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Electric power of the three phases</TD>
    <TD>PEl_phase</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Reactive power of the three phases</TD>
    <TD>QEl_phase</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Ambient temperature</TD>
    <TD>TAmb</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Ambient air humidity (relative)</TD>
    <TD>HumidityAmb</TD>
    <TD>&nbsp;</TD></TR></TBODY></TABLE></DIV>
<H2>Description:</H2>
<P>&nbsp;</P></BODY></HTML>
"),
		experiment(
			StopTime=1,
			StartTime=0,
			Tolerance=1e-06,
			Interval=0.001,
			__esi_SolverOptions(
				solver="CVODE",
				typename="ExternalCVODEOptionData"),
			__esi_MinInterval="9.999999999999999e-10",
			__esi_AbsTolerance="1e-6"));
end GreenCityConnector;
