// CP: 65001
// SimulationX Version: 4.2.3.69223
within CoSES_Models.HeatGenerator.GeneralModels.GeneratorExamples;
model CHP_new "Model of the CHP"
	Modelica.Blocks.Interfaces.RealInput CHPModulation "Modulation of the CHP" annotation(
		Placement(
			transformation(extent={{-70,-180},{-30,-140}}),
			iconTransformation(extent={{-170,-20},{-130,20}})),
		Dialog(
			group="Input Parameters",
			tab="Results",
			visible=false));
	Real StartTime(quantity="Basics.Time") "Starting time of the CHP";
	protected
		parameter Real tCHPStop(quantity="Basics.Time")=84 "Cool-down time of the CHP";
	public
		Real StopTime(quantity="Basics.Time") "Stop time of the CHP";
	protected
		parameter Real EffTotMax_Data(quantity="Basics.RelMagnitude")=0.9 "Maximum total efficiency to normalize the data";
	public
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
		Modelica.Blocks.Math.Max max1 annotation(Placement(transformation(extent={{20,-160},{40,-140}})));
		Modelica.Blocks.Sources.RealExpression MinimumModulation(y=ModulationMin) annotation(Placement(transformation(extent={{-55,-140},{-35,-120}})));
		Modelica.Blocks.Tables.CombiTable2D EffTotal_table(
			tableOnFile=true,
			tableName="Efficiency",
			fileName=classDirectory()+"neoTower2_Efficiency.txt") "Total efficiency of the heat pump" annotation(Placement(transformation(extent={{95,-75},{115,-55}})));
		Modelica.Blocks.Tables.CombiTable1Ds StartUp_table(
			tableOnFile=true,
			tableName="StartUp",
			fileName=classDirectory()+"neoTower2_StartUp.txt",
			columns={2,3,4,5,6}) "Start-up behavior of the CHP" annotation(Placement(transformation(extent={{95,-105},{115,-85}})));
		Modelica.Blocks.Math.Max max2 annotation(Placement(transformation(extent={{-5,-60},{15,-40}})));
		Modelica.Blocks.Sources.RealExpression MinimumReturnTemperature(y=TRetMin) "Minimum return temperature" annotation(Placement(transformation(extent={{-55,-40},{-35,-20}})));
		Modelica.Blocks.Tables.CombiTable1Ds CoolDown_table(
			tableOnFile=true,
			tableName="CoolDown",
			fileName=classDirectory()+"neoTower2_CoolDown.txt",
			columns={2,3,4,5}) "Cool down behavior of the CHP" annotation(Placement(transformation(extent={{95,-130},{115,-110}})));
		Modelica.Blocks.Interfaces.BooleanInput CHPOn "CHP on or off" annotation(Placement(
			transformation(extent={{-120,30},{-80,70}}),
			iconTransformation(extent={{-170,80},{-130,120}})));
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
	protected
		parameter Real tCHPStartUp(quantity="Basics.Time")=825 "Start-up time of the CHP" annotation(Dialog(
			group="Efficiency",
			tab="Results"));
	public
		Modelica.Blocks.Interfaces.RealOutput VWater(quantity="Thermics.VolumeFlow") "Water flow through the CHP" annotation(
			Placement(
				transformation(extent={{-50,-115},{-30,-95}}),
				iconTransformation(extent={{136.7,-110},{156.7,-90}})),
			Dialog(
				group="Water Flow",
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
		parameter Real tCHPStart(
			quantity="Basics.Time",
			displayUnit="h")=10800 "Time until CHP operates in steady state" annotation(Dialog(
			group="Power and Efficiency",
			tab="Parameters"));
		parameter Real CosPhi=0.92 "CosPhi of the CHP" annotation(Dialog(
			group="Power and Efficiency",
			tab="Parameters"));
		parameter Real TSupSet(quantity="Basics.Temp")=353.15 "Set supply temperature" annotation(Dialog(
			group="Temperature",
			tab="Parameters"));
		parameter Real TRetMax(quantity="Basics.Temp")=343.15 "Maximum return temperature" annotation(Dialog(
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
		Modelica.Blocks.Nonlinear.SlewRateLimiter slewRateLimiter1(
			Rising=0.025,
			Td=0.1) annotation(Placement(transformation(extent={{-20,-170},{0,-150}})));
		Modelica.Blocks.Logical.And CHPon annotation(Placement(transformation(extent={{-45,40},{-25,60}})));
		Modelica.Blocks.Sources.BooleanStep booleanStep1(startTime=1) annotation(Placement(transformation(extent={{-95,15},{-75,35}})));
	initial equation
		// enter your equations here
		
		StartTime = time.start;
		StopTime = time.start;
	equation
		// enter your equations here
		
		when CHPOn then
			StartTime = time;
		end when;
		
		when not CHPOn then
			StopTime = time;
		end when;
		
		StartUp_table.u = (time - StartTime);
		CoolDown_table.u = (time - StopTime);
		
		if CHPOn and CHPButton and (TRet <TRetMax) then	//CHP on
			if ((time - StartTime) < tCHPStartUp) and (StartTime > time.start) then	// Start-up behavior
				slewRateLimiter1.u = 1;
				
				// power & efficiency
				PEl = StartUp_table.y[1] * PElMax;
				QEl = StartUp_table.y[2] * PElMax * (1 / CosPhi - 1);
				PHeat = StartUp_table.y[3] * PElMax / EffElMax * (EffTotal_table.y - EffElMax);	// * Factor - TBD!!!
				PGas = StartUp_table.y[4] * PElMax / EffElMax;
				
				// efficiency
				if PGas > 0 then
					EffEl = max(0, PEl / PGas);
					EffHeat = PHeat / PGas;
				else
					EffEl = 0;
					EffHeat = 0;
				end if;
				EffTot = EffEl + EffHeat;
						
				// temperature & flow rate
				TSup = max(TRet + 1, StartUp_table.y[5] + 273.15);
				VWater = PHeat / (cpMed * rhoMed * (TSup - TRet));
				
			elseif ((time - StartTime) < tCHPStart) and (StartTime > time.start) then	// Time until CHP runs in steady state
				slewRateLimiter1.u = CHPModulation;
				
				// efficiency
				EffEl = EffElMin + (EffElMax - EffElMin) * (max1.y - ModulationMin) / (1 - ModulationMin);
				EffTot = EffTotal_table.y / EffTotMax_Data * EffTotMax;
				EffHeat = EffTot - EffEl;	// * Factor - TBD!!!
		
				// power
				PEl = PElMin + (PElMax - PElMin) * (max1.y - ModulationMin) / (1 - ModulationMin);
				QEl = PEl * (1 / CosPhi - 1);
				PHeat = PEl / EffEl * EffHeat;
				PGas = PEl / EffEl;
		
				
				// temperature & flow rate
				TSup = TSupSet;
				VWater = PHeat / (cpMed * rhoMed * (TSup - TRet));
				
			else	// CHP runs in steady state
				slewRateLimiter1.u = CHPModulation;
				// efficiency
				EffEl = EffElMin + (EffElMax - EffElMin) * (max1.y - ModulationMin) / (1 - ModulationMin);
				EffTot = EffTotal_table.y / EffTotMax_Data * EffTotMax;
				EffHeat = EffTot - EffEl;
				
				// power
				PEl = PElMin + (PElMax - PElMin) * (max1.y - ModulationMin) / (1 - ModulationMin);
				QEl = PEl * (1 / CosPhi - 1);
				PHeat = PEl / EffEl * EffHeat;
				PGas = PEl / EffEl;
		
				
				// temperature & flow rate
				TSup = TSupSet;
				VWater = PHeat / (cpMed * rhoMed * (TSup - TRet));
			end if;
			
			PEl_phase[1] = 0.35 * PEl;
			PEl_phase[2] = 0.35 * PEl;
			PEl_phase[3] = 0.3 * PEl;
			
			QEl_phase[1] = QEl / 3;
			QEl_phase[2] = QEl / 3;
			QEl_phase[3] = QEl / 3;
			
		elseif CHPButton then
			slewRateLimiter1.u = 0;
			if ((time - StopTime) < tCHPStop) and (StopTime > time.start) then	// Cool down behavior
				// temperature & flow rate
				TSup = CoolDown_table.y[1] + 273.15;
				VWater = CoolDown_table.y[2] / 60000;
				
				// power & efficiency
				PEl = CoolDown_table.y[3];
				QEl = CoolDown_table.y[4];
				PHeat = VWater * cpMed * rhoMed * (TSup - TRet);
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
				VWater = 0;
			end if;
			
			PEl_phase[1] = 0;
			PEl_phase[2] = 0;
			PEl_phase[3] = PEl;
			
			QEl_phase[1] = 0;
			QEl_phase[2] = 0;
			QEl_phase[3] = QEl;
		
		else
			// efficiency
			EffEl = 0;
			EffTot = 0;
			EffHeat = 0;
			
			// power & efficiency
			PEl = 0;
			QEl = 0;
			PHeat = 0;
			PGas = 0;
			PEl_phase[1] = 0;
			PEl_phase[2] = 0;
			PEl_phase[3] = 0;
			QEl_phase[1] = 0;
			QEl_phase[2] = 0;
			QEl_phase[3] = 0;
			
			// temperature & flow rate
			TSup = TRet;
			VWater = 0;
		end if;
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
		connect(max1.y,EffTotal_table.u2) annotation(Line(
			points={{41,-150},{46,-150},{88,-150},{88,-71},{93,-71}},
			color={0,0,127},
			thickness=0.0625));
		connect(slewRateLimiter1.y,max1.u2) annotation(Line(
			points={{1,-160},{6,-160},{13,-160},{13,-156},{18,-156}},
			color={0,0,127},
			thickness=0.0625));
		connect(CHPon.u1,CHPOn) annotation(Line(
			points={{-47,50},{-52,50},{-95,50},{-100,50}},
			color={255,0,255},
			thickness=0.0625));
		connect(booleanStep1.y,CHPon.u2) annotation(Line(
			points={{-74,25},{-69,25},{-52,25},{-52,42},{-47,42}},
			color={255,0,255},
			thickness=0.0625));
	annotation(
		Icon(coordinateSystem(extent={{-150,-150},{150,150}})),
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
end CHP_new;
