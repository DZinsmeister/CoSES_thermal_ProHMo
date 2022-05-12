﻿// CP: 65001
// SimulationX Version: 4.2.3.69223
within CoSES_Models.HeatGenerator.DigitalTwins;
model WolfCGB14_GC "WolfCGB14 validated with CoSES mearusements"
	import CoSES_Models.HeatGenerator.GeneralModels.GeneratorExamples.*;
	import CoSES_Models.HeatGenerator.GeneralModels.*;
	parameter Boolean CBButton=true "On / off button of the CHP (if switched off, no power during idling, but doesn't react to commands from the control system)" annotation(Dialog(tab="Controller Configuration"));
	parameter Real DeltaT(quantity="Thermics.TempDiff")=20 "Temperature difference between flow and return temperature" annotation(Dialog(tab="Controller Configuration"));
	Modelica.Blocks.Interfaces.RealInput ControlIn "Input Signal, 0-10V" annotation(
		Placement(
			transformation(extent={{-100,65},{-60,105}}),
			iconTransformation(extent={{-245,5},{-205,45}})),
		Dialog(
			group="I/O",
			tab="Results",
			visible=false));
	Boolean CBon "Switch-on/off of CB" annotation(Dialog(
		group="I/O",
		tab="Results",
		visible=false));
	Real Modulation "Modulation of the condensing boiler" annotation(Dialog(
		group="I/O",
		tab="Results",
		visible=false));
	Real TFlow(quantity="Basics.Temp") "Flow temperature" annotation(Dialog(
		group="Temperature",
		tab="Results",
		visible=false));
	Real TReturn(quantity="Basics.Temp") "Return temperature" annotation(Dialog(
		group="Temperature",
		tab="Results",
		visible=false));
	Real qvFuel(quantity="Thermics.VolumeFlow") "Fuel consumption" annotation(Dialog(
		group="Fuel",
		__esi_groupCollapsed=true,
		tab="Results",
		visible=false));
	Real VFuel(quantity="Basics.Volume") "Demanded fuel volume" annotation(Dialog(
		group="Fuel",
		tab="Results",
		visible=false));
	Real PFuel(quantity="Basics.Power") "Gas power" annotation(Dialog(
		group="Fuel",
		tab="Results",
		visible=false));
	Real EFuel(quantity="Basics.Energy") "Fuel energy demand" annotation(Dialog(
		group="Fuel",
		tab="Results",
		visible=false));
	Real qv(quantity="Thermics.VolumeFlow") "Volume flow" annotation(Dialog(
		group="Heat",
		tab="Results",
		visible=false));
	Real QHeat(quantity="Basics.Power") "Heat output power of CB" annotation(Dialog(
		group="Heat",
		tab="Results",
		visible=false));
	Real EHeat(quantity="Basics.Energy") "Heat output" annotation(Dialog(
		group="Heat",
		tab="Results",
		visible=false));
	Real Efficiency(quantity="Basics.RelMagnitude") "Heating efficiency" annotation(Dialog(
		group="Heat",
		tab="Results",
		visible=false));
	Real PEl(quantity="Basics.Power") "Electric power consumption of the condensing boiler" annotation(Dialog(
		group="Electricity",
		tab="Results",
		visible=false));
	Real EEl(
		quantity="Basics.Energy",
		displayUnit="kWh") "Electric energy consumption of the condensing boiler" annotation(Dialog(
		group="Electricity",
		tab="Results",
		visible=false));
	GreenCity.Interfaces.Electrical.LV3Phase lV3Phase "Electrical Low-Voltage AC Three-Phase Connector" annotation(Placement(
		transformation(extent={{125,5},{145,25}}),
		iconTransformation(extent={{115,-231.7},{135,-211.7}})));
	GreenCity.Interfaces.Thermal.VolumeFlowIn Return "Thermal Volume Flow Input Connector" annotation(Placement(
		transformation(extent={{125,-45},{145,-25}}),
		iconTransformation(extent={{211.7,-35},{231.7,-15}})));
	GreenCity.Interfaces.Thermal.VolumeFlowOut Flow "Thermal Volume Flow Output Connector" annotation(Placement(
		transformation(extent={{125,-20},{145,0}}),
		iconTransformation(extent={{211.7,65},{231.7,85}})));
	LaboratoryModels.GreenCityConnector greenCityConnector1 "Adapter to Green City connectors" annotation(Placement(transformation(extent={{35,0},{60,25}})));
	GreenCity.Interfaces.Environment.EnvironmentConditions environmentConditions "Environment Conditions Connector" annotation(Placement(
		transformation(extent={{125,30},{145,50}}),
		iconTransformation(extent={{115,215},{135,235}})));
	LaboratoryModels.WolfCGB wolfCGB1(
		EffHeat_table(tableID "External table object"),
		StartUp_table(tableID "External table object"),
		CoolDown_table(tableID "External table object"),
		CBButton=CBButton,
		DeltaTSet=DeltaT,
		PHeat_table(tableID "External table object"),
		DeltaT_table(tableID "External table object")) annotation(Placement(transformation(extent={{-20,0},{10,30}})));
	Modelica.Blocks.Sources.BooleanExpression booleanExpression1(y=CBon) annotation(Placement(transformation(extent={{-75,15},{-55,35}})));
	Modelica.Blocks.Sources.RealExpression realExpression1(y=Modulation) annotation(Placement(transformation(extent={{-75,-5},{-55,15}})));
	equation
		// enter your equations here
		if ControlIn > 2 then
			CBon = true;
			Modulation = ControlIn / 10;
		else
			CBon = false;
			Modulation = 0;
		end if;
		
		TFlow = wolfCGB1.TSup;
		TReturn = wolfCGB1.TRet; 
		qvFuel = wolfCGB1.qvGas;
		VFuel = wolfCGB1.VGas;
		PFuel = wolfCGB1.PGas;
		EFuel = wolfCGB1.EGas;
		qv = wolfCGB1.qvWater;
		QHeat = wolfCGB1.PHeat;
		EHeat = wolfCGB1.EHeat;
		Efficiency = wolfCGB1.EffHeat;
		PEl = wolfCGB1.PEl;
		EEl = wolfCGB1.EEl;
	equation
		connect(greenCityConnector1.environmentConditions,environmentConditions) annotation(
			Line(
				points={{59.66667175292969,20},{64.7,20},{105,20},{105,40},{135,40}},
				color={192,192,192},
				thickness=0.0625),
			__esi_AutoRoute=false);
		connect(greenCityConnector1.volumeFlowIn,Return) annotation(
			Line(
				points={{59.66667175292969,5},{64.7,5},{100,5},{100,-35},{135,-35}},
				color={190,30,45},
				thickness=0.0625),
			__esi_AutoRoute=false);
		connect(greenCityConnector1.volumeFlowOut,Flow) annotation(
			Line(
				points={{59.66667175292969,10},{64.7,10},{105,10},{105,-10},{135,-10}},
				color={190,30,45}),
			__esi_AutoRoute=false);
		connect(greenCityConnector1.lV3Phase,lV3Phase) annotation(Line(
			points={{59.7,15},{64.7,15},{130,15},{135,15}},
			color={247,148,29},
			thickness=0.0625));
		connect(greenCityConnector1.TRet,wolfCGB1.TRet) annotation(Line(
			points={{35,15},{30,15},{14.7,15},{9.699999999999999,15}},
			color={0,0,127},
			thickness=0.0625));
		connect(wolfCGB1.TSup,greenCityConnector1.TSup) annotation(Line(
			points={{9.699999999999999,10},{14.7,10},{30,10},{35,10}},
			color={0,0,127},
			thickness=0.0625));
		connect(greenCityConnector1.VWater,wolfCGB1.qvWater) annotation(Line(
			points={{35,5},{30,5},{14.7,5},{9.699999999999999,5}},
			color={0,0,127},
			thickness=0.0625));
		connect(greenCityConnector1.QEl_phase[:],wolfCGB1.QEl_phase[:]) annotation(Line(
			points={{40,0.3},{40,-4.7},{5,-4.7},{5,0.3}},
			color={0,0,127},
			thickness=0.0625));
		connect(wolfCGB1.PEl_phase[:],greenCityConnector1.PEl_phase[:]) annotation(
			Line(
				points={{0,0.3333358764648438},{0,-10},{45,-10},{45,0.3333358764648438}},
				color={0,0,127},
				thickness=0.0625),
			__esi_AutoRoute=false);
		connect(wolfCGB1.CBOn,booleanExpression1.y) annotation(Line(
			points={{-20,25},{-25,25},{-49,25},{-54,25}},
			color={255,0,255},
			thickness=0.0625));
		connect(realExpression1.y,wolfCGB1.CBModulation) annotation(Line(
			points={{-54,5},{-49,5},{-25,5},{-25,15},{-20,15}},
			color={0,0,127},
			thickness=0.0625));
	annotation(
		Icon(
			coordinateSystem(extent={{-225,-225},{225,225}}),
			graphics={
							Bitmap(
								imageSource="iVBORw0KGgoAAAANSUhEUgAAADwAAAA8CAYAAAA6/NlyAAAABGdBTUEAALGPC/xhBQAAAAlwSFlz
AAAScQAAEnEB89x6jgAAACVJREFUaEPtwTEBAAAAwqD1T+1nCiAAAAAAAAAAAAAAAAAAgKsBOHwA
AQdXZHsAAAAASUVORK5CYII=",
								extent={{-100,-100},{100,100}}),
							Bitmap(
								imageSource="iVBORw0KGgoAAAANSUhEUgAAADwAAAA8CAYAAAA6/NlyAAAABGdBTUEAALGPC/xhBQAAAAlwSFlz
AAAScQAAEnEB89x6jgAAACVJREFUaEPtwTEBAAAAwqD1T+1nCiAAAAAAAAAAAAAAAAAAgKsBOHwA
AQdXZHsAAAAASUVORK5CYII=",
								extent={{-100,-100},{100,100}}),
							Bitmap(
								imageSource="iVBORw0KGgoAAAANSUhEUgAAAIcAAACHCAYAAAA850oKAAAABGdBTUEAALGPC/xhBQAAAAlwSFlz
AAAScQAAEnEB89x6jgAAAF5JREFUeF7twYEAAAAAw6D5Ux/gClUAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAwKsBHVoA
ARId0X4AAAAASUVORK5CYII=",
								extent={{-225,-225},{225,225}}),
							Rectangle(
								radius=4,
								fillColor={255,255,255},
								fillPattern=FillPattern.Solid,
								lineThickness=6,
								extent={{-220,223.3},{216.7,-220}}),
							Bitmap(
								imageSource="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
GoWqlVVALeftIC9NObnA7+Dv36Ka1luL1T6o2nQR5jVFVAyK1G9RoKaN34TvwGdMeYWT+IThyh87
sXS8JN5GqJgJ8/iNAHEAmXH+Ie+QhyK70BDZGaDwoMaBYAF4VM7SpUv1wYeAICIIiZk7d66W1OzZ
s2nWrFlaWjNmzNBB88svv2iZTZs2jaZOnUpTpkzR/PTTT+UgwEy+++47Db/+9ttv6ZtvvqHJkyfT
119/TV988YUW5scff0zvvfcevfPOO1qm4K233tJyfeONN+j111+n8ePHV4Al3K9fP+rcubOmY8eO
ujDg9RVXXKHp0qWLLhyge7duFejRvRtd2b17Ra68kq697lrqeXVPuvraa+i666+j9h07UKvLWjlp
06YNtW3bltq3b6d/Q6dOHanT5Z32/oa9v6NbV+qG71Xf2V19B1737NmTevToob8PJ53Ro0dXACef
Z599VjNmzBjN888/Ty+88IJm7Nix9PLLL+s8QZ5VxsSJEzXvvvsuvf/++/Thhx9q+ARm8umnn+rj
Y4MTnAscUxc43mDSpEnly3ByhHwQn5AahA/B8QlQZBcckZ0BggbC4xqT2RRBTQg1C7zHtQI0Rbi5
g3W4ecLLsC2G38cZms/efMa24e2YcFMI32uf/c2E97COnXjbSCjgrVu31qLp1KlTufDat2+vadeu
nQbvt20LIe1PWQFqX4F27dXyyztSGzVt31Ftq1MHOq7p8VS/QYaTzMx9ZCjqZ9bXJKcm7yMthVL2
kpqaSmlpadS4cWNq2LChrmm79hUJ+cDYifMIIE9c63AK9r6Z+PtcRJrwWT52LDZM0a8qsgsPkZ0B
BAehQUwsMBaVKRvMMyw21zL+jPmat2GDYK5sOcPLeJv2d/L6KCD8ffY2sBw1wosvvliJq62WXosW
LejSSy+lVq1a0WWXoZC0Lq91tWmnXlu0bqvWcYD3Wl7WUr9u0fIiOrHZiZSSriRV301KWpIiuQy1
XgqWKZLSkykxPYkSFPFpiZo4RUpKipZdkyZNKD09nYYMGbLfvrkw8wzwMp7nPDLFZGJvLxD2doPh
2oaJuT0cN4gNNTtMITY0Y0V2oSOyM0A/FWpwtkRCxQxkL7gCP1ogoTkGmV144YV05513quC/TfdN
op/yxhtvLG8uQnodO7VVTdwOdGmri2nQoP706GOj6IEH76X77x9Od919J93/wD109/A79bJbb7uZ
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
P0pIiKOjjjqCrrvuWpGdQmQXGiI7g1hqxmY0bKBrd8co6TU+5mg6rukJug8Pgmuqprg4AenhamyP
Hl2pa+dOeujJ3N9+pe1birTwNudvoK2q+bllSyEVFOTT1qJiKi1Q+Vei9LajlLbtUHm4u5R27t6q
mq6q9lawlkpzVE1y6SLas3aNrs3hAsXOnaW0bv0aLbt69WprqSUlx1OjRpkajKvD8rr1alFcfF1d
s0Oz9nbV5MbxENmJ7EJBZGcQG7IjGvHwKGp4dBMttYxGDXSTFdKD6DIaNaSTcaX2rDPp2BOOp7PP
OZPOO+8cOk9Nr+7WlaZ/9x3tVPlUoArV5vz1VLwZ//FqPRVtKVDLt9PO/B20p5Ro+Ypc2qqazNt3
btNN2t35ebR22k/0+fDhNOX2YVT4yut6IPGOHXh/F61dt0b32TVsmEENG2VQRkYa1a5zpJYd+u/i
4uvo/rxatY6gxo0bqOmRutBKzU5kFyoiO4NQZVcZtswixRX8UWPPDtWMfUw/ETgtM40yG2dQ42Mb
UZPjGtOxTY9VtTvU8I7X02ann0yXNG9Oox99hEbeew+1v7QlzZo+TQ8qzvrzD/pz1iw9yHjKN5Pp
+y+/pKy5i+jHz36kUiWf2T/+RMV5a2m3+k7asod2r9lCGwsLaP2KpbQ2ZzYVrZtPW7dspu3bSmjX
9m1UtHkTndj0eC023AubrkgDmQZpaYT/Q5GUlKSaunH6P76Vyc6xnwcBrmMP8J7ILvqI7AxiQXYY
5vvUs09Rcnoy1Y6rRekN0ig+OU7V6OpTYmqCmmZoAZ5yxil04ilNqfk5Z1HXyzvSwL69qVO7NvTZ
xx/S9J9+oGk/fk9zZv5Gc/FUkz/m69fZS+ZR1tKZtGTRL7Rq7i9UmL2IVq7Ops2r12nW562jksUr
aOfKPKJlK6mkqJBKS7bQDjz1JHuJvkCB5mog2YHk5GSKj48X2e1FZBcaIjuDWJBdYXEBPTH6capV
7yiq37A+jXhkBD039ll6YdwL9Mzzo+n1t1+n1vh/EE0a0PEnHUdnnaaatM1OopNPOI5a/Kc5nXPG
aXRVty7U6+qedEXH9nRV1y501x23Ucc2rem0ZsfS+c1PpGYnZdBlZ51El5x6omoSH08XnXUuXXxO
czr7jLOp0xnN6aHr+9KTAwfrfsCePbrSkJsG0Y0D++lbxRqpJmog2eGhnajdJSQkiOz2IrILDZGd
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
apddCYPi3AAAAABJRU5ErkJggg==",
								extent={{-214.7,-217},{212,216.3}}),
							Text(
								textString="DZ",
								fontSize=14,
								textStyle={
									TextStyle.Bold},
								lineColor={0,128,255},
								extent={{96.8,-133.8},{290.1,-280.4}})}),
		Documentation(info="<HTML><HEAD>
<META http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\"> 
<TITLE>WolfCGB14 validated with CoSES mearusements</TITLE> 
<STYLE type=\"text/css\">
table>tbody>tr:hover,th{background-color:#edf1f3}html{font-size:90%}body,table{font-size:1rem}body{font-family:'Open Sans',Arial,sans-serif;color:#465e70}h1,h2{margin:1em 0 .6em;font-weight:600}p{margin-top:.3em;margin-bottom:.2em}table{border-collapse:collapse;margin:1em 0;width:100%;}tr{border:1px solid #beccd3}td,th{padding:.3em 1em; border-width: 1px; border-style: solid; border-color: rgb(190, 204, 211);}td{word-break:break-word}tr:nth-child(even){background-color:#fafafa}th{font-family:'Open Sans Semibold',Arial,sans-serif;font-weight:700;text-align:left;word-break:keep-all}.lib-wrap{width:70%}@media screen and (max-width:800px){.lib-wrap{width:100%}}td p{margin:.2em}
</STYLE>
 
<META name=\"GENERATOR\" content=\"MSHTML 11.00.10570.1001\"></HEAD> 
<BODY>
<H1>WolfCGB14 validated with CoSES mearusements</H1>
<HR>

<DIV class=\"lib-wrap\">
<TABLE class=\"type\">
  <TBODY>
  <TR>
    <TH>Symbol:</TH>
    <TD colspan=\"3\"><IMG width=\"221\" height=\"290\" src=\"data:image/png;base64,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\"></TD></TR>
  <TR>
    <TH>Identifier:</TH>
    <TD colspan=\"3\">CoSES_Models.HeatGenerator.DigitalTwins.WolfCGB14_GC</TD></TR>
  <TR>
    <TH>Version:</TH>
    <TD colspan=\"3\">1.0</TD></TR>
  <TR>
    <TH>File:</TH>
    <TD colspan=\"3\">WolfCGB14_GC.mo</TD></TR>
  <TR>
    <TH>Connectors:</TH>
    <TD>Input Signal, 0-10V</TD>
    <TD>ControlIn</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
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
    <TH>Parameters:</TH>
    <TD>On / off button of the CHP (if switched off, no power during idling, 
      but doesn't react to commands from the control system)</TD>
    <TD>CBButton</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Temperature difference between flow and return temperature</TD>
    <TD>DeltaT</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Adapter to Green City connectors</TD>
    <TD>greenCityConnector1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Model of the condensing boiler based on measurements in the 
    laboratory</TD>
    <TD>wolfCGB1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Set output signal to a time varying Boolean expression</TD>
    <TD>booleanExpression1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Set output signal to a time varying Real expression</TD>
    <TD>realExpression1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>Results:</TH>
    <TD>Input Signal, 0-10V</TD>
    <TD>ControlIn</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Switch-on/off of CB</TD>
    <TD>CBon</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Modulation of the condensing boiler</TD>
    <TD>Modulation</TD>
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
    <TD>Fuel consumption</TD>
    <TD>qvFuel</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Demanded fuel volume</TD>
    <TD>VFuel</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Gas power</TD>
    <TD>PFuel</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Fuel energy demand</TD>
    <TD>EFuel</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Volume flow</TD>
    <TD>qv</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heat output power of CB</TD>
    <TD>QHeat</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heat output</TD>
    <TD>EHeat</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heating efficiency</TD>
    <TD>Efficiency</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Electric power consumption of the condensing boiler</TD>
    <TD>PEl</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Electric energy consumption of the condensing boiler</TD>
    <TD>EEl</TD>
    <TD>&nbsp;</TD></TR></TBODY></TABLE></DIV>
<H2>Description:</H2>
<P><FONT size=\"2\">The model represents the CGB14 condensing boiler from Wolf 
based on the modelica model WolfCGB.mo</FONT></P>
<P><FONT size=\"2\">The heat generator can be switched off&nbsp;completely by 
deactivating it via the parameter \"CBButton\". Otherwise,&nbsp;the 
condensing&nbsp;power&nbsp;runs in idling mode.</FONT></P>
<P>&nbsp;</P>
<P><FONT color=\"#465e70\" size=\"2\">Input/Control signals:</FONT></P>
<UL>
  <LI><FONT size=\"2\">0-10V signal (as from the heat generator)<BR>0-2V - 
  off<BR>2-10V - 20-100% modulation</FONT></LI></UL>
<P><FONT color=\"#465e70\" size=\"2\">Output signals:</FONT></P>
<UL>
  <LI><FONT color=\"#465e70\" size=\"2\">TSup - Supply temperature from the     
  condensing boiler </FONT></LI>
  <LI><FONT color=\"#465e70\" size=\"2\">qvWater - Water flow from the condensing    
   boiler </FONT></LI>
  <LI><FONT color=\"#465e70\" size=\"2\">PEl_phase - Electric power of the three     
  phases (only phase 1 is active)</FONT></LI>
  <LI><FONT color=\"#465e70\" size=\"2\">QEl_phase - reactive power of the three     
  phases (only phase 1 is active)</FONT></LI></UL><FONT color=\"#465e70\" 
size=\"2\"><FONT size=\"2\">
<P><FONT color=\"#465e70\"></FONT><SPAN lang=\"EN-US\" style='font-family: \"Calibri\",sans-serif; font-size: 11pt; mso-bidi-font-size: 10.0pt; mso-fareast-font-family: SimSun; mso-ansi-language: EN-US; mso-fareast-language: EN-US; mso-bidi-language: AR-SA;'><FONT 
color=\"#465e70\" face=\"Arial\" size=\"2\"></FONT> <FONT color=\"#000000\"><FONT color=\"#465e70\" 
face=\"Arial\" size=\"2\"></FONT> </FONT></SPAN>
<P><FONT color=\"#000000\"><FONT color=\"#465e70\" face=\"Arial\" size=\"2\">The 
condensing boiler is divided  in into four sections and based on measurements 
from the  CoSES  laboratory:</FONT></FONT></P>
<P></P><FONT color=\"#000000\">
<P></P><SPAN lang=\"EN-US\" style='font-family: \"Calibri\",sans-serif; font-size: 11pt; mso-bidi-font-size: 10.0pt; mso-fareast-font-family: SimSun; mso-ansi-language: EN-US; mso-fareast-language: EN-US; mso-bidi-language: AR-SA;'>
<P><FONT color=\"#465e70\" face=\"Arial\" size=\"2\"></FONT> </P>
<P></P>
<P></P><FONT color=\"#000000\">
<P><FONT color=\"#465e70\" face=\"Arial\" size=\"2\"></FONT> </P>
<UL><FONT color=\"#465e70\" face=\"Arial\" size=\"2\"></FONT>     
  <LI><SPAN lang=\"EN-US\" style=\"mso-bidi-font-size: 10.0pt;\"><FONT color=\"#465e70\" 
  face=\"Arial\" size=\"2\">Start-up   process: The   behavior is provided by a time 
      dependent look-up   table.</FONT></SPAN></LI><FONT color=\"#465e70\" face=\"Arial\" 
  size=\"2\"></FONT>     
  <LI><SPAN lang=\"EN-US\" style=\"mso-bidi-font-size: 10.0pt;\"><SPAN lang=\"EN-US\" 
  style=\"mso-bidi-font-size: 10.0pt;\"><SPAN lang=\"EN-US\" style=\"mso-bidi-font-size: 10.0pt;\"><SPAN 
  lang=\"EN-US\" style=\"mso-bidi-font-size: 10.0pt;\"><SPAN lang=\"EN-US\" style=\"mso-bidi-font-size: 10.0pt;\"><FONT 
  color=\"#465e70\" face=\"Arial\" size=\"2\">Steady-state:   The steady-state     
  efficiency depends on the return temperature and power   modulation and is     
  defined by a two-dimensional look-up table. Load changes   during steady-state 
      are modeled with a rising or falling       
  flank.</FONT></SPAN></SPAN></SPAN></SPAN></SPAN></LI><FONT color=\"#465e70\" 
  face=\"Arial\" size=\"2\"></FONT>     
  <LI><SPAN lang=\"EN-US\" style='font-family: \"Calibri\",sans-serif; font-size: 11pt; mso-bidi-font-size: 10.0pt;'><SPAN 
  lang=\"EN-US\" style='font-family: \"Calibri\",sans-serif; font-size: 11pt; mso-bidi-font-size: 10.0pt;'><SPAN 
  lang=\"EN-US\" style='font-family: \"Calibri\",sans-serif; font-size: 11pt; mso-bidi-font-size: 10.0pt;'><SPAN 
  lang=\"EN-US\" style='font-family: \"Calibri\",sans-serif; font-size: 11pt; mso-bidi-font-size: 10.0pt;'><FONT 
  color=\"#465e70\" face=\"Arial\" size=\"2\">Shut-down   process: Similar to the     
  start-up process, the shut-down process is provided by   a time dependent     
  look-up table.</FONT></SPAN></SPAN></SPAN></SPAN></LI></UL></FONT></SPAN>
<P></P></FONT>
<P></P></FONT>
<P></P></FONT>
<P></P></BODY></HTML>
"),
		experiment(
			StopTime=1,
			StartTime=0,
			Tolerance=1e-06,
			Interval=0.001,
			__esi_MinInterval="9.999999999999999e-10",
			__esi_AbsTolerance="1e-6"));
end WolfCGB14_GC;
