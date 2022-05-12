// CP: 65001
// SimulationX Version: 4.2.3.69223
within CoSES_Models.HeatGenerator.LaboratoryModels;
model WolfCGB "Model of the condensing boiler based on measurements in the laboratory"
	Modelica.Blocks.Nonlinear.SlewRateLimiter slewRateLimiter1(
		Rising=0.025,
		Td=0.1) "Limits the slew rate of a signal" annotation(Placement(transformation(extent={{-20,-170},{0,-150}})));
	protected
		Real qv_Stop(quantity="Thermics.VolumeFlow") "Flow rate when  condensing boiler is turned off";
		Real qv_Start(quantity="Thermics.VolumeFlow") "Flow rate during startup";
		parameter Real tCBStartUp(quantity="Basics.Time")=300 "Start-up time of the condensing boiler";
		Real StartTime(quantity="Basics.Time") "Starting time of the condensing boiler" annotation(HideResult=false);
		parameter Real tCBStop(quantity="Basics.Time")=70 "Cool-down time of the condensing boiler";
		Real StopTime(quantity="Basics.Time") "Stop time of the condensing boiler" annotation(HideResult=false);
	public
		Modelica.Blocks.Math.Max max1 "Pass through the largest signal" annotation(Placement(transformation(extent={{20,-160},{40,-140}})));
		Modelica.Blocks.Sources.RealExpression MinimumModulation(y=ModulationMin) "Set output signal to a time varying Real expression" annotation(Placement(transformation(extent={{-55,-140},{-35,-120}})));
		Modelica.Blocks.Tables.CombiTable2D EffHeat_table(
			tableOnFile=true,
			tableName="EffHeat",
			fileName=classDirectory()+"Data\\WolfCGB14\\WolfCGB14_SteadyState.txt",
			tableID "External table object") "Total efficiency of the condensing boiler" annotation(Placement(transformation(extent={{95,-60},{115,-40}})));
		Modelica.Blocks.Tables.CombiTable1Ds StartUp_table(
			tableOnFile=true,
			tableName="StartUp",
			fileName=classDirectory()+"Data\\WolfCGB14\\WolfCGB14_StartUp.txt",
			columns={2,3},
			tableID "External table object") "Start-up behavior of the condensing boiler" annotation(Placement(transformation(extent={{95,-140},{115,-120}})));
		Modelica.Blocks.Math.Max max2 annotation(Placement(transformation(extent={{-5,-50},{15,-30}})));
		Modelica.Blocks.Sources.RealExpression MinimumReturnTemperature(y=TRetMin) "Minimum return temperature" annotation(Placement(transformation(extent={{-55,-30},{-35,-10}})));
		Modelica.Blocks.Tables.CombiTable1Ds CoolDown_table(
			tableOnFile=true,
			tableName="CoolDown",
			fileName=classDirectory()+"Data\\WolfCGB14\\WolfCGB14_CoolDown.txt",
			columns={2,3},
			tableID "External table object") "Cool down behavior of the condensing boiler" annotation(Placement(transformation(extent={{95,-165},{115,-145}})));
		parameter Boolean CBButton=true "On / off button of the condensing (if switched off, no power during idling, but doesn't react to commands from the control system)" annotation(Dialog(tab="Parameters"));
		parameter Real PElIdle(
			quantity="Basics.Power",
			displayUnit="W")=35 "Consumed power during idling" annotation(Dialog(
			group="Power and Efficiency",
			tab="Parameters"));
		parameter Real PHeatNom(quantity="Basics.Power")=14000 "Nominal heat power" annotation(Dialog(
			group="Power and Efficiency",
			tab="Parameters"));
		parameter Real ModulationMin(quantity="Basics.RelMagnitude")=0.2 "Minimum modulation of the condensing boiler (with regard to the electric power)" annotation(Dialog(
			group="Power and Efficiency",
			tab="Parameters"));
		parameter Real EffHeatMax(quantity="Basics.RelMagnitude")=1.05 "Maximum efficiency of the condensing boiler" annotation(Dialog(
			group="Power and Efficiency",
			tab="Parameters"));
		parameter Real DeltaTSet(quantity="Thermics.TempDiff")=20 "Set temperature difference" annotation(Dialog(
			group="Temperature",
			tab="Parameters"));
		parameter Real TRetMax(quantity="Basics.Temp")=348.15 "Maximum return temperature" annotation(Dialog(
			group="Temperature",
			tab="Parameters"));
		parameter Real TRetMin(quantity="Basics.Temp")=293.15 "Minimum return temperature" annotation(Dialog(
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
		parameter Real rhoGasVolume(quantity="Basics.Density")=0.75 "Volumetric fuel density" annotation(Dialog(
			group="Medium",
			tab="Parameters"));
		parameter Real rhoGasEnergy(
			quantity="Thermodynamics.SpecEnergy",
			displayUnit="MJ/kg")=48800000 "Energy density of fuel (LHV / rhoGasVolume)" annotation(Dialog(
			group="Medium",
			tab="Parameters"));
		Modelica.Blocks.Interfaces.RealInput CBModulation(quantity="Basics.RelMagnitude") "Modulation of the condensing boiler" annotation(
			Placement(
				transformation(extent={{-70,-180},{-30,-140}}),
				iconTransformation(extent={{-170,-20},{-130,20}})),
			Dialog(
				group="Input Parameters",
				tab="Results",
				visible=false));
		Modelica.Blocks.Interfaces.BooleanInput CBOn "Condensing boiler on or off" annotation(
			Placement(
				transformation(extent={{-120,30},{-80,70}}),
				iconTransformation(extent={{-170,80},{-130,120}})),
			Dialog(
				group="Input Parameters",
				tab="Results",
				visible=false));
		Real PGas(quantity="Basics.Power") "Gas power" annotation(Dialog(
			group="Power",
			tab="Results",
			visible=false));
		Real PHeat(quantity="Basics.Power") "Heat power of the condensing boiler" annotation(Dialog(
			group="Power",
			tab="Results",
			visible=false));
		Real PEl(quantity="Basics.Power") "Total electric power" annotation(Dialog(
			group="Power",
			tab="Results",
			visible=false));
		Real QEl(quantity="Basics.Power") "Total reactive power" annotation(Dialog(
			group="Power",
			tab="Results",
			visible=false));
		Modelica.Blocks.Interfaces.RealOutput PEl_phase[3](quantity="Basics.Power") "Electric consumption of the three phases" annotation(
			Placement(
				transformation(extent={{150,-60},{170,-40}}),
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
				transformation(extent={{150,-85},{170,-65}}),
				iconTransformation(
					origin={100,-146.7},
					extent={{-10,-10},{10,10}},
					rotation=-90)),
			Dialog(
				group="Power",
				tab="Results",
				visible=false));
		Real EGas(quantity="Basics.Energy") "Cumulated gas energy of the condensing boiler" annotation(Dialog(
			group="Energy",
			tab="Results",
			visible=false));
		Real EEl(quantity="Basics.Energy") "Cumulated electric energy of the condensing boiler" annotation(Dialog(
			group="Energy",
			tab="Results",
			visible=false));
		Real EHeat(quantity="Basics.Energy") "Cumulated heat energy of the condensing boiler" annotation(Dialog(
			group="Energy",
			tab="Results",
			visible=false));
		Real EffHeat(quantity="Basics.RelMagnitude") "Heat efficiency of the condensing boiler" annotation(Dialog(
			group="Efficiency",
			tab="Results",
			visible=false));
		Modelica.Blocks.Interfaces.RealOutput qvWater(quantity="Thermics.VolumeFlow") "Water flow through the condensing boiler" annotation(
			Placement(
				transformation(extent={{-50,-115},{-30,-95}}),
				iconTransformation(extent={{136.7,-110},{156.7,-90}})),
			Dialog(
				group="Flow",
				tab="Results",
				visible=false));
		Real qvGas(quantity="Thermics.VolumeFlow") "Fuel consumption" annotation(Dialog(
			group="Flow",
			tab="Results",
			visible=false));
		Real VGas(
			quantity="Basics.Volume",
			displayUnit="m³") "Consumed amount of gas" annotation(Dialog(
			group="Flow",
			tab="Results",
			visible=false));
		Modelica.Blocks.Interfaces.RealInput TRet(quantity="Basics.Temp") "Return temperature to the condensing boiler" annotation(
			Placement(
				transformation(extent={{-70,-70},{-30,-30}}),
				iconTransformation(extent={{166.7,-20},{126.7,20}})),
			Dialog(
				group="Temperature",
				tab="Results",
				visible=false));
		Modelica.Blocks.Interfaces.RealOutput TSup(quantity="Basics.Temp") "Supply temperature from the condensing boiler" annotation(
			Placement(
				transformation(extent={{-50,-95},{-30,-75}}),
				iconTransformation(extent={{136.7,-60},{156.7,-40}})),
			Dialog(
				group="Temperature",
				tab="Results",
				visible=false));
		Real DeltaT(quantity="Thermics.TempDiff") "Temperature difference between supply and return" annotation(Dialog(
			group="Temperature",
			tab="Results",
			visible=false));
		Boolean TRetWarning "If the return temperature is too high, the condensing boiler switches off" annotation(Dialog(
			group="Temperature",
			tab="Results",
			visible=false));
		Modelica.Blocks.Sources.BooleanStep booleanStep1(startTime=0.1) annotation(Placement(transformation(extent={{-95,5},{-75,25}})));
		Modelica.Blocks.Logical.And CBon annotation(Placement(transformation(extent={{-45,40},{-25,60}})));
		Modelica.Blocks.Math.Min min1 annotation(Placement(transformation(extent={{55,-150},{75,-130}})));
		Modelica.Blocks.Sources.RealExpression MaximumModulation(y=1) annotation(Placement(transformation(extent={{20,-130},{40,-110}})));
		Modelica.Blocks.Tables.CombiTable2D PHeat_table(
			tableOnFile=true,
			tableName="PHeat",
			fileName=classDirectory()+"Data\\WolfCGB14\\WolfCGB14_SteadyState.txt",
			tableID "External table object") "Heat power of the condensing boiler" annotation(Placement(transformation(extent={{95,-85},{115,-65}})));
		Modelica.Blocks.Tables.CombiTable2D DeltaT_table(
			tableOnFile=true,
			tableName="DeltaT",
			fileName=classDirectory()+"Data\\WolfCGB14\\WolfCGB14_SteadyState.txt",
			tableID "External table object") "Temeprature difference of the condensing boiler" annotation(Placement(transformation(extent={{95,-110},{115,-90}})));
	initial equation
		// enter your equations here
		
		StartTime = time.start;
		StopTime = time.start;
		qv_Stop = 0;
		
		EGas = 0;
		EEl = 0;
		EHeat = 0;
		VGas = 0;
		
		if TRet < (TRetMax - 5) then
			TRetWarning = false;
		else
			TRetWarning = true;
		end if;
	equation
		// enter your equations here
		
		when CBon.y then
			StartTime = time;
		end when;
		
		when not CBon.y then
			StopTime = time;
			qv_Stop = pre(qvWater);
		end when;
		
		StartUp_table.u = (time - StartTime);
		CoolDown_table.u = (time - StopTime);
		DeltaT = DeltaT_table.y * DeltaTSet;
		qv_Start = PHeat_table.y * PHeatNom / (cpMed * rhoMed * DeltaT);
		
		when TRet < (TRetMax - 5) then
			TRetWarning = false;
		elsewhen TRet > TRetMax then
			TRetWarning = true;
		end when;
		
		if CBon.y and CBButton and (not TRetWarning) then	//CB on
			if ((time - StartTime) < tCBStartUp) and (time > time.start) then	// Start-up behavior
				// power & efficiency
				PEl = 0;
				QEl = 0;
				PHeat = StartUp_table.y[1] * PHeat_table.y * PHeatNom;
				PGas = - (PHeat_table.y * PHeatNom) / (EffHeat_table.y * EffHeatMax);
				if PGas < 0 then
					EffHeat = -PHeat / PGas;
				else
					EffHeat = 0;
				end if;
				
				// temperature & flow rate
				qvWater = StartUp_table.y[1] * qv_Start;
				TSup = TRet + PHeat / (cpMed * rhoMed * max(0.00001, qvWater));
				
			else	// CB runs in steady state
				// power & efficiency
				PHeat = PHeat_table.y * PHeatNom; 
				EffHeat = EffHeat_table.y * EffHeatMax;
				PEl = 0;
				QEl = 0;
				PGas = -PHeat / EffHeat;
				
				// temperature & flow rate
				qvWater = PHeat / (cpMed * rhoMed * DeltaT);
				TSup = TRet + DeltaT;
				
			end if;
		
		elseif CBButton then
			if ((time - StopTime) < tCBStop) and (StopTime > time.start) then	// Cool down behavior
				// power & efficiency
				EffHeat = 0;
				PEl = 0;
				QEl = 0;
				PHeat = CoolDown_table.y[1] * PHeat_table.y * PHeatNom;
				PGas = 0;
						
				// temperature & flow rate
				qvWater = CoolDown_table.y[2] * qv_Stop;
				TSup = TRet + PHeat / (cpMed * rhoMed * max(0.00001, qvWater));
				
			else
				// efficiency
				EffHeat = 0;
				
				// power & efficiency
				PEl = -PElIdle;
				QEl = 0;
				PHeat = 0;
				PGas = 0;
				
				// temperature & flow rate
				TSup = TRet;
				qvWater = 0;
			end if;
			
		else	
			// power & efficiency
			EffHeat = 0;
			PEl = 0;
			QEl = 0;
			PHeat = 0;
			PGas = 0;
			
			// temperature & flow rate
			TSup = TRet;
			qvWater = 0;
		end if;
		
		PEl_phase = {0, 0, PEl};
		QEl_phase = {0, 0, QEl};
		
		qvGas = abs(PGas) / (rhoGasVolume * rhoGasEnergy);
		der(VGas) = qvGas;
		
		der(EGas) = PGas;
		der(EEl) = PEl;
		der(EHeat) = PHeat;
	equation
		connect(MinimumModulation.y,max1.u1) annotation(Line(
			points={{-34,-130},{-29,-130},{13,-130},{13,-144},{18,-144}},
			color={0,0,127},
			thickness=0.0625));
		connect(TRet,max2.u2) annotation(Line(
			points={{-50,-50},{-45,-50},{-12,-50},{-12,-46},{-7,-46}},
			color={0,0,127},
			thickness=0.0625));
		connect(MinimumReturnTemperature.y,max2.u1) annotation(Line(
			points={{-34,-20},{-29,-20},{-12,-20},{-12,-34},{-7,-34}},
			color={0,0,127},
			thickness=0.0625));
		connect(slewRateLimiter1.y,max1.u2) annotation(Line(
			points={{1,-160},{6,-160},{13,-160},{13,-156},{18,-156}},
			color={0,0,127},
			thickness=0.015625));
		connect(CBon.u2,booleanStep1.y) annotation(Line(
			points={{-47,42},{-52,42},{-69,42},{-69,15},{-74,15}},
			color={255,0,255},
			thickness=0.0625));
		connect(CBon.u1,CBOn) annotation(Line(
			points={{-47,50},{-52,50},{-95,50},{-100,50}},
			color={255,0,255},
			thickness=0.0625));
		connect(min1.u2,max1.y) annotation(Line(
			points={{53,-146},{48,-146},{46,-146},{46,-150},{41,-150}},
			color={0,0,127},
			thickness=0.0625));
		connect(MaximumModulation.y,min1.u1) annotation(Line(
			points={{41,-120},{46,-120},{48,-120},{48,-134},{53,-134}},
			color={0,0,127},
			thickness=0.0625));
		connect(max2.y,EffHeat_table.u1) annotation(Line(
			points={{16,-40},{21,-40},{88,-40},{88,-44},{93,-44}},
			color={0,0,127},
			thickness=0.0625));
		connect(max2.y,PHeat_table.u1) annotation(Line(
			points={{16,-40},{21,-40},{88,-40},{88,-69},{93,-69}},
			color={0,0,127},
			thickness=0.0625));
		connect(max2.y,DeltaT_table.u1) annotation(Line(
			points={{16,-40},{21,-40},{88,-40},{88,-94},{93,-94}},
			color={0,0,127},
			thickness=0.0625));
		connect(DeltaT_table.u2,min1.y) annotation(Line(
			points={{93,-106},{88,-106},{81,-106},{81,-140},{76,-140}},
			color={0,0,127},
			thickness=0.0625));
		connect(PHeat_table.u2,min1.y) annotation(Line(
			points={{93,-81},{88,-81},{81,-81},{81,-140},{76,-140}},
			color={0,0,127},
			thickness=0.0625));
		connect(EffHeat_table.u2,min1.y) annotation(Line(
			points={{93,-56},{88,-56},{81,-56},{81,-140},{76,-140}},
			color={0,0,127},
			thickness=0.0625));
		connect(CBModulation,slewRateLimiter1.u) annotation(Line(
			points={{-50,-160},{-45,-160},{-27,-160},{-22,-160}},
			color={0,0,127},
			thickness=0.0625));
	annotation(
		statAnaRefVar(flags=2),
		__esi_protocols(transient={
																																																																																																																																																																																																																																		Protocol(var=time),
																																																																																																																																																																																																																																		Protocol(var=statAnaRefVar)}),
		__esi_solverOptions(
			solver="CVODE",
			typename="ExternalCVODEOptionData"),
		Icon(
			coordinateSystem(extent={{-150,-150},{150,150}}),
			graphics={
				Text(
					textString="Wolf CGB",
					fontSize=10,
					lineColor={0,0,255},
					extent={{-162.7,116.6},{174,-13.4}}),
				Text(
					textString="by CoSES",
					fontSize=10,
					lineColor={0,0,255},
					extent={{-169.2,23.5},{167.5,-106.5}})}),
		Documentation(info="<HTML><HEAD>
<META http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\"> 
<TITLE>Model of the condensing boiler based on measurements in the  
laboratory</TITLE> 
<STYLE type=\"text/css\">
table>tbody>tr:hover,th{background-color:#edf1f3}html{font-size:90%}body,table{font-size:1rem}body{font-family:'Open Sans',Arial,sans-serif;color:#465e70}h1,h2{margin:1em 0 .6em;font-weight:600}p{margin-top:.3em;margin-bottom:.2em}table{border-collapse:collapse;margin:1em 0;width:100%;}tr{border:1px solid #beccd3}td,th{padding:.3em 1em; border-width: 1px; border-style: solid; border-color: rgb(190, 204, 211);}td{word-break:break-word}tr:nth-child(even){background-color:#fafafa}th{font-family:'Open Sans Semibold',Arial,sans-serif;font-weight:700;text-align:left;word-break:keep-all}.lib-wrap{width:70%}@media screen and (max-width:800px){.lib-wrap{width:100%}}td p{margin:.2em}
</STYLE>
   
<META name=\"GENERATOR\" content=\"MSHTML 11.00.10570.1001\"></HEAD> 
<BODY>
<H1>Model of the condensing boiler based on measurements in the laboratory</H1>
<HR>

<DIV class=\"lib-wrap\">
<TABLE class=\"type\">
  <TBODY>
  <TR>
    <TH>Symbol:</TH>
    <TD colspan=\"3\"><IMG width=\"204\" height=\"145\" src=\"data:image/png;base64,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\"></TD></TR>
  <TR>
    <TH>Identifier:</TH>
    <TD colspan=\"3\">CoSES_Models.HeatGenerator.LaboratoryModels.WolfCGB</TD></TR>
  <TR>
    <TH>Version:</TH>
    <TD colspan=\"3\">1.0</TD></TR>
  <TR>
    <TH>File:</TH>
    <TD colspan=\"3\">WolfCGB.mo</TD></TR>
  <TR>
    <TH>Connectors:</TH>
    <TD>Modulation of the condensing boiler</TD>
    <TD>CBModulation</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Condensing boiler on or off</TD>
    <TD>CBOn</TD>
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
    <TD>Water flow through the condensing boiler</TD>
    <TD>qvWater</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Return temperature to the condensing boiler</TD>
    <TD>TRet</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Supply temperature from the condensing boiler</TD>
    <TD>TSup</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>Parameters:</TH>
    <TD>Limits the slew rate of a signal</TD>
    <TD>slewRateLimiter1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Pass through the largest signal</TD>
    <TD>max1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Set output signal to a time varying Real expression</TD>
    <TD>MinimumModulation</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Total efficiency of the condensing boiler</TD>
    <TD>EffHeat_table</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Start-up behavior of the condensing boiler</TD>
    <TD>StartUp_table</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Pass through the largest signal</TD>
    <TD>max2</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Minimum return temperature</TD>
    <TD>MinimumReturnTemperature</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Cool down behavior of the condensing boiler</TD>
    <TD>CoolDown_table</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>On / off button of the condensing (if switched off, no power during    
               idling, but doesn't react to commands from the control system)</TD>
    <TD>CBButton</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Consumed power during idling</TD>
    <TD>PElIdle</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Nominal heat power</TD>
    <TD>PHeatNom</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Minimum modulation of the condensing boiler (with regard to the        
           electric power)</TD>
    <TD>ModulationMin</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Maximum efficiency of the condensing boiler</TD>
    <TD>EffHeatMax</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Set temperature difference</TD>
    <TD>DeltaTSet</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Maximum return temperature</TD>
    <TD>TRetMax</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Minimum return temperature</TD>
    <TD>TRetMin</TD>
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
    <TD>Volumetric fuel density</TD>
    <TD>rhoGasVolume</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Energy density of fuel (LHV / rhoGasVolume)</TD>
    <TD>rhoGasEnergy</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Generate step signal of type Boolean</TD>
    <TD>booleanStep1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Logical 'and': y = u1 and u2</TD>
    <TD>CBon</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Pass through the smallest signal</TD>
    <TD>min1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Set output signal to a time varying Real expression</TD>
    <TD>MaximumModulation</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heat power of the condensing boiler</TD>
    <TD>PHeat_table</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Temeprature difference of the condensing boiler</TD>
    <TD>DeltaT_table</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>Results:</TH>
    <TD>Modulation of the condensing boiler</TD>
    <TD>CBModulation</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Condensing boiler on or off</TD>
    <TD>CBOn</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Gas power</TD>
    <TD>PGas</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heat power of the condensing boiler</TD>
    <TD>PHeat</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Total electric power</TD>
    <TD>PEl</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Total reactive power</TD>
    <TD>QEl</TD>
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
    <TD>Cumulated gas energy of the condensing boiler</TD>
    <TD>EGas</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Cumulated electric energy of the condensing boiler</TD>
    <TD>EEl</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Cumulated heat energy of the condensing boiler</TD>
    <TD>EHeat</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heat efficiency of the condensing boiler</TD>
    <TD>EffHeat</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Water flow through the condensing boiler</TD>
    <TD>qvWater</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Fuel consumption</TD>
    <TD>qvGas</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Consumed amount of gas</TD>
    <TD>VGas</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Return temperature to the condensing boiler</TD>
    <TD>TRet</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Supply temperature from the condensing boiler</TD>
    <TD>TSup</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Temperature difference between supply and return</TD>
    <TD>DeltaT</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>If the return temperature is too high, the condensing boiler switches  
                 off</TD>
    <TD>TRetWarning</TD>
    <TD>&nbsp;</TD></TR></TBODY></TABLE></DIV>
<H2>Description:</H2>
<P><FONT size=\"2\">This model describes&nbsp;the condensing boiler Wolf CGB based 
on measurements from the CoSES laboratory.</FONT></P>
<P><FONT size=\"2\">The heat generator can be switched off&nbsp;completely by 
deactivating it via the parameter \"CBButton\". Otherwise,&nbsp;the 
condensing&nbsp;power&nbsp;runs in idling mode.</FONT></P>
<P>&nbsp;</P>
<P><FONT color=\"#465e70\" size=\"2\">Input/Control signals:</FONT></P>
<UL>
  <LI><FONT color=\"#465e70\" size=\"2\">CB on/off - Boolean value to switch the     
  condensing boiler on or off</FONT></LI>
  <LI><FONT color=\"#465e70\" size=\"2\">CBModulation - Value of the modulation, if  
     it is below ModulationMin, it will be overwritten by that value</FONT></LI>
  <LI><FONT color=\"#465e70\" size=\"2\">TRet - Return temperature to the condensing 
      boiler </FONT></LI></UL>
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
face=\"Arial\" size=\"2\"></FONT> 
<P><FONT color=\"#465e70\" face=\"Arial\" size=\"2\">The condensing boiler is divided  
in into four sections and based on measurements from the  CoSES  
laboratory:</FONT></P><SPAN lang=\"EN-US\" style='font-family: \"Calibri\",sans-serif; font-size: 11pt; mso-bidi-font-size: 10.0pt; mso-fareast-font-family: SimSun; mso-ansi-language: EN-US; mso-fareast-language: EN-US; mso-bidi-language: AR-SA;'><FONT 
color=\"#465e70\" face=\"Arial\" size=\"2\"></FONT> 
<P></P><FONT color=\"#000000\"><FONT color=\"#465e70\" face=\"Arial\" size=\"2\"></FONT> 

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
  look-up table.</FONT></SPAN></SPAN></SPAN></SPAN></LI></UL>
<P><SPAN lang=\"EN-US\" style='font-family: \"Calibri\",sans-serif; font-size: 11pt; mso-bidi-font-size: 10.0pt;'><SPAN 
lang=\"EN-US\" style='font-family: \"Calibri\",sans-serif; font-size: 11pt; mso-bidi-font-size: 10.0pt;'><SPAN 
lang=\"EN-US\" style='font-family: \"Calibri\",sans-serif; font-size: 11pt; mso-bidi-font-size: 10.0pt;'><SPAN 
lang=\"EN-US\" style='font-family: \"Calibri\",sans-serif; font-size: 11pt; mso-bidi-font-size: 10.0pt;'><BR></SPAN></SPAN></SPAN></SPAN></P></FONT> 

<P></P></SPAN> 
<P></P></FONT> 
<P></P></SPAN></P></FONT></FONT> 
<P></P></BODY></HTML>
"),
		experiment(
			StopTime=1,
			StartTime=0,
			Tolerance=1e-06,
			Interval=0.001,
			__esi_MinInterval="9.999999999999999e-10",
			__esi_AbsTolerance="1e-6"));
end WolfCGB;
