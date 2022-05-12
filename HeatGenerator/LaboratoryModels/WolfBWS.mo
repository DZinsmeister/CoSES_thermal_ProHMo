// CP: 65001
// SimulationX Version: 4.2.3.69223
within CoSES_Models.HeatGenerator.LaboratoryModels;
model WolfBWS "Wolf Heatpump BWS"
	protected
		Real StartTime(quantity="Basics.Time") "Starting time of heating" annotation(HideResult=false);
		parameter Real tHPStart(
			quantity="Basics.Time",
			displayUnit="s")=300 "Time until HP operates in steady state" annotation(HideResult=false);
	public
		Real StopTime(quantity="Basics.Time") "Stop time of the HP";
	protected
		parameter Real tHPStop(quantity="Basics.Time")=80 "Cool-down time of the HP";
	public
		Modelica.Blocks.Tables.CombiTable2D PElHeatFactor_table(
			tableOnFile=true,
			tableName="PEl",
			fileName=classDirectory()+"Data\\WolfBWS1_10\\BWS1_10.txt",
			tableID "External table object") "Multiplication factor for the electrical power demand of the heat pump during heating" annotation(Placement(transformation(extent={{80,-105},{100,-85}})));
		Modelica.Blocks.Tables.CombiTable2D PHeatFactor_table(
			tableOnFile=true,
			tableName="QHeat",
			fileName=classDirectory()+"Data\\WolfBWS1_10\\BWS1_10.txt",
			tableID "External table object") "Multiplication factor for the heat output of the heat pump" annotation(Placement(transformation(extent={{120,-105},{140,-85}})));
		Modelica.Blocks.Sources.BooleanStep booleanStep1(startTime=0.1) annotation(Placement(transformation(extent={{-80,-285},{-60,-265}})));
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
	protected
		parameter Real PElHeatNom(
			quantity="Basics.Power",
			displayUnit="Nm/s")=PHeatNom / COPNom "Nominal electricity consumption during heating at A2/W35" annotation(Dialog(
			group="Nominal Power and Efficiency",
			tab="Parameters"));
	public
		parameter Real PElIdle(
			quantity="Basics.Power",
			displayUnit="W")=15 "Consumed power during idling" annotation(Dialog(
			group="Nominal Power and Efficiency",
			tab="Parameters"));
		parameter Real CosPhi=0.76 "CosPhi of the heat pump during operation" annotation(Dialog(
			group="Nominal Power and Efficiency",
			tab="Parameters"));
		parameter Real TRetMax(quantity="Basics.Temp")=341.15 "Maximum return temperature" annotation(Dialog(
			group="Temperature",
			tab="Parameters",
			visible=false));
		parameter Real TRetMin(quantity="Basics.Temp")=293.15 "Minimum return temperature" annotation(Dialog(
			group="Temperature",
			tab="Parameters"));
		parameter Real DeltaTHeat(quantity="Thermics.TempDiff")=5 "Temperature difference between supply and return during heating" annotation(Dialog(
			group="Temperature",
			tab="Parameters"));
		parameter Real TSouceMax(quantity="Basics.Temp")=293.15 "Maximum return temperature" annotation(Dialog(
			group="Temperature",
			tab="Parameters"));
		parameter Real TSourceMin(quantity="Basics.Temp")=268.15 "Minimum return temperature" annotation(Dialog(
			group="Temperature",
			tab="Parameters"));
		parameter Real DeltaTSource(quantity="Thermics.TempDiff")=5 "Temperature difference between supply and return of the brine" annotation(Dialog(
			group="Temperature",
			tab="Parameters"));
		parameter Real cpMed(
			quantity="Thermics.SpecHeatCapacity",
			displayUnit="kJ/(kg·K)")=4180 "Specific heat capacity of the heating medium" annotation(Dialog(
			group="Medium",
			tab="Parameters"));
		parameter Real rhoMed(
			quantity="Basics.Density",
			displayUnit="kg/m³")=1000 "Density of the medium" annotation(Dialog(
			group="Medium",
			tab="Parameters"));
		Modelica.Blocks.Interfaces.RealInput AUXModulation "Modulation of the auxiliary heater - discrete in 3 steps:
