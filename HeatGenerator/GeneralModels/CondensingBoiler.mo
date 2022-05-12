// CP: 65001
// SimulationX Version: 4.2.3.69223
within CoSES_Models.HeatGenerator.GeneralModels;
model CondensingBoiler "Condensing Boiler (modulating) with efficiency depending on the return temperature"
	GreenCity.Interfaces.Thermal.VolumeFlowIn ReturnCB "Return pipe of CB" annotation(Placement(
		transformation(extent={{236,-25},{256,-5}}),
		iconTransformation(extent={{215,12},{235,32}})));
	GreenCity.Interfaces.Thermal.VolumeFlowOut FlowCB "Flow pipe of CB" annotation(Placement(
		transformation(extent={{237,41},{257,61}}),
		iconTransformation(extent={{215,162},{235,182}})));
	GreenCity.Interfaces.Electrical.LV1Phase CPGrid1 if(CPPhase==1) "1-phase connection of circulation pump to Grid" annotation(Placement(
		transformation(extent={{77,-150},{97,-130}}),
		iconTransformation(extent={{-135,-238},{-115,-218}})));
	GreenCity.Interfaces.Electrical.LV3Phase CPGrid3 if(CPPhase==3) "3-phase connection of circulation pump to Grid" annotation(Placement(
		transformation(extent={{151,-149},{171,-129}}),
		iconTransformation(extent={{-85,-238},{-65,-218}})));
	GreenCity.Interfaces.Thermal.DefineVolumeFlow ToFlow "Specifies a volume flow port V1.0" annotation(Placement(transformation(extent={{185,40},{205,60}})));
	GreenCity.Interfaces.Thermal.ExtractVolumeFlow FromReturn annotation(Placement(transformation(extent={{205,-25},{185,-5}})));
	GreenCity.Interfaces.Electrical.DefineCurrentAC3 CPGridConnection3(VoltageType=VoltageType) if(CPPhase==3) annotation(Placement(transformation(
		origin={160,-71},
		extent={{10,-10},{-10,10}},
		rotation=90)));
	GreenCity.Interfaces.Electrical.DefineCurrentAC1 CPGridConnection1 if(CPPhase==1) annotation(Placement(transformation(
		origin={87,-70},
		extent={{10,-10},{-10,10}},
		rotation=90)));
	Modelica.Blocks.Tables.CombiTable1D PelCP(
		tableOnFile=true,
		tableName=CPTable,
		fileName=CPFile) "Electrical power demand of circulation pump" annotation(Placement(transformation(extent={{0,35},{20,55}})));
	Modelica.Blocks.Tables.CombiTable1D QMax(
		tableOnFile=true,
		tableName=QMaxTable,
		fileName=QFile) "Maximum heat powr characteristic of CB" annotation(Placement(transformation(extent={{0,10},{20,30}})));
	Modelica.Blocks.Tables.CombiTable1D QMin(
		tableOnFile=true,
		tableName=QMinTable,
		fileName=QFile) "Minimum heat powr characteristic of CB" annotation(Placement(transformation(
		origin={10,-5},
		extent={{-10,-10},{10,10}})));
	Modelica.Blocks.Tables.CombiTable1D etaNom(
		tableOnFile=not useConstEta,
		table=[0,0],
		tableName=etaTable,
		fileName=QFile) if not useConstEta "Nominal efficiency of CB" annotation(Placement(transformation(extent={{0,-40},{20,-20}})));
	Real EHeat(
		quantity="Basics.Energy",
		displayUnit="kWh") "Heat output of condensing boiler" annotation(Dialog(
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
		displayUnit="kWh") "Fuel energy demand of condensing boiler" annotation(Dialog(
		group="Energy",
		tab="Results 2",
		visible=false));
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
		discrete Real StartTime(
			quantity="Basics.Time",
			displayUnit="s") "Starting time of heating" annotation(Dialog(
			group="Timing",
			tab="Results 2"));
		Real etaNominal(
			quantity="Basics.RelMagnitude",
			displayUnit="%") "Actual nominal efficiency of CB" annotation(Dialog(
			group="Others",
			tab="Results 2"));
	public
		input Modelica.Blocks.Interfaces.BooleanInput CBon "Switch on/off of CB" annotation(
			Placement(
				transformation(extent={{-85,61},{-45,101}}),
				iconTransformation(extent={{-245,102},{-205,142}})),
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
		input Modelica.Blocks.Interfaces.BooleanInput CPon "Switch on/off of circulation pump" annotation(
			Placement(
				transformation(extent={{-85,10},{-45,50}}),
				iconTransformation(extent={{-245,52},{-205,92}})),
			Dialog(
				group="I/O",
				tab="Results 1",
				visible=false));
		Real Efficiency(quantity="Basics.RelMagnitude") "Heating efficiency" annotation(Dialog(
			group="Heating Power",
			tab="Results 1",
			visible=false));
		input Modelica.Blocks.Interfaces.RealInput QRefRelative(
			quantity="Basics.RelMagnitude",
			displayUnit="%") "Percental target heat power output" annotation(
			Placement(
				transformation(
					origin={40,103},
					extent={{-20,-20},{20,20}},
					rotation=-90),
				iconTransformation(
					origin={-75,222},
					extent={{-20,-20},{20,20}},
					rotation=-90)),
			Dialog(
				group="Heating Power",
				tab="Results 1",
				visible=false));
		Real QMaxModulation(quantity="Basics.Power") "Maximum Heat Power during modulation" annotation(Dialog(
			group="Heating Power",
			tab="Results 1",
			visible=false));
		Real QHeatInput(
			quantity="Basics.Power",
			displayUnit="kW") "Actual heat power" annotation(Dialog(
			group="Heating Power",
			tab="Results 1",
			visible=false));
		Real QHeat(
			quantity="Basics.Power",
			displayUnit="kW") "Heat output power of CB" annotation(Dialog(
			group="Heating Power",
			tab="Results 1",
			visible=false));
		input Modelica.Blocks.Interfaces.RealInput qvRef(
			quantity="Thermics.VolumeFlow",
			displayUnit="m³/h") "Reference volume flow of circulation pump" annotation(
			Placement(
				transformation(
					origin={115,103},
					extent={{-20,-20},{20,20}},
					rotation=-90),
				iconTransformation(
					origin={75,222},
					extent={{-20,-20},{20,20}},
					rotation=-90)),
			Dialog(
				group="Volume Flow",
				tab="Results 1",
				visible=false));
	protected
		Real qv(
			quantity="Thermics.VolumeFlow",
			displayUnit="m³/h") "Actual volume flow" annotation(Dialog(
			group="Volume Flow",
			tab="Results 1"));
		Real TFlow(
			quantity="Thermics.Temp",
			displayUnit="°C") "Flow temperature of CB" annotation(Dialog(
			group="Temperature",
			tab="Results 1"));
		Real TReturn(
			quantity="Thermics.Temp",
			displayUnit="°C") "Return temperature of CB" annotation(Dialog(
			group="Temperature",
			tab="Results 1"));
	public
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
		parameter Real cpMed(
			quantity="Thermodynamics.SpecHeatCapacity",
			displayUnit="kJ/(kg·K)")=4177 "Specific heat capacity of heating medium" annotation(Dialog(
			group="Heating System",
			tab="Condensing Boiler - Dimensions"));
		parameter Real rhoMed(
			quantity="Basics.Density",
			displayUnit="kg/m³")=1000 "Density of heating medium" annotation(Dialog(
			group="Heating System",
			tab="Condensing Boiler - Dimensions"));
		parameter Real VCB(
			quantity="Geometry.Volume",
			displayUnit="l")=0.01 "Heating medium volume of CB" annotation(Dialog(
			group="Heating System",
			tab="Condensing Boiler - Dimensions"));
		parameter Real TAmbient(
			quantity="Thermics.Temp",
			displayUnit="°C")=291.14999999999998 "Ambient temperature" annotation(Dialog(
			group="Heat Losses",
			tab="Condensing Boiler - Dimensions"));
		parameter Real QlossRate(
			quantity="Thermics.HeatCond",
			displayUnit="W/K")=0.2 "Heat loss rate of CB-isolation" annotation(Dialog(
			group="Heat Losses",
			tab="Condensing Boiler - Dimensions"));
		parameter Boolean useConstEta=false "If true, constant value for nominal efficiency should be used" annotation(Dialog(
			group="Model Configuration",
			tab="Fuel Consumption"));
		parameter Real rhoFuelVolume(
			quantity="Basics.Density",
			displayUnit="kg/m³")=0.7 "Volumetric fuel density" annotation(Dialog(
			group="Fuel Medium",
			tab="Fuel Consumption"));
		parameter Real rhoFuelEnergy(
			quantity="Thermodynamics.SpecEnergy",
			displayUnit="MJ/kg")=40000000 "Energy density of fuel" annotation(Dialog(
			group="Fuel Medium",
			tab="Fuel Consumption"));
		parameter Real eta(
			quantity="Basics.RelMagnitude",
			displayUnit="%")=1.09 if useConstEta "Standard efficiency of condensing boiler" annotation(Dialog(
			group="Condensing Boiler - Characteristics",
			tab="Fuel Consumption"));
		parameter Real LatentHeat(
			quantity="Basics.RelMagnitude",
			displayUnit="%")=0 "Additional latent heat losses of condensing boiler" annotation(Dialog(
			group="Condensing Boiler - Characteristics",
			tab="Fuel Consumption"));
		parameter Real ExhaustLoss(
			quantity="Basics.RelMagnitude",
			displayUnit="%")=0 "Additional exhaust gas losses" annotation(Dialog(
			group="Condensing Boiler - Characteristics",
			tab="Fuel Consumption"));
		parameter Real RadiationLoss(
			quantity="Basics.RelMagnitude",
			displayUnit="%")=0 "Additional radiation losses" annotation(Dialog(
			group="Condensing Boiler - Characteristics",
			tab="Fuel Consumption"));
		parameter String etaTable="eta_norm" if not useConstEta "Table name for nominal efficiency of CB" annotation(Dialog(
			group="Efficiency",
			tab="Fuel Consumption"));
		parameter Real TFlowMax(
			quantity="Thermics.Temp",
			displayUnit="°C")=358.15 "Maximum flow temperature" annotation(Dialog(
			group="Modulated Heat Power",
			tab="Condensing Boiler - Power Data"));
		parameter String QFile=classDirectory()+"Data\\Wolf_CBG_20.txt" "File name for power behavior of CB" annotation(Dialog(
			group="Modulated Heat Power",
			tab="Condensing Boiler - Power Data"));
		parameter String QMaxTable="Q_CB_max" "Table name for maximum heat power of CB" annotation(Dialog(
			group="Modulated Heat Power",
			tab="Condensing Boiler - Power Data"));
		parameter String QMinTable="Q_CB_min" "Table name for minimum heat power of CB" annotation(Dialog(
			group="Modulated Heat Power",
			tab="Condensing Boiler - Power Data"));
		parameter String CPFile=GreenCity.Utilities.Functions.getModelDataDirectory()+"\\condensing_boiler\\circulation_pump\\CP_25_60.txt" "File name for CP-power behavior" annotation(Dialog(
			group="Power Data",
			tab="Circulation Pump - Dimensions"));
		parameter String CPTable="P_CP" "Table name for CP-power behavior" annotation(Dialog(
			group="Power Data",
			tab="Circulation Pump - Dimensions"));
		parameter Real CosPhiCP=0.98 "Power factor of circulation pump" annotation(Dialog(
			group="Power Data",
			tab="Circulation Pump - Dimensions"));
		parameter Real qvMax(
			quantity="Thermics.VolumeFlow",
			displayUnit="m³/h")=0.00083333333333333328 "Maximum volume flow of CP" annotation(Dialog(
			group="Boundaries",
			tab="Circulation Pump - Dimensions"));
		parameter Real qvMin(
			quantity="Thermics.VolumeFlow",
			displayUnit="m³/h")=0.00025000000000000001 "Minimum volume flow of CP" annotation(Dialog(
			group="Boundaries",
			tab="Circulation Pump - Dimensions"));
		parameter Integer CPPhase=1 "Phase number circulation pump is connected to" annotation(Dialog(
			group="Circulation Pump - Configuration",
			tab="Circulation Pump - Dimensions"));
		parameter Real tThStart(
			quantity="Basics.Time",
			displayUnit="s")=480 "Heat power switch-on time period" annotation(Dialog(
			group="Heat Power",
			tab="Dynamics"));
		parameter Real tCP(
			quantity="Basics.Time",
			displayUnit="s")=15 "Operation time delay of circulation pump" annotation(Dialog(
			group="Circulation Pump",
			tab="Dynamics"));
	protected
		type VoltageEnum = enumeration( 
			LV "Low-Voltage", 
			MV "Medium-Voltage", 
			HV "High-Voltage") "Voltage-Level Enumeration" annotation(initValue=LV);
	initial equation
			assert((CPPhase==1)or(CPPhase==3), "CPPhase must equal 1 or 3");
		
			if CPon then		
				ToFlow.qvMedium=max(min((qvRef),qvMax),qvMin);
			else
				ToFlow.qvMedium=0;
			end if;
					
			if CBon then	
				TFlow=FromReturn.TMedium;
			else
				TFlow=TAmbient;
			end if;		
		
			EHeat=0;
			ECP=0;
			VFuel=0;
			EFuel=0;
			
			StartTime=time.start;
			
			if CBon then
				QHeatInput=max(min((QRefRelative*QMax.y[1]),QMax.y[1]),QMin.y[1]);
			else
				QHeatInput=0;
			end if;
	equation
				when CBon then
					StartTime=time;
				end when;
			
				if not useConstEta then
					etaNom.u[1]=TReturn;
				end if;	
					
				if useConstEta then
					etaNominal=eta;
				else
					etaNominal=etaNom.y[1];
				end if;
					
				QMax.u[1]=TReturn;
				QMin.u[1]=TReturn;
				QMaxModulation = cpMed*rhoMed*qvMax*(TFlowMax-TReturn);	
								
				when (CBon and not ((time-StartTime)<tThStart)) then
					reinit(QHeatInput,min(max(min((QRefRelative*QMax.y[1]),QMax.y[1]),QMin.y[1]), QMaxModulation));
				elsewhen (CBon and not (time-StartTime)<tThStart and QRefRelative>=1) then
					reinit(QHeatInput,min(QMax.y[1], QMaxModulation));
				elsewhen (CBon and not (time-StartTime)<tThStart and QRefRelative*QMax.y[1]<QMin.y[1]) then
					reinit(QHeatInput,QMin.y[1]);
				elsewhen not CBon then
					reinit(QHeatInput,0);
				end when;
				
				if CBon then
					if (((time-StartTime)<tThStart) and (StartTime>time.start)) then
						tThStart/3*der(QHeatInput)+QHeatInput=max(min((QRefRelative*QMax.y[1]),QMax.y[1]),QMin.y[1]);
					elseif (QRefRelative<=1 and QRefRelative*QMax.y[1]>QMin.y[1]) then
						der(QHeatInput)=der(QRefRelative)*QMax.y[1];
					else
						der(QHeatInput)=0;
					end if;
				else
					der(QHeatInput)=0;
				end if;
					
				TReturn=FromReturn.TMedium;
				qv=FromReturn.qvMedium;
				if (CPon) then	
					tCP*der(ToFlow.qvMedium)+ToFlow.qvMedium=max(min((qvRef),qvMax),qvMin);
					PelCP.u[1]=qv;	
					PCP=-PelCP.y[1];			
				else
					tCP*der(ToFlow.qvMedium)+ToFlow.qvMedium=0;
					PelCP.u[1]=0;
					PCP=0;
				end if;
				cpMed*rhoMed*VCB*der(TFlow)=-QlossRate*(TFlow-TAmbient)+QHeatInput-cpMed*rhoMed*qv*(TFlow-TReturn);
				ToFlow.TMedium=TFlow;
				
				if (abs(CosPhiCP)>1e-10) then
					SCP=abs(PCP)/CosPhiCP;
				else
					SCP=abs(PCP);
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
				
				if CBon then
					on = 1;
				else
					on = 0;
				end if;
				
				if ((ExhaustLoss > 0) or (RadiationLoss > 0)) then
					PFuel=-QHeatInput/(((1+LatentHeat)*etaNominal-ExhaustLoss-RadiationLoss)/((1+LatentHeat)*etaNominal));
					Efficiency = ((1+LatentHeat)*etaNominal-ExhaustLoss-RadiationLoss)/((1+LatentHeat)*etaNominal) * on;
				else
					PFuel = -QHeatInput / etaNominal;
					Efficiency = etaNominal * on;
				end if;
				
				qvFuel=abs(PFuel)/(rhoFuelVolume*rhoFuelEnergy);
				
				der(EHeat)=QHeat;
				der(ECP)=PCP;
				der(EFuel)=PFuel;
				der(VFuel)=qvFuel;
			
			if (CPPhase==1) then 
			connect(CPGrid1,CPGridConnection1.FlowCurrent) annotation(Line(points={{87,-140},{82,-140},{82,-113},{87,-113},{87,-85},{87,
		-80}}));
		end if;
			if (CPPhase==3) then
			connect(CPGrid3,CPGridConnection3.LVFlowCurrent) annotation(Line(points={{161,-139},{156,-139},{156,-113},{160,-113},{160,-86},{160,
		-81}}));
		end if;
		
		
		connect(ToFlow.Pipe,FlowCB) annotation(Line(
			points={{205,50},{210,50},{242,50},{242,51},{247,51}},
			color={190,30,45}));
		connect(FromReturn.Pipe,ReturnCB) annotation(Line(
			points={{205,-15},{210,-15},{241,-15},{246,-15}},
			color={190,30,45},
			thickness=0.0625));
	annotation(
		Icon(
			coordinateSystem(extent={{-225,-223},{225,223}}),
			graphics={
							Bitmap(
								imageSource="iVBORw0KGgoAAAANSUhEUgAAAG4AAABuCAYAAADGWyb7AAAABGdBTUEAALGPC/xhBQAAABl0RVh0
U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAu7SURBVHhe7Z1tjB1VGcdrbemLtNu0paXp
20qzyTbdmsV3WiMNMZRi1SbVlC8kNWj5QrBB1EhiUmn4YAw2bfhAgmYp0Yg22ZUE5IOBDUFjMIGF
mMYPYIoW0u2LLNiAFSHH85+dZ/s8z57n3rl3Zu7MvT2/5B/vzvxn7pnzn/O6dZkTiUQikXYY9hr3
clG1ELJAJg2BIXRxVPVqGF5safUVsjEJXRBVH5mEzG7//v1ufHzcnTp1ykXKAXWLOkZdhzJIZTLL
PDY2lt460ilQ56EsvEyEEelHqsFoeSbCiKYbqQbUvc7Dy0QYp6am0ttEOg3GPJ2Hl4kwRqpF5+Fl
IowWl577o5v67n3u3Je+6i58/XZ38djD7oPX/5mebQ68uAbX4h64F+6Zlfdf/uvM99dN7xz+iXvv
iafSkuZD5+FlIoyaD6feTgp3+qoVQSGMZsATuhZCkPiORrx1x13Ba+umN1ddlztAnYeXiTBqJj9z
Y7CQXI3CaxQaCeFZoJWFrqmz3n3s12npW0fn4WUijBxd6XijqMvUx0OtBsdwjnupi+THoFC3ie5V
+/JUShmgjGhlvFfCM7eLzsPLRBg5urXxStPdZ6jV6eBxDYFxgZ8LtTrtQZdZZ3h9YUxuB52Hl4kw
cnilQRyEyM+FKlWPTTxcPBg/d2bg+vTMZfTLUdQEoGjQ6vRL1i46Dy8TYeTwgujC6O6OtyZCV7zu
Dvk5SNPsegKBVjXjxAvHywihLO2i8/AyEUaOLhCnDsHhTc8yeeqk8oQGdB5eJsLI0YXiVB0cJj6h
t73TwkQE5URgeJHyovPwMhFGji4kp+rg+MQHlYcxt9l6sBvQeXiZCCOHVxrEqTo4Phmo2xIhDzoP
LxNh5PBKgzhVB6dbHIIsoquqGp2Hl4kwcnilQZyqg0O3WJeJCcZarEOLaPk6Dy8TYeToAnKqDg4g
PO2pWniZ8oy1Og8vE2EkmgWjF9DornSBcYx79G5Co/O4Fz8HWRWC69BVooxVSJcT4bWLzsPLRBiJ
LNtNejrOPXrXJLQzoj2oBKLRuTqCbpK/iO2OtzoPLxNhRGCQbg2h7SYc4x7IegtD1+Ph9PfgbQ1d
r7vJuoBy4dkwxvHytttd6jy8TISRfzmp0duu9yxDCm1AE/pNDanRoI8KwuK3DotxUiVbXroQCK3Z
24O3LtRKcCxLS8EYpd/YLNfjumahd1IoC3qrPOg8vEyEERVFarWfRsB0bbtdRdbrG3WznRRaF8JC
d9nuM3N0Hl4mwtgt8AU4AuuFxTfQeXiZCGO3wGe9oYlPt6Lz8DIRxm4htMncC+g8vEyEsVvAeIIu
ksIjYXYZGou6RToPLxNh7CYwroXC62bpPLxMhLEbwRiHnRa8saHK6CbpPLxMhDFSLToPLxNhjFSL
zsPLRBgj1aLz8DIRxl7l0MQ77sjJi27iX++nR5oz9o/3kuvwv51C5+FlIoy9yrJfvenmjJx2+59/
Kz0yzfiZS0k4kMa6pkx0Hl4mwtiLoJUhAGjk1XfTo9MgMDqn2fPMheT48BOT6ZHy0Xl4mQhjL4Iu
ksI5dfGD9Og0jYLj103998P0aLnoPLxMhLEXoZbTf+JMeuQyjYLjLbVT45zOw8tEGHsRtBZUvO4m
AVogxjkoRKsTmrzoPLxMhDFSLToPLxNhjFSLzsPLRBh7DUzlMa0/+EL4z4Cg+9zx9LlEIdCV4lyn
xjmdh5eJMPYamJCg0jFBCdFockLQeSv8ItF5eJkIYy+B1kKVjklGiCzBUYvrxHpO5+FlIoxFc/Dg
wURVgG6QQrFmhlmC456y13M6Dy8TYSya/v5+t2zZsvSnzoKuDZWNMc4iS3BYKpDHWjYUhc7Dy0QY
i4buW9XfCEN3WcQ6rOzACJ5FKhNhLBrcc1vf4vhX+TKi8/AyEcYimZiYcEvnzU2Ci3+8NBs6Dy8T
YSySI0eOuFtWXO3u3bjSHTp0KD3aGdA96g3lIkCXWeYERefhZSKMRYKJycjQOndvf+eDw9Qdkwlr
/UZkmZwQ5MM1ZaHz8DIRxqJAUFuWLHBnbhp09w+s6uiSAC2CKtlavxGtBEcvg7XLUgQ6Dy8TYSwC
jG241zM39LvJmwfd6Kc3uB07dqRnywdbUxRGs9lgK8HR8iKLt110Hl4mwpgX/HlarNuOfmKNm7x1
MNHo5zobXCsV3EpwrbwQ7aLz8DIRxjxgrTY8POz2behzk1/bPKPR7Z0NrpUurZXgeBdc1jin8/Ay
EcZmoEWNjIykP0mS0D7uQ/uGD4xpdMfGWcEh5LIW5bSxnKVyWwkO0EtR1j8g0nl4mQhjMzDFh0//
F0AwGRlavtBN3u7DUhq9WQaHMRDdaZkzTSwFskzbWw0Oy4yuXA7Q38bns0S0HAQxunujm/y2D0sJ
xyk46k5xD7wEVYOxCuGV1fW1Cs8ilYkwNgPB9S34qNg4RgDb1i12Z+/eHNTY3svB4b9msWvTkuQe
utVGSg5u24bFbmj1gpmxDi3o0b1r3dkfDgZ17Mtr3J49e5KA1/fNd8d2r0muicxG5+FlIozNQFcH
37G9lysfP7/6owF39gEfVEDfu2ll4u1bNNc9e1e/23d9Xy26yTrCs0hlIoxZgO/c0QG3fsX8ZKwb
Wrcg+dnSgRuXTYf2gw3Jz/gcu8kwOg8vE2HMAnznHt3kjn1rVfJ5++Ci5GdLB3b2uRcf9KH5z8fv
vjbZwywLvBBV/ca9CHgWqUyEMQuYmIw/uMadH9vgtg8t8FqYfM6iO3cvKbVicW+Ur6w1YtnoPLxM
hDELmCE+dniFOz++1o3/fJW79Qs+OP85i9avnlfaL1VpWYLn6PRvI4pC5+FlIoxZQKXc9pVF7vzE
tYle+v01M58b6aWnrsn8He2ActFzdGuro/IzmQhjFjCO9C39iPv7K8vdhVMrMwneoc3zSmsJvLWR
unHmysufykQYs4KF9PYb5rvXTi5350/7brOB4BnaMm/WfmWRICT9LGVOgspCP4OXiTBmBW84gkAg
v/vtUjOw79+zOGmdZf+3V7H/SdtxEL6vrLG0THgWqUyEsVXQ9aGLWr9urtu186okqDvvWJi0RtwP
4XayAuk5rujJCabW+nxZKmoLjO53RQeH1qLPl6kioHtd0cFhExnhZRVaDd0HE4OQx1JRi3L6fgSH
cRjPgM/4Dmx04zPGw7pC5WcyEcY88MlBVW88fT9eIr084EKQdZy8BMpqIox5qFNwXAiRWrYOE60w
y4Y3Wi+8Zc+OedlSmQhjHuoWnNWq0H3qABGIFSD86PrJS7+HLANeplQmwpiHOgWH1tEItCCUkfwk
hI3jEMZdHhhU5gY54N+VykQY81Cn4LJ+P1oZWhtdZwkBhlpv0QS+20QY89CNwRE0A0VLpdkxWh9C
7eT/04jKz2QijHno5uDqApWfyUQY8xCDyw+Vn8lEGPMQg8sPlZ/JRBjzEIObzb//c9q98fafhc5f
PJmenQ2Vn8lEGPMQg5vNy2/8wj303Magxl7Zl5y/9L/L/4qays9kIox5iMHNBi0uFBrpthOb3SN/
2ur+8vr0b+up/EwmwpiHXgwOz4Q1XJ7dkuMvbA+GBn3x+Fa35/EtyefnX/vxTPmZTIQxD3UKjn4D
nlf8n0RgmwzPhTVfKyCQnz7bn4S09ZFht/OXQ+7wH65LwrrnyYHkGAVJ38VkIox5wIPSfaoOrkxR
gFnBZISCQWAI6mM/+2wS4H1Pb4rBAf4sZanRhrTF4y/uSoIaePiTib45OujWPfSp5DNaYu7gWi0Q
pw7BFQ09E1oZNpjbrZ+/TZ5IWhe6RgoJ3SeCQ6D4+f7frJ2pPyYTYURB26UXg8Nvy/EsrY5rIUKT
FIRHXeV3jq4WWaQyEUZ0A+3Si8EVCRbfOjiIWtznb7laZJHKZJa53d3wGFxzsF7TwaELPfDA9D/P
DyhIv1fIPDOdbqVPj8FlA7slWHRjTEP3aLQ0kknIHFUfmYx7hS6Iql7IxmTYK3RRVPVCNg2BIba8
+ghZNA0tEolEIoo5c/4PxQ/RCb8tUzEAAAAASUVORK5CYII=",
								extent={{-223,223},{233,-230}}),
							Text(
								textString="DZ",
								fontSize=14,
								textStyle={
									TextStyle.Bold},
								lineColor={0,128,255},
								extent={{109.8,-148.6},{248,-257}})}),
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
end CondensingBoiler;
