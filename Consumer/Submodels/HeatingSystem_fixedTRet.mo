// CP: 65001
// SimulationX Version: 4.2.3.69223
within CoSES_Models.Consumer.Submodels;
model HeatingSystem_fixedTRet "Heating system with fixed return temperature"
	import GreenCity.GreenBuilding.HeatingSystem.*;
	import GreenCity.GreenBuilding.*;
	import GreenCity.*;
	GreenCity.Interfaces.Thermal.VolumeFlowIn HeatFlow "Flow pipe" annotation(Placement(
		transformation(extent={{25,40},{45,60}}),
		iconTransformation(extent={{-210,90},{-190,110}})));
	GreenCity.Interfaces.Thermal.VolumeFlowOut HeatReturn "Return pipe" annotation(Placement(
		transformation(extent={{25,-25},{45,-5}}),
		iconTransformation(extent={{-210,-110},{-190,-90}})));
	input Modelica.Blocks.Interfaces.RealInput TZone(
		quantity="Thermics.Temp",
		displayUnit="°C") "Temperature of heated zone" annotation(
		Placement(
			transformation(
				origin={210,-95},
				extent={{-20,-20},{20,20}},
				rotation=90),
			iconTransformation(
				origin={0,-200},
				extent={{-20,-20},{20,20}},
				rotation=90)),
		Dialog(
			group="Temperature",
			tab="Results",
			visible=false));
	protected
		Curve2D TOverLog(
			f={{0,0,0,0,0,0,0,0,0,0,0,
			0,0,0},{0,4.994998332,0,0,0,0,0,0,0,
			0,0,0,0,0},{0,7.213475204,9.994999165999999,0,0,0,0,
			0,0,0,0,0,0,0},{0,9.102392266000001,12.33151731,14.99499944,0,
			0,0,0,0,0,0,0,0,0},{0,10.82021281,14.42695041,
			17.38029748,19.99499958,0,0,0,0,0,0,0,0,0},{0,
			12.42669869,16.37035002,19.57615189,22.40710059,24.99499967,0,0,0,0,0,0,0,
			0},{0,13.95276566,18.20478453,21.64042561,24.66303462,27.42407474,29.99499972,0,0,0,0,
			0,0,0},{0,15.41695027,19.95589,23.60445002,26.80410439,29.72013412,32.43579597,34.99499976,0,
			0,0,0,0,0},{0,16.83144214,21.64042561,25.4886362,28.85390082,31.91464718,34.76059497,
			37.44437845,39.99499979,0,0,0,0,0},{0,18.20478453,23.2700791,27.3071768,30.82879328,
			34.02595056,36.99455194,39.79079143,42.45093508,44.99499981,0,0,0,0},{0,19.54325169,24.85339738,
			29.07042408,32.74070004,36.06737602,39.15230378,42.05509878,44.81420118,47.45610791,49.99499983,0,0,0},{0,
			20.85161957,26.39686192,30.78621092,34.59862441,38.04898211,41.2448825,44.24924394,47.10260403,49.83288655,52.46029344,54.99499985,0,
			0},{0,22.13362824,27.90553133,32.46063842,36.40956907,39.97858348,43.28085123,46.38249036,49.32606925,52.14089245,54.84814948,
			57.46374983,59.99499986,0},{0,23.39227472,29.38344697,34.09857192,38.17911105,41.86239758,45.26701724,48.46219689,51.49247692,
			54.38850217,57.1724203,59.86085297,62.46665243,64.99499987},{0,24.63000681,30.83390054,35.70396771,39.91178001,43.70546947,47.20890005,
			50.49432643,53.60820879,56.58249614,59.44026824,62.19883923,64.87159195,67.46912450000001},{0,25.84885611,32.25961713,37.28009607,41.61131605,
			45.51196133,49.11105006,52.48379204,55.67852029,58.72845567,61.65758656,64.48390199000001,67.22130177,69.88078998}},
			x(
				
				mono=1,
				interpol=3,
				extra=true,
				mirror=false,
				cycle=false)={0,5,10,15,20,25,30,35,40,45,
			50,55,60,65},
			y(
				
				mono=1,
				interpol=1,
				extra=true,
				mirror=false,
				cycle=false)={0,5,10,15,20,25,30,35,40,45,
			50,55,60,65,70,75}) "Logarithmic over temperature of heating system" annotation(
			Placement(transformation(extent={{-10,10},{10,30}})),
			Dialog(
				group="Temperature",
				tab="Results"));
	public
		GreenCity.Interfaces.Thermal.DefineVolumeFlow ToReturn "Specifies a Thermal Volume Flow Connector" annotation(Placement(transformation(extent={{100,-25},{80,-5}})));
		GreenCity.Interfaces.Thermal.ExtractVolumeFlow FromFlow annotation(Placement(transformation(extent={{80,40},{100,60}})));
		Real TFlowHeat(
			quantity="Thermics.Temp",
			displayUnit="°C") "Flow temperature of heating system" annotation(Dialog(
			group="Temperature",
			tab="Results",
			visible=false));
		Real TReturnHeat(
			quantity="Thermics.Temp",
			displayUnit="°C") "Return temperature of heating system" annotation(Dialog(
			group="Temperature",
			tab="Results",
			visible=false));
		output Modelica.Blocks.Interfaces.RealOutput QHeat(
			quantity="Basics.Power",
			displayUnit="kW") if not ConvRad "Heat power of heating system" annotation(
			Placement(
				transformation(extent={{310,-25},{330,-5}}),
				iconTransformation(extent={{190,-10},{210,10}})),
			Dialog(
				group="Heating Power",
				tab="Results",
				visible=false));
		Modelica.Blocks.Interfaces.RealOutput ConvectiveThermalLoad(
			quantity="Basics.Power",
			displayUnit="kW") if ConvRad "Convection heat" annotation(
			Placement(
				transformation(extent={{310,25},{330,45}}),
				iconTransformation(extent={{190,40},{210,60}})),
			Dialog(
				group="Heating Power",
				tab="Results",
				visible=false));
		Modelica.Blocks.Interfaces.RealOutput RadiantThermalLoad(
			quantity="Basics.Power",
			displayUnit="kW") if ConvRad "Radiation heat" annotation(
			Placement(
				transformation(extent={{310,-60},{330,-40}}),
				iconTransformation(extent={{190,-60},{210,-40}})),
			Dialog(
				group="Heating Power",
				tab="Results",
				visible=false));
		Real EHeat(
			quantity="Basics.Energy",
			displayUnit="kWh") "Heat output of heating system" annotation(Dialog(
			group="Energy",
			tab="Results",
			visible=false));
		Real qvHeat(
			quantity="Thermics.VolumeFlow",
			displayUnit="m³/h") "Volume flow of heating system" annotation(Dialog(
			group="Volume Flow",
			tab="Results",
			visible=false));
		parameter Boolean ConvRad=false "Seperate output of convection and radiation heat available" annotation(Dialog(
			group="Configuration",
			tab="Parameters"));
		parameter Real QHeatNorm(
			quantity="Thermics.HeatFlowSurf",
			displayUnit="W/m²")=50 "Normal installed heating power per AZone" annotation(Dialog(
			group="Heating System",
			tab="Parameters"));
		parameter Real n=1.1 "Heating system exponent" annotation(Dialog(
			group="Heating System",
			tab="Parameters"));
		parameter Real radiationShare(
			quantity="Basics.RelMagnitude",
			displayUnit="%")=0.59999999999999998 if ConvRad "Share of radiation heat" annotation(Dialog(
			group="Heating System",
			tab="Parameters"));
		parameter Real VHeatMedium(
			quantity="Geometry.Volume",
			displayUnit="l")=0.1 "Volume of heating system" annotation(Dialog(
			group="Heating System",
			tab="Parameters"));
		parameter Real TFlowHeatNorm(
			quantity="Thermics.Temp",
			displayUnit="°C")=308.14999999999998 "Normal flow temperature of heating system" annotation(Dialog(
			group="Heating System",
			tab="Parameters"));
		parameter Real TReturnHeatNorm(
			quantity="Thermics.Temp",
			displayUnit="°C")=301.14999999999998 "Normal return temperature of heating system" annotation(Dialog(
			group="Heating System",
			tab="Parameters"));
		parameter Real TZoneNorm(
			quantity="Thermics.Temp",
			displayUnit="°C")=293.14999999999998 "Normal zone temperature for heating system" annotation(Dialog(
			group="Heating System",
			tab="Parameters"));
		parameter Real TReturnHeatInit(
			quantity="Thermics.Temp",
			displayUnit="°C")=303.14999999999998 "Initial return temperature of heating system" annotation(Dialog(
			group="Initial Temperatures",
			tab="Parameters"));
		parameter Real cpMed(
			quantity="Thermodynamics.SpecHeatCapacity",
			displayUnit="kJ/(kg·K)")=4177 "Specific heat capacity of heating medium" annotation(Dialog(
			group="Heating Medium",
			tab="Parameters"));
		parameter Real rhoMed(
			quantity="Basics.Density",
			displayUnit="kg/m³")=1000 "Density of heating medium" annotation(Dialog(
			group="Heating Medium",
			tab="Parameters"));
		parameter Real AZone(
			quantity="Geometry.Area",
			displayUnit="m²")=100 "Net floor space of the heated building zone" annotation(Dialog(
			group="Zone",
			tab="Parameters"));
	initial equation
		if ConvRad then
			assert(radiationShare>=0 and radiationShare<=1, "Radiation share out if limits");
		end if;
		EHeat=0;
		TReturnHeat=TReturnHeatInit;
		TFlowHeat=FromFlow.TMedium;
		qvHeat=FromFlow.qvMedium;
	equation
		TFlowHeat=FromFlow.TMedium;
		qvHeat=FromFlow.qvMedium;
		//cpMed*rhoMed*VHeatMedium*der(TReturnHeat-TZone)=-abs(((TOverLog(min(max((TReturnHeat-TZone),0),65),min(max((TFlowHeat-TZone),5),75)))/(TOverLog(min(max((TReturnHeatNorm-TZoneNorm),5),55),min(max((TFlowHeatNorm-TZoneNorm),5),75)))))^n*QHeatNorm*AZone+cpMed*rhoMed*qvHeat*(TFlowHeat-TReturnHeat);
		TReturnHeat = TReturnHeatInit;
		ToReturn.TMedium=TReturnHeat;
		ToReturn.qvMedium=qvHeat;		
		
		if ConvRad then
			ConvectiveThermalLoad=(1-radiationShare)*cpMed*rhoMed*qvHeat*(TFlowHeat-TReturnHeat);
			RadiantThermalLoad=radiationShare*cpMed*rhoMed*qvHeat*(TFlowHeat-TReturnHeat);
			der(EHeat)=ConvectiveThermalLoad+RadiantThermalLoad;
		else
			QHeat=cpMed*rhoMed*qvHeat*(TFlowHeat-TReturnHeat);
			der(EHeat)=QHeat;
		end if;
	equation
		connect(ToReturn.Pipe,HeatReturn) annotation(Line(
			points={{80,-15},{75,-15},{40,-15},{35,-15}},
			color={190,30,45}));
		connect(FromFlow.Pipe,HeatFlow) annotation(Line(
			points={{80,50},{75,50},{40,50},{35,50}},
			color={190,30,45}));
	annotation(
		Icon(
			coordinateSystem(extent={{-200,-200},{200,200}}),
			graphics={
				Bitmap(
					imageSource="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
YII=",
					extent={{-197,200},{197,-203}}),
				Text(
					textString="DZ",
					fontSize=12,
					textStyle={
						TextStyle.Bold},
					lineColor={0,128,255},
					extent={{69,-116.7},{282.3,-250}})}),
		Documentation(info="<HTML><HEAD>
<META http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\"> 
<TITLE>Heating system with fixed return temperature</TITLE> 
<STYLE type=\"text/css\">
table>tbody>tr:hover,th{background-color:#edf1f3}html{font-size:90%}body,table{font-size:1rem}body{font-family:'Open Sans',Arial,sans-serif;color:#465e70}h1,h2{margin:1em 0 .6em;font-weight:600}p{margin-top:.3em;margin-bottom:.2em}table{border-collapse:collapse;margin:1em 0;width:100%;}tr{border:1px solid #beccd3}td,th{padding:.3em 1em; border-width: 1px; border-style: solid; border-color: rgb(190, 204, 211);}td{word-break:break-word}tr:nth-child(even){background-color:#fafafa}th{font-family:'Open Sans Semibold',Arial,sans-serif;font-weight:700;text-align:left;word-break:keep-all}.lib-wrap{width:70%}@media screen and (max-width:800px){.lib-wrap{width:100%}}td p{margin:.2em}
</STYLE>
  
<META name=\"GENERATOR\" content=\"MSHTML 11.00.10570.1001\"></HEAD> 
<BODY>
<H1>Heating system with fixed return temperature</H1>
<P>Based on GreenCity's 'Heating System'</P>
<P><BR></P>
<P>Changes:</P>
<UL>
  <LI>Return temperature is defined by fixed parameter, not by parameters of the 
    heating system<BR></LI></UL>
<HR>

<DIV class=\"lib-wrap\">
<TABLE class=\"type\">
  <TBODY>
  <TR>
    <TH>Symbol:</TH>
    <TD colspan=\"3\"><IMG width=\"215\" height=\"159\" src=\"data:image/png;base64,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\"></TD></TR>
  <TR>
    <TH>Identifier:</TH>
    <TD 
  colspan=\"3\">CoSES_Models.Consumer.Submodels.HeatingSystem_fixedTRet</TD></TR>
  <TR>
    <TH>Version:</TH>
    <TD colspan=\"3\">1.0</TD></TR>
  <TR>
    <TH>File:</TH>
    <TD colspan=\"3\">HeatingSystem_fixedTRet.mo</TD></TR>
  <TR>
    <TH>Connectors:</TH>
    <TD>Flow pipe</TD>
    <TD>HeatFlow</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Return pipe</TD>
    <TD>HeatReturn</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Temperature of heated zone</TD>
    <TD>TZone</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heat power of heating system</TD>
    <TD>QHeat</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>Parameters:</TH>
    <TD>Specifies a Thermal Volume Flow Connector</TD>
    <TD>ToReturn</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Extracts the characteristics of a Thermal Volume Flow Connector</TD>
    <TD>FromFlow</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Seperate output of convection and radiation heat available</TD>
    <TD>ConvRad</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Normal installed heating power per AZone</TD>
    <TD>QHeatNorm</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heating system exponent</TD>
    <TD>n</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Share of radiation heat</TD>
    <TD>radiationShare</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Volume of heating system</TD>
    <TD>VHeatMedium</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Normal flow temperature of heating system</TD>
    <TD>TFlowHeatNorm</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Normal return temperature of heating system</TD>
    <TD>TReturnHeatNorm</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Normal zone temperature for heating system</TD>
    <TD>TZoneNorm</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Initial return temperature of heating system</TD>
    <TD>TReturnHeatInit</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Specific heat capacity of heating medium</TD>
    <TD>cpMed</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Density of heating medium</TD>
    <TD>rhoMed</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Net floor space of the heated building zone</TD>
    <TD>AZone</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>Results:</TH>
    <TD>Temperature of heated zone</TD>
    <TD>TZone</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Flow temperature of heating system</TD>
    <TD>TFlowHeat</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Return temperature of heating system</TD>
    <TD>TReturnHeat</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heat power of heating system</TD>
    <TD>QHeat</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Convection heat</TD>
    <TD>ConvectiveThermalLoad</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Radiation heat</TD>
    <TD>RadiantThermalLoad</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heat output of heating system</TD>
    <TD>EHeat</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Volume flow of heating system</TD>
    <TD>qvHeat</TD>
    <TD>&nbsp;</TD></TR></TBODY></TABLE></DIV>
<H2>Description:</H2>
<P>From 'Heating System':</P>
<P><BR></P>
<P>The <EM>heating system</EM> model corresponds to the Green Building,<EM> 
building zone</EM> model. It characterizes the heat input of a <EM>building  
 zone</EM> depending on flow, return, zone temperature and  further heating 
 system parameters. Always   connect the corresponding indoor temperature output 
 to the zone  temperature input to avoid numerical difficulties. Use 
<EM>Modelica  real  expressions</EM> to model unheated <EM>building zones</EM>. 
In such a  case, define the  constant heat power as 0 W.</P>
<P></P>
<P>The heating system exponent (n)  describes the nominal share between 
 radiation and convection. It is highly dependent  on geometrical heating system 
 characteristics. The following parameter  values can be used as a basic input 
 set, if no further information is  available.</P>
<P></P>
<UL>
  <LI value=\"1\">n=1.00 .. 1.10: floor  heating</LI>
  <LI value=\"2\">n=1.20 .. 1.30: panel  radiator</LI>
  <LI value=\"3\">n=1.25:  ribbed radiator</LI>
  <LI value=\"4\">n=1.3:radiator</LI>
  <LI value=\"5\">n=1.25  .. 1.45: convector</LI></UL>
<P></P>
<P>The normal temperature  characteristics (i.e. flow, return, zone) mainly 
 depend on heating system type and  the building's year of construction. The 
 nominal zone temperature is  always about 20°C. The following parameter values 
 can be used as default  values for nominal flow and return temperatures, if no 
 further information is  available:</P>
<P></P>
<UL>
  <LI value=\"1\">flow: 90  °C, return: 70  °C (old buildings, former   
  standard)</LI>
  <LI value=\"2\">flow: 76  °C, return: 65  °C (old buildings, new standard)</LI>
  <LI value=\"3\">flow: 70  °C, return: 55/50 °C (low  temperature)</LI>
  <LI value=\"4\">flow: 60/55 °C, return: 45  °C (condensing effect)</LI>
  <LI value=\"5\">flow: 45/35 °C, return:  35/28 °C (floor heating)</LI></UL>
<P></P>
<P>The heating medium's volume  is closely connected to system type and 
 geometrical  characteristics. A sufficient parameter definition is required to 
 avoid  numerical difficulties. Note if no further information is available, a 
 heating  medium volume of about 100 l to 150 l per 100 m2 net floor space area  
(equal to floor heating system) is feasible. The installed normal  heating 
 power is defined as heat power per m2 net floor space area. Parameter  values 
 between 15 W/m2 and 300 W/m2 are valid. </P>
<P></P>
<P>The user can additionally, define if  the model output shall be the overall 
 heat output (QHeat) or if this result  should be divided into convection 
 (ConvectiveThermalLoad) and radiation  (RadiantThermalLoad)&nbsp; heating 
 shares. In such a case use the boolean configuration variable  ConvRad. If this 
 value is set to true, another parameter is made available namely, radiation 
 share.  </P>
<P></P>
<P>This parameter defines the constant share of heat radiation regarding the 
 overall heat output.   This value highly depends on geometrical system and  
building characteristics. If no further information is available, use  following 
default values dependent on previously described characteristics.</P>
<P></P>
<UL>
  <LI value=\"1\">ceiling  heating:92%</LI>
  <LI value=\"2\">wall  heating: 69%</LI>
  <LI value=\"3\">floor  heating: 50% - 69%</LI>
  <LI value=\"4\">panel radiators:  40% - 50%</LI>
  <LI value=\"5\">ribbed  radiators: 20% - 30%</LI>
  <LI value=\"6\">convectors:  10%</LI></UL></BODY></HTML>
"),
		experiment(
			StopTime=1,
			StartTime=0,
			Interval=0.002,
			__esi_MaxInterval="0.002"));
end HeatingSystem_fixedTRet;