< 33% => 33%
33% - 67% => 67%
> 67% => 100%" annotation(
			Placement(
				transformation(extent={{-99.90000000000001,-240},{-59.9,-200}}),
				iconTransformation(extent={{-170,-70},{-130,-30}})),
			Dialog(
				group="Modulation",
				tab="Results",
				visible=false));
		Modelica.Blocks.Interfaces.BooleanInput HPOn "If true, HP is switched on" annotation(
			Placement(
				transformation(extent={{-100,-269.9},{-60,-229.9}}),
				iconTransformation(extent={{-170,80},{-130,120}})),
			Dialog(
				group="Dynamics",
				tab="Results",
				visible=false));
		Boolean StartUp "If true, HP is currently starting" annotation(Dialog(
			group="Dynamics",
			tab="Results",
			visible=false));
		Boolean CoolDown "If true, heat pump is currently cooling down" annotation(Dialog(
			group="Dynamics",
			tab="Results",
			visible=false));
		Modelica.Blocks.Interfaces.RealInput TRet(quantity="Basics.Temp") "Return temperature to the heat pump" annotation(
			Placement(
				transformation(extent={{-110,-55.1},{-70,-15.1}}),
				iconTransformation(extent={{166.7,30},{126.7,70}})),
			Dialog(
				group="Water",
				tab="Results",
				visible=false));
		Modelica.Blocks.Interfaces.RealOutput TSup(quantity="Basics.Temp") "Supply temperature from the heat pump" annotation(
			Placement(
				transformation(extent={{-85,-70},{-65,-50}}),
				iconTransformation(extent={{136.7,-10},{156.7,10}})),
			Dialog(
				group="Water",
				tab="Results",
				visible=false));
		Modelica.Blocks.Math.Max THPout_Heat annotation(Placement(transformation(extent={{25,-25},{45,-5}})));
		Modelica.Blocks.Math.Add add1 annotation(Placement(transformation(extent={{-20,-35},{0,-15}})));
		Modelica.Blocks.Sources.RealExpression DeltaT_Heat(y=DeltaTHeat) annotation(Placement(transformation(extent={{-90,-15},{-70,5}})));
		Modelica.Blocks.Sources.RealExpression TRetMin_Heat(y=TRetMin) annotation(Placement(transformation(extent={{-90,5},{-70,25}})));
		Modelica.Blocks.Logical.And HPon annotation(Placement(transformation(extent={{35,-260},{55,-240}})));
		Real THP_out(quantity="Basics.Temp") "Output temperature of the heat pump" annotation(Dialog(
			group="Water",
			tab="Results",
			visible=false));
		Modelica.Blocks.Interfaces.RealOutput VWater(quantity="Thermics.VolumeFlow") "Water flow through the heat pump" annotation(
			Placement(
				transformation(extent={{-85,-90},{-65,-70}}),
				iconTransformation(extent={{136.7,-60},{156.7,-40}})),
			Dialog(
				group="Water",
				tab="Results",
				visible=false));
		Modelica.Blocks.Interfaces.RealInput TSourceIn(quantity="Basics.Temp") "Source inlet temperature" annotation(
			Placement(
				transformation(extent={{-105,-150},{-65,-110}}),
				iconTransformation(
					origin={50,150},
					extent={{-20,-20},{20,20}},
					rotation=-90)),
			Dialog(
				group="Ambient Conditions",
				tab="Results",
				visible=false));
		Modelica.Blocks.Interfaces.RealOutput TSourceOut(quantity="Basics.Temp") "Outlet source temperature" annotation(
			Placement(
				transformation(extent={{-85,-170},{-65,-150}}),
				iconTransformation(
					origin={-50,150},
					extent={{-10,-10},{10,10}},
					rotation=90)),
			Dialog(
				group="Ambient Conditions",
				tab="Results",
				visible=false));
		Modelica.Blocks.Interfaces.RealOutput VSource(quantity="Thermics.VolumeFlow") "Brine flow through the heat pump" annotation(
			Placement(
				transformation(extent={{-85,-190},{-65,-170}}),
				iconTransformation(
					origin={0,150},
					extent={{-10,-10},{10,10}},
					rotation=90)),
			Dialog(
				group="Ambient Conditions",
				tab="Results",
				visible=false));
		Modelica.Blocks.Interfaces.RealOutput PEl_phase[3](quantity="Basics.Power") "Electric consumption of the three phases" annotation(
			Placement(
				transformation(extent={{170,-55},{190,-35}}),
				iconTransformation(
					origin={49,-146},
					extent={{-10,-9.699999999999999},{10,10.3}},
					rotation=-90)),
			Dialog(
				group="Power",
				tab="Results",
				visible=false));
		Modelica.Blocks.Interfaces.RealOutput QEl_phase[3](quantity="Basics.Power") "Reactive power of the three phases" annotation(
			Placement(
				transformation(
					origin={180,-65},
					extent={{-10,-10},{10,10}}),
				iconTransformation(
					origin={100,-146.7},
					extent={{-10,-10},{10,10}},
					rotation=-90)),
			Dialog(
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
	protected
		Real PElAux_phase[3](quantity="Basics.Power") "Electric consumption of the three phases due to auxiliary heater" annotation(
			HideResult=false,
			Dialog(
				group="Power",
				tab="Results"));
	public
		Real QEl(quantity="Basics.Power") "Total reactive power" annotation(Dialog(
			group="Power",
			tab="Results",
			visible=false));
		Real PHeat_HP(quantity="Basics.Power") "Heat output of the heat pump" annotation(Dialog(
			group="Power",
			tab="Results",
			visible=false));
		Real PHeat_Aux(quantity="Basics.Power") "Heat output of the auxiliary heating system" annotation(Dialog(
			group="Power",
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
		Real COP "Coefficiency of performance (heating)" annotation(Dialog(
			group="Efficiency",
			tab="Results",
			visible=false));
		Modelica.Blocks.Sources.RealExpression TSource_Max(y=TSouceMax) annotation(Placement(transformation(extent={{-90,-110},{-70,-90}})));
		Modelica.Blocks.Math.Min THPout_Cooling annotation(Placement(transformation(extent={{20,-125},{40,-105}})));
		Modelica.Blocks.Logical.GreaterThreshold greaterThreshold1 annotation(Placement(transformation(extent={{-40,-230},{-20,-210}})));
		Modelica.Blocks.Logical.Or or1 annotation(Placement(transformation(extent={{0,-250},{20,-230}})));
	initial equation
		// enter your equations here
		
		StartTime = time.start;
		StopTime = time.start;
		
		EEl_HP = 0;
		EEl_Aux = 0;
		EHeat_HP = 0;
		EHeat_Aux = 0;
	equation
		// enter your equations here
		
		when HPon.y then
			StartTime=time;
		end when;
		
		when not HPon.y then
			StopTime = time;
		end when;
		
		if HPButton and HPon.y and (TRet < TRetMax) and (TSourceIn > TSourceMin) then	// Heat pump running
			if ((time - StartTime) < tHPStart) and (StartTime > time.start) then	// Start-up behavior - TBD!!!
				StartUp = true;
				CoolDown = false;
				// power
				PEl_HP = 0;
				PHeat_HP = 0;
				PHeat_Aux = 0;
				PEl_Aux = 0;
				PElAux_phase = {0, 0, 0};
				
				// temperature & flow rate
				VWater = 0;
				THP_out = TRet;
				TSup = THP_out;
				TSourceOut = TSourceIn - DeltaTSource;
				VSource = 0;
			else	// steady state
				StartUp = false;
				CoolDown = false;
				// power
				if AUXModulation > 0.67 then
					PHeat_Aux = PAuxMax;
					PElAux_phase = {-PAuxMax / 3, -PAuxMax / 3, -PAuxMax / 3};
				elseif AUXModulation > 0.33 then
					PHeat_Aux = PAuxMax * 2 / 3;
					PElAux_phase = {-PAuxMax / 3, -PAuxMax / 3, 0};
				elseif AUXModulation > 0 then
					PHeat_Aux = PAuxMax / 3;
					PElAux_phase = {-PAuxMax / 3, 0, 0};
				else
					PHeat_Aux = 0;
					PElAux_phase = {0, 0, 0};
				end if;
				PEl_Aux = -PHeat_Aux;
				PEl_HP = -PElHeatFactor_table.y * PElHeatNom;
				PHeat_HP = PHeatFactor_table.y * PHeatNom;
				
				// temperature & flow rate
				VWater = PHeat_HP / (cpMed * rhoMed * DeltaTHeat);
				THP_out = THPout_Heat.y;
				if VWater > 0 then
					TSup = THP_out + PHeat_Aux / (cpMed * rhoMed * VWater);
				else
					TSup = THP_out;
				end if;
				TSourceOut = TSourceIn - DeltaTSource;
				VSource = (PHeat_HP + PEl_HP) / (cpMed * rhoMed * DeltaTSource);
			end if;
			
			QEl = PEl_HP * (1 / CosPhi - 1);
			PEl_phase = {0.35 * PEl_HP + PElAux_phase[1], 0.35 * PEl_HP +  + PElAux_phase[2], 0.3 * PEl_HP +  + PElAux_phase[3]};
			QEl_phase = {QEl / 3, QEl / 3, QEl / 3};
		
		elseif HPButton then	// Heat pump off
			StartUp = false;
			if ((time - StopTime) < tHPStop) and (StopTime > time.start) and (TRet < TRetMax) then	// CoolDown
				CoolDown = true;
				// power
				PEl_HP = -PElIdle;
				QEl = 0;
				PHeat_HP = 0;
				
				// temperature & flow rate
				THP_out = TRet;
				VWater = 0;
				TSup = THP_out;	
				TSourceOut = TSourceIn - DeltaTSource;
				VSource = 0;
			else
				CoolDown = false;
				// power
				PEl_HP = -PElIdle;
				QEl = 0;
				PHeat_HP = 0;
				
				// temperature & flow rate
				THP_out = TRet;
				VWater = 0;
				TSup = THP_out;	
				TSourceOut = TSourceIn - DeltaTSource;
				VSource = 0;
			end if;
			
			PHeat_Aux = 0;
			PEl_Aux = 0;
			PElAux_phase = {0, 0, 0};	
			PEl_phase = {PEl_HP, 0, 0};
			QEl_phase = {QEl, 0, 0};
			
		else
			StartUp = false;
			CoolDown = false;
			// power
			PEl_HP = 0;
			QEl = 0;
			PHeat_HP = 0;
			PHeat_Aux = 0;
			PEl_Aux = 0;
			
			PElAux_phase = {0, 0, 0};	
			PEl_phase = {0, 0, 0};
			QEl_phase = {QEl, 0, 0};
			
			// temperature & flow rate
			THP_out = TRet;
			VWater = 0;
			TSup = THP_out;	
			TSourceOut = TSourceIn - DeltaTSource;
			VSource = 0;
		end if;
		
		// Efficiency
		if (PEl_HP + PEl_Aux) < -PElIdle then
			COP = -(PHeat_HP + PHeat_Aux) / (PEl_HP + PEl_Aux);
		else
			COP = 0;
		end if;
		
		der(EEl_HP) = PEl_HP;
		der(EEl_Aux) = PEl_Aux;
		der(EHeat_HP) = PHeat_HP;
		der(EHeat_Aux) = PHeat_Aux;
	equation
		connect(TRet,add1.u2) annotation(Line(
			points={{-90,-35},{-85,-35},{-27,-35},{-27,-31},{-22,-31}},
			color={0,0,127},
			thickness=0.0625));
		connect(add1.u1,DeltaT_Heat.y) annotation(Line(
			points={{-22,-19},{-27,-19},{-64,-19},{-64,-5},{-69,-5}},
			color={0,0,127},
			thickness=0.0625));
		connect(TRetMin_Heat.y,THPout_Heat.u1) annotation(Line(
			points={{-69,15},{-64,15},{18,15},{18,-9},{23,-9}},
			color={0,0,127},
			thickness=0.0625));
		connect(THPout_Heat.u2,add1.y) annotation(Line(
			points={{23,-21},{18,-21},{6,-21},{6,-25},{1,-25}},
			color={0,0,127},
			thickness=0.0625));
		connect(HPon.u2,booleanStep1.y) annotation(Line(
			points={{33,-258},{28,-258},{-54,-258},{-54,-275},{-59,-275}},
			color={255,0,255},
			thickness=0.0625));
		connect(THPout_Heat.y,PHeatFactor_table.u1) annotation(Line(
			points={{46,-15},{51,-15},{113,-15},{113,-89},{118,-89}},
			color={0,0,127},
			thickness=0.0625));
		connect(THPout_Heat.y,PElHeatFactor_table.u1) annotation(Line(
			points={{46,-15},{51,-15},{73,-15},{73,-89},{78,-89}},
			color={0,0,127},
			thickness=0.0625));
		connect(THPout_Cooling.y,PElHeatFactor_table.u2) annotation(Line(
			points={{41,-115},{46,-115},{73,-115},{73,-101},{78,-101}},
			color={0,0,127},
			thickness=0.0625));
		connect(THPout_Cooling.y,PHeatFactor_table.u2) annotation(Line(
			points={{41,-115},{46,-115},{113,-115},{113,-101},{118,-101}},
			color={0,0,127},
			thickness=0.0625));
		connect(TSource_Max.y,THPout_Cooling.u1) annotation(Line(
			points={{-69,-100},{-64,-100},{13,-100},{13,-109},{18,-109}},
			color={0,0,127},
			thickness=0.0625));
		connect(TSourceIn,THPout_Cooling.u2) annotation(Line(
			points={{-85,-130},{-80,-130},{13,-130},{13,-121},{18,-121}},
			color={0,0,127},
			thickness=0.0625));
		connect(greaterThreshold1.u,AUXModulation) annotation(Line(
			points={{-42,-220},{-47,-220},{-75,-220},{-80,-220}},
			color={0,0,127},
			thickness=0.0625));
		connect(or1.y,HPon.u1) annotation(Line(
			points={{21,-240},{26,-240},{28,-240},{28,-250},{33,-250}},
			color={255,0,255},
			thickness=0.0625));
		connect(HPOn,or1.u2) annotation(Line(
			points={{-80,-250},{-75,-250},{-7,-250},{-7,-248},{-2,-248}},
			color={255,0,255},
			thickness=0.0625));
		connect(greaterThreshold1.y,or1.u1) annotation(Line(
			points={{-19,-220},{-14,-220},{-7,-220},{-7,-240},{-2,-240}},
			color={255,0,255},
			thickness=0.0625));
	annotation(
		Icon(
			coordinateSystem(extent={{-150,-150},{150,150}}),
			graphics={
				Text(
					textString="Wolf",
					fontSize=12,
					lineColor={0,0,255},
					extent={{-73.40000000000001,113.2},{70,29.9}}),
				Text(
					textString="GSHP BWS",
					fontSize=12,
					lineColor={0,0,255},
					extent={{-209.3,98.2},{214,-91.7}}),
				Text(
					textString="by CoSES",
					fontSize=12,
					lineColor={0,0,255},
					extent={{-209.1,16.4},{214.2,-173.5}})}),
		Documentation(info="<HTML><HEAD>
<META http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\"> 
<TITLE>Wolf Heatpump BWS</TITLE> 
<STYLE type=\"text/css\">
table>tbody>tr:hover,th{background-color:#edf1f3}html{font-size:90%}body,table{font-size:1rem}body{font-family:'Open Sans',Arial,sans-serif;color:#465e70}h1,h2{margin:1em 0 .6em;font-weight:600}p{margin-top:.3em;margin-bottom:.2em}table{border-collapse:collapse;margin:1em 0;width:100%;}tr{border:1px solid #beccd3}td,th{padding:.3em 1em; border-width: 1px; border-style: solid; border-color: rgb(190, 204, 211);}td{word-break:break-word}tr:nth-child(even){background-color:#fafafa}th{font-family:'Open Sans Semibold',Arial,sans-serif;font-weight:700;text-align:left;word-break:keep-all}.lib-wrap{width:70%}@media screen and (max-width:800px){.lib-wrap{width:100%}}td p{margin:.2em}
</STYLE>
 
<META name=\"GENERATOR\" content=\"MSHTML 11.00.10570.1001\"></HEAD> 
<BODY>
<H1>Wolf Heatpump BWS</H1>
<HR>

<DIV class=\"lib-wrap\">
<TABLE class=\"type\">
  <TBODY>
  <TR>
    <TH>Symbol:</TH>
    <TD colspan=\"3\"><IMG width=\"207\" height=\"200\" src=\"data:image/png;base64,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\"></TD></TR>
  <TR>
    <TH>Identifier:</TH>
    <TD colspan=\"3\">CoSES_Models.HeatGenerator.LaboratoryModels.WolfBWS</TD></TR>
  <TR>
    <TH>Version:</TH>
    <TD colspan=\"3\">1.0</TD></TR>
  <TR>
    <TH>File:</TH>
    <TD colspan=\"3\">WolfBWS.mo</TD></TR>
  <TR>
    <TH>Connectors:</TH>
    <TD>Modulation of the auxiliary heater - discrete in 3 steps: &lt; 33% 
      =&gt; 33% 33% - 67% =&gt; 67%&gt; 67% =&gt; 100%</TD>
    <TD>AUXModulation</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>If true, HP is switched on</TD>
    <TD>HPOn</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Return temperature to the heat pump</TD>
    <TD>TRet</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Supply temperature from the heat pump</TD>
    <TD>TSup</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Water flow through the heat pump</TD>
    <TD>VWater</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Source inlet temperature</TD>
    <TD>TSourceIn</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Outlet source temperature</TD>
    <TD>TSourceOut</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Brine flow through the heat pump</TD>
    <TD>VSource</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Electric consumption of the three phases</TD>
    <TD>PEl_phase</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Reactive power of the three phases</TD>
    <TD>QEl_phase</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>Parameters:</TH>
    <TD>Multiplication factor for the electrical power demand of the heat pump 
      during heating</TD>
    <TD>PElHeatFactor_table</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Multiplication factor for the heat output of the heat pump</TD>
    <TD>PHeatFactor_table</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Generate step signal of type Boolean</TD>
    <TD>booleanStep1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
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
    <TD>Consumed power during idling</TD>
    <TD>PElIdle</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>CosPhi of the heat pump during operation</TD>
    <TD>CosPhi</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Minimum return temperature</TD>
    <TD>TRetMin</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Temperature difference between supply and return during heating</TD>
    <TD>DeltaTHeat</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Maximum return temperature</TD>
    <TD>TSouceMax</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Minimum return temperature</TD>
    <TD>TSourceMin</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Temperature difference between supply and return of the brine</TD>
    <TD>DeltaTSource</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Specific heat capacity of the heating medium</TD>
    <TD>cpMed</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Density of the medium</TD>
    <TD>rhoMed</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Pass through the largest signal</TD>
    <TD>THPout_Heat</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Output the sum of the two inputs</TD>
    <TD>add1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Set output signal to a time varying Real expression</TD>
    <TD>DeltaT_Heat</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Set output signal to a time varying Real expression</TD>
    <TD>TRetMin_Heat</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Logical 'and': y = u1 and u2</TD>
    <TD>HPon</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Set output signal to a time varying Real expression</TD>
    <TD>TSource_Max</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Pass through the smallest signal</TD>
    <TD>THPout_Cooling</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Output y is true, if input u is greater than threshold</TD>
    <TD>greaterThreshold1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Logical 'or': y = u1 or u2</TD>
    <TD>or1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>Results:</TH>
    <TD>Stop time of the HP</TD>
    <TD>StopTime</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Modulation of the auxiliary heater - discrete in 3 steps:&lt; 33% 
      =&gt; 33% 33% - 67% =&gt; 67%&gt; 67% =&gt; 100%</TD>
    <TD>AUXModulation</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>If true, HP is switched on</TD>
    <TD>HPOn</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>If true, HP is currently starting</TD>
    <TD>StartUp</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>If true, heat pump is currently cooling down</TD>
    <TD>CoolDown</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Return temperature to the heat pump</TD>
    <TD>TRet</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Supply temperature from the heat pump</TD>
    <TD>TSup</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Output temperature of the heat pump</TD>
    <TD>THP_out</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Water flow through the heat pump</TD>
    <TD>VWater</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Source inlet temperature</TD>
    <TD>TSourceIn</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Outlet source temperature</TD>
    <TD>TSourceOut</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Brine flow through the heat pump</TD>
    <TD>VSource</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Electric consumption of the three phases</TD>
    <TD>PEl_phase</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Reactive power of the three phases</TD>
    <TD>QEl_phase</TD>
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
    <TD>Total reactive power</TD>
    <TD>QEl</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heat output of the heat pump</TD>
    <TD>PHeat_HP</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heat output of the auxiliary heating system</TD>
    <TD>PHeat_Aux</TD>
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
    <TD>Coefficiency of performance (heating)</TD>
    <TD>COP</TD>
    <TD>&nbsp;</TD></TR></TBODY></TABLE></DIV>
<H2>Description:</H2>
<P><FONT size=\"2\">The model is not completely validated with measurements 
yet.</FONT></P>
<P><FONT size=\"2\">The heat generator can be switched off&nbsp;completely by  
deactivating it via the parameter \"HPButton\". Otherwise,&nbsp;the heat pump runs 
 in idling mode.</FONT></P>
<P><FONT size=\"2\"><BR></FONT></P><FONT size=\"2\">
<P><FONT color=\"#465e70\" size=\"2\">Input/Control signals:</FONT></P>
<UL>
  <LI><FONT color=\"#465e70\" size=\"2\">HPOn - Boolean value to switch 
  the&nbsp;heat pump on or off</FONT></LI>
  <LI><FONT color=\"#465e70\" size=\"2\">HPModulation - Value of the modulation, if  
     it is below ModulationMin, it will be overwritten by that value</FONT></LI>
  <LI>AUXModulation - Value of the modulation of the auxiliary heater - the aux. 
    heater can be&nbsp;controlled in&nbsp;4 stages: 0%,&nbsp;33%, 67%, 100%</LI>
  <LI>TRet - Return temperature to the heat pump</LI>
  <LI>TSourceIn - Brine inlet&nbsp;temperature to the heat pump</LI></UL>
<P><FONT color=\"#465e70\" size=\"2\">Output signals:</FONT></P>
<UL>
  <LI><FONT color=\"#465e70\" size=\"2\">TSup - Supply temperature from the heat   
  pump</FONT></LI>
  <LI><FONT color=\"#465e70\" size=\"2\">qvWater - Water flow from the heat   
  pump</FONT></LI>
  <LI>TSourceOut - Brine outlet temperature from the heat pump</LI>
  <LI>pvSource - Brine flow from the heat pump</LI>
  <LI><FONT color=\"#465e70\" size=\"2\">PEl_phase - Electric power of the three     
    phases</FONT></LI>
  <LI><FONT color=\"#465e70\" size=\"2\">QEl_phase - reactive power of the three     
    phases</FONT></LI></UL>
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
<P></P></BODY></HTML>
"),
		experiment(
			StopTime=1,
			StartTime=0,
			Tolerance=1e-06,
			Interval=0.001,
			__esi_MinInterval="9.999999999999999e-10",
			__esi_AbsTolerance="1e-6"));
end WolfBWS;
