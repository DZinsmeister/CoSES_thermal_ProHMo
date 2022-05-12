// CP: 65001
// SimulationX Version: 4.2.3.69223
within CoSES_Models.HeatGenerator.LaboratoryModels;
model WolfCHA "Wolf Heatpump CHA"
	protected
		Real StartTime(quantity="Basics.Time") "Starting time of heating" annotation(HideResult=false);
		parameter Real tHPStart(
			quantity="Basics.Time",
			displayUnit="s")=10 "Time until HP operates in steady state" annotation(HideResult=false);
	public
		Real StopTime(quantity="Basics.Time") "Stop time of the HP";
	protected
		parameter Real tHPStop(quantity="Basics.Time")=10 "Cool-down time of the HP";
		parameter Real tDeIcing(
			quantity="Basics.Time",
			displayUnit="min")=1800 "Time of a whole cycle between two deicing starts";
		parameter Real tDeIcingOn(
			quantity="Basics.Time",
			displayUnit="min")=60 "Time, when the heat pump is actively DeIcing";
	public
		Modelica.Blocks.Tables.CombiTable2D PElHeatFactor_table(
			tableOnFile=true,
			tableName="PEl",
			fileName=classDirectory()+"Data\\WolfCHA10\\CHA10_TAmbHeat.txt",
			tableID "External table object") "Multiplication factor for the electrical power demand of the heat pump during heating" annotation(Placement(transformation(extent={{80,-105},{100,-85}})));
		Modelica.Blocks.Tables.CombiTable2D PHeatFactor_table(
			tableOnFile=true,
			tableName="QHeat",
			fileName=classDirectory()+"Data\\WolfCHA10\\CHA10_TAmbHeat.txt",
			tableID "External table object") "Multiplication factor for the heat output of the heat pump" annotation(Placement(transformation(extent={{120,-105},{140,-85}})));
		Modelica.Blocks.Tables.CombiTable2D PElHeatModulationFactor_table(
			tableOnFile=true,
			tableName="PEl",
			fileName=classDirectory()+"Data\\WolfCHA10\\CHA10_ModulationHeat.txt",
			tableID "External table object") "Multiplication factor for the electric power due to modulating during heating" annotation(Placement(transformation(extent={{80,-180},{100,-160}})));
		Modelica.Blocks.Tables.CombiTable2D PHeatModulationFactor_table(
			tableOnFile=true,
			tableName="QHeat",
			fileName=classDirectory()+"Data\\WolfCHA10\\CHA10_ModulationHeat.txt",
			tableID "External table object") "Multiplication factor for the heat output due to modulating" annotation(Placement(transformation(extent={{120,-180},{140,-160}})));
		Modelica.Blocks.Tables.CombiTable2D PElCoolingFactor_table(
			tableOnFile=true,
			tableName="PEl",
			fileName=classDirectory()+"Data\\WolfCHA10\\CHA10_TAmbCold.txt",
			tableID "External table object") "Multiplication factor for the electrical power demand of the heat pump during cooling" annotation(Placement(transformation(extent={{160,-105},{180,-85}})));
		Modelica.Blocks.Tables.CombiTable2D PCoolingFactor_table(
			tableOnFile=true,
			tableName="PCold",
			fileName=classDirectory()+"Data\\WolfCHA10\\CHA10_TAmbCold.txt",
			tableID "External table object") "Multiplication factor for the cold output of the heat pump" annotation(Placement(transformation(extent={{200,-105},{220,-85}})));
		Modelica.Blocks.Tables.CombiTable2D PElCoolingModulationFactor_table(
			tableOnFile=true,
			tableName="PEl",
			fileName=classDirectory()+"Data\\WolfCHA10\\CHA10_ModulationCold.txt",
			tableID "External table object") "Multiplication factor for the electric power due to modulating during cooling" annotation(Placement(transformation(extent={{160,-180},{180,-160}})));
		Modelica.Blocks.Tables.CombiTable2D PCoolingModulationFactor_table(
			tableOnFile=true,
			tableName="PCold",
			fileName=classDirectory()+"Data\\WolfCHA10\\CHA10_ModulationCold.txt",
			tableID "External table object") "Multiplication factor for the cold output due to modulating" annotation(Placement(transformation(extent={{200,-180},{220,-160}})));
		Modelica.Blocks.Nonlinear.SlewRateLimiter slewRateLimiter1(
			Rising=0.025,
			Td=0.1) "Limits the slew rate of a signal" annotation(Placement(transformation(extent={{-50,-230},{-30,-210}})));
		Modelica.Blocks.Math.Max HPModulation_Min annotation(Placement(transformation(extent={{-10,-220},{10,-200}})));
		Modelica.Blocks.Math.Min HPModulation_Max annotation(Placement(transformation(extent={{25,-210},{45,-190}})));
		Modelica.Blocks.Sources.RealExpression MaximumModulation(y=1) annotation(Placement(transformation(extent={{-10,-190},{10,-170}})));
		Modelica.Blocks.Sources.RealExpression MinimumModulation(y=0.2) annotation(Placement(transformation(extent={{-50,-195},{-30,-175}})));
		Modelica.Blocks.Sources.BooleanStep booleanStep1(startTime=0.1) annotation(Placement(transformation(extent={{-80,-335},{-60,-315}})));
		parameter Boolean HPButton=true "On / off button of the heat pump (if switched off, no power during idling, but doesn't react to commands from the control system)" annotation(Dialog(tab="Parameters"));
		parameter Real PAuxMax(quantity="Basics.Power")=6000 "Maximum power of the auxiliary heater" annotation(Dialog(
			group="Nominal Power and Efficiency",
			tab="Parameters"));
		parameter Real PHeatNom(quantity="Basics.Power")=5750 "Nominal heat output at A2/W35 (not maximum heat output)" annotation(Dialog(
			group="Nominal Power and Efficiency",
			tab="Parameters"));
		parameter Real PCoolingNom(quantity="Basics.Power")=6010 "Nominal cooling power at A35/W18 (not maximum cooling output)" annotation(Dialog(
			group="Nominal Power and Efficiency",
			tab="Parameters"));
		parameter Real COPNom=4.65 "Nominal COP at A2/W35" annotation(Dialog(
			group="Nominal Power and Efficiency",
			tab="Parameters"));
		parameter Real EERNom=5.92 "Nominal EER at A35/W18" annotation(Dialog(
			group="Nominal Power and Efficiency",
			tab="Parameters"));
	protected
		parameter Real PElHeatNom(
			quantity="Basics.Power",
			displayUnit="Nm/s")=PHeatNom / COPNom "Nominal electricity consumption during heating at A2/W35" annotation(Dialog(
			group="Nominal Power and Efficiency",
			tab="Parameters"));
		parameter Real PElCoolingNom(
			quantity="Basics.Power",
			displayUnit="Nm/s")=PCoolingNom / EERNom "Nominal electricity consumption during cooling at A35W18" annotation(Dialog(
			group="Nominal Power and Efficiency",
			tab="Parameters"));
	public
		parameter Real PElIdle(
			quantity="Basics.Power",
			displayUnit="W")=15 "Consumed power during idling" annotation(Dialog(
			group="Nominal Power and Efficiency",
			tab="Parameters"));
		parameter Real CosPhi=0.95 "CosPhi of the heat pump during operation" annotation(Dialog(
			group="Nominal Power and Efficiency",
			tab="Parameters"));
		parameter Real TRetMaxHeat(quantity="Basics.Temp")=341.15 "Maximum return temperature" annotation(Dialog(
			group="Temperature",
			tab="Parameters",
			visible=false));
		parameter Real TRetMaxCooling(quantity="Basics.Temp")=303.15 "Maximum return temperature" annotation(Dialog(
			group="Temperature",
			tab="Parameters"));
		parameter Real TRetMinHeat(quantity="Basics.Temp")=288.15 "Minimum return temperature" annotation(Dialog(
			group="Temperature",
			tab="Parameters"));
		parameter Real TRetMinCooling(quantity="Basics.Temp")=280.15 "Minimum return temperature" annotation(Dialog(
			group="Temperature",
			tab="Parameters"));
		parameter Real TDeIcing(quantity="Basics.Temp")=278.15 "Ambient temperature, when the heat pump requires DeIcing" annotation(Dialog(
			group="Temperature",
			tab="Parameters"));
		parameter Real DeltaTHeat(quantity="Thermics.TempDiff")=5 "Temperature difference between supply and return during heating" annotation(Dialog(
			group="Temperature",
			tab="Parameters"));
		parameter Real DeltaTCooling(quantity="Thermics.TempDiff")=5 "Temperature difference between supply and return during cooling" annotation(Dialog(
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
		Modelica.Blocks.Interfaces.RealInput HPModulation "Modulation of the HP for heating or cooling - between 15 and 100%" annotation(
			Placement(
				transformation(extent={{-104.9,-240},{-64.90000000000001,-200}}),
				iconTransformation(extent={{-170,-70},{-130,-30}})),
			Dialog(
				group="Modulation",
				tab="Results",
				visible=false));
		Modelica.Blocks.Interfaces.RealInput AUXModulation "Modulation of the auxiliary heater - discrete in 3 steps:
< 33% => 33%
33% - 67% => 67%
> 67% => 100%" annotation(
			Placement(
				transformation(extent={{-104.9,-275},{-64.90000000000001,-235}}),
				iconTransformation(extent={{-170,-120},{-130,-80}})),
			Dialog(
				group="Modulation",
				tab="Results",
				visible=false));
		Modelica.Blocks.Interfaces.BooleanInput HPOn "If true, HP is switched on" annotation(
			Placement(
				transformation(extent={{-100,-319.9},{-60,-279.9}}),
				iconTransformation(extent={{-170,80},{-130,120}})),
			Dialog(
				group="Dynamics",
				tab="Results",
				visible=false));
		Modelica.Blocks.Interfaces.BooleanInput HPmode(
			fixed=true,
			start=true) "If true, heat pump is in heating mode, if not, HP is in cooling mode" annotation(
			Placement(
				transformation(extent={{-100,-379.9},{-60,-339.9}}),
				iconTransformation(extent={{-170,30},{-130,70}})),
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
		Boolean DeIcing(
			start=false,
			fixed=true) "If true, heat pump is currently deicing" annotation(Dialog(
			group="Dynamics",
			tab="Results",
			visible=false));
		Modelica.Blocks.Interfaces.RealOutput VWater(quantity="Thermics.VolumeFlow") "Water flow through the heat pump" annotation(
			Placement(
				transformation(extent={{-85,-90},{-65,-70}}),
				iconTransformation(extent={{136.7,-60},{156.7,-40}})),
			Dialog(
				group="Water Flow",
				tab="Results",
				visible=false));
		Modelica.Blocks.Interfaces.RealInput TRet(quantity="Basics.Temp") "Return temperature to the heat pump" annotation(
			Placement(
				transformation(extent={{-110,-55.1},{-70,-15.1}}),
				iconTransformation(extent={{166.7,30},{126.7,70}})),
			Dialog(
				group="Temperature",
				tab="Results",
				visible=false));
		Modelica.Blocks.Interfaces.RealOutput TSup(quantity="Basics.Temp") "Supply temperature from the heat pump" annotation(
			Placement(
				transformation(extent={{-85,-70},{-65,-50}}),
				iconTransformation(extent={{136.7,-10},{156.7,10}})),
			Dialog(
				group="Temperature",
				tab="Results",
				visible=false));
		Real THP_out(quantity="Basics.Temp") "Output temperature of the heat pump" annotation(Dialog(
			group="Temperature",
			tab="Results",
			visible=false));
		Modelica.Blocks.Interfaces.RealInput TAmb(quantity="Basics.Temp") "Ambietnt air temperature" annotation(
			Placement(
				transformation(extent={{-105,-140},{-65,-100}}),
				iconTransformation(
					origin={-100,150},
					extent={{-20,-20},{20,20}},
					rotation=-90)),
			Dialog(
				group="Ambient Conditions",
				tab="Results",
				visible=false));
		Modelica.Blocks.Interfaces.RealInput HumidityAmb(quantity="Basics.RelMagnitude") "Ambient air humidity" annotation(
			Placement(
				transformation(extent={{-105,-170},{-65,-130}}),
				iconTransformation(
					origin={-50,150},
					extent={{-20,-20},{20,20}},
					rotation=-90)),
			Dialog(
				group="Ambient Conditions",
				tab="Results",
				visible=false));
		Modelica.Blocks.Interfaces.RealOutput PEl_phase[3](quantity="Basics.Power") "Electric consumption of the three phases" annotation(
			Placement(
				transformation(extent={{250,-85},{270,-65}}),
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
					origin={290,-75},
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
		Real PCooling(quantity="Basics.Power") "Cooling output of the heat pump" annotation(Dialog(
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
		Real ECooling(quantity="Basics.Energy") "Cumulated cooling energy of the HP" annotation(Dialog(
			group="Energy",
			tab="Results",
			visible=false));
		Real COP "Coefficiency of performance (heating)" annotation(Dialog(
			group="Efficiency",
			tab="Results",
			visible=false));
		Real EER "Energy Efficiency Ratio (Cooling)" annotation(Dialog(
			group="Efficiency",
			tab="Results",
			visible=false));
		Modelica.Blocks.Math.Max THPout_Heat annotation(Placement(transformation(extent={{25,-15},{45,5}})));
		Modelica.Blocks.Math.Min THPout_Cooling annotation(Placement(transformation(extent={{125,10},{145,30}})));
		Modelica.Blocks.Math.Add add1 annotation(Placement(transformation(extent={{-20,-20},{0,0}})));
		Modelica.Blocks.Sources.RealExpression DeltaT_Heat(y=DeltaTHeat) annotation(Placement(transformation(extent={{-70,-10},{-50,10}})));
		Modelica.Blocks.Sources.RealExpression TRetMin_Heat(y=TRetMinHeat) annotation(Placement(transformation(extent={{-20,10},{0,30}})));
		Modelica.Blocks.Math.Add add2(k1=-1) annotation(Placement(transformation(extent={{90,5},{110,25}})));
		Modelica.Blocks.Sources.RealExpression TRetMin_Heat1(y=TRetMinHeat) "Set output signal to a time varying Real expression" annotation(Placement(transformation(extent={{90,35},{110,55}})));
		Modelica.Blocks.Sources.RealExpression DeltaT_Cooling(y=DeltaTCooling) annotation(Placement(transformation(extent={{55,15},{75,35}})));
		Modelica.Blocks.Logical.And HPon annotation(Placement(transformation(extent={{-15,-310},{5,-290}})));
	initial equation
		// enter your equations here
		
		StartTime = time.start;
		StopTime = time.start;
		
		EEl_HP = 0;
		EEl_Aux = 0;
		EHeat_HP = 0;
		EHeat_Aux = 0;
		ECooling = 0;
	equation
		// enter your equations here
		
		when HPon.y or change(HPmode) then
			StartTime=time;
		end when;
		
		when not HPon.y then
			StopTime = time;
		end when;
		
		if HPButton and ((HPon.y and ((HPmode and (TRet < TRetMaxHeat)) or (not HPmode and (TRet > TRetMinCooling)))) or pre(DeIcing)) then	// Heat pump running
			if HPmode then	// Heat pump in heating mode
				if ((time - StartTime) < tHPStart) and (StartTime > time.start) then	// Start-up behavior - TBD!!!
					slewRateLimiter1.u = 1;
					StartUp = true;
					DeIcing = false;
					CoolDown = false;
					// power
					PEl_HP = 0;
					PHeat_HP = 0;
					PHeat_Aux = 0;
					PEl_Aux = 0;
					PElAux_phase = {0, 0, 0};
					PCooling = 0;
					
					// temperature & flow rate
					VWater = 0;
					THP_out = TRet;
					TSup = THP_out;	
					
				elseif TAmb < TDeIcing and (rem((time - StartTime), tDeIcing) > (tDeIcing - tDeIcingOn)) then	// DeIcing - TBD!!!
					slewRateLimiter1.u = HPModulation;
					StartUp = false;
					DeIcing = true;
					CoolDown = false;
					// power
					PEl_HP = 0;
					PHeat_HP = 0;
					PHeat_Aux = 0;
					PEl_Aux = 0;
					PElAux_phase = {0, 0, 0};
					PCooling = 0;
					
					// temperature & flow rate
					VWater = 0;
					THP_out = TRet;
					TSup = THP_out;
					
				else	// steady state
					StartUp = false;
					DeIcing = false;
					CoolDown = false;
					// power
					if AUXModulation > 0.67 then
						PHeat_Aux = PAuxMax;
						PElAux_phase = {-PAuxMax / 3, -PAuxMax / 3, -PAuxMax / 3};
						slewRateLimiter1.u = 1;
					elseif AUXModulation > 0.33 then
						PHeat_Aux = PAuxMax * 2 / 3;
						PElAux_phase = {-PAuxMax / 3, -PAuxMax / 3, 0};
						slewRateLimiter1.u = 1;
					elseif AUXModulation > 0 then
						PHeat_Aux = PAuxMax / 3;
						PElAux_phase = {-PAuxMax / 3, 0, 0};
						slewRateLimiter1.u = 1;
					else
						PHeat_Aux = 0;
						PElAux_phase = {0, 0, 0};
						slewRateLimiter1.u = HPModulation;
					end if;
					PEl_Aux = -PHeat_Aux;
					PEl_HP = -PElHeatFactor_table.y * PElHeatModulationFactor_table.y * PElHeatNom;
					PHeat_HP = PHeatFactor_table.y * PHeatModulationFactor_table.y * PHeatNom;
					PCooling = 0;
					
					// temperature & flow rate
					VWater = PHeat_HP / (cpMed * rhoMed * DeltaTHeat);
					THP_out = THPout_Heat.y;
					if VWater > 0 then
						TSup = THP_out + PHeat_Aux / (cpMed * rhoMed * VWater);
					else
						TSup = THP_out;
					end if;
				end if;
				
			else	// Heat pump in cooling mode
				if ((time - StartTime) < tHPStart) and (StartTime > time.start) then	// Start-up behavior - TBD!!!
					slewRateLimiter1.u = 1;
					StartUp = true;
					DeIcing = false;
					CoolDown = false;
					// power
					PEl_HP = 0;
					PHeat_HP = 0;
					PHeat_Aux = 0;
					PEl_Aux = 0;
					PElAux_phase = {0, 0, 0};
					PCooling = 0;
					
					// temperature & flow rate
					VWater = 0;
					THP_out = TRet;
					TSup = THP_out;	
					
				else	// steady state
					slewRateLimiter1.u = HPModulation;
					StartUp = false;
					DeIcing = false;
					CoolDown = false;
					// power
					PEl_HP = -PElCoolingFactor_table.y * PElCoolingModulationFactor_table.y * PElCoolingNom;
					PHeat_HP = 0;
					PHeat_Aux = 0;
					PEl_Aux = 0;
					PElAux_phase = {0, 0, 0};
					PCooling = PCoolingFactor_table.y * PCoolingModulationFactor_table.y * PCoolingNom;
					
					// temperature & flow rate
					VWater = PCooling / (cpMed * rhoMed * DeltaTCooling);
					THP_out = THPout_Cooling.y;
					TSup = THP_out;
				end if;
			end if;
			
			QEl = PEl_HP * (1 / CosPhi - 1);
			PEl_phase = {0.35 * PEl_HP + PElAux_phase[1], 0.35 * PEl_HP +  + PElAux_phase[2], 0.3 * PEl_HP +  + PElAux_phase[3]};
			QEl_phase = {QEl / 3, QEl / 3, QEl / 3};
		
		elseif HPButton then	// Heat pump off
			slewRateLimiter1.u = 0;
			StartUp = false;
			DeIcing = false;
			if ((time - StopTime) < tHPStop) and (StopTime > time.start) and ((HPmode and (TRet < TRetMaxHeat)) or (not HPmode and (TRet > TRetMinCooling))) then	// CoolDown
				CoolDown = true;
				// power
				PEl_HP = -PElIdle;
				QEl = 0;
				PHeat_HP = 0;
				PCooling = 0;
				
				// temperature & flow rate
				THP_out = TRet;
				VWater = 0;
				TSup = THP_out;	
			else
				CoolDown = false;
				// power
				PEl_HP = -PElIdle;
				QEl = 0;
				PHeat_HP = 0;
				PCooling = 0;
				
				// temperature & flow rate
				THP_out = TRet;
				VWater = 0;
				TSup = THP_out;	
			end if;
			
			PHeat_Aux = 0;
			PEl_Aux = 0;
			PElAux_phase = {0, 0, 0};	
			PEl_phase = {PEl_HP, 0, 0};
			QEl_phase = {QEl, 0, 0};
			
		else
			slewRateLimiter1.u = 0;
			StartUp = false;
			DeIcing = false;
			CoolDown = false;
			// power
			PEl_HP = 0;
			QEl = 0;
			PHeat_HP = 0;
			PHeat_Aux = 0;
			PEl_Aux = 0;
			PCooling = 0;
			
			PElAux_phase = {0, 0, 0};	
			PEl_phase = {0, 0, 0};
			QEl_phase = {QEl, 0, 0};
			
			// temperature & flow rate
			THP_out = TRet;
			VWater = 0;
			TSup = THP_out;	
			
		end if;
		
		// Efficiency
		if PEl_HP < -PElIdle then
			COP = -(PHeat_HP + PHeat_Aux) / (PEl_HP + PEl_Aux);
			EER = -PCooling / PEl_HP;
		else
			COP = 0;
			EER = 0;
		end if;
		
		der(EEl_HP) = PEl_HP;
		der(EEl_Aux) = PEl_Aux;
		der(EHeat_HP) = PHeat_HP;
		der(EHeat_Aux) = PHeat_Aux;
		der(ECooling) = PCooling;
	equation
		connect(TAmb,PElHeatFactor_table.u2) annotation(Line(
			points={{-85,-120},{-80,-120},{73,-120},{73,-101},{78,-101}},
			color={0,0,127},
			thickness=0.0625));
		connect(TAmb,PHeatFactor_table.u2) annotation(Line(
			points={{-85,-120},{-80,-120},{113,-120},{113,-101},{118,-101}},
			color={0,0,127},
			thickness=0.0625));
		connect(TAmb,PElCoolingFactor_table.u2) annotation(Line(
			points={{-85,-120},{-80,-120},{153,-120},{153,-101},{158,-101}},
			color={0,0,127},
			thickness=0.0625));
		connect(TAmb,PCoolingFactor_table.u2) annotation(Line(
			points={{-85,-120},{-80,-120},{193,-120},{193,-101},{198,-101}},
			color={0,0,127},
			thickness=0.0625));
		connect(slewRateLimiter1.y,HPModulation_Min.u2) annotation(Line(
			points={{-29,-220},{-24,-220},{-17,-220},{-17,-216},{-12,-216}},
			color={0,0,127},
			thickness=0.015625));
		connect(HPModulation_Max.y,PCoolingModulationFactor_table.u2) annotation(Line(
			points={{46,-200},{51,-200},{193,-200},{193,-176},{198,-176}},
			color={0,0,127},
			thickness=0.0625));
		connect(HPModulation_Max.y,PElCoolingModulationFactor_table.u2) annotation(Line(
			points={{46,-200},{51,-200},{153,-200},{153,-176},{158,-176}},
			color={0,0,127},
			thickness=0.0625));
		connect(HPModulation_Max.y,PHeatModulationFactor_table.u2) annotation(Line(
			points={{46,-200},{51,-200},{113,-200},{113,-176},{118,-176}},
			color={0,0,127},
			thickness=0.0625));
		connect(HPModulation_Max.y,PElHeatModulationFactor_table.u2) annotation(Line(
			points={{46,-200},{51,-200},{73,-200},{73,-176},{78,-176}},
			color={0,0,127},
			thickness=0.0625));
		connect(MaximumModulation.y,HPModulation_Max.u1) annotation(Line(
			points={{11,-180},{16,-180},{18,-180},{18,-194},{23,-194}},
			color={0,0,127},
			thickness=0.0625));
		connect(HPModulation_Max.u2,HPModulation_Min.y) annotation(Line(
			points={{23,-206},{18,-206},{16,-206},{16,-210},{11,-210}},
			color={0,0,127},
			thickness=0.0625));
		connect(MinimumModulation.y,HPModulation_Min.u1) annotation(Line(
			points={{-29,-185},{-24,-185},{-17,-185},{-17,-204},{-12,-204}},
			color={0,0,127},
			thickness=0.0625));
		connect(TRet,add1.u2) annotation(Line(
			points={{-90,-35},{-85,-35},{-27,-35},{-27,-16},{-22,-16}},
			color={0,0,127},
			thickness=0.0625));
		connect(add1.u1,DeltaT_Heat.y) annotation(Line(
			points={{-22,-4},{-27,-4},{-44,-4},{-44,0},{-49,0}},
			color={0,0,127},
			thickness=0.0625));
		connect(PElHeatModulationFactor_table.u1,THPout_Heat.y) annotation(Line(
			points={{78,-164},{73,-164},{51,-164},{51,-5},{46,-5}},
			color={0,0,127},
			thickness=0.0625));
		connect(PHeatModulationFactor_table.u1,THPout_Heat.y) annotation(
			Line(
				points={{118,-164},{113,-164},{110,-164},{110,-5},{46,-5}},
				color={0,0,127},
				thickness=0.0625),
			__esi_AutoRoute=false);
		connect(THPout_Heat.y,PHeatFactor_table.u1) annotation(
			Line(
				points={{46,-5},{50,-5},{110,-5},{110,-89},{118,-89}},
				color={0,0,127},
				thickness=0.0625),
			__esi_AutoRoute=false);
		connect(PElHeatFactor_table.u1,THPout_Heat.y) annotation(Line(
			points={{78,-89},{73,-89},{51,-89},{51,-5},{46,-5}},
			color={0,0,127},
			thickness=0.0625));
		connect(TRetMin_Heat.y,THPout_Heat.u1) annotation(Line(
			points={{1,20},{6,20},{18,20},{18,1},{23,1}},
			color={0,0,127},
			thickness=0.0625));
		connect(THPout_Heat.u2,add1.y) annotation(Line(
			points={{23,-11},{18,-11},{6,-11},{6,-10},{1,-10}},
			color={0,0,127},
			thickness=0.0625));
		connect(TRet,add2.u2) annotation(Line(
			points={{-90,-35},{-85,-35},{83,-35},{83,9},{88,9}},
			color={0,0,127},
			thickness=0.0625));
		connect(add2.u1,DeltaT_Cooling.y) annotation(Line(
			points={{88,21},{83,21},{81,21},{81,25},{76,25}},
			color={0,0,127},
			thickness=0.0625));
		connect(THPout_Cooling.y,PCoolingModulationFactor_table.u1) annotation(
			Line(
				points={{146,20},{151,20},{190,20},{190,-164},{198,-164}},
				color={0,0,127},
				thickness=0.0625),
			__esi_AutoRoute=false);
		connect(THPout_Cooling.y,PCoolingFactor_table.u1) annotation(
			Line(
				points={{146,20},{151,20},{190,20},{190,-89},{198,-89}},
				color={0,0,127},
				thickness=0.0625),
			__esi_AutoRoute=false);
		connect(PElCoolingFactor_table.u1,THPout_Cooling.y) annotation(Line(
			points={{158,-89},{153,-89},{151,-89},{151,20},{146,20}},
			color={0,0,127},
			thickness=0.0625));
		connect(PElCoolingModulationFactor_table.u1,THPout_Cooling.y) annotation(Line(
			points={{158,-164},{153,-164},{151,-164},{151,20},{146,20}},
			color={0,0,127},
			thickness=0.0625));
		connect(THPout_Cooling.u1,TRetMin_Heat1.y) annotation(Line(
			points={{123,26},{118,26},{116,26},{116,45},{111,45}},
			color={0,0,127},
			thickness=0.0625));
		connect(THPout_Cooling.u2,add2.y) annotation(Line(
			points={{123,14},{118,14},{116,14},{116,15},{111,15}},
			color={0,0,127},
			thickness=0.0625));
		connect(HPon.u2,booleanStep1.y) annotation(Line(
			points={{-17,-308},{-22,-308},{-54,-308},{-54,-325},{-59,-325}},
			color={255,0,255},
			thickness=0.0625));
		connect(HPon.u1,HPOn) annotation(Line(
			points={{-17,-300},{-22,-300},{-75,-300},{-80,-300}},
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
					textString="ASHP CHA",
					fontSize=12,
					lineColor={0,0,255},
					extent={{-209.3,98.2},{214,-91.7}}),
				Text(
					textString="by CoSES",
					fontSize=12,
					lineColor={0,0,255},
					extent={{-205.8,28.4},{217.5,-161.5}})}),
		Documentation(info="<HTML><HEAD>
<META http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\"> 
<TITLE>Wolf Heatpump CHA</TITLE> 
<STYLE type=\"text/css\">
table>tbody>tr:hover,th{background-color:#edf1f3}html{font-size:90%}body,table{font-size:1rem}body{font-family:'Open Sans',Arial,sans-serif;color:#465e70}h1,h2{margin:1em 0 .6em;font-weight:600}p{margin-top:.3em;margin-bottom:.2em}table{border-collapse:collapse;margin:1em 0;width:100%;}tr{border:1px solid #beccd3}td,th{padding:.3em 1em; border-width: 1px; border-style: solid; border-color: rgb(190, 204, 211);}td{word-break:break-word}tr:nth-child(even){background-color:#fafafa}th{font-family:'Open Sans Semibold',Arial,sans-serif;font-weight:700;text-align:left;word-break:keep-all}.lib-wrap{width:70%}@media screen and (max-width:800px){.lib-wrap{width:100%}}td p{margin:.2em}
</STYLE>
   
<META name=\"GENERATOR\" content=\"MSHTML 11.00.10570.1001\"></HEAD> 
<BODY>
<H1>Wolf Heatpump CHA</H1>
<HR>

<DIV class=\"lib-wrap\">
<TABLE class=\"type\">
  <TBODY>
  <TR>
    <TH>Symbol:</TH>
    <TD colspan=\"3\"><IMG width=\"207\" height=\"210\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAM8AAADSCAYAAADtyZQaAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAAEnQAABJ0Ad5mH3gAABMNSURBVHhe7Z09yC1HGcdfyAeEXJIUKUKqBEFSpAiIEMQioIQ3VikuJGWaQLqkOEUqPyKJisotRCxy4IIWohYBLSwsTiOksEhpeS9YpExhkcJiff6zM7vPzM7Mfp39/v9geN+zu7M7u/v8zjP7eW4Ksmkenm+L08V+cFxOxe35of1ApoLybJ5LcQrsuZxuC7ozPZRnoyDj3NzcJAszz/RQHkIGQnkIGQjl2QGXE7ttS0B5Nk70bBuZBcqzdS4nyrMQlGcHsNu2DJRn46DbRlGWgfJsHXbbFoPybJzUxVJmo+mhPIQMhPLsjofF+ZaZZw4oz06ou2+8KXQuKM+WeXgubtUxzsPzieLMCOXZKCbT3J6lk1ZDeeaF8mwZlXlwupryzAvl2Qn1XQY85pkLyrM7eLZtLijPxokd+5B5oDx7QB373PBendmgPHvjcrLHPuy6TQ3l2QnVCQPVhcMwJqLpoDwbx91ZEJWE72+bFMpDyEAoz8ZB5mlkHWacWaA8m+VSnOyJgVjhsc70UJ6NE808ZBYoDyEDoTybBF228h42d7YtLDzmmR7KQ8hAKM9GSWUcV5h5pofybB3c1xacMbicTtKxI1NDeTYOr/MsB+XZOrgRNHgkgfe0zQPl2QPqTmpTaM4sUJ6VEL6snd2u9UN51gAyh5ctykepmUDWDeVZAf0P+nmRdA1QnlXAn4PfIpRnQXihc9tQnh0QnmygePNAeTZO9HiJzALlWQmDs8eFvwy3FJRnBYzNHuy2LQPlWQMjsgfEoyjLQHlWArtt24PyrIAx2SN1upvZaHoozxpg9tgklGcFMHtsE8qzcSjeclCeVTLuB6r484rzQHlWRJ1FRt4Umr0jm1wLyrM0I38OPt5t4wtA5oDyLIgJfP4c/GahPEvDn4PfLJRnQZB59PWd+i6D9mOe1Fk2V3jMMz2UZ0FCeWr6nm27FCf+IvbsUJ4FScvTF8qzBJRnQa7X9aI8S0B5FoSZZ9tQngUZI8/1shYZCuWZiJdf/q0E8Y9ayjeq/zG9o1vduui6ZD4oz0S8++5fi0cf/Uk02MOC6TC9Y0xdMh+UZyK+/PK/xVNPfRIN+LBgOkzvGFOXzAflmZAuGSSVOcbUJfNAeSakSwZJZY4xdck8UJ6JyWWQtswxpi6ZHsozMbkM0pY5xtQl00N5ZiCWQbpmjjF1ybRsUJ5LcQof9sJt/dUVdozXFwz9af33o83zMx6xDNI1c4ypS6Zlp/LU482VeHMZv7xT2fsFNvMszTwC6QzSN3OMqUumY/fyVOMuzV+NNmA4hLLTXarbXoJljERnkL6ZY0xdMh0blUd3vWxpyTz4G73fy8llslB9Txi6d9e+PwwZ45FHfjwoc4ypS6Zh/8c8dngneap5CC4jXRFkjOef/9WgzDGmLpmG/XfbHB27bVPKQ/bFceSRsdkTBpSH9ORA8gArUNWtU2faYvK8IHO5bz8TErBBeWYEW+eOlGelUCISQHlyYOu4QolIAOXJoeVxhRIRC8KBpAjF0YUSHR6EAUkRChMrlOiwYPeTFKEoufKolFelkMOA3U5ShIKkCrLPXSkPpJDDgF2/AF2u1ejrManrNlcgvL6jCSUJy46kuZxklaR4yEa5lfWUXXCllzPuC4TAAvS70Fk/VjABQ+SZWRoT2Lcmln1scMc2jWyypgwZYvKcEvMmJQiFBegnTzXO/j27B9qwZ3EngMlOwXM51fBm5jIy2nGncyCPV09qOWFQlso0aIYsX68DkM1hhsck6Rv4DXmsmFe+sXxXICQWIOyW2ZKQp8o8kEemK4PCzsNGiHfXtJkukbmCcebJUrdcK6eLlwuWhS20gu5ZTAZkl1tkGBnnjZIPjWEtUJ7+IDQWoEvmiUjlTVPep1YFFDJGTCRDvbzGONSz8zSS6eVKuf2WjFnBMQ1E8YJbgFBnWakwyBsiAJlOVscrbtMBXUc2c3ZaUiKbZQm6yBOMBzPI49dbDyag9XGPrIz7DLFkFSrCz06GhmBKioZwMi0zT55dymOmU/VNRnHjMJ0a1+i2xZa7BoJg1sFu5HBiBdOBWJcPYLiTjPL0RzbPEkwsDzCS2O5XVadEv0HndKozD/C7btKGFd05oDOKJ4Q0HoGOj55IwI6LSaCF2YI8n3327+L1139ffPXV13bIsiwkz0bA1sHJgpXcflOJYQNbf7k4mfpIsBV5IM2LL94rnn76k+Lxxz8qHjz4yo5ZFoQHSYGt48oaJBI5JCEWZ0ikA11wwR/rosWGAT18jfJoafDmIJQ7dz6mPJsAWycsC0uEgMfpadd9q7BioYSemIwlw7UIRhbVvVuTPDFpKM/WwNZJlYUkMkEuy28EtQ32MCM5nEBV0cdFwhrkyUnjCuXZCtg6bWVFx0RbpYs0rlCerRCKkit8JGEQb7315+Kxxz6KihIrlGcrhIKkCrIPH0kYBF7iiLeg4jXC7n3cuUJ5tkIoSVgozdXoKhHl2QqhLK5QmslIS/S+lPridlXMuXZcVFfDgovicXCRfdwvZCAUSApKsxgpiZB5/vnz7xWpexfNp1OXl/RTnmmhNIsTSvTEEz9tlQfn3ZO3apnh5a1dbtjQm4EpTw5KsxqcRE8++XHxr19/vzXzVO5490Pqccw85IDEHzmpM4lOOv6NvjrTUJ7N4O4MUPvVo3EHgBQ/CGRYcFdAhUyn5x2bV7JuBNwCFNb35t2xHZq29e9DXB6beYJM05zWQXm2gewg3Ooi+8oTwhENLPkwSp5gWjzO0CaQky5sI9rngmyQPDJxbv37kpVH8MZDJn08VEF5NoEJOAnAVODhm74tqPoEbXRa+YAATi7HzqMtmPq0w9G2/n1pkwdL0M96Yfq62+ZLVnfj+iOrSqZG9lG1IyFKuK8wrHGXdMBoeYScpGhjWxvAEHna1n+ryKqQSQkCynTRpHjYaXLfyqPlkQ/IPNHAzY0L6C1PMCy6/pb33vtbce/e58XXX//PDlk3slpkShrBEgswC76VUxKZoHXjE8XNMxbgZt6JoO0tj1pmrOh167P+L7xwr3j77b+Yv1uQSFaDTEmsm5LrPgEnka7X5xs/FuDZLllfeXpknj7rD2lw3xqu6Xzwwd9XL5GsBpmK7Ld0KgAtOE7Q39i95WmZfwgC+trHPH3X38njgESvvvpp8dJLv1mlQLIaZCqSB+E2yHLf9GF3Z2p5zPLUPFL0aUff9dfy4AG5V175XfHmm38svvjiSzNsbcgqgPBUnyBbyX8VlL5K66Yth8dO9ZWnAWPn11vwlpsi0t4G4Xn8LnWuiCw31xXSgXXSxwTA1tVdm6nlASbbRdoMsdywzu2QCbquv8N109YujUNWD3SRpx5vxDB7tpSnKUl5nn1d8syL+SbPBLAJQhto7hhHl/CYoHPQCtlpW3Dt8sqADNhn/R15aVxMBcVuKP9azjz7XZoP+slTjyuHn6Xh3s6WLXd7Pvt1ZFi9cv6y9Ip7v1rgtaGcrsxyuj34381X37cUDgvWIdYeu7xL1R6/nWQd1HFgCeJkLpQ8dbBVpWqQH3h+5pHhQeMvJ5iv6mB8tL754I1rvP5WzTcuj8KbV6bblmqPGV53Q7s9F0LmpiEPvghj8qTixw6vvySHZaoemScvVSmM/IN6WiwzKFjZ3Di9IVIrr+oDDK/aVg1Py5NsT7A80xYvpZI10Nx/2FXY94EEqfjBcImVah4p+VoY1m2rUMNtoNXPS3QIVvmvMa6vPF6A63ZSnr3S3H8O7Ef15Z6TR+9nFRt9uJ48MqU5zojVwbxUfaxEFZQIUDWu0W2rvk3K+YfyeBvSm9fAbpveqJRnlaTlKam+wIP9uWJ5BAm2eqWa45rdvpIy5ZYl/NWCetytjHMbTc8b/9tppK5eppFChjfrCLH2BBv19W//oLh541P7iayFXvLEvnzNcNdDKucXxmQXrDwkhnvhxLPP/qK4f/8LO5QsTUMe/UWIonoL0S9f+yVZ/bat/lLtAeXJUL/2iBLtiqCHMRTKk0HLQ4mmZ7ZHEijP9MTkcWWoRNLDkG6F/UA8cHsOH0nYCTFpwtJXoqnlkW68tMsvffvz8sXcmIc+6Rgbj6IPQ9rmEcPdGMpHEnZATJZUwQv5cPt8G1PJ44I1DFAsTwd1G6Z9Mh9vNvKhIU/mvrUu84jh5HHwkYQNE5MkVpB97t79k7fjU0wijwQlgrWPJCmQudqCvE2eLvOIoeXZ9iMJspfduW9zHtzbGpjenT8vr7PEzruX11kGnAaUvdN+QBdpc4PMhdIOxETRpY80jkoeaQQC3hXXxpRcsillG9sPAblxDYLloujtgcBvm1cXeTq3R+G6adt/JEHJUwZhfVGpughlKOVpSlLWWZc8/YgJgzJEGoeRA0GrBDHBKMNMO2WFwoDGhpBNGV+P3LgAbzkW155qeXb5OTna5Okyjxht0vhxZ0GcysDGOC9+QVu89I8VWUXQJo/gAroR2GXdzT2WEGuLXVZ9t+13pFxHGocsNhpUOnvgf70tTbBGspFBZtRVHmSERvAJsUyBYbIJom017XHjM9Pl5jEI7LNgBdwNyeGF0/LiqIqxRtyGTCmPUDYoXICtGzRu1Y8lpNpihtdd0FKg968ijcPIExFBD5dmeNOEMnlIUzvJk5ku1SbgBND1TPt6CBGbxzDCfS6fo3GC/X7yvtD9uMF+LUs5LPZFi0nVF6yOVVmOuTuhHBIJxL7y4L+NPJaAjRptS7CsO09+t7j55g+vIo0jFajecGkAAt2sA/5vCVQEpzQ7j52nt9qWVJscsrm88bKZeskDwnkMRXfP/LgphSm3mY0/xJGduIpNDaaTRpVTBLESxEK1XFOn/P/GztoLRINasAGfMbNgpl5dW6dewXrcpPJ4bdXrMk4ef77XQWYp87QfFKEAmA6LliZ5w2OYeTrZMmAZsdVJDXeEbUab+sqTWu/eyIzKfRLuW4wq4w4xUq6P7FezP3VMlOPbvmj9acpiYkbFiMQo/qCiSlfRz/WM0ch6XBissqAqANU4LDRcAbfHsEHUOMzfk6fKdrpd9bxroTBYz8tvd1Un1Ra1YQzVjroeJogiomCYtyT5IE2U9nfr7mA6zCOcFvN2w2T1GtOYZSsRRr+MROgyj+Gofaj3FbD7q84ydv9fZFq3cDuN/RDEbh0rXkxp1HJv6gZgRso0taa+LADTugXpBgjSuLhYAhru5h+suBHGjpvlsYRYW4IdMsUjCbJYI4X5KwHlSrWNFLLaZtquODm8EtRvTBNIYJYZlDDoo8uRIpvO0GUeYzDxKIHeDG7Zvxiu9qGRQIa55Xf+okUsVOMUKkZktUgKd4ZtqRtBEYTXDLrdYIJeBXqF7plYjAR62q5ftPXnstjpKE83wtPUs0oke0r2WfObj6wGypNByzO3RPKlV3WDyDqhPBli8rgylUTV8USPYx2yDJQnQ0yasCx5TESWhfJkiMmSKl0fSSD7gfJkiEkSK8g+17p9h2wHypMhJooulObYUJ4MMWFQKA0BlCcDpSE5KE8GSkNyUJ4MlIbkoDyEDITyEDIQykPIQCgPIQOhPKQB3s75zDM/807Tu4J3SbeBF7a/9tr9RsFrpfYE5SFR8K5ovIBQg+DHmzzbQN133vmsuFweVOXDD/9BecgxwHui8QZP945ovIgQLyXsQlgXoO7a3wDaF8pDkujs0zXrOHRd1Ntb1gGUhyRxGeTzz//TOes4dPbZY9YBlIdkQQbByYM+WceBure3f9hl1gGUh2RBBulyhi0G6j733C93mXUA5SGTssYfpboWlOdwqPeWZUvkhX+j6u4PynM4RIAOb1K8nBLyDK67PygPIQOhPAdEv0YWiUS/C7z5ClufMXX3BuU5HDhucd2q8N3OMk69JL3JmLr7g/IcDj/IkUnqwxgIkTteGVN3f1CeAxL9lTSgfgEgxZi6e4PyEDIQynM4pOs1+HTzmLr7g/IcDhHAni3Ll4Q80WnDQnkIIRkoz5ExPzmITGFPAuDnCjt0ywxj6u4EynNY6lPLD88newat6+nmMXX3A+U5LPU1m/4CjKm7HyjPgcGtNehpVQL06HqNqbsXKM+hQbZQZ8l6XeQcU3cfUB5CBkJ5CBkI5TksuOBZH+C7Rwu6HbaMqbsfKM9hqc+Y4WC/fLSg/9m2/nX3A+U5MPWDbTboe9wZPabuXqA8hAyE8hAyEMpzYPT7COrS7bhlTN29QHkOS33GrH46VIZ1OmU2pu5+oDyHpT5jVr+LoP/Ztv519wPlOTDu/jQjg+t6dcweY+ruBcpDyEAoDyEDoTwHhmfbxkF5Dkt90N+fMXX3A+U5MGNeEXWU10vloDyHQ50di5acFGPq7g/KQ8hAKM+RqV4fNSBzjKm7EyjPYcEdAcFL2/ESj04nAsbU3Q+U57DEzpj1vz2nhrfnkANRv3PNgq5Yx1tsxtTdC5TnsPCs21goDyEDoTwkgmSWwV2wMXW3BeUhEShPFygPiUB5ukB5SATK0wXKQyJQni5QHkIGQnkOh2SG6LUZV3h9pxtF8X/D7lyfsJX5lAAAAABJRU5ErkJggg==\"></TD></TR>
  <TR>
    <TH>Identifier:</TH>
    <TD colspan=\"3\">CoSES_Models.HeatGenerator.LaboratoryModels.WolfCHA</TD></TR>
  <TR>
    <TH>Version:</TH>
    <TD colspan=\"3\">1.0</TD></TR>
  <TR>
    <TH>File:</TH>
    <TD colspan=\"3\">WolfCHA.mo</TD></TR>
  <TR>
    <TH>Connectors:</TH>
    <TD>Modulation of the HP for heating or cooling - between 15 and 100%</TD>
    <TD>HPModulation</TD>
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
    <TD>If true, heat pump is in heating mode, if not, HP is in cooling      
      mode</TD>
    <TD>HPmode</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Water flow through the heat pump</TD>
    <TD>VWater</TD>
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
    <TD>Ambietnt air temperature</TD>
    <TD>TAmb</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Ambient air humidity</TD>
    <TD>HumidityAmb</TD>
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
    <TD>Multiplication factor for the electric power due to modulating during  
                 heating</TD>
    <TD>PElHeatModulationFactor_table</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Multiplication factor for the heat output due to modulating</TD>
    <TD>PHeatModulationFactor_table</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Multiplication factor for the electrical power demand of the heat pump 
                  during cooling</TD>
    <TD>PElCoolingFactor_table</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Multiplication factor for the cold output of the heat pump</TD>
    <TD>PCoolingFactor_table</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Multiplication factor for the electric power due to modulating during  
                 cooling</TD>
    <TD>PElCoolingModulationFactor_table</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Multiplication factor for the cold output due to modulating</TD>
    <TD>PCoolingModulationFactor_table</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Limits the slew rate of a signal</TD>
    <TD>slewRateLimiter1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Pass through the largest signal</TD>
    <TD>HPModulation_Min</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Pass through the smallest signal</TD>
    <TD>HPModulation_Max</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Set output signal to a time varying Real expression</TD>
    <TD>MaximumModulation</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Set output signal to a time varying Real expression</TD>
    <TD>MinimumModulation</TD>
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
    <TD>Nominal heat output at A2/W35 (not maximum heat output)</TD>
    <TD>PHeatNom</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Nominal cooling power at A35/W18 (not maximum cooling output)</TD>
    <TD>PCoolingNom</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Nominal COP at A2/W35</TD>
    <TD>COPNom</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Nominal EER at A35/W18</TD>
    <TD>EERNom</TD>
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
    <TD>Maximum return temperature</TD>
    <TD>TRetMaxCooling</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Minimum return temperature</TD>
    <TD>TRetMinHeat</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Minimum return temperature</TD>
    <TD>TRetMinCooling</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Ambient temperature, when the heat pump requires DeIcing</TD>
    <TD>TDeIcing</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Temperature difference between supply and return during heating</TD>
    <TD>DeltaTHeat</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Temperature difference between supply and return during cooling</TD>
    <TD>DeltaTCooling</TD>
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
    <TD>Pass through the smallest signal</TD>
    <TD>THPout_Cooling</TD>
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
    <TD>Output the sum of the two inputs</TD>
    <TD>add2</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Set output signal to a time varying Real expression</TD>
    <TD>TRetMin_Heat1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Set output signal to a time varying Real expression</TD>
    <TD>DeltaT_Cooling</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Logical 'and': y = u1 and u2</TD>
    <TD>HPon</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>Results:</TH>
    <TD>Stop time of the HP</TD>
    <TD>StopTime</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Modulation of the HP for heating or cooling - between 15 and 100%</TD>
    <TD>HPModulation</TD>
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
    <TD>If true, heat pump is in heating mode, if not, HP is in cooling      
      mode</TD>
    <TD>HPmode</TD>
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
    <TD>If true, heat pump is currently deicing</TD>
    <TD>DeIcing</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Water flow through the heat pump</TD>
    <TD>VWater</TD>
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
    <TD>Ambietnt air temperature</TD>
    <TD>TAmb</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Ambient air humidity</TD>
    <TD>HumidityAmb</TD>
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
    <TD>Cooling output of the heat pump</TD>
    <TD>PCooling</TD>
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
    <TD>Cumulated cooling energy of the HP</TD>
    <TD>ECooling</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Coefficiency of performance (heating)</TD>
    <TD>COP</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Energy Efficiency Ratio (Cooling)</TD>
    <TD>EER</TD>
    <TD>&nbsp;</TD></TR></TBODY></TABLE></DIV>
<H2>Description:</H2>
<P><FONT size=\"2\">The model is not completely validated with measurements 
 yet.</FONT></P>
<P><FONT size=\"2\">The heat generator can be switched off&nbsp;completely by  
deactivating it via the parameter \"HPButton\". Otherwise,&nbsp;the heat pump 
 runs  in idling mode.</FONT></P>
<P><FONT size=\"2\"><BR></FONT></P><FONT size=\"2\">
<P><FONT color=\"#465e70\" size=\"2\">Input/Control signals:</FONT></P>
<UL>
  <LI><FONT color=\"#465e70\" size=\"2\">HPOn - Boolean value to switch   
  the&nbsp;heat pump  on or off</FONT></LI>
  <LI>HPmode - Boolean value to switch between heating (true) and cooling     
  (false) mode</LI>
  <LI><FONT color=\"#465e70\" size=\"2\">HPModulation - Value of the modulation, if  
       it is below ModulationMin, it will be overwritten by that 
  value</FONT></LI>
  <LI>AUXModulation - Value of the modulation of the auxiliary heater - the aux. 
      heater can be&nbsp;controlled in&nbsp;4 stages: 0%,&nbsp;33%, 67%, 
  100%</LI>
  <LI>TRet - Return temperature to the heat pump</LI>
  <LI>TAmb - Ambient air temperature</LI>
  <LI>HumidityAmb - Ambient air humidity</LI></UL>
<P><FONT color=\"#465e70\" size=\"2\">Output signals:</FONT></P>
<UL>
  <LI><FONT color=\"#465e70\" size=\"2\">TSup - Supply temperature from the heat     
  pump</FONT></LI>
  <LI><FONT color=\"#465e70\" size=\"2\">qvWater - Water flow from the heat     
  pump</FONT></LI>
  <LI><FONT color=\"#465e70\" size=\"2\">PEl_phase - Electric power of the three     
      phases</FONT></LI>
  <LI><FONT color=\"#465e70\" size=\"2\">QEl_phase - reactive power of the three     
      phases</FONT></LI></UL>
<P>The heat pump is devided into four sections and based on measurements from  
the CoSES laboratory:</P>
<UL>
  <LI>Start-up process: The     behavior is provided by a time   dependent   
  look-up     table.</LI>
  <LI>De-Icing process (only at heating): If the ambient temperature is low, the 
    air humidity can freeze on the heat exchanger of the heat pump. Therefore, 
  the   heat pump goes into deicing if these conditions are true and uses hot 
  water   from the house to defrost the heat exchangers. The     behavior is 
  provided by   a time   dependent look-up     table.</LI>
  <LI>Steady-state process:&nbsp; The steady-state     efficiency depends on the 
    return temperature and power   modulation and is     defined by a   
  two-dimensional look-up table. Load changes   during steady-state     are   
  modeled with a rising or falling       flank.</LI>
  <LI>Shut-down process: Similar to the     start-up process, the shut-down   
  process is provided by   a time dependent     look-up  table.</LI></UL></FONT> 
</BODY></HTML>
"),
		experiment(
			StopTime=1,
			StartTime=0,
			Tolerance=1e-06,
			Interval=0.001,
			__esi_MinInterval="9.999999999999999e-10",
			__esi_AbsTolerance="1e-6"));
end WolfCHA;
