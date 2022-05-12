// CP: 65001
// SimulationX Version: 4.2.3.69223
within CoSES_Models.HeatGenerator.DigitalTwins;
model WolfBWS1_10_GC "WolfBWS1_10_GC"
	GreenCity.Interfaces.Electrical.LV3Phase lV3Phase "Electrical Low-Voltage AC Three-Phase Connector" annotation(Placement(
		transformation(extent={{75,-5},{95,15}}),
		iconTransformation(extent={{115,-231.7},{135,-211.7}})));
	GreenCity.Interfaces.Thermal.VolumeFlowIn Return "Thermal Volume Flow Input Connector" annotation(Placement(
		transformation(extent={{75,-55},{95,-35}}),
		iconTransformation(extent={{211.7,-35},{231.7,-15}})));
	GreenCity.Interfaces.Thermal.VolumeFlowOut Flow "Thermal Volume Flow Output Connector" annotation(Placement(
		transformation(extent={{75,-30},{95,-10}}),
		iconTransformation(extent={{211.7,65},{231.7,85}})));
	GreenCity.Interfaces.Environment.EnvironmentConditions environmentConditions "Environment Conditions Connector" annotation(Placement(
		transformation(extent={{75,20},{95,40}}),
		iconTransformation(extent={{115,215},{135,235}})));
	parameter Boolean HPButton=true "On / off button of the heat pump (if switched off, no power during idling, but doesn't react to commands from the control system)" annotation(Dialog(tab="Parameters"));
	parameter Real PAuxMax(quantity="Basics.Power")=6000 "Maximum power of the auxiliary heater" annotation(Dialog(
		group="Nominal Power and Efficiency",
		tab="Parameters"));
	parameter Real PHeatNom(quantity="Basics.Power")=10800 "Nominal heat output at B0/W35 (not maximum heat output)" annotation(Dialog(
		group="Nominal Power and Efficiency",
		tab="Parameters"));
	parameter Real COPNom=4.7 "Nominal COP at B0/W35" annotation(Dialog(
		group="Nominal Power and Efficiency",
		tab="Parameters"));
	parameter Boolean horizontalCollector=false "if true: horizontal collector, else downhole heat exchanger" annotation(Dialog(
		group="Ground Collector",
		tab="Parameters"));
	parameter Integer numberHE=1 "Number of independent heat exchangers" annotation(Dialog(
		group="Ground Collector",
		tab="Parameters"));
	parameter Real HoleDepth(
		quantity="Basics.Length",
		displayUnit="m")=6 "Depth of hole, for horizontal collectors: laying depth of heat collectors" annotation(Dialog(
		group="Ground Collector",
		tab="Parameters"));
	parameter Real rHole(
		quantity="Basics.Length",
		displayUnit="m")=0.3 "Radius of hole, for horizontal collectors: equivalent radius of the flat collector field" annotation(Dialog(
		group="Ground Collector",
		tab="Parameters"));
	Real TFlow(quantity="Basics.Temp") "Flow temperature" annotation(Dialog(
		group="Temperature",
		tab="Results",
		visible=false));
	Real TReturn(quantity="Basics.Temp") "Return temperature" annotation(Dialog(
		group="Temperature",
		tab="Results",
		visible=false));
	Real THPout(quantity="Basics.Temp") "Output temperature of the heat pump" annotation(Dialog(
		group="Temperature",
		tab="Results",
		visible=false));
	Real TSourceIn(quantity="Basics.Temp") "Source temperature (in)" annotation(Dialog(
		group="Temperature",
		tab="Results",
		visible=false));
	Real TSouceOut(quantity="Basics.Temp") "Source temperature (out)" annotation(Dialog(
		group="Temperature",
		tab="Results",
		visible=false));
	Real QHeat_HP(quantity="Basics.Power") "Heat output power of HP" annotation(Dialog(
		group="Power",
		tab="Results",
		visible=false));
	Real QHeat_Aux(quantity="Basics.Power") "Heat output of the auxiliary heating system" annotation(Dialog(
		group="Power",
		tab="Results",
		visible=false));
	Real PEl_HP(quantity="Basics.Power") "Electric consumption of the heat pump" annotation(Dialog(
		group="Power",
		tab="Results",
		visible=false));
	Real PEl_Aux(quantity="Basics.Power") "Electric consumption of the auxiliary heater" annotation(Dialog(
		group="Power",
		tab="Results",
		visible=false));
	Real COP "Coefficiency of Performance" annotation(Dialog(
		group="Efficiency",
		tab="Results",
		visible=false));
	Real EEl_HP(
		quantity="Basics.Energy",
		displayUnit="kWh") "Cumulated electric energy of the HP" annotation(Dialog(
		group="Energy",
		tab="Results",
		visible=false));
	Real EEl_Aux(quantity="Basics.Energy") "Cumulated electric energy of the auxiliary heater" annotation(Dialog(
		group="Energy",
		tab="Results",
		visible=false));
	Real EHeat_HP(quantity="Basics.Energy") "Cumulated heat energy of the HP" annotation(Dialog(
		group="Energy",
		tab="Results",
		visible=false));
	Real EHeat_Aux(quantity="Basics.Energy") "Cumulated heat energy of the auxiliary heater" annotation(Dialog(
		group="Energy",
		tab="Results",
		visible=false));
	Modelica.Blocks.Interfaces.BooleanInput HPOn "Heat pump on or off" annotation(
		Placement(
			transformation(extent={{-130,5},{-90,45}}),
			iconTransformation(extent={{-245,55},{-205,95}})),
		Dialog(
			group="Inputs",
			tab="Results",
			visible=false));
	Modelica.Blocks.Interfaces.RealInput HPAuxModulation(quantity="Basics.RelMagnitude") "Modulation of the auxiliary heater" annotation(
		Placement(
			transformation(extent={{-130,-25},{-90,15}}),
			iconTransformation(extent={{-245,-45},{-205,-5}})),
		Dialog(
			group="Inputs",
			tab="Results",
			visible=false));
	LaboratoryModels.GreenCityConnector greenCityConnector1 "Adapter to Green City connectors" annotation(Placement(transformation(extent={{15,-10},{40,15}})));
	LaboratoryModels.WolfBWS wolfBWS1(
		PElHeatFactor_table(tableID "External table object"),
		PHeatFactor_table(tableID "External table object"),
		HPButton=HPButton,
		PAuxMax(displayUnit="Nm/s")=PAuxMax,
		PHeatNom(displayUnit="Nm/s")=PHeatNom,
		COPNom=COPNom) annotation(Placement(transformation(extent={{-60,-15},{-30,15}})));
	GreenCity.Local.HeatExchangers.GroundCollector groundCollector1(
		numberHE=numberHE,
		horizontalCollector=horizontalCollector,
		rAffected=rHole+1,
		HoleDepth=HoleDepth,
		rHole=rHole) annotation(Placement(transformation(extent={{-10,10},{5,50}})));
	GreenCity.Interfaces.Thermal.DefineVolumeFlow defineVolumeFlow1 annotation(Placement(transformation(extent={{-35,80},{-15,100}})));
	GreenCity.Interfaces.Thermal.ExtractVolumeFlow extractVolumeFlow1 annotation(Placement(transformation(extent={{-15,55},{-35,75}})));
	equation
		// enter your equations here
		
		TFlow = wolfBWS1.TSup;
		TReturn = wolfBWS1.TRet;
		THPout = wolfBWS1.THP_out;
		TSourceIn = wolfBWS1.TSourceIn;
		TSouceOut = wolfBWS1.TSourceOut;
		QHeat_HP = wolfBWS1.PHeat_HP;
		QHeat_Aux = wolfBWS1.PHeat_Aux;
		PEl_HP = wolfBWS1.PEl_HP;
		PEl_Aux = wolfBWS1.PEl_Aux;
		COP = wolfBWS1.COP;
		EEl_HP = wolfBWS1.EEl_HP;
		EEl_Aux = wolfBWS1.EEl_Aux;
		EHeat_HP = wolfBWS1.EHeat_HP;
		EHeat_Aux = wolfBWS1.EHeat_Aux;
	equation
		connect(lV3Phase,greenCityConnector1.lV3Phase) annotation(Line(
			points={{85,5},{80,5},{44.7,5},{39.7,5}},
			color={247,148,29},
			thickness=0.0625));
		connect(Flow,greenCityConnector1.volumeFlowOut) annotation(
			Line(
				points={{85,-20},{80,-20},{70,-20},{70,0},{39.66667175292969,0}},
				color={190,30,45}),
			__esi_AutoRoute=false);
		connect(Return,greenCityConnector1.volumeFlowIn) annotation(
			Line(
				points={{85,-45},{80,-45},{65,-45},{65,-5},{39.66667175292969,-5}},
				color={190,30,45},
				thickness=0.0625),
			__esi_AutoRoute=false);
		connect(greenCityConnector1.environmentConditions,environmentConditions) annotation(
			Line(
				points={{39.66667175292969,10},{39.7,10},{70,10},{70,30},{85,30}},
				color={192,192,192},
				thickness=0.0625),
			__esi_AutoRoute=false);
		connect(wolfBWS1.TRet,greenCityConnector1.TRet) annotation(Line(
			points={{-30.3,5},{-25.3,5},{10,5},{15,5}},
			color={0,0,127},
			thickness=0.0625));
		connect(greenCityConnector1.VWater,wolfBWS1.VWater) annotation(Line(
			points={{15,-5},{10,-5},{-25.3,-5},{-30.3,-5}},
			color={0,0,127},
			thickness=0.0625));
		connect(wolfBWS1.TSup,greenCityConnector1.TSup) annotation(Line(
			points={{-30.3,0},{-25.3,0},{10,0},{15,0}},
			color={0,0,127},
			thickness=0.0625));
		connect(wolfBWS1.QEl_phase[:],greenCityConnector1.QEl_phase[:]) annotation(Line(
			points={{-35,-14.7},{-35,-19.7},{20,-19.7},{20,-14.7},{20,-9.699999999999999}},
			color={0,0,127},
			thickness=0.0625));
		connect(wolfBWS1.PEl_phase[:],greenCityConnector1.PEl_phase[:]) annotation(
			Line(
				points={{-40,-14.66666412353516},{-40,-25},{25,-25},{25,-14.7},{25,-9.666664123535156}},
				color={0,0,127},
				thickness=0.0625),
			__esi_AutoRoute=false);
		connect(HPOn,wolfBWS1.HPOn) annotation(Line(
			points={{-110,25},{-105,25},{-65,25},{-65,10},{-60,10}},
			color={255,0,255},
			thickness=0.0625));
		connect(HPAuxModulation,wolfBWS1.AUXModulation) annotation(Line(
			points={{-110,-5},{-105,-5},{-65,-5},{-60,-5}},
			color={0,0,127},
			thickness=0.0625));
		connect(defineVolumeFlow1.Pipe,groundCollector1.SourceIn) annotation(Line(
			points={{-15,90},{-10,90},{2.3,90},{2.3,55},{2.3,50}},
			color={190,30,45}));
		connect(wolfBWS1.VSource,defineVolumeFlow1.qvMedium) annotation(Line(
			points={{-45,15},{-45,20},{-45,85},{-40,85},{-35,85}},
			color={0,0,127},
			thickness=0.0625));
		connect(wolfBWS1.TSourceOut,defineVolumeFlow1.TMedium) annotation(Line(
			points={{-50,15},{-50,20},{-50,95},{-40,95},{-35,95}},
			color={0,0,127},
			thickness=0.0625));
		connect(extractVolumeFlow1.Pipe,groundCollector1.SourceOut) annotation(Line(
			points={{-15,65},{-10,65},{-7.3,65},{-7.3,55},{-7.3,50}},
			color={190,30,45},
			thickness=0.0625));
		connect(extractVolumeFlow1.TMedium,wolfBWS1.TSourceIn) annotation(Line(
			points={{-35,60},{-40,60},{-40,20},{-40,15}},
			color={0,0,127},
			thickness=0.0625));
		connect(environmentConditions,groundCollector1.EnvironmentConditions) annotation(Line(
			points={{85,30},{80,30},{12.3,30},{7.3,30}},
			color={192,192,192},
			thickness=0.0625));
	annotation(
		Icon(
			coordinateSystem(extent={{-225,-225},{225,225}}),
			graphics={
							Bitmap(
								imageSource="iVBORw0KGgoAAAANSUhEUgAAAIcAAACHCAYAAAA850oKAAAABGdBTUEAALGPC/xhBQAAAAlwSFlz
AAAScQAAEnEB89x6jgAAAF5JREFUeF7twYEAAAAAw6D5Ux/gClUAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAwKsBHVoA
ARId0X4AAAAASUVORK5CYII=",
								extent={{-225,-225},{225,225}}),
							Bitmap(
								imageSource="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
",
								extent={{-207.6,-225},{207.6,225}})}),
		Documentation(info="<HTML><HEAD>
<META http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\"> 
<TITLE>WolfBWS1_10_GC</TITLE> 
<STYLE type=\"text/css\">
table>tbody>tr:hover,th{background-color:#edf1f3}html{font-size:90%}body,table{font-size:1rem}body{font-family:'Open Sans',Arial,sans-serif;color:#465e70}h1,h2{margin:1em 0 .6em;font-weight:600}p{margin-top:.3em;margin-bottom:.2em}table{border-collapse:collapse;margin:1em 0;width:100%;}tr{border:1px solid #beccd3}td,th{padding:.3em 1em; border-width: 1px; border-style: solid; border-color: rgb(190, 204, 211);}td{word-break:break-word}tr:nth-child(even){background-color:#fafafa}th{font-family:'Open Sans Semibold',Arial,sans-serif;font-weight:700;text-align:left;word-break:keep-all}.lib-wrap{width:70%}@media screen and (max-width:800px){.lib-wrap{width:100%}}td p{margin:.2em}
</STYLE>
 
<META name=\"GENERATOR\" content=\"MSHTML 11.00.10570.1001\"></HEAD> 
<BODY>
<H1>WolfBWS1_10_GC</H1>
<HR>

<DIV class=\"lib-wrap\">
<TABLE class=\"type\">
  <TBODY>
  <TR>
    <TH>Symbol:</TH>
    <TD colspan=\"3\"><IMG width=\"259\" height=\"290\" src=\"data:image/png;base64,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\"></TD></TR>
  <TR>
    <TH>Identifier:</TH>
    <TD 
  colspan=\"3\">CoSES_Models.HeatGenerator.DigitalTwins.WolfBWS1_10_GC</TD></TR>
  <TR>
    <TH>Version:</TH>
    <TD colspan=\"3\">1.0</TD></TR>
  <TR>
    <TH>File:</TH>
    <TD colspan=\"3\">WolfBWS1_10_GC.mo</TD></TR>
  <TR>
    <TH>Connectors:</TH>
    <TD>Electrical Low-Voltage AC Three-Phase Connector</TD>
    <TD>lV3Phase</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Thermal Volume Flow Input Connector</TD>
    <TD>Return</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Thermal Volume Flow Output Connector</TD>
    <TD>Flow</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Environment Conditions Connector</TD>
    <TD>environmentConditions</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heat pump on or off</TD>
    <TD>HPOn</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Modulation of the auxiliary heater</TD>
    <TD>HPAuxModulation</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>Parameters:</TH>
    <TD>On / off button of the heat pump (if switched off, no power during 
      idling, but doesn't react to commands from the control system)</TD>
    <TD>HPButton</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Maximum power of the auxiliary heater</TD>
    <TD>PAuxMax</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Nominal heat output at B0/W35 (not maximum heat output)</TD>
    <TD>PHeatNom</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Nominal COP at B0/W35</TD>
    <TD>COPNom</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>if true: horizontal collector, else downhole heat exchanger</TD>
    <TD>horizontalCollector</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Number of independent heat exchangers</TD>
    <TD>numberHE</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Depth of hole, for horizontal collectors: laying depth of heat 
      collectors</TD>
    <TD>HoleDepth</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Radius of hole, for horizontal collectors: equivalent radius of the 
      flat collector field</TD>
    <TD>rHole</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Adapter to Green City connectors</TD>
    <TD>greenCityConnector1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Wolf Heatpump BWS</TD>
    <TD>wolfBWS1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Ground-coupled heat exchanger</TD>
    <TD>groundCollector1</TD>
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
    <TH>Results:</TH>
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
    <TD>Output temperature of the heat pump</TD>
    <TD>THPout</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Source temperature (in)</TD>
    <TD>TSourceIn</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Source temperature (out)</TD>
    <TD>TSouceOut</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heat output power of HP</TD>
    <TD>QHeat_HP</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heat output of the auxiliary heating system</TD>
    <TD>QHeat_Aux</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Electric consumption of the heat pump</TD>
    <TD>PEl_HP</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Electric consumption of the auxiliary heater</TD>
    <TD>PEl_Aux</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Coefficiency of Performance</TD>
    <TD>COP</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Cumulated electric energy of the HP</TD>
    <TD>EEl_HP</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Cumulated electric energy of the auxiliary heater</TD>
    <TD>EEl_Aux</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Cumulated heat energy of the HP</TD>
    <TD>EHeat_HP</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Cumulated heat energy of the auxiliary heater</TD>
    <TD>EHeat_Aux</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heat pump on or off</TD>
    <TD>HPOn</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Modulation of the auxiliary heater</TD>
    <TD>HPAuxModulation</TD>
    <TD>&nbsp;</TD></TR></TBODY></TABLE></DIV>
<H2>Description:</H2>
<P><FONT size=\"2\">The model is not completely validated with measurements  
yet.</FONT></P>
<P><FONT size=\"2\">The model represents the BWS1-10 heat pump from&nbsp;Wolf and 
is based  on the modelica WolfBWS.mo</FONT></P>
<P><FONT size=\"2\">The heat generator can be switched off&nbsp;completely by   
deactivating it via the parameter \"HPButton\". Otherwise,&nbsp;the heat pump runs 
 in idling mode.</FONT></P>
<P><FONT size=\"2\"><BR></FONT></P><FONT size=\"2\">
<P><FONT color=\"#465e70\" size=\"2\">Input/Control signals:</FONT></P>
<UL>
  <LI><FONT color=\"#465e70\" size=\"2\">HPOn - Boolean value to switch   
  the&nbsp;heat pump on or off, the heat pump has no modulation 
  option</FONT></LI>
  <LI>AUXModulation - Value of the modulation of the auxiliary heater - the aux. 
      heater can be&nbsp;controlled in&nbsp;4 stages: 0%,&nbsp;33%, 67%, 
  100%</LI></UL>
<P>The heat pump is devided into three sections and based on measurements from   
the CoSES laboratory:</P>
<UL>
  <LI>Start-up process: The     behavior is provided by a time   dependent   
  look-up     table.</LI>
  <LI>Steady-state process:&nbsp; The steady-state     efficiency depends on the 
    return temperature and power   modulation and is     defined by a   
  two-dimensional look-up table. Load changes   during steady-state     are   
  modeled with a rising or falling       flank.</LI>
  <LI>Shut-down process: Similar to the     start-up process, the shut-down   
  process is provided by   a time dependent     look-up table.</LI></UL></FONT>
<P><BR></P></BODY></HTML>
"),
		experiment(
			StopTime=1,
			StartTime=0,
			Tolerance=1e-06,
			Interval=0.001,
			__esi_MinInterval="9.999999999999999e-10",
			__esi_AbsTolerance="1e-6"));
end WolfBWS1_10_GC;
