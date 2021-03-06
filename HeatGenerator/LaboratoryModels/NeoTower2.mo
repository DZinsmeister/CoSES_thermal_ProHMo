// CP: 65001
// SimulationX Version: 4.2.3.69223
within CoSES_Models.HeatGenerator.LaboratoryModels;
model NeoTower2 "Model of the CHP based on measurements in the laboratory"
	Modelica.Blocks.Nonlinear.SlewRateLimiter slewRateLimiter1(
		Rising=0.025,
		Td=0.1) "Limits the slew rate of a signal" annotation(Placement(transformation(extent={{-20,-170},{0,-150}})));
	Real qv_Stop(quantity="Thermics.VolumeFlow") "Flow rate when chps is turned off";
	protected
		parameter Real tCHPStartUpcold(quantity="Basics.Time")=825 "Start-up time of the CHP when cold";
		parameter Real tCHPStartUpwarm(quantity="Basics.Time")=200 "Start-up time of the CHP when warm";
		Real tCHPStartUp "Start-up time of the CHP" annotation(HideResult=false);
	public
		Real StartTime(quantity="Basics.Time") "Starting time of the CHP";
	protected
		parameter Real tCHPStop(quantity="Basics.Time")=84 "Cool-down time of the CHP";
	public
		Real StopTime(quantity="Basics.Time") "Stop time of the CHP";
	protected
		parameter Real EffTotMax_Data(quantity="Basics.RelMagnitude")=0.9 "Maximum total efficiency to normalize the data";
	public
		Modelica.Blocks.Math.Max max1 annotation(Placement(transformation(extent={{20,-160},{40,-140}})));
		Modelica.Blocks.Sources.RealExpression MinimumModulation(y=ModulationMin) annotation(Placement(transformation(extent={{-55,-140},{-35,-120}})));
		Modelica.Blocks.Tables.CombiTable2D EffTotal_table(
			tableOnFile=true,
			tableName="Efficiency",
			fileName=classDirectory()+"Data\\NeoTower2\\neoTower2_Efficiency.txt",
			tableID "External table object") "Total efficiency of the heat pump" annotation(Placement(transformation(extent={{95,-75},{115,-55}})));
		Modelica.Blocks.Tables.CombiTable1Ds StartUp_table(
			tableOnFile=true,
			tableName="StartUp",
			fileName=classDirectory()+"Data\\NeoTower2\\neoTower2_StartUp.txt",
			columns={2,3,4,5,6},
			tableID "External table object") "Start-up behavior of the CHP" annotation(Placement(transformation(extent={{95,-105},{115,-85}})));
		Modelica.Blocks.Math.Max max2 annotation(Placement(transformation(extent={{-5,-60},{15,-40}})));
		Modelica.Blocks.Sources.RealExpression MinimumReturnTemperature(y=TRetMin) "Minimum return temperature" annotation(Placement(transformation(extent={{-55,-40},{-35,-20}})));
		Modelica.Blocks.Tables.CombiTable1Ds CoolDown_table(
			tableOnFile=true,
			tableName="CoolDown",
			fileName=classDirectory()+"Data\\NeoTower2\\neoTower2_CoolDown.txt",
			columns={2,3,4,5},
			tableID "External table object") "Cool down behavior of the CHP" annotation(Placement(transformation(extent={{95,-130},{115,-110}})));
		parameter Boolean CHPButton=true "On / off button of the CHP (if switched off, no power during idling, but doesn't react to commands from the control system)" annotation(Dialog(tab="Parameters"));
		parameter Real PElMax(quantity="Basics.Power")=1900 "Maximum electric power output" annotation(Dialog(
			group="Power and Efficiency",
			tab="Parameters"));
		parameter Real PElMin(
			quantity="Basics.Power",
			displayUnit="Nm/s")=PElMax * ModulationMin "Minimum electric power output" annotation(Dialog(
			group="Power and Efficiency",
			tab="Parameters",
			visible=false));
		parameter Real PElIdle(
			quantity="Basics.Power",
			displayUnit="W")=35 "Consumed power during idling" annotation(Dialog(
			group="Power and Efficiency",
			tab="Parameters"));
		parameter Real PTotMax(quantity="Basics.Power")=7000 "Total power output (heat + electricity) at maximum modulation and TRet = 30°C - oder PHeatMax?" annotation(Dialog(
			group="Power and Efficiency",
			tab="Parameters",
			visible=false));
		parameter Real PTotMin(quantity="Basics.Power")=4300 "Total power output (heat + electricity) at minimum modulation and TRet = 30°C  - oder PHeatMin?" annotation(Dialog(
			group="Power and Efficiency",
			tab="Parameters",
			visible=false));
		parameter Real EffElMax(quantity="Basics.RelMagnitude")=0.24 "Electric efficiency at maximum modulation (constant over the return temperature)" annotation(Dialog(
			group="Power and Efficiency",
			tab="Parameters"));
		parameter Real EffElMin(quantity="Basics.RelMagnitude")=0.18 "Electric efficiency at minimum modulation(constant over the return temperature)" annotation(Dialog(
			group="Power and Efficiency",
			tab="Parameters"));
		parameter Real EffTotMax(quantity="Basics.RelMagnitude")=0.9 "Total efficiency at maximum modulation and TRet = 30°C - tbd" annotation(Dialog(
			group="Power and Efficiency",
			tab="Parameters"));
		parameter Real ModulationMin(quantity="Basics.RelMagnitude")=0.55 "Minimum modulation of the CHP (with regard to the electric power)" annotation(Dialog(
			group="Power and Efficiency",
			tab="Parameters"));
		parameter Real PHeatUp(quantity="Basics.Power")=1000 "Required power to heat up the system until it runs at steady state" annotation(Dialog(
			group="Power and Efficiency",
			tab="Parameters"));
		Real HeatUpFactor "Factor of how much power is still required to heat up the CHP" annotation(Dialog(
			group="Power and Efficiency",
			tab="Parameters",
			visible=false));
		parameter Real tCHPStart(
			quantity="Basics.Time",
			displayUnit="min")=2400 "Time until CHP operates in steady state" annotation(Dialog(
			group="Power and Efficiency",
			tab="Parameters"));
		parameter Real tCHPAmbientTemperature(
			quantity="Basics.Time",
			displayUnit="h")=36000 "Time until CHP is at ambient temperature" annotation(Dialog(
			group="Power and Efficiency",
			tab="Parameters"));
		parameter Real CosPhi=0.92 "CosPhi of the CHP" annotation(Dialog(
			group="Power and Efficiency",
			tab="Parameters"));
		parameter Real TSupSet(quantity="Basics.Temp")=353.15 "Set supply temperature" annotation(Dialog(
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
		Modelica.Blocks.Interfaces.RealInput CHPModulation(quantity="Basics.RelMagnitude") "Modulation of the CHP" annotation(
			Placement(
				transformation(extent={{-70,-180},{-30,-140}}),
				iconTransformation(extent={{-170,-20},{-130,20}})),
			Dialog(
				group="Input Parameters",
				tab="Results",
				visible=false));
		Modelica.Blocks.Interfaces.BooleanInput CHPOn "CHP on or off" annotation(
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
		Real PHeat(quantity="Basics.Power") "Heat power of the CHP" annotation(Dialog(
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
		Real EGas(quantity="Basics.Energy") "Cumulated gas energy of the CHP" annotation(Dialog(
			group="Energy",
			tab="Results",
			visible=false));
		Real EEl(quantity="Basics.Energy") "Cumulated electric energy of the CHP" annotation(Dialog(
			group="Energy",
			tab="Results",
			visible=false));
		Real EHeat(quantity="Basics.Energy") "Cumulated heat energy of the CHP" annotation(Dialog(
			group="Energy",
			tab="Results",
			visible=false));
		Real EffTot(quantity="Basics.RelMagnitude") "Overall efficiency of the CHP" annotation(Dialog(
			group="Efficiency",
			tab="Results",
			visible=false));
		Real EffEl(quantity="Basics.RelMagnitude") "Electric efficiency of the CHP" annotation(Dialog(
			group="Efficiency",
			tab="Results",
			visible=false));
		Real EffHeat(quantity="Basics.RelMagnitude") "Heat efficiency of the CHP" annotation(Dialog(
			group="Efficiency",
			tab="Results",
			visible=false));
		Modelica.Blocks.Interfaces.RealOutput qvWater(quantity="Thermics.VolumeFlow") "Water flow through the CHP" annotation(
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
		Modelica.Blocks.Interfaces.RealInput TRet(quantity="Basics.Temp") "Return temperature to the CHP" annotation(
			Placement(
				transformation(extent={{-70,-80},{-30,-40}}),
				iconTransformation(extent={{166.7,-20},{126.7,20}})),
			Dialog(
				group="Temperature",
				tab="Results",
				visible=false));
		Modelica.Blocks.Interfaces.RealOutput TSup(quantity="Basics.Temp") "Supply temperature from the CHP" annotation(
			Placement(
				transformation(extent={{-50,-95},{-30,-75}}),
				iconTransformation(extent={{136.7,-60},{156.7,-40}})),
			Dialog(
				group="Temperature",
				tab="Results",
				visible=false));
		Modelica.Blocks.Sources.BooleanStep booleanStep1(startTime=0.1) annotation(Placement(transformation(extent={{-95,5},{-75,25}})));
		Modelica.Blocks.Logical.And CHPon annotation(Placement(transformation(extent={{-45,40},{-25,60}})));
		Modelica.Blocks.Math.Min min1 annotation(Placement(transformation(extent={{55,-150},{75,-130}})));
		Modelica.Blocks.Sources.RealExpression MaximumModulation(y=1) annotation(Placement(transformation(extent={{20,-130},{40,-110}})));
	initial equation
		// enter your equations here
		
		StartTime = time.start;
		StopTime = time.start;
		qv_Stop = 0;
		
		EGas = 0;
		EEl = 0;
		EHeat = 0;
		VGas = 0;
	equation
		// enter your equations here
		
		when CHPon.y then
			StartTime = time;
		end when;
		
		when not CHPon.y then
			StopTime = time;
			qv_Stop = pre(qvWater);
		end when;
		
		StartUp_table.u = (time - StartTime);
		CoolDown_table.u = (time - StopTime);
		
		if CHPon.y and CHPButton and (TRet < TRetMax) then	//CHP on
			if (time - StopTime) > tCHPAmbientTemperature then
				tCHPStartUp = tCHPStartUpcold;
			else
				tCHPStartUp = tCHPStartUpwarm;
			end if;
			
			if ((time - StartTime) < tCHPStartUp) and (time > time.start) then	// Start-up behavior
				slewRateLimiter1.u = 1;
				HeatUpFactor = max(0, (min(1, (StartTime - StopTime) / tCHPAmbientTemperature)) *  (1 - (time - StartTime) / (tCHPStart * min(1,(StartTime - StopTime) / tCHPAmbientTemperature))));
								// StartTime - StopTime) / tCHPAmbientTemperature: maximum factor - if CHP isn't deactivated longer thant tCHPAmbientTemperature, it is < 1
								// 1 - (time - StartTime) / (tCHPStart * min(1,(StartTime - StopTime) / tCHPAmbientTemperature)): Slope of HeatUpFactor
								// tCHPStart * min(1,(StartTime - StopTime) / tCHPAmbientTemperature): If CHP wasn't deactivated for tCHPAmbientTemperature, the time to reach steady state is reduced accordingly
				
				// power & efficiency
				PEl = StartUp_table.y[1] * PElMax;
				QEl = StartUp_table.y[2] * PElMax * (1 / CosPhi - 1);
				PHeat = max(0, StartUp_table.y[3] * PElMax / EffElMax * (EffTotal_table.y - EffElMax) - PHeatUp * HeatUpFactor);
				PGas = -StartUp_table.y[4] * PElMax / EffElMax;
				
				// efficiency
				if PGas < 0 then
					EffEl = max(0, -PEl / PGas);
					EffHeat = -PHeat / PGas;
				else
					EffEl = 0;
					EffHeat = 0;
				end if;
				EffTot = EffEl + EffHeat;
						
				// temperature & flow rate
				TSup = max(TRet + 1, StartUp_table.y[5] + 273.15);
				qvWater = PHeat / (cpMed * rhoMed * (TSup - TRet));
				
			elseif ((time - StartTime) < tCHPStart) and (time > time.start) then	// Time until CHP runs in steady state
				slewRateLimiter1.u = min(1, CHPModulation);
				HeatUpFactor = max(0, (min(1, (StartTime - StopTime) / tCHPAmbientTemperature)) *  (1 - (time - StartTime) / (tCHPStart * min(1,(StartTime - StopTime) / tCHPAmbientTemperature))));
				
				// efficiency
				EffEl = EffElMin + (EffElMax - EffElMin) * (max1.y - ModulationMin) / (1 - ModulationMin);
				EffTot = EffTotal_table.y / EffTotMax_Data * EffTotMax;
		
				// power
				PEl = PElMin + (PElMax - PElMin) * (max1.y - ModulationMin) / (1 - ModulationMin);
				QEl = PEl * (1 / CosPhi - 1);
				PHeat = PEl / EffEl * (EffTot - EffEl) - PHeatUp * HeatUpFactor; 
				PGas = -PEl / EffEl;
				
				EffHeat = -PHeat / PGas;
		
				
				// temperature & flow rate
				TSup = TSupSet;
				qvWater = PHeat / (cpMed * rhoMed * (TSup - TRet));
				
			else	// CHP runs in steady state
				slewRateLimiter1.u = min(1, CHPModulation);
				HeatUpFactor = 0;
				
				// efficiency
				EffEl = EffElMin + (EffElMax - EffElMin) * (max1.y - ModulationMin) / (1 - ModulationMin);
				EffTot = EffTotal_table.y / EffTotMax_Data * EffTotMax;
				EffHeat = EffTot - EffEl;
				
				// power
				PEl = PElMin + (PElMax - PElMin) * (max1.y - ModulationMin) / (1 - ModulationMin);
				QEl = PEl * (1 / CosPhi - 1);
				PHeat = PEl / EffEl * EffHeat; 
				PGas = -PEl / EffEl;
		
				
				// temperature & flow rate
				TSup = TSupSet;
				qvWater = PHeat / (cpMed * rhoMed * (TSup - TRet));
			end if;
			
			PEl_phase = {0.35 * PEl, 0.35 * PEl, 0.3 * PEl};
			QEl_phase = {QEl / 3, QEl / 3, QEl / 3};
			
		elseif CHPButton then
			HeatUpFactor = 0;
			tCHPStartUp = 0;
			slewRateLimiter1.u = 0;
			if ((time - StopTime) < tCHPStop) and (StopTime > time.start) then	// Cool down behavior
				// temperature & flow rate
				TSup = CoolDown_table.y[1] + 273.15;
				qvWater = CoolDown_table.y[2] * qv_Stop;
				
				// power & efficiency
				PEl = CoolDown_table.y[3];
				QEl = CoolDown_table.y[4];
				PHeat = qvWater * cpMed * rhoMed * (TSup - TRet);
				PGas = 0;
						
				// efficiency
				EffEl = 0;
				EffTot = 0;
				EffHeat = 0;
				
			else
				// efficiency
				EffEl = 0;
				EffTot = 0;
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
			
			PEl_phase = {0, 0, PEl};
			QEl_phase = {0, 0, QEl};
		
		else	
			slewRateLimiter1.u = 0;
			tCHPStartUp = 0;
			
			// efficiency
			EffEl = 0;
			EffTot = 0;
			EffHeat = 0;
			
			// power & efficiency
			PEl = 0;
			QEl = 0;
			PHeat = 0;
			PGas = 0;
			PEl_phase = {0, 0, 0};
			QEl_phase = {0, 0, 0};
			
			// temperature & flow rate
			TSup = TRet;
			qvWater = 0;
		end if;
		
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
			points={{-50,-60},{-45,-60},{-12,-60},{-12,-56},{-7,-56}},
			color={0,0,127},
			thickness=0.0625));
		connect(MinimumReturnTemperature.y,max2.u1) annotation(Line(
			points={{-34,-30},{-29,-30},{-12,-30},{-12,-44},{-7,-44}},
			color={0,0,127},
			thickness=0.0625));
		connect(EffTotal_table.u1,max2.y) annotation(Line(
			points={{93,-59},{88,-59},{21,-59},{21,-50},{16,-50}},
			color={0,0,127},
			thickness=0.0625));
		connect(slewRateLimiter1.y,max1.u2) annotation(Line(
			points={{1,-160},{6,-160},{13,-160},{13,-156},{18,-156}},
			color={0,0,127},
			thickness=0.015625));
		connect(CHPon.u2,booleanStep1.y) annotation(Line(
			points={{-47,42},{-52,42},{-69,42},{-69,15},{-74,15}},
			color={255,0,255},
			thickness=0.0625));
		connect(CHPon.u1,CHPOn) annotation(Line(
			points={{-47,50},{-52,50},{-95,50},{-100,50}},
			color={255,0,255},
			thickness=0.0625));
		connect(min1.u2,max1.y) annotation(Line(
			points={{53,-146},{48,-146},{46,-146},{46,-150},{41,-150}},
			color={0,0,127},
			thickness=0.0625));
		connect(min1.y,EffTotal_table.u2) annotation(Line(
			points={{76,-140},{81,-140},{88,-140},{88,-71},{93,-71}},
			color={0,0,127},
			thickness=0.0625));
		connect(MaximumModulation.y,min1.u1) annotation(Line(
			points={{41,-120},{46,-120},{48,-120},{48,-134},{53,-134}},
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
					textString="neoTower2.0",
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
<TITLE>Model of the CHP based on measurements in the laboratory</TITLE> 
<STYLE type=\"text/css\">
table>tbody>tr:hover,th{background-color:#edf1f3}html{font-size:90%}body,table{font-size:1rem}body{font-family:'Open Sans',Arial,sans-serif;color:#465e70}h1,h2{margin:1em 0 .6em;font-weight:600}p{margin-top:.3em;margin-bottom:.2em}table{border-collapse:collapse;margin:1em 0;width:100%;}tr{border:1px solid #beccd3}td,th{padding:.3em 1em; border-width: 1px; border-style: solid; border-color: rgb(190, 204, 211);}td{word-break:break-word}tr:nth-child(even){background-color:#fafafa}th{font-family:'Open Sans Semibold',Arial,sans-serif;font-weight:700;text-align:left;word-break:keep-all}.lib-wrap{width:70%}@media screen and (max-width:800px){.lib-wrap{width:100%}}td p{margin:.2em}
</STYLE>
    
<META name=\"GENERATOR\" content=\"MSHTML 11.00.10570.1001\"></HEAD> 
<BODY>
<H1>Model of the CHP based on measurements in the laboratory</H1>
<HR>

<DIV class=\"lib-wrap\">
<TABLE class=\"type\">
  <TBODY>
  <TR>
    <TH>Symbol:</TH>
    <TD colspan=\"3\"><IMG width=\"211\" height=\"145\" src=\"data:image/png;base64,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\"></TD></TR>
  <TR>
    <TH>Identifier:</TH>
    <TD 
colspan=\"3\">CoSES_Models.HeatGenerator.LaboratoryModels.NeoTower2</TD></TR>
  <TR>
    <TH>Version:</TH>
    <TD colspan=\"3\">1.0</TD></TR>
  <TR>
    <TH>File:</TH>
    <TD colspan=\"3\">NeoTower2.mo</TD></TR>
  <TR>
    <TH>Connectors:</TH>
    <TD>Modulation of the CHP</TD>
    <TD>CHPModulation</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>CHP on or off</TD>
    <TD>CHPOn</TD>
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
    <TD>Water flow through the CHP</TD>
    <TD>qvWater</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Return temperature to the CHP</TD>
    <TD>TRet</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Supply temperature from the CHP</TD>
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
    <TD>Total efficiency of the heat pump</TD>
    <TD>EffTotal_table</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Start-up behavior of the CHP</TD>
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
    <TD>Cool down behavior of the CHP</TD>
    <TD>CoolDown_table</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>On / off button of the CHP (if switched off, no power during idling,   
                      but doesn't react to commands from the control system)</TD>
    <TD>CHPButton</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Maximum electric power output</TD>
    <TD>PElMax</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Consumed power during idling</TD>
    <TD>PElIdle</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Electric efficiency at maximum modulation (constant over the return    
                     temperature)</TD>
    <TD>EffElMax</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Electric efficiency at minimum modulation(constant over the return     
                    temperature)</TD>
    <TD>EffElMin</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Total efficiency at maximum modulation and TRet = 30°C - tbd</TD>
    <TD>EffTotMax</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Minimum modulation of the CHP (with regard to the electric power)</TD>
    <TD>ModulationMin</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Required power to heat up the system until it runs at steady state</TD>
    <TD>PHeatUp</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Time until CHP operates in steady state</TD>
    <TD>tCHPStart</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Time until CHP is at ambient temperature</TD>
    <TD>tCHPAmbientTemperature</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>CosPhi of the CHP</TD>
    <TD>CosPhi</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Set supply temperature</TD>
    <TD>TSupSet</TD>
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
    <TD>CHPon</TD>
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
    <TH>Results:</TH>
    <TD>Flow rate when chps is turned off</TD>
    <TD>qv_Stop</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Starting time of the CHP</TD>
    <TD>StartTime</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Stop time of the CHP</TD>
    <TD>StopTime</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Factor of how much power is still required to heat up the CHP</TD>
    <TD>HeatUpFactor</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Modulation of the CHP</TD>
    <TD>CHPModulation</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>CHP on or off</TD>
    <TD>CHPOn</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Gas power</TD>
    <TD>PGas</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heat power of the CHP</TD>
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
    <TD>Cumulated gas energy of the CHP</TD>
    <TD>EGas</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Cumulated electric energy of the CHP</TD>
    <TD>EEl</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Cumulated heat energy of the CHP</TD>
    <TD>EHeat</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Overall efficiency of the CHP</TD>
    <TD>EffTot</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Electric efficiency of the CHP</TD>
    <TD>EffEl</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heat efficiency of the CHP</TD>
    <TD>EffHeat</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Water flow through the CHP</TD>
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
    <TD>Return temperature to the CHP</TD>
    <TD>TRet</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Supply temperature from the CHP</TD>
    <TD>TSup</TD>
    <TD>&nbsp;</TD></TR></TBODY></TABLE></DIV>
<H2>Description:</H2>
<P><FONT color=\"#465e70\" size=\"2\">The heat generator can be switched 
 off&nbsp;completely by deactivating it via the parameter \"CHPButton\". 
 Otherwise,&nbsp;the CHP runs in idling mode.</FONT></P>
<P><FONT size=\"2\"><BR></FONT></P>
<P><FONT color=\"#465e70\" size=\"2\">Input/Control signals:</FONT></P>
<UL>
  <LI><FONT color=\"#465e70\" size=\"2\">CHP on/off - Boolean value to switch the    
   CHP on or off</FONT></LI>
  <LI><FONT color=\"#465e70\" size=\"2\">CHPModulation - Value of the modulation, if 
      it is below ModulationMin, it will be overwritten by that 
value</FONT></LI>
  <LI><FONT color=\"#465e70\" size=\"2\">TRet - Return temperature to the     
  CHP</FONT></LI></UL>
<P><FONT color=\"#465e70\" size=\"2\">Output signals:</FONT></P>
<UL>
  <LI><FONT color=\"#465e70\" size=\"2\">TSup - Supply temperature from the     
  CHP</FONT></LI>
  <LI><FONT color=\"#465e70\" size=\"2\">qvWater - Water flow from the     
  CHP</FONT></LI>
  <LI><FONT color=\"#465e70\" size=\"2\">PEl_phase - Electric power of the three     
  phases</FONT></LI>
  <LI><FONT color=\"#465e70\" size=\"2\">QEl_phase - reactive power of the three     
  phases</FONT></LI></UL>
<P><FONT size=\"2\"><BR><FONT color=\"#465e70\"></FONT></FONT></P><SPAN lang=\"EN-US\" 
style='font-family: \"Calibri\",sans-serif; font-size: 11pt; mso-bidi-font-size: 10.0pt; mso-fareast-font-family: SimSun; mso-ansi-language: EN-US; mso-fareast-language: EN-US; mso-bidi-language: AR-SA;'><FONT 
color=\"#465e70\" face=\"Arial\" size=\"2\"></FONT> 
<P></P><FONT color=\"#000000\"><FONT color=\"#465e70\" face=\"Arial\" size=\"2\"></FONT> 

<P><FONT color=\"#465e70\" face=\"Arial\" size=\"2\">The CHP is divided in into four  
sections and based on measurements from the  CoSES laboratory:</FONT></P><SPAN 
lang=\"EN-US\" style='font-family: \"Calibri\",sans-serif; font-size: 11pt; mso-bidi-font-size: 10.0pt; mso-fareast-font-family: SimSun; mso-ansi-language: EN-US; mso-fareast-language: EN-US; mso-bidi-language: AR-SA;'><FONT 
color=\"#465e70\" face=\"Arial\" size=\"2\"></FONT> 
<P></P><FONT color=\"#000000\"><FONT color=\"#465e70\" face=\"Arial\" size=\"2\"></FONT> 

<UL><FONT color=\"#465e70\" face=\"Arial\" size=\"2\"></FONT>     
  <LI><SPAN lang=\"EN-US\" style=\"mso-bidi-font-size: 10.0pt;\"><FONT color=\"#465e70\" 
  face=\"Arial\" size=\"2\">Start-up   process: At the beginning, the CHP draws     
  electric energy from the grid to   start the combustion engine. After the     
  engine has fired, the CHP generates   electrical energy and first heats up the 
      internal heating circuit before   providing heat to the heating system. 
  The     behavior is provided by a time   dependent look-up     
  table.</FONT></SPAN></LI><FONT color=\"#465e70\" face=\"Arial\" size=\"2\"></FONT>   
    
  <LI><SPAN lang=\"EN-US\" style=\"mso-bidi-font-size: 10.0pt;\"><SPAN lang=\"EN-US\" 
  style=\"mso-bidi-font-size: 10.0pt;\"><FONT color=\"#465e70\" face=\"Arial\" size=\"2\">Warm-up 
        process: If the CHP has been shut down for a long period of time, it     
  requires   additional energy to warm up and reach steady-state efficiency.     
  This energy is    subtracted from the steady-state efficiency and decreases    
   linearly over the   warm-up phase. The warm-up phase is shorter when the     
  downtime was   shorter.</FONT></SPAN></SPAN></LI><FONT color=\"#465e70\" face=\"Arial\" 
  size=\"2\"></FONT>     
  <LI><SPAN lang=\"EN-US\" style=\"mso-bidi-font-size: 10.0pt;\"><SPAN lang=\"EN-US\" 
  style=\"mso-bidi-font-size: 10.0pt;\"><SPAN lang=\"EN-US\" style=\"mso-bidi-font-size: 10.0pt;\"><FONT 
  color=\"#465e70\" face=\"Arial\" size=\"2\">Steady-state:   The steady-state     
  efficiency depends on the return temperature and power   modulation and is     
  defined by a two-dimensional look-up table. Load changes   during steady-state 
      are modeled with a rising or falling       
  flank.</FONT></SPAN></SPAN></SPAN></LI><FONT color=\"#465e70\" face=\"Arial\" 
  size=\"2\"></FONT>     
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
lang=\"EN-US\" style='font-family: \"Calibri\",sans-serif; font-size: 11pt; mso-bidi-font-size: 10.0pt;'><IMG 
width=\"1097\" height=\"518\" align=\"baseline\" style=\"width: 625px; height: 273px;\" 
alt=\"\" src=\"data:image/png;base64,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EEZG9ReqXRhOttookoiMD0USGRxFEpFxoUgiMi4USUTGgyKJyPhQJJHBUSQRGReKJCLjQpFEZDwokoiMD0USGZwf/vCHzcc+9rHmq1/9artFRJaZW2+9dXLPXnPNNe0WEVlmLr/88sk9S7iGiCw3Dz/88OR+xZ555pl2q4gsM48//vj0vuX/q4YiiYiIiIiIiIjIBookIiIiIiIiIiIbKJKIiIiIiIiIiGygSCIiIiIiIiIisoEiiYiIiIiIiIjIBookIiIiIiIiIiIbKJKIiIiIiIiIiGygSCIiIiIiIiIisoEiiYiIiIiIiIjIBookIiIisu3ceuutzaWXXjqxRx55pN0qIiIisrUokoiIiMi2gzjyghe8YGJ33XVXu1VERERka1EkERERkcH5xCc+0Zx99tkT++9//9tu7UaRRERERJYBRRIREREZnHe+851T0ePf//53u7Wbyy67rDnqqKMm9pvf/KbdKiIiIrK1KJKIiIjI4CwqkoiIiIgsA4okIiIiMjiKJCIiIjJGFElERERkcLZSJPnTn/7U3HHHHc0tt9zSPPjgg81zzz3X7jmYv/zlL82vf/3r5qabbmr27t3b27aPhx9+uLnzzjubn/zkJ5PzPfbYY+0eERERGTOKJCIiIjIYZ555ZnP88cc3L3zhC6ciyctf/vLJtmzve9/72iP2c8UVVzTHHXfcxO6+++526wFI/loee999901eL14n7NRTT2327NkzaRP89re/bd773vc2RxxxxKa2r33ta5vbbrutbdUPYs+uXbua17/+9ZvOgXFehCGEExERERkviiQiIiIyGKeffvpBAkLN3vGOd7RH7GdWdRtEknzsz3/+8+YlL3nJdFtpL37xi5tf/vKXk2N3797d2xZBZ5ZQ8te//rU57bTTqsdnQyy59tpr26NERERkbCiSiIiIyGDce++9k9CXU045ZSocIGiwLRuhLplFRBK8P/Aowevk85//fPOHP/yh+dvf/jbxQNm5c+e03ete97rmgQceaF760pdOvFly23vuuac5//zzp21f85rXdJYq/uc//9m88Y1vnLZ9+9vfPgmz2bdvX/P00083jz76aHPdddc1xx577LTNj3/84/ZoERERGROKJCIiIjI4i+YkWUQkwRA9yD9SQo6Rd7/73ZvaIaj88Y9/bFsc4Nlnn90UrnPzzTe3ezZz8cUXT9t8+MMfnhxX4/e//33zspe9bNLula98pQlrRURERogiiYiIiAzO4RZJvva1r7V7DgYvj9z2+uuvb/cczA033DBtd8kll7RbD0CYzYte9KLJ/hNPPLHT2yS4+uqrp+f73ve+124VERGRsaBIIiIiIoNzOEUScog89dRT7Z6DwcMkt/3Xv/7V7jmY3Pa8885rtx7gK1/5ynQ/SVtnQaWdaP+Rj3yk3SoiIiJjQZFEREREBudwiiRvetOb2q11nnzyyWnbN7/5ze3WOrntu971rnbrAS688MLpfvKtzMMxxxwzab9jx452i4iIiIwFRRIREREZnMMpkrztbW9rt9b5z3/+M21LktU+ctuaqMHxsZ9EsVGGuM+izPAsMUdERESWD0USERERGZzDKZKU5YNLZgkfmVltTzrppOn+RY3qOiIiIjIuFElERERkcFZFJHnLW94y3b9nz57md7/73dxGuWEREREZF4okIiIiMjirIpK8//3vn+6fNyeJiIiIjBdFEhERERmcM888cyouPP300+3WbpZVJPnMZz4z3f+5z32u3SoiIiKriiKJiIiIDM4HPvCBqbjw5z//ud3azbKKJPfff/90/6te9arecsIiIiIyfhRJREREZHA+/vGPT8WFG2+8sd3azbKKJHDeeedN21xwwQWTY2bxyCOPNI8//nj7l4iIiIwFRRIREREZnN27d0+FBTwwrr322uanP/1pc8cdd0xs7969bcv9LLNIsm/fvubVr371tN3pp5/e3HDDDc0//vGPtsV+EEa++93vNjt37myOOuqo5p577mn3iIiIyFhQJBEREZHB+d///jcRHUJYKK0UOpZZJIEHH3ywOfHEE6dtsSOOOKJ5xSteMRFQjjnmmE37MEUSERGR8aFIIiIiIoeFZ555prnqqquaM844ozn66KM3CQhjE0kAz5Err7yyOeGEE6bHlHbkkUc2b33rW5svfvGLzVNPPdUeKSIiImNBkURERES2BASJJ598cmKlgMA+tmHPPvtsu3UzXcfWOFxtgfdHuNC3v/3tZteuXc0XvvCF5pvf/Gbzq1/9qvn73//ethIREZExokgiIiIiIiIiIrKBIomIiIiIiIiIyAaKJCIiIiIiIiIiGyiSiIiIiIiIiIhsoEgiIiIiIiIiItI0zf8BH+7VgGlnYiEAAAAASUVORK5CYII=\" 
border=\"0\" hspace=\"0\"></SPAN></SPAN></SPAN></SPAN></P>
<P>
<UL style=\"list-style-type: disc; direction: ltr;\">
  <P><FONT face=\"Times New Roman\" size=\"3\"><BR></FONT></P></UL>
<P></P></FONT> 
<P>
<UL style=\"list-style-type: disc; direction: ltr;\">
  <P><BR></P></UL>
<P></P></SPAN> 
<P>
<UL style=\"list-style-type: disc; direction: ltr;\"></UL>
<P></P></FONT> 
<P></P></SPAN> 
<P></P>
<P><BR></P></BODY></HTML>
"),
		experiment(
			StopTime=1,
			StartTime=0,
			Tolerance=1e-06,
			Interval=0.001,
			__esi_MinInterval="9.999999999999999e-10",
			__esi_AbsTolerance="1e-6"));
end NeoTower2;
