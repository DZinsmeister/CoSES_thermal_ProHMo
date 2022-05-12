// CP: 65001
// SimulationX Version: 4.2.3.69223
within CoSES_Models.Consumer;
model DHW_demand "DHW_demand"
	GreenCity.Interfaces.Thermal.VolumeFlowIn FlowHotWater "Flow pipe of hot water supply" annotation(Placement(
		transformation(extent={{-120,30},{-100,50}}),
		iconTransformation(extent={{-110,40},{-90,60}})));
	GreenCity.Interfaces.Thermal.VolumeFlowOut ReturnHotWater "Return pipe of hot water supply" annotation(Placement(
		transformation(extent={{-120,-5},{-100,15}}),
		iconTransformation(extent={{-110,-60},{-90,-40}})));
	GreenCity.Interfaces.Environment.EnvironmentConditions EnvironmentConditions "Environment Conditions Connector" annotation(Placement(
		transformation(extent={{90,75},{110,95}}),
		iconTransformation(extent={{86.7,40},{106.7,60}})));
	Modelica.Blocks.Interfaces.RealOutput TRef(quantity="Basics.Temp") "Reference Temperature" annotation(Placement(
		transformation(
			origin={-50,100},
			extent={{-10,-10},{10,10}},
			rotation=90),
		iconTransformation(
			origin={-50,100},
			extent={{-10,-10},{10,10}},
			rotation=90)));
	Modelica.Blocks.Interfaces.RealOutput qv_DHW(
		quantity="Pneumatics.Flow",
		displayUnit="l/h") "DHW Flow" annotation(
		Placement(
			transformation(
				origin={150,5},
				extent={{-10,-10},{10,10}}),
			iconTransformation(
				origin={0,100},
				extent={{-10,-10},{10,10}},
				rotation=-270)),
		Dialog(
			group="Volume Flow",
			tab="Results",
			visible=false));
	GreenCity.Interfaces.Thermal.ExtractVolumeFlow FromFlow "Hot water output" annotation(Placement(transformation(extent={{15,30},{35,50}})));
	GreenCity.Interfaces.Thermal.DefineVolumeFlow ToReturn "Cold water return" annotation(Placement(transformation(extent={{35,-5},{15,15}})));
	Modelica.Blocks.Tables.CombiTable1D Load(
		tableOnFile=true,
		tableName=Table,
		fileName=File) "DHW Load" annotation(Placement(transformation(extent={{-15,-40},{5,-20}})));
	Real qv_Set "Parameter" annotation(Dialog(
		group="Volume Flow",
		tab="Results",
		visible=false));
	Real VHotWater(
		quantity="Geometry.Volume",
		displayUnit="l") "Hot water volume" annotation(Dialog(
		group="Volume Flow",
		tab="Results",
		visible=false));
	Modelica.Blocks.Interfaces.RealInput TPipe(quantity="Basics.Temp") "Temperature of the pipe between storage and freshwaterstation or within the outlet layer of the DHW storage" annotation(
		Placement(
			transformation(
				origin={50,100},
				extent={{-20,-20},{20,20}},
				rotation=-90),
			iconTransformation(
				origin={50,100},
				extent={{-20,-20},{20,20}},
				rotation=-90)),
		Dialog(
			group="Temperature",
			tab="Results",
			visible=false));
	Modelica.Blocks.Interfaces.RealInput TColdWater(quantity="Basics.Temp") "Cold water temperature" annotation(
		Placement(
			transformation(
				origin={50,-97},
				extent={{-20,-19.7},{20,20.3}},
				rotation=90),
			iconTransformation(
				origin={50,-97},
				extent={{-20,-19.7},{20,20.3}},
				rotation=90)),
		Dialog(
			group="Temperature",
			tab="Results",
			visible=false));
	Real THotWaterIs(
		quantity="Basics.Temp",
		displayUnit="kW") "Hot water temperature at inlet (minus losses within the valves)" annotation(Dialog(
		group="Temperature",
		tab="Results",
		visible=false));
	Boolean T_fail "Too low flow temperature, cannot provide warm enough DHW" annotation(Dialog(
		group="Temperature",
		tab="Results",
		visible=false));
	Real Q_DHWset(quantity="Basics.Power") "Heat power at set temperature difference = qv_DHW*rho*cp*(THotWaterSet-TColdWater)" annotation(Dialog(
		group="Power and Energy",
		tab="Results",
		visible=false));
	Real E_DHWset(
		quantity="Basics.Energy",
		displayUnit="kWh") "Heat energy at set temperature difference" annotation(Dialog(
		group="Power and Energy",
		tab="Results",
		visible=false));
	Real E_missing(
		quantity="Basics.Energy",
		displayUnit="kWh") "Missing Heat power domestic hot water" annotation(Dialog(
		group="Power and Energy",
		tab="Results",
		visible=false));
	Real Q_missing(quantity="Basics.Power") "Missing heat output for hot domestic hot water" annotation(Dialog(
		group="Power and Energy",
		tab="Results",
		visible=false));
	Real Q_DHW(
		quantity="Basics.Power",
		displayUnit="kW") "Heat power domestic hot water" annotation(Dialog(
		group="Power and Energy",
		tab="Results",
		visible=false));
	Real E_DHW(
		quantity="Basics.Energy",
		displayUnit="kWh") "Heat output for hot domestic hot water" annotation(Dialog(
		group="Power and Energy",
		tab="Results",
		visible=false));
	parameter Boolean WeeklyData(quantity="Basics.Real")=true "Data repeats weekly" annotation(Dialog(tab="Input Data"));
	parameter Boolean DataType=true "If true: DHW consumption as Volume Flow, else: DHW consumption as Power" annotation(Dialog(tab="Input Data"));
	parameter String File=classDirectory()+"Data\\DHW Load Profiles\\DHW_wholeyear_250l.txt" "DHW Data File" annotation(Dialog(tab="Input Data"));
	parameter String Table="V_DHW" "DHW Table Name" annotation(Dialog(tab="Input Data"));
	parameter Real DeltaT(quantity="Thermodynamics.TempDiff")=1 "Accepted lower tolerance for T_DHW" annotation(Dialog(tab="Input Data"));
	parameter Real DHWfactor=1 "Factor, with which the DHW demand gets multiplied" annotation(Dialog(tab="Input Data"));
	parameter Real THotWaterSet(
		quantity="Thermics.Temp",
		displayUnit="°C")=318.15 "Hot water set temperature" annotation(Dialog(
		group="Water Properties",
		tab="Input Data"));
	parameter Real cpWater(
		quantity="Thermics.SpecHeatCapacity",
		displayUnit="kJ/(kg·K)")=4177 "Specific heat capacity of hot water" annotation(Dialog(
		group="Water Properties",
		tab="Input Data"));
	parameter Real rhoWater(
		quantity="Basics.Density",
		displayUnit="kg/m³")=1000 "Density of hot water" annotation(Dialog(
		group="Water Properties",
		tab="Input Data"));
	initial equation
		E_DHW=0;
		E_missing=0;
		E_DHWset=0;
		VHotWater=0;
		assert(Load.y[1]>=0,"Load Data must be greater 0",AssertionLevel.warning);
	equation
		THotWaterIs = FromFlow.TMedium;
		
		if WeeklyData then
			Load.u[1] = rem(EnvironmentConditions.HourOfYear * 3600, 604800);
		else
			Load.u[1] = rem(EnvironmentConditions.HourOfYear * 3600, 31536000);
		end if;
		
		if DataType then
			qv_Set = Load.y[1] / 3600000 * DHWfactor;
			Q_DHW = qv_Set * cpWater * rhoWater * (THotWaterSet - TColdWater);
		else
			Q_DHW = Load.y[1] * DHWfactor;
			qv_Set = Q_DHW / (cpWater * rhoWater * (max(1, THotWaterSet - TColdWater)));
		end if;
		
		if qv_Set > 0 then
			if (TPipe > (THotWaterSet - DeltaT)) and (THotWaterIs > TColdWater) then
				qv_DHW = abs(Q_DHW / (cpWater * rhoWater * (THotWaterIs - TColdWater)));
				T_fail = false;
				Q_missing = 0;
			else
				qv_DHW = abs(Q_DHW / (cpWater * rhoWater * (max(1, THotWaterSet - DeltaT - TColdWater))));
				T_fail = true;
				Q_missing = Q_DHW * (THotWaterSet - THotWaterIs) / max(1,(THotWaterSet - TColdWater));
			end if;
		else
			qv_DHW = 0;
			T_fail = false;
			Q_missing = 0;
		end if;
		
		TRef = THotWaterSet;
		ToReturn.qvMedium = qv_DHW;
		ToReturn.TMedium = TColdWater;
		Q_DHWset = qv_Set * cpWater * rhoWater * (THotWaterSet - TColdWater);
		der(E_DHWset) = Q_DHWset;
		der(E_DHW) = Q_DHW;
		der(E_missing) = Q_missing;
		der(VHotWater) = qv_DHW;
	equation
		connect(ToReturn.Pipe,ReturnHotWater) annotation(Line(
			points={{15,5},{10,5},{-105,5},{-110,5}},
			color={190,30,45}));
		connect(FromFlow.Pipe,FlowHotWater) annotation(Line(
			points={{15,40},{10,40},{-105,40},{-110,40}},
			color={190,30,45},
			thickness=0.0625));
	annotation(
		Icon(graphics={
						Bitmap(
							imageSource="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",
							extent={{-100,100},{100,-100}}),
						Text(
							textString="DZ",
							fontSize=12,
							textStyle={
								TextStyle.Bold},
							lineColor={0,128,255},
							extent={{-102.5,23.1},{247.5,-190.2}})}),
		Documentation(info="<HTML><HEAD>
<META http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\"> 
<TITLE>DHW_demand</TITLE> 
<STYLE type=\"text/css\">
table>tbody>tr:hover,th{background-color:#edf1f3}html{font-size:90%}body,table{font-size:1rem}body{font-family:'Open Sans',Arial,sans-serif;color:#465e70}h1,h2{margin:1em 0 .6em;font-weight:600}p{margin-top:.3em;margin-bottom:.2em}table{border-collapse:collapse;margin:1em 0;width:100%;}tr{border:1px solid #beccd3}td,th{padding:.3em 1em; border-width: 1px; border-style: solid; border-color: rgb(190, 204, 211);}td{word-break:break-word}tr:nth-child(even){background-color:#fafafa}th{font-family:'Open Sans Semibold',Arial,sans-serif;font-weight:700;text-align:left;word-break:keep-all}.lib-wrap{width:70%}@media screen and (max-width:800px){.lib-wrap{width:100%}}td p{margin:.2em}
</STYLE>
  
<META name=\"GENERATOR\" content=\"MSHTML 11.00.10570.1001\"></HEAD> 
<BODY>
<H1>DHW_demand</H1>
<HR>

<P>DHW_demand calculates the domestic hot water consumption based on a time 
series input file.</P>
<P>The user can create a consumption file based with the consumption as water 
flow rate or domestic hot water power consumption (DataType).</P>
<P>If the temperature is below a certain setpoint and too cold to be used, a 
warning is generated (T_fail) and the amount of heat, that was not provided is 
calculated (Q_missing / E_missing).</P>
<DIV class=\"lib-wrap\">
<TABLE class=\"type\">
  <TBODY>
  <TR>
    <TH>Symbol:</TH>
    <TD colspan=\"3\"><IMG width=\"247\" height=\"163\" src=\"data:image/png;base64,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\"></TD></TR>
  <TR>
    <TH>Identifier:</TH>
    <TD colspan=\"3\">CoSES_Models.Consumer.DHW_demand</TD></TR>
  <TR>
    <TH>Version:</TH>
    <TD colspan=\"3\">1.0</TD></TR>
  <TR>
    <TH>File:</TH>
    <TD colspan=\"3\">DHW_demand.mo</TD></TR>
  <TR>
    <TH>Connectors:</TH>
    <TD>Flow pipe of hot water supply</TD>
    <TD>FlowHotWater</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Return pipe of hot water supply</TD>
    <TD>ReturnHotWater</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Environment Conditions Connector</TD>
    <TD>EnvironmentConditions</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Reference Temperature</TD>
    <TD>TRef</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>DHW Flow</TD>
    <TD>qv_DHW</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Temperature of the pipe between storage and freshwaterstation or       
      within the outlet layer of the DHW storage</TD>
    <TD>TPipe</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Cold water temperature</TD>
    <TD>TColdWater</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>Parameters:</TH>
    <TD>Hot water output</TD>
    <TD>FromFlow</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Cold water return</TD>
    <TD>ToReturn</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>DHW Load</TD>
    <TD>Load</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Data repeats weekly</TD>
    <TD>WeeklyData</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>If true: DHW consumption as Volume Flow, else: DHW consumption as     
      Power</TD>
    <TD>DataType</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>DHW Data File</TD>
    <TD>File</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>DHW Table Name</TD>
    <TD>Table</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Accepted lower tolerance for T_DHW</TD>
    <TD>DeltaT</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Factor, with which the DHW demand gets multiplied</TD>
    <TD>DHWfactor</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Hot water set temperature</TD>
    <TD>THotWaterSet</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Specific heat capacity of hot water</TD>
    <TD>cpWater</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Density of hot water</TD>
    <TD>rhoWater</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>Results:</TH>
    <TD>Reference Temperature</TD>
    <TD>TRef</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>DHW Flow</TD>
    <TD>qv_DHW</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Parameter</TD>
    <TD>qv_Set</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Hot water volume</TD>
    <TD>VHotWater</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Temperature of the pipe between storage and freshwaterstation or       
      within the outlet layer of the DHW storage</TD>
    <TD>TPipe</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Cold water temperature</TD>
    <TD>TColdWater</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Hot water temperature at inlet (minus losses within the valves)</TD>
    <TD>THotWaterIs</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Too low flow temperature, cannot provide warm enough DHW</TD>
    <TD>T_fail</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heat power at set temperature difference =       
      qv_DHW*rho*cp*(THotWaterSet-TColdWater)</TD>
    <TD>Q_DHWset</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heat energy at set temperature difference</TD>
    <TD>E_DHWset</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Missing Heat power domestic hot water</TD>
    <TD>E_missing</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Missing heat output for hot domestic hot water</TD>
    <TD>Q_missing</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heat power domestic hot water</TD>
    <TD>Q_DHW</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heat output for hot domestic hot water</TD>
    <TD>E_DHW</TD>
    <TD>&nbsp;</TD></TR></TBODY></TABLE></DIV>
<H2>Description:</H2>
<P>&nbsp;</P></BODY></HTML>
"),
		experiment(
			StopTime=1,
			StartTime=0,
			Interval=0.002,
			__esi_MaxInterval="0.002"));
end DHW_demand;
