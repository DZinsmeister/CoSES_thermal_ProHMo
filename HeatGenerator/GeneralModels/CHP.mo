// CP: 65001
// SimulationX Version: 4.2.3.69223
within CoSES_Models.HeatGenerator.GeneralModels;
model CHP "Modulating CHP with efficiency depending on return temperature"
	GreenCity.Interfaces.Thermal.VolumeFlowIn ReturnCHP "Return pipe of CHP" annotation(Placement(
		transformation(extent={{-50,-80},{-70,-60}}),
		iconTransformation(extent={{190,-10},{210,10}})));
	GreenCity.Interfaces.Electrical.LV3Phase GENGrid3 if(CHPPhase==3) "3-phase connection of generator to Grid" annotation(Placement(
		transformation(
			origin={15,-215},
			extent={{-10,-10},{10,10}},
			rotation=-90),
		iconTransformation(
			origin={200,-150},
			extent={{-10,-10},{10,10}},
			rotation=-90)));
	GreenCity.Interfaces.Thermal.VolumeFlowOut FlowCHP "Flow pipe of CHP" annotation(Placement(
		transformation(extent={{210,-85},{230,-65}}),
		iconTransformation(extent={{190,140},{210,160}})));
	GreenCity.Interfaces.Electrical.LV1Phase CPGrid1 if(CPPhase==1) "1-phase connection of circulation pump to Grid" annotation(Placement(
		transformation(extent={{75,-225},{95,-205}}),
		iconTransformation(extent={{-110,-210},{-90,-190}})));
	GreenCity.Interfaces.Electrical.LV3Phase CPGrid3 if(CPPhase==3) "3-phase connection of circulation pump to Grid" annotation(Placement(
		transformation(extent={{150,-225},{170,-205}}),
		iconTransformation(extent={{-10,-210},{10,-190}})));
	GreenCity.Interfaces.Electrical.LV1Phase GENGrid1 if(CHPPhase==1) "1-phase connection of generator to Grid" annotation(Placement(
		transformation(extent={{-70,-225},{-50,-205}}),
		iconTransformation(extent={{190,-110},{210,-90}})));
	input Modelica.Blocks.Interfaces.BooleanInput CHPon "Switch on/off of CHP" annotation(
		Placement(
			transformation(extent={{-85,61},{-45,101}}),
			iconTransformation(extent={{-220,80},{-180,120}})),
		Dialog(
			group="I/O",
			tab="Results 1",
			visible=false));
	input Modelica.Blocks.Interfaces.BooleanInput CPon "Switch on/off of circulation pump" annotation(
		Placement(
			transformation(extent={{-85,10},{-45,50}}),
			iconTransformation(extent={{-220,30},{-180,70}})),
		Dialog(
			group="I/O",
			tab="Results 1",
			visible=false));
	GreenCity.Interfaces.Thermal.ExtractVolumeFlow FromReturn "Extracts the characteristics of a Thermal Volume Flow Connector" annotation(Placement(transformation(extent={{-25,-80},{-5,-60}})));
	GreenCity.Interfaces.Thermal.DefineVolumeFlow ToFlow "Specifies a volume flow port" annotation(Placement(transformation(extent={{160,-85},{180,-65}})));
	GreenCity.Interfaces.Electrical.DefineCurrentAC3 CHPGridConnection3(VoltageType=VoltageType) if(CHPPhase==3) "Specifies current and phase angle, extracts voltage of a 3-phase connector" annotation(Placement(transformation(
		origin={15,-145},
		extent={{-10,-10},{10,10}},
		rotation=-90)));
	GreenCity.Interfaces.Electrical.DefineCurrentAC3 CPGridConnection3(VoltageType=VoltageType) if(CPPhase==3) "Specifies current and phase angle, extracts voltage of a 3-phase connector" annotation(Placement(transformation(
		origin={160,-145},
		extent={{10,-10},{-10,10}},
		rotation=90)));
	GreenCity.Interfaces.Electrical.DefineCurrentAC1 CPGridConnection1 if(CPPhase==1) "Specifies current and phase angle, extracts voltage of a 1-phase connector" annotation(Placement(transformation(
		origin={85,-145},
		extent={{10,-10},{-10,10}},
		rotation=90)));
	GreenCity.Interfaces.Electrical.DefineCurrentAC1 CHPGridConnection1 if(CHPPhase==1) "Specifies current and phase angle, extracts voltage of a 1-phase connector" annotation(Placement(transformation(
		origin={-60,-145},
		extent={{10,-10},{-10,10}},
		rotation=90)));
	Modelica.Blocks.Tables.CombiTable1D PelCP(
		tableOnFile=true,
		tableName=CPTable,
		fileName=CPFile) "Electrical power demand of circulation pump" annotation(Placement(transformation(extent={{-35,30},{-15,50}})));
	Modelica.Blocks.Tables.CombiTable1D QMin(
		tableOnFile=not ConstantPower,
		table=[0,0],
		tableName=QMinTable,
		fileName=CHPFile) if not ConstantPower "Minimum heat power characteristic of CHP" annotation(Placement(transformation(extent={{60,-60},{80,-40}})));
	Modelica.Blocks.Tables.CombiTable1D QMax(
		tableOnFile=not ConstantPower,
		table=[0,0],
		tableName=QMaxTable,
		fileName=CHPFile) if not ConstantPower "Maximum heat power characteristic of CHP" annotation(Placement(transformation(extent={{60,-35},{80,-15}})));
	protected
		type VoltageEnum = enumeration( 
			LV "Low-Voltage", 
			MV "Medium-Voltage", 
			HV "High-Voltage") "Voltage-Level Enumeration" annotation(initValue=LV);
	public
		Modelica.Blocks.Tables.CombiTable1D etaElec(
			tableOnFile=not ConstantPower,
			table=[0,0],
			tableName=etaElecTable,
			fileName=CHPFile) if not ConstantPower "Electric efficiency of CHP" annotation(Placement(transformation(extent={{60,5},{80,25}})));
		Modelica.Blocks.Tables.CombiTable1D Pel(
			tableOnFile=not ConstantPower,
			table=[0,0],
			tableName=PelTable,
			fileName=CHPFile) if not ConstantPower "Electric power characteristic of CHP" annotation(Placement(transformation(extent={{60,30},{80,50}})));
		Modelica.Blocks.Tables.CombiTable1D etaHeat(
			tableOnFile=not ConstantPower,
			table=[0,0],
			tableName=etaHeatTable,
			fileName=CHPFile) if not ConstantPower "Heat efficiency of CHP" annotation(Placement(transformation(extent={{60,-85},{80,-65}})));
		Modelica.Blocks.Interfaces.RealInput ModIn(quantity="Basics.RelMagnitude") if not ConstantPower "Percental power modulation" annotation(
			Placement(
				transformation(extent={{-120,30},{-80,70}}),
				iconTransformation(
					origin={-50,200},
					extent={{-20,-20},{20,20}},
					rotation=-90)),
			Dialog(
				group="I/O",
				tab="Results 1",
				visible=false));
	protected
		Real on "on" annotation(
			HideResult=false,
			Dialog(
				group="I/O",
				tab="Results 1"));
	public
		Real Modulation(quantity="Basics.RelMagnitude") if not ConstantPower "Percental power modulation" annotation(Dialog(
			group="I/O",
			tab="Results 1",
			visible=false));
		input Modelica.Blocks.Interfaces.RealInput qvRef(
			quantity="Thermics.VolumeFlow",
			displayUnit="m³/h") "Target volume flow of circulation pump" annotation(
			Placement(
				transformation(
					origin={115,103},
					extent={{-20,-20},{20,20}},
					rotation=-90),
				iconTransformation(
					origin={100,200},
					extent={{-20,-20},{20,20}},
					rotation=-90)),
			Dialog(
				group="Volume Flow",
				tab="Results 1",
				visible=false));
		Real qv(
			quantity="Thermics.VolumeFlow",
			displayUnit="m³/h") "Actual volume flow" annotation(Dialog(
			group="Volume Flow",
			tab="Results 1",
			visible=false));
	protected
		Real QMaxModulation(quantity="Basics.Power") "Maximum Heat Power during modulation" annotation(
			HideResult=false,
			Dialog(
				group="Heating Power",
				tab="Results 1"));
		Real QHeatInput(
			quantity="Basics.Power",
			displayUnit="kW") "Actual heat power" annotation(
			HideResult=false,
			Dialog(
				group="Heating Power",
				tab="Results 1"));
	public
		Real QHeat(
			quantity="Basics.Power",
			displayUnit="kW") "Heat output power of CHP" annotation(Dialog(
			group="Heating Power",
			tab="Results 1",
			visible=false));
	protected
		Real eta_heat(quantity="Basics.RelMagnitude") "Actual heat efficiency of CHP" annotation(
			HideResult=false,
			Dialog(
				group="Heating Power",
				tab="Results 1"));
	public
		Real HeatEff(quantity="Basics.RelMagnitude") "Actual heat efficiency of CHP" annotation(Dialog(
			group="Heating Power",
			tab="Results 1",
			visible=false));
		Real TFlow(
			quantity="Thermics.Temp",
			displayUnit="°C") "Flow temperature of CHP" annotation(Dialog(
			group="Temperature",
			tab="Results 1",
			visible=false));
		Real TReturn(
			quantity="Thermics.Temp",
			displayUnit="°C") "Return temperature of CHP" annotation(Dialog(
			group="Temperature",
			tab="Results 1",
			visible=false));
		Real PFuel(
			quantity="Basics.Power",
			displayUnit="kW") "Used fuel power" annotation(Dialog(
			group="Fuel",
			tab="Results 1",
			visible=false));
		Real qvFuel(
			quantity="Thermics.VolumeFlow",
			displayUnit="l/min") "Fuel consumption" annotation(Dialog(
			group="Fuel",
			tab="Results 1",
			visible=false));
		Real VFuel(
			quantity="Geometry.Volume",
			displayUnit="m³") "Demanded fuel volume" annotation(Dialog(
			group="Fuel",
			tab="Results 1",
			visible=false));
		Real EHeat(
			quantity="Basics.Energy",
			displayUnit="kWh") "Heat output of CHP" annotation(Dialog(
			group="Energy",
			tab="Results 2",
			visible=false));
		Real EGEN(
			quantity="Basics.Energy",
			displayUnit="kWh") "Electrical energy output of CHP" annotation(Dialog(
			group="Energy",
			tab="Results 2",
			visible=false));
		Real ECP(
			quantity="Basics.Energy",
			displayUnit="kWh") "Electrical energy demand of circulation pump" annotation(Dialog(
			group="Energy",
			tab="Results 2",
			visible=false));
		Real EFuel(
			quantity="Basics.Energy",
			displayUnit="kWh") "Fuel energy demand of CHP" annotation(Dialog(
			group="Energy",
			tab="Results 2",
			visible=false));
	protected
		discrete Real StartTime(
			quantity="Basics.Time",
			displayUnit="s") "Starting time of heating" annotation(Dialog(
			group="Timing",
			tab="Results 2"));
	public
		Real PGEN(
			quantity="Basics.Power",
			displayUnit="kW") "Effective power of asynchronous generator" annotation(Dialog(
			group="Electrical Power",
			tab="Results 2",
			visible=false));
	protected
		Real SGEN(
			quantity="Basics.Power",
			displayUnit="kVA") "Apparent power of asynchronous generator" annotation(Dialog(
			group="Electrical Power",
			tab="Results 2"));
	public
		Real PCP(
			quantity="Basics.Power",
			displayUnit="kW") "Effective power of circulation pump" annotation(Dialog(
			group="Electrical Power",
			tab="Results 2",
			visible=false));
	protected
		Real SCP(
			quantity="Basics.Power",
			displayUnit="kVA") "Apparent power of circulation pump" annotation(Dialog(
			group="Electrical Power",
			tab="Results 2"));
		Real eta_elec(quantity="Basics.RelMagnitude") "Actual electric efficiency of CHP" annotation(
			HideResult=false,
			Dialog(
				group="Electrical Power",
				tab="Results 2"));
	public
		Real ElEff(quantity="Basics.RelMagnitude") "Actual electric efficiency of CHP" annotation(Dialog(
			group="Electrical Power",
			tab="Results 2",
			visible=false));
		parameter Boolean ConstantPower=false "If true, CHP works with constant power, false, if CHP can be modulated" annotation(Dialog(
			group="Heating Mode",
			tab="Model Definitions"));
		parameter Boolean useConstEtaHeat=false if ConstantPower "If true, constant value for nominal efficiency should be used" annotation(Dialog(
			group="Heating Mode",
			tab="Model Definitions"));
		parameter Integer CPPhase=1 "Phase number circulation pump is connected to" annotation(Dialog(
			group="CP - Configuration",
			tab="Model Definitions"));
		parameter Integer CHPPhase=3 "Phase number of CHP electrical power grid feed" annotation(Dialog(
			group="CHP - Configuration",
			tab="Model Definitions"));
	protected
		parameter VoltageEnum VoltageType=VoltageEnum.LV "Voltage-Level" annotation(Dialog(
			group="Voltage Level",
			tab="Model Definitions"));
	public
		parameter Real cpMed(
			quantity="Thermics.SpecHeatCapacity",
			displayUnit="kJ/(kg·K)")=4177 "Specific heat capacity of heating medium" annotation(Dialog(
			group="Heating System",
			tab="CHP - Dimensions"));
		parameter Real rhoMed(
			quantity="Basics.Density",
			displayUnit="kg/m³")=1000 "Density of heating medium" annotation(Dialog(
			group="Heating System",
			tab="CHP - Dimensions"));
		parameter Real VCHP(
			quantity="Geometry.Volume",
			displayUnit="l")=0.01 "Heating medium volume of CHP" annotation(Dialog(
			group="Heating System",
			tab="CHP - Dimensions"));
		parameter Real rhoFuelVolume(
			quantity="Basics.Density",
			displayUnit="kg/m³")=0.7 "Volumetric fuel density" annotation(Dialog(
			group="Fuel Consumption",
			tab="CHP - Dimensions"));
		parameter Real rhoFuelEnergy(
			quantity="Thermodynamics.SpecEnergy",
			displayUnit="MJ/kg")=40000000 "Energy density of fuel" annotation(Dialog(
			group="Fuel Consumption",
			tab="CHP - Dimensions"));
		parameter Real TAmbient(
			quantity="Thermics.Temp",
			displayUnit="°C")=291.14999999999998 "Ambient temperature" annotation(Dialog(
			group="Heat Losses",
			tab="CHP - Dimensions"));
		parameter Real QlossRate(
			quantity="Thermodynamics.HeatConduct",
			displayUnit="W/K")=0.2 "Heat loss rate of CHP-isolation" annotation(Dialog(
			group="Heat Losses",
			tab="CHP - Dimensions"));
		parameter String CHPFile="C:\\Users\\Public\\Documents\\SimulationX 4.2\\Modelica\\CoSES_Models\\Data\\Heat Generator\\CHP\\neoTower2.txt" if not ConstantPower "File name for power behavior of a modulated CHP" annotation(Dialog(tab="CHP - Power Data"));
		parameter Real TFlowMax(quantity="Basics.Temp")=358.15 "Maximum flow temperature" annotation(Dialog(
			group="Heat",
			tab="CHP - Power Data"));
		parameter Real ConstantHeatPower(
			quantity="Basics.Power",
			displayUnit="kW")=12500 if useConstEtaHeat "Constant heat power of CHP" annotation(Dialog(
			group="Heat",
			tab="CHP - Power Data"));
		parameter Real etaHeatConstant=0.7 if useConstEtaHeat "Constant heat efficiency of the CHP" annotation(Dialog(
			group="Heat",
			tab="CHP - Power Data"));
		parameter String QMaxTable="Q_CHP_max" if not useConstEtaHeat "Table name for maximum heat power of CHP" annotation(Dialog(
			group="Heat",
			tab="CHP - Power Data"));
		parameter String QMinTable="Q_CHP_min" if not ConstantPower "Table name for minimum heat power of CHP" annotation(Dialog(
			group="Heat",
			tab="CHP - Power Data"));
		parameter String etaHeatTable="eta_heat" if not ConstantPower "Table name for heat efficiency of CHP" annotation(Dialog(
			group="Heat",
			tab="CHP - Power Data"));
		parameter Real ConstantElectricPower(
			quantity="Basics.Power",
			displayUnit="kW")=30000 if ConstantPower "Constant electric power" annotation(Dialog(
			group="Modulated Heat Power",
			tab="CHP - Power Data"));
		parameter Real etaElecConstant=0.3 if ConstantPower "Constant electric efficiency of the CHP" annotation(Dialog(
			group="Modulated Heat Power",
			tab="CHP - Power Data"));
		parameter String PelTable="P_el" if not ConstantPower "Table name for electric power" annotation(Dialog(
			group="Modulated Heat Power",
			tab="CHP - Power Data"));
		parameter String etaElecTable="eta_elec" if not ConstantPower "Table name for electric efficiency of CHP" annotation(Dialog(
			group="Modulated Heat Power",
			tab="CHP - Power Data"));
		parameter Real CosPhiGEN=0.95 "Power factor of asynchronous generator" annotation(Dialog(
			group="Generator",
			tab="CHP - Power Data"));
		parameter String CPFile=GreenCity.Utilities.Functions.getModelDataDirectory()+"\\CHP\\circulation_pump\\CP_25_60.txt" "File name for CP-power behavior" annotation(Dialog(
			group="Power Data",
			tab="CP - Dimensions"));
		parameter String CPTable="P_CP" "Table name for CP-power behavior" annotation(Dialog(
			group="Power Data",
			tab="CP - Dimensions"));
		parameter Real CosPhiCP=0.98 "Power factor of circulation pump" annotation(Dialog(
			group="Power Data",
			tab="CP - Dimensions"));
		parameter Real qvMax(
			quantity="Thermics.VolumeFlow",
			displayUnit="m³/h")=0.00083333333333333328 "Maximum volume flow of CP" annotation(Dialog(
			group="Boundaries",
			tab="CP - Dimensions"));
		parameter Real qvMin(
			quantity="Thermics.VolumeFlow",
			displayUnit="m³/h")=0.00025000000000000001 "Minimum volume flow of CP" annotation(Dialog(
			group="Boundaries",
			tab="CP - Dimensions"));
		parameter Real tThStart(
			quantity="Basics.Time",
			displayUnit="s")=480 "Heat power switch-on time period" annotation(Dialog(
			group="Heat Power",
			tab="Dynamics"));
		parameter Real tElStart(
			quantity="Basics.Time",
			displayUnit="s")=120 "Electrical power switch-on time period" annotation(Dialog(
			group="Electrical Power",
			tab="Dynamics"));
		parameter Real tDtEl(
			quantity="Basics.Time",
			displayUnit="s")=0 "Effective dead time of electrical power" annotation(Dialog(
			group="Electrical Power",
			tab="Dynamics"));
		parameter Real tCP(
			quantity="Basics.Time",
			displayUnit="s")=15 "Operation time delay of circulation pump" annotation(Dialog(
			group="Circulation Pump",
			tab="Dynamics"));
	initial equation
		assert((CPPhase==1)or(CPPhase==3), "CPPhase must equal 1 or 3");
		assert((CHPPhase==1)or(CHPPhase==3), "CHPPhase must equal 1 or 3");
		
		if CPon then		
			ToFlow.qvMedium=max(min(qvRef,qvMax),qvMin);
		else
			ToFlow.qvMedium=0;
		end if;
		
		if CHPon then	
			TFlow=FromReturn.TMedium;
		else
			TFlow=TAmbient;
		end if;
		
		EHeat=0;
		EGEN=0;
		ECP=0;
		VFuel=0;
		EFuel=0;
		
		
		StartTime=time.start;
		
		if ConstantPower then
			if CHPon then
				if useConstEtaHeat then
					QHeatInput = ConstantHeatPower;
				else
					QHeatInput = QMax.y[1];
				end if;
				PGEN = ConstantElectricPower;
		   	else
		  		QHeatInput=0;
		   		PGEN=0;
		   	end if;
		else
			if CHPon then
				QHeatInput=max(min((Modulation*QMax.y[1]),QMax.y[1]),QMin.y[1]);
				PGEN = Pel.y[1];
			else
				QHeatInput=0;
				PGEN=0;
			end if;
		end if;
	equation
		// enter your equations here
		when CHPon then
			StartTime=time;
		end when;
		
		QMaxModulation = cpMed*rhoMed*qvMax*(TFlowMax-TReturn);
						
		if ConstantPower then
			Modulation = 1;
		else
			Modulation = ModIn;
		end if;
		
		Pel.u[1] = Modulation;
		etaElec.u[1] = Modulation;
		
		if useConstEtaHeat then
			eta_elec = etaElecConstant;
			eta_heat = etaHeatConstant;
		else
			eta_elec = etaElec.y[1];
			eta_heat = etaHeat.y[1];
		end if;
		
		if useConstEtaHeat then
			when (CHPon and not (time-StartTime)<tThStart) then
				reinit(QHeatInput,ConstantHeatPower);
			elsewhen not CHPon then		 	        
			 	reinit(QHeatInput,0);
			end when;
		
			if CHPon then  
				if (((time-StartTime)<tThStart) and StartTime>time.start) then   
					tThStart/3*der(QHeatInput)+QHeatInput=ConstantHeatPower;
				else
					der(QHeatInput)=0;
				end if; 
			else
				der(QHeatInput)=0;
			end if;
		
		else
			when (CHPon and not (time-StartTime)<tThStart) then
				reinit(QHeatInput,min(max(min((Modulation*QMax.y[1]),QMax.y[1]),QMin.y[1]), QMaxModulation));
			elsewhen (CHPon and not (time-StartTime)<tThStart and Modulation>=1) then
				reinit(QHeatInput,min(QMax.y[1], QMaxModulation));
			elsewhen (CHPon and not (time-StartTime)<tThStart and Modulation*QMax.y[1]<QMin.y[1]) then
				reinit(QHeatInput,QMin.y[1]);
			elsewhen not CHPon then
				reinit(QHeatInput,0);
			end when;
			        
			if CHPon then
				if (((time-StartTime)<tThStart) and StartTime>time.start) then
					tThStart/3*der(QHeatInput)+QHeatInput=max(min((Modulation*QMax.y[1]),QMax.y[1]),QMin.y[1]);
				elseif (Modulation<=1 and Modulation*QMax.y[1]>QMin.y[1]) then
					der(QHeatInput)=der(Modulation)*QMax.y[1];
				else
					der(QHeatInput)=0;
				end if;
			else
				der(QHeatInput)=0;
			end if;		      	
		end if;
							
		if ConstantPower then
			when (CHPon and not (time-StartTime)<(tDtEl+tElStart) and (time-StartTime)>tDtEl) then
				reinit(PGEN,ConstantElectricPower);
			elsewhen (CHPon and not (time-1-StartTime)<tThStart and not (time-time.start)<(tDtEl+tElStart) and (time-StartTime)>tDtEl) then
				reinit(PGEN,ConstantElectricPower);
			elsewhen not CHPon then
				reinit(PGEN,0);
			end when;
		
			if CHPon then
				if (((time-StartTime)>tDtEl) and StartTime>time.start) then
					if ((time-StartTime) < (tDtEl+tElStart)) then
						tElStart/3*der(PGEN)+PGEN=ConstantElectricPower;
					else
						der(PGEN)=0;
					end if;
				else
					der(PGEN)=0; 
				end if;
			else
				der(PGEN)=0;
			end if;
		else
			when (CHPon and not (time-StartTime)<(tDtEl+tElStart) and (time-StartTime)>tDtEl) then
				reinit(PGEN,Pel.y[1]);
			elsewhen (CHPon and not (time-1-StartTime)<tThStart and not (time-StartTime)<(tDtEl+tElStart) and (time-StartTime)>tDtEl) then
				reinit(PGEN,Pel.y[1]);
			elsewhen (CHPon and not (time-StartTime)<tThStart and Modulation>=1) then
				reinit(PGEN,Pel.y[1]);
			elsewhen (CHPon and not (time-StartTime)<tThStart and Modulation*QMax.y[1]<QMin.y[1]) then
				reinit(PGEN,Pel.y[1]);
			elsewhen not CHPon then
				reinit(PGEN,0);
			end when;
			
			if CHPon then
				if (((time-StartTime)>tDtEl) and StartTime>time.start) then
					if ((time-StartTime) < (tDtEl+tElStart)) then
						tElStart/3*der(PGEN)+PGEN=Pel.y[1];
					else
						der(PGEN)=der(Pel.y[1]);
					end if;	
				else
					if (StartTime>time.start) then
						der(PGEN)=0;
					else
						der(PGEN)=der(Pel.y[1]);
					end if;
				end if;
			else
				der(PGEN)=0;
			end if;
		end if;
					
		if (abs(CosPhiGEN)>1e-10) then
			SGEN=abs(PGEN)/CosPhiGEN;
		else
			SGEN=abs(PGEN);
		end if;
		
		TReturn=FromReturn.TMedium;
		qv=FromReturn.qvMedium;
		if CPon then	
			tCP*der(ToFlow.qvMedium)+ToFlow.qvMedium=max(min(qvRef,qvMax),qvMin);
			PelCP.u[1]=qv;	
			PCP=-PelCP.y[1];
			cpMed*rhoMed*VCHP*der(TFlow)=-QlossRate*(TFlow-TAmbient)+QHeatInput-cpMed*rhoMed*qv*(TFlow-TReturn);
		else
			tCP*der(ToFlow.qvMedium)+ToFlow.qvMedium=0;
			PelCP.u[1]=0;
			PCP=0;
			cpMed*rhoMed*VCHP*der(TFlow)=-QlossRate*(TFlow-TAmbient)-cpMed*rhoMed*qv*(TFlow-TReturn);
		end if;
		ToFlow.TMedium=TFlow;
					
		if (abs(CosPhiCP)>1e-10) then
			SCP=abs(PCP)/CosPhiCP;
		else
			SCP=abs(PCP);
		end if;
		
		if (CHPPhase==1) then
			if (CHPGridConnection1.Veff>1e-10) then
				CHPGridConnection1.Ieff=SGEN/CHPGridConnection1.Veff;
				CHPGridConnection1.Phi=acos(min(max(-CosPhiGEN,-1),1));
			else
				CHPGridConnection1.Ieff=0;
				CHPGridConnection1.Phi=0;
			end if;
		end if;
					
		if (CHPPhase==3) then
			for i in 1:3 loop
				if (CHPGridConnection3.Veff[i]>1e-10) then
					CHPGridConnection3.Ieff[i]=SGEN/(3*CHPGridConnection3.Veff[i]);
					CHPGridConnection3.Phi[i]=acos(min(max(-CosPhiGEN,-1),1));
				else
					CHPGridConnection3.Ieff[i]=0;
					CHPGridConnection3.Phi[i]=0;
				end if;
			end for;
		end if;
					
		if (CPPhase==1) then
			if (CPGridConnection1.Veff>1e-10) then
				CPGridConnection1.Ieff=SCP/CPGridConnection1.Veff;
				CPGridConnection1.Phi=acos(min(max(CosPhiCP,-1),1));
			else
				CPGridConnection1.Ieff=0;
				CPGridConnection1.Phi=0;
			end if;
		end if;
		if (CPPhase==3) then
			for i in 1:3 loop
				if (CPGridConnection3.Veff[i]>1e-10) then			
					CPGridConnection3.Ieff[i]=SCP/(3*CPGridConnection3.Veff[i]);
					CPGridConnection3.Phi[i]=acos(min(max(CosPhiCP,-1),1));
				else
					CPGridConnection3.Ieff[i]=0;
					CPGridConnection3.Phi[i]=0;
				end if;
			end for;
		end if;
					
		QHeat=cpMed*rhoMed*qv*(TFlow-TReturn);
		der(EHeat)=QHeat;
		der(EGEN)=PGEN;
		der(ECP)=PCP;
					
		PFuel=-((QHeatInput + PGEN) / (eta_heat + eta_elec));
		qvFuel=abs(PFuel)/(rhoFuelVolume*rhoFuelEnergy);
		der(VFuel)=qvFuel;
		der(EFuel)=PFuel;
		
		if CHPon then
			on = 1;
		else
			on = 0;
		end if;
		
		ElEff = eta_elec * on;
		HeatEff = eta_heat * on;
	equation
			if (CPPhase==1) then 
			connect(CPGrid1,CPGridConnection1.FlowCurrent) annotation(Line(points={{85,-215},{80,-215},{80,-187.7},{85,-187.7},{85,-160},{85,
		-155}}));
		end if;
			if (CPPhase==3) then
			connect(CPGrid3,CPGridConnection3.LVFlowCurrent) annotation(Line(points=0));
		end if;
			if (CHPPhase==3) then
			connect(GENGrid3,CHPGridConnection3.LVFlowCurrent) annotation(Line(points=0));
		end if;
			if (CHPPhase==1) then
			connect(GENGrid1,CHPGridConnection1.FlowCurrent) annotation(Line(points={{-60,-215},{-65,-215},{-65,-187.7},{-60,-187.7},{-60,-160},{-60,
		-155}}));
		end if;
		
		
		connect(ToFlow.Pipe,FlowCHP) annotation(Line(
			points={{180,-75},{185,-75},{215,-75},{220,-75}},
			color={190,30,45}));
		connect(FromReturn.Pipe,ReturnCHP) annotation(Line(
			points={{-25,-70},{-30,-70},{-55,-70},{-60,-70}},
			color={190,30,45},
			thickness=0.015625));
		connect(FromReturn.TMedium,etaHeat.u[1]) annotation(Line(
			points={{-5,-75},{0,-75},{53,-75},{58,-75}},
			color={0,0,127},
			thickness=0.0625));
		connect(FromReturn.TMedium,QMin.u[1]) annotation(Line(
			points={{-5,-75},{0,-75},{53,-75},{53,-50},{58,-50}},
			color={0,0,127},
			thickness=0.0625));
		connect(FromReturn.TMedium,QMax.u[1]) annotation(Line(
			points={{-5,-75},{0,-75},{53,-75},{53,-25},{58,-25}},
			color={0,0,127},
			thickness=0.0625));
	annotation(
		__esi_protocols(transient={
																																																																																																																																																																																																																														Protocol(var=time),
																																																																																																																																																																																																																													Protocol(var=statAnaRefVar)}),
		__esi_solverOptions(
			solver="CVODE",
			typename="ExternalCVODEOptionData"),
		statAnaRefVar(__esi_flags=2),
		__esi_solver(
			bEffJac=false,
			bSparseMat=false,
			typename="CVODE"),
		Icon(
			coordinateSystem(extent={{-200,-200},{200,200}}),
			graphics={
				Bitmap(
					imageSource="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",
					extent={{-248,203},{260,-207}}),
				Text(
					textString="DZ",
					fontSize=14,
					textStyle={
						TextStyle.Bold},
					lineColor={0,128,255},
					extent={{41.3,-67.3},{291.3,-284}})}),
		experiment(
			StopTime=1,
			StartTime=0,
			Tolerance=1e-06,
			Interval=0.002,
			__esi_Solver(
				bSplitCodeGen=false,
				typename="CVODE"),
			__esi_MinInterval="9.999999999999999e-10",
			__esi_MaxInterval="0.002",
			__esi_AbsTolerance="1e-6"));
end CHP;
