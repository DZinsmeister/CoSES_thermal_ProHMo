// CP: 65001
// SimulationX Version: 4.2.3.69223
within CoSES_Models.Consumer.Submodels;
model BuildingZone_VariableVentilation "Building zone including inner heat losses and yields with variable ventilation losses"
	import GreenCity.GreenBuilding.Building.*;
	import GreenCity.GreenBuilding.*;
	import GreenCity.*;
	input Modelica.Blocks.Interfaces.RealInput TZoneRef(
		quantity="Thermics.Temp",
		displayUnit="°C") if LoadCalculation "Desired zone temperature" annotation(
		Placement(
			transformation(extent={{645,-495},{605,-455}}),
			iconTransformation(
				origin={200,200},
				extent={{20,-20},{-20,20}},
				rotation=90)),
		Dialog(
			group="Temperature",
			tab="Results 1",
			visible=false));
	protected
		function calc_Phi "calc_Phi"
			input Real P;
			input Real Q;
			output Real Phi;
			protected
				Real P_act;
			algorithm
				if (P>1e-10) then
					P_act:=P;
				elseif (P<-1e-10) then
					P_act:=P;
				else	
					P_act:=(1e-10)*sign(P);
				end if;
				if ((abs(P_act)>1e-10) and (abs(Q)>1e-10)) then
					if (P_act>=0) then
						Phi:=atan(Q/P_act);
					else
						if (Q>0) then
							Phi:=pi+atan(Q/P_act);
						else
							Phi:=-pi+atan(Q/P_act);
						end if;
					end if;
				else
					if (abs(Q)>1e-10) then
						if (Q>0) then
							Phi:=pi/2;
						else
							Phi:=-pi/2;
						end if;
					else
						if (P_act>=0) then	
							Phi:=0;
						else
							Phi:=-pi;
						end if;
					end if;
				end if;
			annotation(__esi_Impure=false);
		end calc_Phi;
		function calc_current
			input Real P;
			input Real Q;
			input Real U;
			output Real current;
			protected
				Real S;
			algorithm
				S:=(P^2+Q^2)^0.5;
				if (abs(U)>1e-10) then
					current:=S/U;
				else
					current:=0;
				end if;
			annotation(__esi_Impure=false);
		end calc_current;
		function ground
			input Real depthGround;
			input Real DayOfYear;
			input Boolean LeapYear;
			input Real cGround;
			input Real lambdaGround;
			input Real rhoGround;
			input Real GeoGradient;
			input Real TAmbientAverage;
			input Real TAmbientMax;
			input Integer MaxMonth;
			output Real TGround;
			protected
				Real a=lambdaGround/(rhoGround*cGround);
				Real xi;
				Real TimePeriod;
				Real PhaseDisplacement=2*pi*MaxMonth/12;
			algorithm
				if (LeapYear) then
					TimePeriod:=366*24*3600;
				else
					TimePeriod:=365*24*3600;
				end if;
				xi:=depthGround*sqrt(pi/(a*TimePeriod));
				TGround:=TAmbientAverage+GeoGradient*depthGround+(((TAmbientMax-TAmbientAverage)*exp(-xi)))*cos(2*pi*(DayOfYear*24*3600)/TimePeriod-PhaseDisplacement-xi);
			annotation(
				derivative=groundDot,
				__esi_Impure=false);
		end ground;
		function groundDot "groundDot"
			input Real depthGround;
			input Real DayOfYear;
			input Boolean LeapYear;
			input Real cGround;
			input Real lambdaGround;
			input Real rhoGround;
			input Real GeoGradient;
			input Real TAmbientAverage;
			input Real TAmbientMax;
			input Integer MaxMonth;
			input Real depthGroundDot;
			input Real DayOfYearDot;
			input Real cGroundDot;
			input Real lambdaGroundDot;
			input Real rhoGroundDot;
			input Real GeoGradientDot;
			input Real TAmbientAverageDot;
			input Real TAmbientMaxDot;
			output Real TGroundDot;
			protected
				Real a:=lambdaGround/(rhoGround*cGround);
				Real xi;
				Real TimePeriod;
				Real PhaseDisplacement:=2*pi*MaxMonth/12;
				Real aDot:=0;
				Real xiDot:=0;
				Real TimePeriodDot:=0;
				Real PhaseDisplacementDot:=0;
			algorithm
				if (LeapYear) then
					TimePeriod:=366*24*3600;
				else
					TimePeriod:=365*24*3600;
				end if;
				xi:=depthGround*sqrt(pi/(a*TimePeriod));
				
				TGroundDot:=(((TAmbientMax-TAmbientAverage)*exp(-xi)))*-(2*pi*24*3600*DayOfYearDot/TimePeriod)*sin(2*pi*(DayOfYear*24*3600)/TimePeriod-PhaseDisplacement-xi);
			annotation(Impure=false);
		end groundDot;
		function angleMinMax
			input Real angle;
			input Real angleMax;
			input Real angleMin;
			output Real angleOut;
			algorithm
				angleOut:=min(angleMax,(max(angleMin,angle)));
			annotation(__esi_Impure=false);
		end angleMinMax;
		function ThreeVectorMult "ThreeVectorMult"
			input Real vector1[:];
			input Real vector2[:];
			input Real vector3[:];
			input Integer length;
			output Real prod;
			algorithm
				prod:=0;
				for i in 1:length loop
					prod:=prod+(vector1[i]*vector2[i]*vector3[i]);
				end for;
			annotation(__esi_Impure=false);
		end ThreeVectorMult;
		function sumVector "sumVector"
			input Real u[:];
			input Integer first;
			input Integer last;
			output Real y;
			algorithm
				y:=0;
				for i in first:last loop
					y:=y+u[i];
				end for;
			annotation(__esi_Impure=false);
		end sumVector;
		function sumVector1 "sumVector1"
			input Real u[:];
			input Real v[:];
			input Integer first;
			input Integer last;
			output Real y;
			algorithm
				y:=0;
				for i in first:last loop
					if (v[i]>1e-3) then
						y:=y+u[i];
					else
						y:=y+0;
					end if;
				end for;
			annotation(__esi_Impure=false);
		end sumVector1;
		function sumVector2 "sumVector2"
			input Real u[:];
			input Real v[:];
			input Integer first;
			input Integer last;
			output Real y;
			algorithm
				y:=0;
				for i in first:last loop
					if not(v[i]>1e-3) then
						y:=y+u[i];
					else
						y:=y+0;
					end if;
				end for;
			annotation(__esi_Impure=false);
		end sumVector2;
		function normalVector "normalVector"
			input Real alphaInclination;
			input Real alphaOrientation;
			output Real vector[3];
			algorithm
				vector:={sin(alphaInclination)*cos(alphaOrientation),sin(alphaInclination)*sin(alphaOrientation),cos(alphaInclination)};
			annotation(__esi_Impure=false);
		end normalVector;
		function diffAngle "diffAngle"
			input Real vector1[3];
			input Real vector2[3];
			output Real angle;
			protected
				Real value;
				Real minMax;
			algorithm
				value:=(vector1[1]*vector2[1]+vector1[2]*vector2[2]+vector1[3]*vector2[3])/(sqrt(vector1[1]*vector1[1]+vector1[2]*vector1[2]+vector1[3]*vector1[3])*sqrt(vector2[1]*vector2[1]+vector2[2]*vector2[2]+vector2[3]*vector2[3]));
				minMax:=max(min(value,1),-1);
				angle:=acos(minMax);
			annotation(__esi_Impure=false);
		end diffAngle;
		Boundary Boundaries[Bound] "Boundary model" annotation(Placement(transformation(extent={{-150,100},{-130,110}})));
		InnerMass Masses[Mass] "Inner masses model" annotation(Placement(transformation(extent={{-150,100},{-130,110}})));
	public
		Modelica.Blocks.Tables.CombiTable1D CoolLoadFactorPerson(
			tableOnFile=DINcalc,
			table=[0,0],
			tableName=CoolFactorTable,
			fileName=DINfile) if DINcalc annotation(Placement(transformation(extent={{-10,-10},{10,10}})));
		Modelica.Blocks.Tables.CombiTable1D CoolLoadFactorLight(
			tableOnFile=DINcalc,
			table=[0,0],
			tableName=CoolFactorTable,
			fileName=DINfile) if DINcalc annotation(Placement(transformation(extent={{-10,-10},{10,10}})));
		Modelica.Blocks.Tables.CombiTable1D CoolLoadFactorMachine(
			tableOnFile=DINcalc,
			table=[0,0],
			tableName=CoolFactorTable,
			fileName=DINfile) if DINcalc annotation(Placement(transformation(extent={{-10,-10},{10,10}})));
		Modelica.Blocks.Tables.CombiTable1D AppliedLoadFactorLight(
			tableOnFile=DINcalc,
			table=[0,0],
			tableName=LoadLightTable,
			fileName=DINfile) if DINcalc annotation(Placement(transformation(extent={{-10,-10},{10,10}})));
		Modelica.Blocks.Tables.CombiTable1D AppliedLoadFactorMachine(
			tableOnFile=DINcalc,
			table=[0,0],
			tableName=LoadMachineTable,
			fileName=DINfile) if DINcalc annotation(Placement(transformation(extent={{-10,-10},{10,10}})));
		Modelica.Blocks.Tables.CombiTable1D PelDIN(
			tableOnFile=DINcalc,
			table=[0,0],
			tableName=PelDINTable,
			fileName=PelDINFile) if DINcalc annotation(Placement(transformation(extent={{-10,-10},{10,10}})));
		Modelica.Blocks.Tables.CombiTable1D NumberPersonDIN(
			tableOnFile=DINcalc,
			table=[0,0],
			tableName=NumberPersonDINTable,
			fileName=NumberPersonDINFile) if DINcalc annotation(Placement(transformation(extent={{-10,-10},{10,10}})));
		Modelica.Blocks.Tables.CombiTable1D NumberPerson(
			tableOnFile=not DINcalc,
			table=[0,0],
			tableName=NumberPersonTable,
			fileName=InputDataFile) if not DINcalc annotation(Placement(transformation(extent={{-10,-10},{10,10}})));
		Modelica.Blocks.Tables.CombiTable1D ElectricalPower(
			tableOnFile=not DINcalc,
			table=[0,0],
			tableName=PelTable,
			fileName=InputDataFile) if not DINcalc annotation(Placement(transformation(extent={{-10,-10},{10,10}})));
		Modelica.Blocks.Tables.CombiTable1D ReactivePower(
			tableOnFile=not DINcalc,
			table=[0,0],
			tableName=QelTable,
			fileName=InputDataFile) if not DINcalc annotation(Placement(transformation(extent={{-10,-10},{10,10}})));
		Modelica.Blocks.Tables.CombiTable1D BaseLoad(
			tableOnFile=not DINcalc,
			table=[0,0],
			tableName=BaseLoadTable,
			fileName=InputDataFile) if not DINcalc annotation(Placement(transformation(extent={{-10,-10},{10,10}})));
		Modelica.Blocks.Tables.CombiTable1D NormLoad(
			tableOnFile=not DINcalc,
			table=[0,0],
			tableName=NormLoadTable,
			fileName=InputDataFile) if not DINcalc annotation(Placement(transformation(extent={{-10,-10},{10,10}})));
		Modelica.Blocks.Tables.CombiTable1D MachineLoad(
			tableOnFile=not DINcalc,
			table=[0,0],
			tableName=MachineLoadTable,
			fileName=InputDataFile) if not DINcalc annotation(Placement(transformation(extent={{-10,-10},{10,10}})));
		Modelica.Blocks.Tables.CombiTable1D LightLoad(
			tableOnFile=not DINcalc,
			table=[0,0],
			tableName=LightLoadTable,
			fileName=InputDataFile) if not DINcalc annotation(Placement(transformation(extent={{-10,-10},{10,10}})));
		Modelica.Blocks.Tables.CombiTable1D InnerLoad(
			tableOnFile=not DINcalc,
			table=[0,0],
			tableName=InnerLoadTable,
			fileName=InputDataFile) if not DINcalc annotation(Placement(transformation(extent={{-10,-10},{10,10}})));
		GreenCity.Interfaces.Electrical.DefineCurrentAC3 GridConnection(VoltageType=VoltageType) annotation(Placement(transformation(
			origin={480,-634},
			extent={{10,-10},{-10,10}},
			rotation=90)));
	protected
		Real TZoneAct(
			quantity="Thermics.Temp",
			displayUnit="°C") "Zone temperature" annotation(Dialog(
			group="Temperature",
			tab="Results 1"));
		Real deltaTBound[Bound](
			quantity="Thermics.TempDiff",
			displayUnit="K") "Temperature difference between inner and outer part of boundary" annotation(Dialog(
			group="Temperature",
			tab="Results 1"));
		Real TBoundIn[Bound](
			start=(zeros(Bound))'°C',
			each fixed=true,
			quantity="Thermics.Temp",
			displayUnit="°C") "Inner part temperature of Boundary" annotation(Dialog(
			group="Temperature",
			tab="Results 1"));
		Real TBoundOut[Bound](
			start=(zeros(Bound))'°C',
			each fixed=true,
			quantity="Thermics.Temp",
			displayUnit="°C") "Outer part temperature of Boundary" annotation(Dialog(
			group="Temperature",
			tab="Results 1"));
		Real TAmbientBound[Bound](
			quantity="Thermics.Temp",
			displayUnit="°C") "Input vector for ambient temperatures for each boudary" annotation(Dialog(
			group="Temperature",
			tab="Results 1"));
		Real TGround[Bound](
			quantity="Thermics.Temp",
			displayUnit="°C") "Ground temperature" annotation(Dialog(
			group="Temperature",
			tab="Results 1"));
		model Boundary "Properties of a boundary V1.0"
			Real ABound(
				quantity="Geometry.Area",
				displayUnit="m²") "Surface area";
			Real AWindow(
				quantity="Geometry.Area",
				displayUnit="m²") "Window surface area";
			Real AOthers(
				quantity="Geometry.Area",
				displayUnit="m²") "Other surfaces (e.g. doors)";
			Real rhoBound(
				quantity="Thermodynamics.Density",
				displayUnit="kg/m³") "Density of boundary";
			Real cpBound(
				quantity="Thermodynamics.SpecHeatCapacity",
				displayUnit="kJ/(kg·K)") "Specific heat capacity of boundary";
			Real dBound(
				quantity="Geometry.Length",
				displayUnit="m") "Thickness of boundary";
			Real gWindow "Total energy translucency of window";
			Real uBound(
				quantity="Thermics.HeatTransmCoeff",
				displayUnit="W/(m²·K)") "Heat transmission value of boundary";
			Real uWindow(
				quantity="Thermics.HeatTransmCoeff",
				displayUnit="W/(m²·K)") "Heat transmission value of window";
			Real uOthers(
				quantity="Thermics.HeatTransmCoeff",
				displayUnit="W/(m²·K)") "Heat transmission value of other surfaces";
			Real epsDirt "Dirt corrction value for window";
			Real epsShading "Shading correction value for window";
			Real epsFrame "Frame correction value for window";
			Real NormalVector[3] "Normal vector of boundary";
			Real alphaInc "Inclination angle of boundary";
			Real alphaOr "Orientation angle of boundary";
			Real alphaBound "Absorption coefficient of boundary";
			Real alphaBoundOut(
				quantity="Thermics.HeatTransmCoeff",
				displayUnit="W/(m²·K)") "Outer heat transmission coefficient of boundary";
			Real alphaBoundIn(
				quantity="Thermics.HeatTransmCoeff",
				displayUnit="W/(m²·K)") "Inner heat transmission coefficient of boundary";
			Real depthBound(
				quantity="Geometry.Length",
				displayUnit="m") "Depth of boundary, if it is ground connected";
			Integer contactBound "Boundary is connected to: '0' - ambience, 1,2,3 ... - Zone 1,2,3";
			Real TBoundIn(
				quantity="Thermics.Temp",
				displayUnit="°C") "Average inner boundary temperature";
			Real TBoundOut(
				quantity="Thermics.Temp",
				displayUnit="°C") "Average outer boundary temperature";
			Real TGround(
				quantity="Thermics.Temp",
				displayUnit="°C") "Ground temperature, if boundary is ground connected";
			Real lambdaBound(
				quantity="Thermics.SpecHeatCond",
				displayUnit="W/(m·K)") "Heat conductance of boundary";
			Boolean groundContact "Boundary ground contact enabled/disabled";
			annotation(Icon(coordinateSystem(extent={{-100,50},{100,-50}})));
		end Boundary;
		model InnerMass "Properties of an inner Mass V1.0"
			Real V(
				quantity="Geometry.Volume",
				displayUnit="m³") "Inner additional volumes (e.g. inner walls)";
			Real rho(
				quantity="Thermics.Density",
				displayUnit="kg/m³") "Density";
			Real cp(
				quantity="Thermics.SpecHeatCapacity",
				displayUnit="kJ/(kg·K)") "Specific heat capacity";
			annotation(Icon(coordinateSystem(extent={{-100,50},{100,-50}})));
		end InnerMass;
		type VoltageEnum = enumeration( 
			LV "Low-Voltage", 
			MV "Medium-Voltage", 
			HV "High-Voltage") "Voltage-Level Enumeration" annotation(initValue=LV);
	public
		output Modelica.Blocks.Interfaces.RealOutput TZone(
			quantity="Thermics.Temp",
			displayUnit="°C") "Zone temperature" annotation(
			Placement(
				transformation(
					origin={400,-665},
					extent={{-10,-10},{10,10}},
					rotation=-90),
				iconTransformation(
					origin={-150,-200},
					extent={{-10,-10},{10,10}},
					rotation=-90)),
			Dialog(
				group="Temperature",
				tab="Results 1",
				visible=false));
	protected
		Real QHeatCoolLoad(
			quantity="Basics.Power",
			displayUnit="kW") "Heating/cooling load of building" annotation(Dialog(
			group="Heating and Cooling Power",
			tab="Results 1"));
	public
		Real QHeat(
			quantity="Basics.Power",
			displayUnit="kW") "Heat power" annotation(Dialog(
			group="Heating and Cooling Power",
			tab="Results 1",
			visible=false));
	protected
		Real QTotal(
			quantity="Basics.Power",
			displayUnit="kW") "Total heating/cooling load" annotation(Dialog(
			group="Heating and Cooling Power",
			tab="Results 1"));
	public
		input Modelica.Blocks.Interfaces.RealInput QHeatCool(
			quantity="Basics.Power",
			displayUnit="kW") if not LoadCalculation "Heating and cooling power feeded to building zone" annotation(
			Placement(
				transformation(extent={{645,-225},{605,-185}}),
				iconTransformation(
					origin={-350,0},
					extent={{20,-20},{-20,20}},
					rotation=180)),
			Dialog(
				group="Heating and Cooling Power",
				tab="Results 1",
				visible=false));
		output Modelica.Blocks.Interfaces.RealOutput HeatCoolLoad(
			quantity="Basics.Power",
			displayUnit="kW") if LoadCalculation "Control output for resulting heating and cooling load when Heating-Cooling-Load-Calculation is used" annotation(
			Placement(
				transformation(
					origin={345,-665},
					extent={{-10,-10},{10,10}},
					rotation=-90),
				iconTransformation(
					origin={0,-200},
					extent={{-10,-10},{10,10}},
					rotation=-90)),
			Dialog(
				group="Heating and Cooling Power",
				tab="Results 1",
				visible=false));
	protected
		Real AngleBound[Bound](
			quantity="Geometry.Angle",
			displayUnit="°") "Radiation angle to Boundary" annotation(Dialog(
			group="Others",
			tab="Results 1"));
		Real CZoneAir(
			quantity="Thermics.SpecHeatCapacity",
			displayUnit="kJ/(kg·K)") "Air heat capacity of the zone" annotation(Dialog(
			group="Others",
			tab="Results 1"));
		Real CZoneMass(
			quantity="Thermics.SpecHeatCapacity",
			displayUnit="kJ/(kg·K)") "Mass heat capacity of the zone" annotation(Dialog(
			group="Others",
			tab="Results 1"));
	public
		input Modelica.Blocks.Interfaces.RealInput WindowShading[Bound] if useWindowShading "Vector for external shading of windows for each boundary (0: fully irradiated, 1: fully shaded)" annotation(
			Placement(
				transformation(extent={{640,-580},{600,-540}}),
				iconTransformation(extent={{370,-20},{330,20}})),
			Dialog(
				group="Others",
				tab="Results 1",
				visible=false));
		Real PVent(
			quantity="Basics.Power",
			displayUnit="kW") "Effective ventilation power" annotation(Dialog(
			group="Electrical Power",
			tab="Results 1",
			visible=false));
	protected
		Real QVent(
			quantity="Basics.Power",
			displayUnit="kW") "Reactive ventilation power" annotation(Dialog(
			group="Electrical Power",
			tab="Results 1"));
	public
		Real Pel(
			quantity="Basics.Power",
			displayUnit="kW") "Electrical effective power of the zone" annotation(Dialog(
			group="Electrical Power",
			tab="Results 1",
			visible=false));
	protected
		Real Qel(
			quantity="Basics.Power",
			displayUnit="kW") "Electrical reactive power of the zone" annotation(Dialog(
			group="Electrical Power",
			tab="Results 1"));
	public
		Real EHeat(
			quantity="Basics.Energy",
			displayUnit="kWh") "Energy, used for heating the zone during simulation time period" annotation(Dialog(
			group="Energy",
			tab="Results 1",
			visible=false));
		Real Eel(
			quantity="Basics.Energy",
			displayUnit="kWh") "Electrical energy demand of the zone during simulation time period" annotation(Dialog(
			group="Energy",
			tab="Results 1",
			visible=false));
	protected
		Real QPerson(
			quantity="Basics.Power",
			displayUnit="kW") "Inner heat yields and losses by persons" annotation(Dialog(
			group="Inner yields and losses - Heating and Cooling",
			tab="Results 2"));
		Real QLight(
			quantity="Basics.Power",
			displayUnit="kW") "Inner heat yields by installed light system" annotation(Dialog(
			group="Inner yields and losses - Heating and Cooling",
			tab="Results 2"));
		Real QMachine(
			quantity="Basics.Power",
			displayUnit="kW") "Inner heat yields by installed machines" annotation(Dialog(
			group="Inner yields and losses - Heating and Cooling",
			tab="Results 2"));
		Real QNorm(
			quantity="Basics.Power",
			displayUnit="kW") "Norm heat yields/losses" annotation(Dialog(
			group="Inner yields and losses - Heating and Cooling",
			tab="Results 2"));
		Real QInner(
			quantity="Basics.Power",
			displayUnit="kW") "Inner heat yields/losses" annotation(Dialog(
			group="Inner yields and losses - Heating and Cooling",
			tab="Results 2"));
		Real QBase(
			quantity="Basics.Power",
			displayUnit="kW") "Basic heat yields/losses" annotation(Dialog(
			group="Inner yields and losses - Heating and Cooling",
			tab="Results 2"));
		Real QelHeat(
			quantity="Basics.Power",
			displayUnit="kW") "Electrical power" annotation(Dialog(
			group="Inner yields and losses - Heating and Cooling",
			tab="Results 2"));
		Real QTransWindowAbsorp[Bound](
			quantity="Basics.Power",
			displayUnit="kW") "Window transmission losses correction vector for solar yields" annotation(Dialog(
			group="Window - Heating and Cooling",
			tab="Results 2"));
		Real QTransWindow[Bound](
			quantity="Basics.Power",
			displayUnit="kW") "Transmission losses vector for window" annotation(Dialog(
			group="Window - Heating and Cooling",
			tab="Results 2"));
		Real QTransOthers[Bound](
			quantity="Basics.Power",
			displayUnit="kW") "Transmission losses vector for other surfaces" annotation(Dialog(
			group="Walls and other boundaries - Heating and Cooling",
			tab="Results 2"));
		Real QBound[Bound](
			quantity="Basics.Power",
			displayUnit="kW") "Heat power of boundary" annotation(Dialog(
			group="Walls and other boundaries - Heating and Cooling",
			tab="Results 2"));
		Real QBoundAbsorp[Bound](
			quantity="Basics.Power",
			displayUnit="kW") "Transmission losses correction vector for boundaries due to radiation absorption" annotation(Dialog(
			group="Walls and other boundaries - Heating and Cooling",
			tab="Results 2"));
		Real QBoundIn[Bound](
			quantity="Basics.Power",
			displayUnit="kW") "Inner heat losses/gains due to boundary" annotation(Dialog(
			group="Walls and other boundaries - Heating and Cooling",
			tab="Results 2"));
		Real QBoundOut[Bound](
			quantity="Basics.Power",
			displayUnit="kW") "Outer heat losses/gains due to boundary" annotation(Dialog(
			group="Walls and other boundaries - Heating and Cooling",
			tab="Results 2"));
		Real QBoundChange[Bound](
			quantity="Basics.Power",
			displayUnit="kW") "Interchanged heat between outer and inner parts of boundaries" annotation(Dialog(
			group="Walls and other boundaries - Heating and Cooling",
			tab="Results 2"));
		Real QAirLeak(
			quantity="Basics.Power",
			displayUnit="kW") "Ventilation losses by air leak" annotation(Dialog(
			group="Ventilation - Heating and Cooling",
			tab="Results 2"));
		Real QAirComfort(
			quantity="Basics.Power",
			displayUnit="kW") "Ventilation losses by comfortable air flow" annotation(Dialog(
			group="Ventilation - Heating and Cooling",
			tab="Results 2"));
		Real QHeatBridge[Bound](
			quantity="Basics.Power",
			displayUnit="kW") "Transmission losses vector for heat bridge losses" annotation(Dialog(
			group="Heat Bridge - Heating and Cooling",
			tab="Results 2"));
		Real QHeatBridgeAbsorp[Bound](
			quantity="Basics.Power",
			displayUnit="kW") "Transmission losses correction vector for heat bridges due to radiation absorption" annotation(Dialog(
			group="Heat Bridge - Heating and Cooling",
			tab="Results 2"));
		parameter Boolean Ground1=if Bound>0 then (if not contactBound1>0 then groundContact1 else false) else false "Auxiliary parameter for parameter dialogue initialization ('depthBound1')" annotation(Dialog(
			group="Ground Definitions",
			tab="Model Initialization"));
		parameter Boolean Ground2=if Bound>1 then (if not contactBound2>0 then groundContact2 else false) else false "Auxiliary parameter for parameter dialogue initialization ('depthBound1')" annotation(Dialog(
			group="Ground Definitions",
			tab="Model Initialization"));
		parameter Boolean Ground3=if Bound>2 then (if not contactBound3>0 then groundContact3 else false) else false "Auxiliary parameter for parameter dialogue initialization ('depthBound1')" annotation(Dialog(
			group="Ground Definitions",
			tab="Model Initialization"));
		parameter Boolean Ground4=if Bound>3 then (if not contactBound4>0 then groundContact4 else false) else false "Auxiliary parameter for parameter dialogue initialization ('depthBound1')" annotation(Dialog(
			group="Ground Definitions",
			tab="Model Initialization"));
		parameter Boolean Ground5=if Bound>4 then (if not contactBound5>0 then groundContact5 else false) else false "Auxiliary parameter for parameter dialogue initialization ('depthBound1')" annotation(Dialog(
			group="Ground Definitions",
			tab="Model Initialization"));
		parameter Boolean Ground6=if Bound>5 then (if not contactBound6>0 then groundContact6 else false) else false "Auxiliary parameter for parameter dialogue initialization ('depthBound1')" annotation(Dialog(
			group="Ground Definitions",
			tab="Model Initialization"));
		parameter Boolean Ground7=if Bound>6 then (if not contactBound7>0 then groundContact7 else false) else false "Auxiliary parameter for parameter dialogue initialization ('depthBound1')" annotation(Dialog(
			group="Ground Definitions",
			tab="Model Initialization"));
		parameter Boolean Ground8=if Bound>7 then (if not contactBound8>0 then groundContact8 else false) else false "Auxiliary parameter for parameter dialogue initialization ('depthBound1')" annotation(Dialog(
			group="Ground Definitions",
			tab="Model Initialization"));
		parameter Boolean Ground9=if Bound>8 then (if not contactBound9>0 then groundContact9 else false) else false "Auxiliary parameter for parameter dialogue initialization ('depthBound1')" annotation(Dialog(
			group="Ground Definitions",
			tab="Model Initialization"));
	public
		parameter Integer ZoneIndex=1 "Zone Index" annotation(Dialog(
			group="Zones",
			tab="Model Initialization"));
		parameter Integer NumberZones=1 "Number of Zones" annotation(Dialog(
			group="Zones",
			tab="Model Initialization"));
	protected
		parameter Integer MaxNumberZones=15 "Maximum number of zones" annotation(Dialog(
			group="Zones",
			tab="Model Initialization"));
	public
		parameter Integer Bound=6 "Number of Boundaries" annotation(Dialog(
			group="Boundaries",
			tab="Model Initialization"));
	protected
		parameter Integer BoundMax=9 "Maximum number of Bounderies" annotation(Dialog(
			group="Boundaries",
			tab="Model Initialization"));
		parameter Integer BoundMin=1 "Minimum number of Boundaries" annotation(Dialog(
			group="Boundaries",
			tab="Model Initialization"));
	public
		parameter Integer Mass=1 "Number of inner Masses" annotation(Dialog(
			group="Inner Masses",
			tab="Model Initialization"));
	protected
		parameter Integer MassMax=4 "Maximum number of inner Masses" annotation(Dialog(
			group="Inner Masses",
			tab="Model Initialization"));
		parameter Integer MassMin=0 "Minimum number of inner Masses" annotation(Dialog(
			group="Inner Masses",
			tab="Model Initialization"));
	public
		parameter Real TZoneInit(
			quantity="Thermics.Temp",
			displayUnit="°C")=294.14999999999998 if not LoadCalculation "Initial zone temperature" annotation(Dialog(
			group="Temperatures",
			tab="Model Initialization"));
		parameter Boolean LoadCalculation=false "If enabled, only cooling and heating load calculation" annotation(Dialog(
			group="Calculation Mode",
			tab="Model Initialization"));
		parameter Boolean useDayTime=true "If enabled, database = HourOfDay, else database = HourOfYear" annotation(Dialog(
			group="Database",
			tab="Model Initialization"));
		parameter Boolean useWindowShading=false "External shading of windows, separately for each boundary is enabled" annotation(Dialog(
			group="Shading",
			tab="Model Initialization"));
		parameter Real AZone(
			quantity="Geometry.Area",
			displayUnit="m²")=100 "Net floor space of the zone" annotation(Dialog(
			group="Zone Dimensions",
			tab="Zone"));
		parameter Real hZone(
			quantity="Geometry.Length",
			displayUnit="m")=2.5 "Height of zone" annotation(Dialog(
			group="Zone Dimensions",
			tab="Zone"));
		parameter Real PLightInstall(
			quantity="Basics.Power",
			displayUnit="W")=300 if DINcalc "Installed electrical power of light" annotation(Dialog(
			group="Installed Electric Devices",
			tab="Zone"));
		parameter Real PMachineInstall(
			quantity="Basics.Power",
			displayUnit="W")=1000 if DINcalc "Installed electrical power of machines" annotation(Dialog(
			group="Installed Electric Devices",
			tab="Zone"));
		parameter Real etaMachine(
			quantity="Basics.RelMagnitude",
			displayUnit="%")=0.4 if DINcalc "Efficiency factor of machines" annotation(Dialog(
			group="Installed Electric Devices",
			tab="Zone"));
	protected
		parameter VoltageEnum VoltageType=VoltageEnum.LV "Voltage-Level" annotation(Dialog(
			group="Voltage-Level",
			tab="Zone"));
	public
		parameter Boolean DINcalc=false "DIN calculations enabled/disabled" annotation(Dialog(
			group="DIN Calculations Enabling",
			tab="Heat and Cool Load Factors I"));
		parameter String CoolFactorTable="Si" if DINcalc "Table name for DIN cool load factors" annotation(Dialog(
			group="DIN Data",
			tab="Heat and Cool Load Factors I"));
		parameter String LoadLightTable="m_light" if DINcalc "Table name for DIN load factors for light" annotation(Dialog(
			group="DIN Data",
			tab="Heat and Cool Load Factors I"));
		parameter String LoadMachineTable="m_machine" if DINcalc "Table name for DIN load factors for machines" annotation(Dialog(
			group="DIN Data",
			tab="Heat and Cool Load Factors I"));
		parameter String DINfile=GreenCity.Utilities.Functions.getModelDataDirectory()+"\\building\\DIN_factors\\DIN_factors.txt" if DINcalc "File name for DIN cool and load factors" annotation(Dialog(
			group="DIN Data",
			tab="Heat and Cool Load Factors I"));
		parameter String NumberPersonDINFile=GreenCity.Utilities.Functions.getModelDataDirectory()+"\\building\\DIN_factors\\DIN_persons.txt" if DINcalc "File name for number of persons while DIN calculations" annotation(Dialog(
			group="DIN Data",
			tab="Heat and Cool Load Factors I"));
		parameter String NumberPersonDINTable="person" if DINcalc "Table name for number of persons while DIN calculations" annotation(Dialog(
			group="DIN Data",
			tab="Heat and Cool Load Factors I"));
		parameter String PelDINFile=GreenCity.Utilities.Functions.getModelDataDirectory()+"\\building\\DIN_factors\\DIN_electrical.txt" if DINcalc "File name for electrical power while DIN calculations" annotation(Dialog(
			group="DIN Data",
			tab="Heat and Cool Load Factors I"));
		parameter String PelDINTable="pel" if DINcalc "Table name for electrical power while DIN calculations" annotation(Dialog(
			group="DIN Data",
			tab="Heat and Cool Load Factors I"));
		parameter String InputDataFile=GreenCity.Utilities.Functions.getSimulationDataDirectory()+"\\building\\inner_loads\\zone_x.txt" if not DINcalc "File name for inner loads" annotation(Dialog(
			group="Input Data",
			tab="Heat and Cool Load Factors II"));
		parameter String NumberPersonTable="person" if not DINcalc "Table name for inner loads due to body heat of that number of person" annotation(Dialog(
			group="Input Data",
			tab="Heat and Cool Load Factors II"));
		parameter String BaseLoadTable="baseLoad" if not DINcalc "Table name for inner loads due to basic loads" annotation(Dialog(
			group="Input Data",
			tab="Heat and Cool Load Factors II"));
		parameter String NormLoadTable="normLoad" if not DINcalc "Table name for inner loads due to normal loads" annotation(Dialog(
			group="Input Data",
			tab="Heat and Cool Load Factors II"));
		parameter String MachineLoadTable="machineLoad" if not DINcalc "Table name for inner loads due to machines" annotation(Dialog(
			group="Input Data",
			tab="Heat and Cool Load Factors II"));
		parameter String LightLoadTable="lightLoad" if not DINcalc "Table name for inner loads due to light" annotation(Dialog(
			group="Input Data",
			tab="Heat and Cool Load Factors II"));
		parameter String InnerLoadTable="innerLoad" if not DINcalc "Table name for inner loads due to other loads" annotation(Dialog(
			group="Input Data",
			tab="Heat and Cool Load Factors II"));
		parameter String PelTable="pel" if not DINcalc "Table name for further electrical power characteristics" annotation(Dialog(
			group="Input Data",
			tab="Heat and Cool Load Factors II"));
		parameter String QelTable="qel" if not DINcalc "Table name for further electrical power characteristics" annotation(Dialog(
			group="Input Data",
			tab="Heat and Cool Load Factors II"));
		parameter Real QBody(
			quantity="Basics.Power",
			displayUnit="W")=80 "Body heat dissipation per person" annotation(Dialog(
			group="Inner Yields",
			tab="Heat Yields and Losses"));
		parameter Real QPersonColdWater(
			quantity="Basics.Power",
			displayUnit="W")=-30 "Individual heat losses by cold water usage per person" annotation(Dialog(
			group="Inner Yields",
			tab="Heat Yields and Losses"));
		parameter Real QPersonElectricity(
			quantity="Basics.Power",
			displayUnit="W")=60 "Heat dissipation by usage of electrical devices per person" annotation(Dialog(
			group="Inner Yields",
			tab="Heat Yields and Losses"));
		parameter Real LAirLeak(
			quantity="Basics.Gradient",
			displayUnit="1/h")=0.00013888888888888889 "Air leak of zone" annotation(Dialog(
			group="Ventilations Losses",
			tab="Heat Yields and Losses"));
		Modelica.Blocks.Interfaces.RealInput LComfortVentilation(
			quantity="Thermics.VolumeFlow",
			displayUnit="m³/h") "Air volume flow of ventilation due to comfort" annotation(
			Placement(
				transformation(extent={{-120,30},{-80,70}}),
				iconTransformation(extent={{-370,130},{-330,170}})),
			Dialog(
				group="Ventilations Losses",
				tab="Heat Yields and Losses",
				visible=false));
		parameter Boolean useVentilationSystem=false "If enabled, ventilation losses and gains are modified by VentilationHeatExchangeRate" annotation(Dialog(
			group="Ventilation System",
			tab="Heat Yields and Losses"));
		parameter Real VentilationHeatExchangeRate(
			quantity="Basics.RelMagnitude",
			displayUnit="%")=0.7 if useVentilationSystem "Heat exchange correction factor (heating and cooling) for ventilation losses by using ventilation systems" annotation(Dialog(
			group="Ventilation System",
			tab="Heat Yields and Losses"));
		parameter Real VentPower(
			quantity="Basics.Power",
			displayUnit="W")=1500 if useVentilationSystem "Electrical power of ventilation system [W/(m3/s)]" annotation(Dialog(
			group="Ventilation System",
			tab="Heat Yields and Losses"));
		parameter Real cosPhiVent=0.7 if useVentilationSystem "Power factor of ventilation system" annotation(Dialog(
			group="Ventilation System",
			tab="Heat Yields and Losses"));
		parameter Real uHeatBridge(
			quantity="Thermics.HeatTransmCoeff",
			displayUnit="W/(m²·K)")=0.05 "Equlivalent additional heat transmission value for heat bridges" annotation(Dialog(
			group="Heat Bridge Losses",
			tab="Heat Yields and Losses"));
		parameter Real VMass1(
			quantity="Geometry.Volume",
			displayUnit="m³")=6 if Mass>0 "Volume of inner Mass 1" annotation(Dialog(
			group="Inner Mass 1",
			tab="Inner Masses Dimensions I"));
		parameter Real cpMass1(
			quantity="Thermics.SpecHeatCapacity",
			displayUnit="kJ/(kg·K)")=920 if Mass>0 "Specific heat capacity of inner Mass 1" annotation(Dialog(
			group="Inner Mass 1",
			tab="Inner Masses Dimensions I"));
		parameter Real rhoMass1(
			quantity="Thermics.Density",
			displayUnit="kg/m³")=1800 if Mass>0 "Density of inner Mass 1" annotation(Dialog(
			group="Inner Mass 1",
			tab="Inner Masses Dimensions I"));
		parameter Real VMass2(
			quantity="Geometry.Volume",
			displayUnit="m³")=6 if Mass>1 "Volume of inner Mass 2" annotation(Dialog(
			group="Inner Mass 2",
			tab="Inner Masses Dimensions I"));
		parameter Real cpMass2(
			quantity="Thermics.SpecHeatCapacity",
			displayUnit="kJ/(kg·K)")=920 if Mass>1 "Specific heat capacity of inner Mass 2" annotation(Dialog(
			group="Inner Mass 2",
			tab="Inner Masses Dimensions I"));
		parameter Real rhoMass2(
			quantity="Thermics.Density",
			displayUnit="kg/m³")=1800 if Mass>1 "Density of inner Mass 2" annotation(Dialog(
			group="Inner Mass 2",
			tab="Inner Masses Dimensions I"));
		parameter Real VMass3(
			quantity="Geometry.Volume",
			displayUnit="m³")=6 if Mass>2 "Volume of inner Mass 3" annotation(Dialog(
			group="Inner Mass 3",
			tab="Inner Masses Dimensions II"));
		parameter Real cpMass3(
			quantity="Thermics.SpecHeatCapacity",
			displayUnit="kJ/(kg·K)")=920 if Mass>2 "Specific heat capacity of inner Mass 3" annotation(Dialog(
			group="Inner Mass 3",
			tab="Inner Masses Dimensions II"));
		parameter Real rhoMass3(
			quantity="Thermics.Density",
			displayUnit="kg/m³")=1800 if Mass>2 "Density of inner Mass 3" annotation(Dialog(
			group="Inner Mass 3",
			tab="Inner Masses Dimensions II"));
		parameter Real VMass4(
			quantity="Geometry.Volume",
			displayUnit="m³")=6 if Mass>3 "Volume of inner Mass 4" annotation(Dialog(
			group="Inner Mass 4",
			tab="Inner Masses Dimensions II"));
		parameter Real cpMass4(
			quantity="Thermics.SpecHeatCapacity",
			displayUnit="kJ/(kg·K)")=920 if Mass>3 "Specific heat capacity of inner Mass 4" annotation(Dialog(
			group="Inner Mass 4",
			tab="Inner Masses Dimensions II"));
		parameter Real rhoMass4(
			quantity="Thermics.Density",
			displayUnit="kg/m³")=1800 if Mass>3 "Density of inner Mass 4" annotation(Dialog(
			group="Inner Mass 4",
			tab="Inner Masses Dimensions II"));
		parameter Integer contactBound1=0 "Boundary 1 is connected to: '0'-Ambience, '1,2,3 ...-Zone 1,2,3 ..." annotation(Dialog(
			group="Ambience",
			tab="Boundary 1 - I"));
		parameter Real ABound1(
			quantity="Geometry.Area",
			displayUnit="m²")=30 "Surface area of boundary 1" annotation(Dialog(
			group="Dimensions",
			tab="Boundary 1 - I"));
		parameter Real AWindow1(
			quantity="Geometry.Area",
			displayUnit="m²")=5 "Window surface area of boundary 1" annotation(Dialog(
			group="Dimensions",
			tab="Boundary 1 - I"));
		parameter Real AOthers1(
			quantity="Geometry.Area",
			displayUnit="m²")=0 "Other surfaces of boundary 1" annotation(Dialog(
			group="Dimensions",
			tab="Boundary 1 - I"));
		parameter Real dBound1(
			quantity="Geometry.Length",
			displayUnit="m")=0.36 "Thickness of boundary 1" annotation(Dialog(
			group="Dimensions",
			tab="Boundary 1 - I"));
		parameter Real rhoBound1(
			quantity="Thermics.Density",
			displayUnit="kg/m³")=1800 "Density of boundary 1" annotation(Dialog(
			group="Material",
			tab="Boundary 1 - I"));
		parameter Real cpBound1(
			quantity="Thermics.SpecHeatCapacity",
			displayUnit="kJ/(kg·K)")=920 "Specific heat capacity of boundary 1" annotation(Dialog(
			group="Material",
			tab="Boundary 1 - I"));
		parameter Real uBound1(
			quantity="Thermics.HeatTransmCoeff",
			displayUnit="W/(m²·K)")=0.2 "Heat transmission value of boundary 1" annotation(Dialog(
			group="Heat Transmission",
			tab="Boundary 1 - I"));
		parameter Real uWindow1(
			quantity="Thermics.HeatTransmCoeff",
			displayUnit="W/(m²·K)")=1 "Heat transmission value of window in boundary 1" annotation(Dialog(
			group="Heat Transmission",
			tab="Boundary 1 - I"));
		parameter Real uOthers1(
			quantity="Thermics.HeatTransmCoeff",
			displayUnit="W/(m²·K)")=0 "Heat transmission value of other surfaces in boundary 1" annotation(Dialog(
			group="Heat Transmission",
			tab="Boundary 1 - I"));
		parameter Boolean groundContact1=false if not contactBound1>0 "Boundary 1 has contact to ground" annotation(Dialog(
			group="Ground Position",
			tab="Boundary 1 - II"));
		parameter Real depthBound1(
			quantity="Geometry.Length",
			displayUnit="m")=1 if Ground1 "Depth of boundary 1, if it is ground contacted" annotation(Dialog(
			group="Ground Position",
			tab="Boundary 1 - II"));
		parameter Real epsDirt1=0.1 "Dirt correction value for window in boundary 1 (0: fully irradiated, 1: fully shaded)" annotation(Dialog(
			group="Correction Values",
			tab="Boundary 1 - II"));
		parameter Real epsShading1=0.2 "Shading correction value for boundary 1 (0: fully irradiated, 1: fully shaded)" annotation(Dialog(
			group="Correction Values",
			tab="Boundary 1 - II"));
		parameter Real epsFrame1=0.2 "Frame correction value for window in boundary 1 (0: fully irradiated, 1: fully shaded)" annotation(Dialog(
			group="Correction Values",
			tab="Boundary 1 - II"));
		parameter Real alphaInclination1(
			quantity="Geometry.Angle",
			displayUnit="°")=1.5707963267948966 "Inclination angle of boundary 1" annotation(Dialog(
			group="Alignment",
			tab="Boundary 1 - II"));
		parameter Real alphaOrientation1(
			quantity="Geometry.Angle",
			displayUnit="°")=0 "Orientation angle of boundary 1" annotation(Dialog(
			group="Alignment",
			tab="Boundary 1 - II"));
		parameter Real gWindow1=0.6 "Total translucency of window in boundary 1" annotation(Dialog(
			group="Heat Absorption",
			tab="Boundary 1 - II"));
		parameter Real alphaBound1=0.2 "Absorption coefficient of boundary 1" annotation(Dialog(
			group="Heat Absorption",
			tab="Boundary 1 - II"));
		parameter Real alphaBoundOut1(
			quantity="Thermics.HeatTransmCoeff",
			displayUnit="W/(m²·K)")=20 if not Ground1 "Outer heat transmission coefficient of boundary 1" annotation(Dialog(
			group="Heat Absorption",
			tab="Boundary 1 - II"));
		parameter Real alphaBoundIn1(
			quantity="Thermics.HeatTransmCoeff",
			displayUnit="W/(m²·K)")=7.5 "Inner heat transmission coefficient of boundary 1" annotation(Dialog(
			group="Heat Absorption",
			tab="Boundary 1 - II"));
		parameter Integer contactBound2=0 if Bound>1 "Boundary 2 is connected to: '0'-Ambience, '1,2,3 ...-Zone 1,2,3 ..." annotation(Dialog(
			group="Ambience",
			tab="Boundary 2 - I"));
		parameter Real ABound2(
			quantity="Geometry.Area",
			displayUnit="m²")=30 if Bound>1 "Surface area of boundary 2" annotation(Dialog(
			group="Dimensions",
			tab="Boundary 2 - I"));
		parameter Real AWindow2(
			quantity="Geometry.Area",
			displayUnit="m²")=5 if Bound>1 "Window surface area of boundary 2" annotation(Dialog(
			group="Dimensions",
			tab="Boundary 2 - I"));
		parameter Real AOthers2(
			quantity="Geometry.Area",
			displayUnit="m²")=0 if Bound>1 "Other surfaces of boundary 2" annotation(Dialog(
			group="Dimensions",
			tab="Boundary 2 - I"));
		parameter Real dBound2(
			quantity="Geometry.Length",
			displayUnit="m")=0.36 if Bound>1 "Thickness of boundary 2" annotation(Dialog(
			group="Dimensions",
			tab="Boundary 2 - I"));
		parameter Real rhoBound2(
			quantity="Thermics.Density",
			displayUnit="kg/m³")=1800 if Bound>1 "Density of boundary 2" annotation(Dialog(
			group="Material",
			tab="Boundary 2 - I"));
		parameter Real cpBound2(
			quantity="Thermics.SpecHeatCapacity",
			displayUnit="kJ/(kg·K)")=920 if Bound>1 "Specific heat capacity of boundary 2" annotation(Dialog(
			group="Material",
			tab="Boundary 2 - I"));
		parameter Real uBound2(
			quantity="Thermics.HeatTransmCoeff",
			displayUnit="W/(m²·K)")=0.2 if Bound>1 "Heat transmission value of boundary 2" annotation(Dialog(
			group="Heat Transmission",
			tab="Boundary 2 - I"));
		parameter Real uWindow2(
			quantity="Thermics.HeatTransmCoeff",
			displayUnit="W/(m²·K)")=1 if Bound>1 "Heat transmission value of window in boundary 2" annotation(Dialog(
			group="Heat Transmission",
			tab="Boundary 2 - I"));
		parameter Real uOthers2(
			quantity="Thermics.HeatTransmCoeff",
			displayUnit="W/(m²·K)")=0 if Bound>1 "Heat transmission value of other surfaces in boundary 2" annotation(Dialog(
			group="Heat Transmission",
			tab="Boundary 2 - I"));
		parameter Boolean groundContact2=false if Bound>1 and not contactBound2>0 "Boundary 2 has contact to ground" annotation(Dialog(
			group="Ground Position",
			tab="Boundary 2 - II"));
		parameter Real depthBound2(
			quantity="Geometry.Length",
			displayUnit="m")=1 if Bound>1 and Ground2 "Depth of boundary 2, if it is ground contacted" annotation(Dialog(
			group="Ground Position",
			tab="Boundary 2 - II"));
		parameter Real epsDirt2=0.1 if Bound>1 "Dirt correction value for window in boundary 2 (0: fully irradiated, 1: fully shaded)" annotation(Dialog(
			group="Correction Values",
			tab="Boundary 2 - II"));
		parameter Real epsShading2=0.2 if Bound>1 "shading correction value for  Boundary 2 (0: fully irradiated, 1: fully shaded)" annotation(Dialog(
			group="Correction Values",
			tab="Boundary 2 - II"));
		parameter Real epsFrame2=0.2 if Bound>1 "Frame correction value for window in boundary 2 (0: fully irradiated, 1: fully shaded)" annotation(Dialog(
			group="Correction Values",
			tab="Boundary 2 - II"));
		parameter Real alphaInclination2(
			quantity="Geometry.Angle",
			displayUnit="°")=1.5707963267948966 if Bound>1 "Inclination angle of boundary 2" annotation(Dialog(
			group="Alignment",
			tab="Boundary 2 - II"));
		parameter Real alphaOrientation2(
			quantity="Geometry.Angle",
			displayUnit="°")=1.5707963267948966 if Bound>1 "Orientation angle of boundary 2" annotation(Dialog(
			group="Alignment",
			tab="Boundary 2 - II"));
		parameter Real gWindow2=0.6 if Bound>1 "Total translucency of window in boundary 2" annotation(Dialog(
			group="Heat Absorption",
			tab="Boundary 2 - II"));
		parameter Real alphaBound2=0.2 if Bound>1 "Absorption coefficient of boundary 2" annotation(Dialog(
			group="Heat Absorption",
			tab="Boundary 2 - II"));
		parameter Real alphaBoundOut2(
			quantity="Thermics.HeatTransmCoeff",
			displayUnit="W/(m²·K)")=20 if Bound>1 and not Ground2 "Outer heat transmission coefficient of boundary 2" annotation(Dialog(
			group="Heat Absorption",
			tab="Boundary 2 - II"));
		parameter Real alphaBoundIn2(
			quantity="Thermics.HeatTransmCoeff",
			displayUnit="W/(m²·K)")=7.5 if Bound>1 "Inner heat transmission coefficient of boundary 2" annotation(Dialog(
			group="Heat Absorption",
			tab="Boundary 2 - II"));
		parameter Integer contactBound3=0 if Bound>2 "Boundary 3 is connected to: '0'-Ambience, '1,2,3 ...-Zone 1,2,3 ..." annotation(Dialog(
			group="Ambience",
			tab="Boundary 3 - I"));
		parameter Real ABound3(
			quantity="Geometry.Area",
			displayUnit="m²")=30 if Bound>2 "Surface area of boundary 3" annotation(Dialog(
			group="Dimensions",
			tab="Boundary 3 - I"));
		parameter Real AWindow3(
			quantity="Geometry.Area",
			displayUnit="m²")=5 if Bound>2 "Window surface area of boundary 3" annotation(Dialog(
			group="Dimensions",
			tab="Boundary 3 - I"));
		parameter Real AOthers3(
			quantity="Geometry.Area",
			displayUnit="m²")=0 if Bound>2 "Other surfaces of boundary 3" annotation(Dialog(
			group="Dimensions",
			tab="Boundary 3 - I"));
		parameter Real dBound3(
			quantity="Geometry.Length",
			displayUnit="m")=0.36 if Bound>2 "Thickness of boundary 3" annotation(Dialog(
			group="Dimensions",
			tab="Boundary 3 - I"));
		parameter Real rhoBound3(
			quantity="Thermics.Density",
			displayUnit="kg/m³")=1800 if Bound>2 "Density of boundary 3" annotation(Dialog(
			group="Material",
			tab="Boundary 3 - I"));
		parameter Real cpBound3(
			quantity="Thermics.SpecHeatCapacity",
			displayUnit="kJ/(kg·K)")=920 if Bound>2 "Specific heat capacity of boundary 3" annotation(Dialog(
			group="Material",
			tab="Boundary 3 - I"));
		parameter Real uBound3(
			quantity="Thermics.HeatTransmCoeff",
			displayUnit="W/(m²·K)")=0.2 if Bound>2 "Heat transmission value of boundary 3" annotation(Dialog(
			group="Heat Transmission",
			tab="Boundary 3 - I"));
		parameter Real uWindow3(
			quantity="Thermics.HeatTransmCoeff",
			displayUnit="W/(m²·K)")=1 if Bound>2 "Heat transmission value of window in boundary 3" annotation(Dialog(
			group="Heat Transmission",
			tab="Boundary 3 - I"));
		parameter Real uOthers3(
			quantity="Thermics.HeatTransmCoeff",
			displayUnit="W/(m²·K)")=0 if Bound>2 "Heat transmission value of other surfaces in boundary 3" annotation(Dialog(
			group="Heat Transmission",
			tab="Boundary 3 - I"));
		parameter Boolean groundContact3=false if Bound>2 and not contactBound3>0 "Boundary 3 has contact to ground" annotation(Dialog(
			group="Ground Position",
			tab="Boundary 3 - II"));
		parameter Real depthBound3(
			quantity="Geometry.Length",
			displayUnit="m")=1 if Bound>2 and Ground3 "Depth of boundary 3, if it is ground contacted" annotation(Dialog(
			group="Ground Position",
			tab="Boundary 3 - II"));
		parameter Real epsDirt3=0.1 if Bound>2 "Dirt correction value for window in boundary 3 (0: fully irradiated, 1: fully shaded)" annotation(Dialog(
			group="Correction Values",
			tab="Boundary 3 - II"));
		parameter Real epsShading3=0.2 if Bound>2 "Shading correction value for boundary 3 (0: fully irradiated, 1: fully shaded)" annotation(Dialog(
			group="Correction Values",
			tab="Boundary 3 - II"));
		parameter Real epsFrame3=0.2 if Bound>2 "Frame correction value for window in boundary 3 (0: fully irradiated, 1: fully shaded)" annotation(Dialog(
			group="Correction Values",
			tab="Boundary 3 - II"));
		parameter Real alphaInclination3(
			quantity="Geometry.Angle",
			displayUnit="°")=1.5707963267948966 if Bound>2 "Inclination angle of boundary 3" annotation(Dialog(
			group="Alignment",
			tab="Boundary 3 - II"));
		parameter Real alphaOrientation3(
			quantity="Geometry.Angle",
			displayUnit="°")=3.1415926535897931 if Bound>2 "Orientation angle of boundary 3" annotation(Dialog(
			group="Alignment",
			tab="Boundary 3 - II"));
		parameter Real gWindow3=0.6 if Bound>2 "Total translucency of window in boundary 3" annotation(Dialog(
			group="Heat Absorption",
			tab="Boundary 3 - II"));
		parameter Real alphaBound3=0.2 if Bound>2 "Absorption coefficient of boundary 3" annotation(Dialog(
			group="Heat Absorption",
			tab="Boundary 3 - II"));
		parameter Real alphaBoundOut3(
			quantity="Thermics.HeatTransmCoeff",
			displayUnit="W/(m²·K)")=20 if Bound>2 and not Ground3 "Outer heat transmission coefficient of boundary 3" annotation(Dialog(
			group="Heat Absorption",
			tab="Boundary 3 - II"));
		parameter Real alphaBoundIn3(
			quantity="Thermics.HeatTransmCoeff",
			displayUnit="W/(m²·K)")=7.5 if Bound>2 "Inner heat transmission coefficient of boundary 3" annotation(Dialog(
			group="Heat Absorption",
			tab="Boundary 3 - II"));
		parameter Integer contactBound4=0 if Bound>3 "Boundary 4 is connected to: '0'-Ambience, '1,2,3 ...-Zone 1,2,3 ..." annotation(Dialog(
			group="Ambience",
			tab="Boundary 4 - I"));
		parameter Real ABound4(
			quantity="Geometry.Area",
			displayUnit="m²")=30 if Bound>3 "Surface area of boundary 4" annotation(Dialog(
			group="Dimensions",
			tab="Boundary 4 - I"));
		parameter Real AWindow4(
			quantity="Geometry.Area",
			displayUnit="m²")=5 if Bound>3 "Window surface area of boundary 4" annotation(Dialog(
			group="Dimensions",
			tab="Boundary 4 - I"));
		parameter Real AOthers4(
			quantity="Geometry.Area",
			displayUnit="m²")=0 if Bound>3 "Other surfaces of boundary 4" annotation(Dialog(
			group="Dimensions",
			tab="Boundary 4 - I"));
		parameter Real dBound4(
			quantity="Geometry.Length",
			displayUnit="m")=0.36 if Bound>3 "Thickness of boundary 4" annotation(Dialog(
			group="Dimensions",
			tab="Boundary 4 - I"));
		parameter Real rhoBound4(
			quantity="Thermics.Density",
			displayUnit="kg/m³")=1800 if Bound>3 "Density of boundary 4" annotation(Dialog(
			group="Material",
			tab="Boundary 4 - I"));
		parameter Real cpBound4(
			quantity="Thermics.SpecHeatCapacity",
			displayUnit="kJ/(kg·K)")=920 if Bound>3 "Specific heat capacity of boundary 4" annotation(Dialog(
			group="Material",
			tab="Boundary 4 - I"));
		parameter Real uBound4(
			quantity="Thermics.HeatTransmCoeff",
			displayUnit="W/(m²·K)")=0.2 if Bound>3 "Heat transmission value of boundary 4" annotation(Dialog(
			group="Heat Transmission",
			tab="Boundary 4 - I"));
		parameter Real uWindow4(
			quantity="Thermics.HeatTransmCoeff",
			displayUnit="W/(m²·K)")=1 if Bound>3 "Heat transmission value of window in boundary 4" annotation(Dialog(
			group="Heat Transmission",
			tab="Boundary 4 - I"));
		parameter Real uOthers4(
			quantity="Thermics.HeatTransmCoeff",
			displayUnit="W/(m²·K)")=0 if Bound>3 "Heat transmission value of other surfaces in boundary 4" annotation(Dialog(
			group="Heat Transmission",
			tab="Boundary 4 - I"));
		parameter Boolean groundContact4=false if Bound>3 and not contactBound4>0 "Boundary 4 has contact to ground" annotation(Dialog(
			group="Ground Position",
			tab="Boundary 4 - II"));
		parameter Real depthBound4(
			quantity="Geometry.Length",
			displayUnit="m")=1 if Bound>3 and Ground4 "Depth of boundary 4, if it is ground contacted" annotation(Dialog(
			group="Ground Position",
			tab="Boundary 4 - II"));
		parameter Real epsDirt4=0.1 if Bound>3 "Dirt correction value for window in boundary 4 (0: fully irradiated, 1: fully shaded)" annotation(Dialog(
			group="Correction Values",
			tab="Boundary 4 - II"));
		parameter Real epsShading4=0.2 if Bound>3 "Shading correction value for boundary 4 (0: fully irradiated, 1: fully shaded)" annotation(Dialog(
			group="Correction Values",
			tab="Boundary 4 - II"));
		parameter Real epsFrame4=0.2 if Bound>3 "Frame correction value for window in boundary 4 (0: fully irradiated, 1: fully shaded)" annotation(Dialog(
			group="Correction Values",
			tab="Boundary 4 - II"));
		parameter Real alphaInclination4(
			quantity="Geometry.Angle",
			displayUnit="°")=1.5707963267948966 if Bound>3 "Inclination angle of boundary 4" annotation(Dialog(
			group="Alignment",
			tab="Boundary 4 - II"));
		parameter Real alphaOrientation4(
			quantity="Geometry.Angle",
			displayUnit="°")=4.7123889803846897 if Bound>3 "Orientation angle of boundary 4" annotation(Dialog(
			group="Alignment",
			tab="Boundary 4 - II"));
		parameter Real gWindow4=0.6 if Bound>3 "Total translucency of window in boundary 4" annotation(Dialog(
			group="Heat Absorption",
			tab="Boundary 4 - II"));
		parameter Real alphaBound4=0.2 if Bound>3 "Absorption coefficient of boundary 4" annotation(Dialog(
			group="Heat Absorption",
			tab="Boundary 4 - II"));
		parameter Real alphaBoundOut4(
			quantity="Thermics.HeatTransmCoeff",
			displayUnit="W/(m²·K)")=20 if Bound>3 and not Ground4 "Outer heat transmission coefficient of boundary 4" annotation(Dialog(
			group="Heat Absorption",
			tab="Boundary 4 - II"));
		parameter Real alphaBoundIn4(
			quantity="Thermics.HeatTransmCoeff",
			displayUnit="W/(m²·K)")=7.5 if Bound>3 "Inner heat transmission coefficient of boundary 4" annotation(Dialog(
			group="Heat Absorption",
			tab="Boundary 4 - II"));
		parameter Integer contactBound5=0 if Bound>4 "Boundary 5 is connected to: '0'-Ambience, '1,2,3 ...-Zone 1,2,3 ..." annotation(Dialog(
			group="Ambience",
			tab="Boundary 5 - I"));
		parameter Real ABound5(
			quantity="Geometry.Area",
			displayUnit="m²")=30 if Bound>4 "Surface area of boundary 5" annotation(Dialog(
			group="Dimensions",
			tab="Boundary 5 - I"));
		parameter Real AWindow5(
			quantity="Geometry.Area",
			displayUnit="m²")=0 if Bound>4 "Window surface area of boundary 5" annotation(Dialog(
			group="Dimensions",
			tab="Boundary 5 - I"));
		parameter Real AOthers5(
			quantity="Geometry.Area",
			displayUnit="m²")=0 if Bound>4 "Other surfaces of boundary 5" annotation(Dialog(
			group="Dimensions",
			tab="Boundary 5 - I"));
		parameter Real dBound5(
			quantity="Geometry.Length",
			displayUnit="m")=0.36 if Bound>4 "Thickness of boundary 5" annotation(Dialog(
			group="Dimensions",
			tab="Boundary 5 - I"));
		parameter Real rhoBound5(
			quantity="Thermics.Density",
			displayUnit="kg/m³")=1800 if Bound>4 "Density of boundary 5" annotation(Dialog(
			group="Material",
			tab="Boundary 5 - I"));
		parameter Real cpBound5(
			quantity="Thermics.SpecHeatCapacity",
			displayUnit="kJ/(kg·K)")=920 if Bound>4 "Specific heat capacity of boundary 5" annotation(Dialog(
			group="Material",
			tab="Boundary 5 - I"));
		parameter Real uBound5(
			quantity="Thermics.HeatTransmCoeff",
			displayUnit="W/(m²·K)")=0.2 if Bound>4 "Heat transmission value of boundary 5" annotation(Dialog(
			group="Heat Transmission",
			tab="Boundary 5 - I"));
		parameter Real uWindow5(
			quantity="Thermics.HeatTransmCoeff",
			displayUnit="W/(m²·K)")=0 if Bound>4 "Heat transmission value of window in boundary 5" annotation(Dialog(
			group="Heat Transmission",
			tab="Boundary 5 - I"));
		parameter Real uOthers5(
			quantity="Thermics.HeatTransmCoeff",
			displayUnit="W/(m²·K)")=0 if Bound>4 "Heat transmission value of other surfaces in boundary 5" annotation(Dialog(
			group="Heat Transmission",
			tab="Boundary 5 - I"));
		parameter Boolean groundContact5=true if Bound>4 and not contactBound5>0 "Boundary 5 has contact to ground" annotation(Dialog(
			group="Ground Position",
			tab="Boundary 5 - II"));
		parameter Real depthBound5(
			quantity="Geometry.Length",
			displayUnit="m")=1 if Bound>4 and Ground5 "Depth of boundary 5, if it is ground contacted" annotation(Dialog(
			group="Ground Position",
			tab="Boundary 5 - II"));
		parameter Real epsDirt5=0 if Bound>4 "Dirt correction value for window in boundary 5 (0: fully irradiated, 1: fully shaded)" annotation(Dialog(
			group="Correction Values",
			tab="Boundary 5 - II"));
		parameter Real epsShading5=1 if Bound>4 "Shading correction value for boundary 5 (0: fully irradiated, 1: fully shaded)" annotation(Dialog(
			group="Correction Values",
			tab="Boundary 5 - II"));
		parameter Real epsFrame5=0 if Bound>4 "Frame correction value for window in boundary 5 (0: fully irradiated, 1: fully shaded)" annotation(Dialog(
			group="Correction Values",
			tab="Boundary 5 - II"));
		parameter Real alphaInclination5(
			quantity="Geometry.Angle",
			displayUnit="°")=0 if Bound>4 "Inclination angle of boundary 5" annotation(Dialog(
			group="Alignment",
			tab="Boundary 5 - II"));
		parameter Real alphaOrientation5(
			quantity="Geometry.Angle",
			displayUnit="°")=0 if Bound>4 "Orientation angle of boundary 5" annotation(Dialog(
			group="Alignment",
			tab="Boundary 5 - II"));
		parameter Real gWindow5=0.6 if Bound>4 "Total translucency of window in boundary 5" annotation(Dialog(
			group="Heat Absorption",
			tab="Boundary 5 - II"));
		parameter Real alphaBound5=0 if Bound>4 "Absorption coefficient of boundary 5" annotation(Dialog(
			group="Heat Absorption",
			tab="Boundary 5 - II"));
		parameter Real alphaBoundOut5(
			quantity="Thermics.HeatTransmCoeff",
			displayUnit="W/(m²·K)")=20 if Bound>4 and not Ground5 "Outer heat transmission coefficient of boundary 5" annotation(Dialog(
			group="Heat Absorption",
			tab="Boundary 5 - II"));
		parameter Real alphaBoundIn5(
			quantity="Thermics.HeatTransmCoeff",
			displayUnit="W/(m²·K)")=7.5 if Bound>4 "Inner heat transmission coefficient of boundary 5" annotation(Dialog(
			group="Heat Absorption",
			tab="Boundary 5 - II"));
		parameter Integer contactBound6=0 if Bound>5 "Boundary 6 is connected to: '0'-Ambience, '1,2,3 ...-Zone 1,2,3 ..." annotation(Dialog(
			group="Ambience",
			tab="Boundary 6 - I"));
		parameter Real ABound6(
			quantity="Geometry.Area",
			displayUnit="m²")=30 if Bound>5 "Surface area of boundary 6" annotation(Dialog(
			group="Dimensions",
			tab="Boundary 6 - I"));
		parameter Real AWindow6(
			quantity="Geometry.Area",
			displayUnit="m²")=0 if Bound>5 "Window surface area of boundary 6" annotation(Dialog(
			group="Dimensions",
			tab="Boundary 6 - I"));
		parameter Real AOthers6(
			quantity="Geometry.Area",
			displayUnit="m²")=0 if Bound>5 "Other surfaces of boundary 6" annotation(Dialog(
			group="Dimensions",
			tab="Boundary 6 - I"));
		parameter Real dBound6(
			quantity="Geometry.Length",
			displayUnit="m")=0.36 if Bound>5 "Thickness of boundary 6" annotation(Dialog(
			group="Dimensions",
			tab="Boundary 6 - I"));
		parameter Real rhoBound6(
			quantity="Thermics.Density",
			displayUnit="kg/m³")=1800 if Bound>5 "Density of boundary 6" annotation(Dialog(
			group="Material",
			tab="Boundary 6 - I"));
		parameter Real cpBound6(
			quantity="Thermics.SpecHeatCapacity",
			displayUnit="kJ/(kg·K)")=920 if Bound>5 "Specific heat capacity of boundary 6" annotation(Dialog(
			group="Material",
			tab="Boundary 6 - I"));
		parameter Real uBound6(
			quantity="Thermics.HeatTransmCoeff",
			displayUnit="W/(m²·K)")=0.2 if Bound>5 "Heat transmission value of boundary 6" annotation(Dialog(
			group="Heat Transmission",
			tab="Boundary 6 - I"));
		parameter Real uWindow6(
			quantity="Thermics.HeatTransmCoeff",
			displayUnit="W/(m²·K)")=0 if Bound>5 "Heat transmission value of window in boundary 6" annotation(Dialog(
			group="Heat Transmission",
			tab="Boundary 6 - I"));
		parameter Real uOthers6(
			quantity="Thermics.HeatTransmCoeff",
			displayUnit="W/(m²·K)")=0 if Bound>5 "Heat transmission value of other surfaces in boundary 6" annotation(Dialog(
			group="Heat Transmission",
			tab="Boundary 6 - I"));
		parameter Boolean groundContact6=false if Bound>5 and not contactBound6>0 "Boundary 6 has contact to ground" annotation(Dialog(
			group="Ground Position",
			tab="Boundary 6 - II"));
		parameter Real depthBound6(
			quantity="Geometry.Length",
			displayUnit="m")=1 if Bound>5 and Ground6 "Depth of boundary 6, if it is ground contacted" annotation(Dialog(
			group="Ground Position",
			tab="Boundary 6 - II"));
		parameter Real epsDirt6=0.1 if Bound>5 "Dirt correction value for window in boundary 6 (0: fully irradiated, 1: fully shaded)" annotation(Dialog(
			group="Correction Values",
			tab="Boundary 6 - II"));
		parameter Real epsShading6=0.2 if Bound>5 "Shading correction value for boundary 6 (0: fully irradiated, 1: fully shaded)" annotation(Dialog(
			group="Correction Values",
			tab="Boundary 6 - II"));
		parameter Real epsFrame6=0.2 if Bound>5 "Frame correction value for window in boundary 6 (0: fully irradiated, 1: fully shaded)" annotation(Dialog(
			group="Correction Values",
			tab="Boundary 6 - II"));
		parameter Real alphaInclination6(
			quantity="Geometry.Angle",
			displayUnit="°")=0 if Bound>5 "Inclination angle of boundary 6" annotation(Dialog(
			group="Alignment",
			tab="Boundary 6 - II"));
		parameter Real alphaOrientation6(
			quantity="Geometry.Angle",
			displayUnit="°")=0 if Bound>5 "Orientation angle of boundary 6" annotation(Dialog(
			group="Alignment",
			tab="Boundary 6 - II"));
		parameter Real gWindow6=0.6 if Bound>5 "Total translucency of window in boundary 6" annotation(Dialog(
			group="Heat Absorption",
			tab="Boundary 6 - II"));
		parameter Real alphaBound6=0.5 if Bound>5 "Absorption coefficient of boundary 6" annotation(Dialog(
			group="Heat Absorption",
			tab="Boundary 6 - II"));
		parameter Real alphaBoundOut6(
			quantity="Thermics.HeatTransmCoeff",
			displayUnit="W/(m²·K)")=20 if Bound>5 and not Ground6 "Outer heat transmission coefficient of boundary 6" annotation(Dialog(
			group="Heat Absorption",
			tab="Boundary 6 - II"));
		parameter Real alphaBoundIn6(
			quantity="Thermics.HeatTransmCoeff",
			displayUnit="W/(m²·K)")=7.5 if Bound>5 "Inner heat transmission coefficient of boundary 6" annotation(Dialog(
			group="Heat Absorption",
			tab="Boundary 6 - II"));
		parameter Integer contactBound7=0 if Bound>6 "Boundary 7 is connected to: '0'-Ambience, '1,2,3 ...-Zone 1,2,3 ..." annotation(Dialog(
			group="Ambience",
			tab="Boundary 7 - I"));
		parameter Real ABound7(
			quantity="Geometry.Area",
			displayUnit="m²")=30 if Bound>6 "Surface area of boundary 7" annotation(Dialog(
			group="Dimensions",
			tab="Boundary 7 - I"));
		parameter Real AWindow7(
			quantity="Geometry.Area",
			displayUnit="m²")=5 if Bound>6 "Window surface area of boundary 7" annotation(Dialog(
			group="Dimensions",
			tab="Boundary 7 - I"));
		parameter Real AOthers7(
			quantity="Geometry.Area",
			displayUnit="m²")=0 if Bound>6 "Other surfaces of boundary 7" annotation(Dialog(
			group="Dimensions",
			tab="Boundary 7 - I"));
		parameter Real dBound7(
			quantity="Geometry.Length",
			displayUnit="m")=0.36 if Bound>6 "Thickness of boundary 7" annotation(Dialog(
			group="Dimensions",
			tab="Boundary 7 - I"));
		parameter Real rhoBound7(
			quantity="Thermics.Density",
			displayUnit="kg/m³")=1800 if Bound>6 "Density of boundary 7" annotation(Dialog(
			group="Material",
			tab="Boundary 7 - I"));
		parameter Real cpBound7(
			quantity="Thermics.SpecHeatCapacity",
			displayUnit="kJ/(kg·K)")=920 if Bound>6 "Specific heat capacity of boundary 7" annotation(Dialog(
			group="Material",
			tab="Boundary 7 - I"));
		parameter Real uBound7(
			quantity="Thermics.HeatTransmCoeff",
			displayUnit="W/(m²·K)")=0.2 if Bound>6 "Heat transmission value of boundary 7" annotation(Dialog(
			group="Heat Transmission",
			tab="Boundary 7 - I"));
		parameter Real uWindow7(
			quantity="Thermics.HeatTransmCoeff",
			displayUnit="W/(m²·K)")=1 if Bound>6 "Heat transmission value of window in boundary 7" annotation(Dialog(
			group="Heat Transmission",
			tab="Boundary 7 - I"));
		parameter Real uOthers7(
			quantity="Thermics.HeatTransmCoeff",
			displayUnit="W/(m²·K)")=0 if Bound>6 "Heat transmission value of other surfaces in boundary 7" annotation(Dialog(
			group="Heat Transmission",
			tab="Boundary 7 - I"));
		parameter Boolean groundContact7=false if Bound>6 and not contactBound7>0 "Boundary 7 has contact to ground" annotation(Dialog(
			group="Ground Position",
			tab="Boundary 7 - II"));
		parameter Real depthBound7(
			quantity="Geometry.Length",
			displayUnit="m")=1 if Bound>6 and Ground7 "Depth of boundary 7, if it is ground contacted" annotation(Dialog(
			group="Ground Position",
			tab="Boundary 7 - II"));
		parameter Real epsDirt7=0.1 if Bound>6 "Dirt correction value for window in boundary 7 (0: fully irradiated, 1: fully shaded)" annotation(Dialog(
			group="Correction Values",
			tab="Boundary 7 - II"));
		parameter Real epsShading7=0.2 if Bound>6 "Shading correction value for boundary 7 (0: fully irradiated, 1: fully shaded)" annotation(Dialog(
			group="Correction Values",
			tab="Boundary 7 - II"));
		parameter Real epsFrame7=0.2 if Bound>6 "Frame correction value for window in boundary 7 (0: fully irradiated,1: fully shaded)" annotation(Dialog(
			group="Correction Values",
			tab="Boundary 7 - II"));
		parameter Real alphaInclination7(
			quantity="Geometry.Angle",
			displayUnit="°")=1.5707963267948966 if Bound>6 "Inclination angle of boundary 7" annotation(Dialog(
			group="Alignment",
			tab="Boundary 7 - II"));
		parameter Real alphaOrientation7(
			quantity="Geometry.Angle",
			displayUnit="°")=0 if Bound>6 "Orientation angle of boundary 7" annotation(Dialog(
			group="Alignment",
			tab="Boundary 7 - II"));
		parameter Real gWindow7=0.6 if Bound>6 "Total translucency of window in boundary 7" annotation(Dialog(
			group="Heat Absorption",
			tab="Boundary 7 - II"));
		parameter Real alphaBound7=0.2 if Bound>6 "Absorption coefficient of boundary 7" annotation(Dialog(
			group="Heat Absorption",
			tab="Boundary 7 - II"));
		parameter Real alphaBoundOut7(
			quantity="Thermics.HeatTransmCoeff",
			displayUnit="W/(m²·K)")=20 if Bound>6 and not Ground7 "Outer heat transmission coefficient of boundary 7" annotation(Dialog(
			group="Heat Absorption",
			tab="Boundary 7 - II"));
		parameter Real alphaBoundIn7(
			quantity="Thermics.HeatTransmCoeff",
			displayUnit="W/(m²·K)")=7.5 if Bound>6 "Inner heat transmission coefficient of boundary 7" annotation(Dialog(
			group="Heat Absorption",
			tab="Boundary 7 - II"));
		parameter Integer contactBound8=0 if Bound>7 "Boundary 8 is connected to: '0'-Ambience, '1,2,3 ...-Zone 1,2,3 ..." annotation(Dialog(
			group="Ambience",
			tab="Boundary 8 - I"));
		parameter Real ABound8(
			quantity="Geometry.Area",
			displayUnit="m²")=30 if Bound>7 "Surface area of boundary 8" annotation(Dialog(
			group="Dimensions",
			tab="Boundary 8 - I"));
		parameter Real AWindow8(
			quantity="Geometry.Area",
			displayUnit="m²")=5 if Bound>7 "Window surface area of boundary 8" annotation(Dialog(
			group="Dimensions",
			tab="Boundary 8 - I"));
		parameter Real AOthers8(
			quantity="Geometry.Area",
			displayUnit="m²")=0 if Bound>7 "Other surfaces of boundary 8" annotation(Dialog(
			group="Dimensions",
			tab="Boundary 8 - I"));
		parameter Real dBound8(
			quantity="Geometry.Length",
			displayUnit="m")=0.36 if Bound>7 "Thickness of boundary 8" annotation(Dialog(
			group="Dimensions",
			tab="Boundary 8 - I"));
		parameter Real rhoBound8(
			quantity="Thermics.Density",
			displayUnit="kg/m³")=1800 if Bound>7 "Density of boundary 8" annotation(Dialog(
			group="Material",
			tab="Boundary 8 - I"));
		parameter Real cpBound8(
			quantity="Thermics.SpecHeatCapacity",
			displayUnit="kJ/(kg·K)")=920 if Bound>7 "Specific heat capacity of boundary 8" annotation(Dialog(
			group="Material",
			tab="Boundary 8 - I"));
		parameter Real uBound8(
			quantity="Thermics.HeatTransmCoeff",
			displayUnit="W/(m²·K)")=0.2 if Bound>7 "Heat transmission value of boundary 8" annotation(Dialog(
			group="Heat Transmission",
			tab="Boundary 8 - I"));
		parameter Real uWindow8(
			quantity="Thermics.HeatTransmCoeff",
			displayUnit="W/(m²·K)")=1 if Bound>7 "Heat transmission value of window in boundary 8" annotation(Dialog(
			group="Heat Transmission",
			tab="Boundary 8 - I"));
		parameter Real uOthers8(
			quantity="Thermics.HeatTransmCoeff",
			displayUnit="W/(m²·K)")=0 if Bound>7 "Heat transmission value of other surfaces in boundary 8" annotation(Dialog(
			group="Heat Transmission",
			tab="Boundary 8 - I"));
		parameter Boolean groundContact8=false if Bound>7 and not contactBound8>0 "Boundary 8 has contact to ground" annotation(Dialog(
			group="Ground Position",
			tab="Boundary 8 - II"));
		parameter Real depthBound8(
			quantity="Geometry.Length",
			displayUnit="m")=1 if Bound>7 and Ground8 "Depth of boundary 8, if it is ground contacted" annotation(Dialog(
			group="Ground Position",
			tab="Boundary 8 - II"));
		parameter Real epsDirt8=0.1 if Bound>7 "Dirt correction value for window in boundary 8 (0: fully irradiated, 1: fully shaded)" annotation(Dialog(
			group="Correction Values",
			tab="Boundary 8 - II"));
		parameter Real epsShading8=0.2 if Bound>7 "shading correction value for  Boundary 8 (0: fully irradiated, 1: fully shaded)" annotation(Dialog(
			group="Correction Values",
			tab="Boundary 8 - II"));
		parameter Real epsFrame8=0.2 if Bound>7 "Frame correction value for window in boundary 8 (0: fully irradiated, 1: fully shaded)" annotation(Dialog(
			group="Correction Values",
			tab="Boundary 8 - II"));
		parameter Real alphaInclination8(
			quantity="Geometry.Angle",
			displayUnit="°")=1.5707963267948966 if Bound>7 "Inclination angle of boundary 8" annotation(Dialog(
			group="Alignment",
			tab="Boundary 8 - II"));
		parameter Real alphaOrientation8(
			quantity="Geometry.Angle",
			displayUnit="°")=0 if Bound>7 "Orientation angle of boundary 8" annotation(Dialog(
			group="Alignment",
			tab="Boundary 8 - II"));
		parameter Real gWindow8=0.6 if Bound>7 "Total translucency of window in boundary 8" annotation(Dialog(
			group="Heat Absorption",
			tab="Boundary 8 - II"));
		parameter Real alphaBound8=0.2 if Bound>7 "Absorption coefficient of boundary 8" annotation(Dialog(
			group="Heat Absorption",
			tab="Boundary 8 - II"));
		parameter Real alphaBoundOut8(
			quantity="Thermics.HeatTransmCoeff",
			displayUnit="W/(m²·K)")=20 if Bound>7 and not Ground8 "Outer heat transmission coefficient of boundary 8" annotation(Dialog(
			group="Heat Absorption",
			tab="Boundary 8 - II"));
		parameter Real alphaBoundIn8(
			quantity="Thermics.HeatTransmCoeff",
			displayUnit="W/(m²·K)")=7.5 if Bound>7 "Inner heat transmission coefficient of boundary 8" annotation(Dialog(
			group="Heat Absorption",
			tab="Boundary 8 - II"));
		parameter Integer contactBound9=0 if Bound>8 "Boundary 9 is connected to: '0'-Ambience, '1,2,3 ...-Zone 1,2,3 ..." annotation(Dialog(
			group="Ambience",
			tab="Boundary 9 - I"));
		parameter Real ABound9(
			quantity="Geometry.Area",
			displayUnit="m²")=30 if Bound>8 "Surface area of boundary 9" annotation(Dialog(
			group="Dimensions",
			tab="Boundary 9 - I"));
		parameter Real AWindow9(
			quantity="Geometry.Area",
			displayUnit="m²")=5 if Bound>8 "Window surface area of boundary 9" annotation(Dialog(
			group="Dimensions",
			tab="Boundary 9 - I"));
		parameter Real AOthers9(
			quantity="Geometry.Area",
			displayUnit="m²")=0 if Bound>8 "Other surfaces of boundary 9" annotation(Dialog(
			group="Dimensions",
			tab="Boundary 9 - I"));
		parameter Real dBound9(
			quantity="Geometry.Length",
			displayUnit="m")=0.36 if Bound>8 "Thickness of boundary 9" annotation(Dialog(
			group="Dimensions",
			tab="Boundary 9 - I"));
		parameter Real rhoBound9(
			quantity="Thermics.Density",
			displayUnit="kg/m³")=1800 if Bound>8 "Density of boundary 9" annotation(Dialog(
			group="Material",
			tab="Boundary 9 - I"));
		parameter Real cpBound9(
			quantity="Thermics.SpecHeatCapacity",
			displayUnit="kJ/(kg·K)")=920 if Bound>8 "Specific heat capacity of boundary 9" annotation(Dialog(
			group="Material",
			tab="Boundary 9 - I"));
		parameter Real uBound9(
			quantity="Thermics.HeatTransmCoeff",
			displayUnit="W/(m²·K)")=0.2 if Bound>8 "Heat transmission value of boundary 9" annotation(Dialog(
			group="Heat Transmission",
			tab="Boundary 9 - I"));
		parameter Real uWindow9(
			quantity="Thermics.HeatTransmCoeff",
			displayUnit="W/(m²·K)")=1 if Bound>8 "Heat transmission value of window in boundary 9" annotation(Dialog(
			group="Heat Transmission",
			tab="Boundary 9 - I"));
		parameter Real uOthers9(
			quantity="Thermics.HeatTransmCoeff",
			displayUnit="W/(m²·K)")=0 if Bound>8 "Heat transmission value of other surfaces in boundary 9" annotation(Dialog(
			group="Heat Transmission",
			tab="Boundary 9 - I"));
		parameter Boolean groundContact9=false if Bound>8 and not contactBound9>0 "Boundary 9 has contact to ground" annotation(Dialog(
			group="Ground Position",
			tab="Boundary 9 - II"));
		parameter Real depthBound9(
			quantity="Geometry.Length",
			displayUnit="m")=1 if Bound>8 and Ground9 "Depth of boundary 9, if it is ground contacted" annotation(Dialog(
			group="Ground Position",
			tab="Boundary 9 - II"));
		parameter Real epsDirt9=0.1 if Bound>8 "Dirt correction value for window in boundary 9 (0: fully irradiated, 1: fully shaded)" annotation(Dialog(
			group="Correction Values",
			tab="Boundary 9 - II"));
		parameter Real epsShading9=0.2 if Bound>8 "Shading correction value for boundary 9 (0: fully irradiated, 1: fully shaded)" annotation(Dialog(
			group="Correction Values",
			tab="Boundary 9 - II"));
		parameter Real epsFrame9=0.2 if Bound>8 "Frame correction value for window in boundary 9 (0: fully irradiated, 1: fully shaded)" annotation(Dialog(
			group="Correction Values",
			tab="Boundary 9 - II"));
		parameter Real alphaInclination9(
			quantity="Geometry.Angle",
			displayUnit="°")=1.5707963267948966 if Bound>8 "Inclination angle of boundary 9" annotation(Dialog(
			group="Alignment",
			tab="Boundary 9 - II"));
		parameter Real alphaOrientation9(
			quantity="Geometry.Angle",
			displayUnit="°")=0 if Bound>8 "Orientation angle of boundary 9" annotation(Dialog(
			group="Alignment",
			tab="Boundary 9 - II"));
		parameter Real gWindow9=0.6 if Bound>8 "Total translucency of window in boundary 9" annotation(Dialog(
			group="Heat Absorption",
			tab="Boundary 9 - II"));
		parameter Real alphaBound9=0.2 if Bound>8 "Absorption coefficient of boundary 9" annotation(Dialog(
			group="Heat Absorption",
			tab="Boundary 9 - II"));
		parameter Real alphaBoundOut9(
			quantity="Thermics.HeatTransmCoeff",
			displayUnit="W/(m²·K)")=20 if Bound>8 and not Ground9 "Outer heat transmission coefficient of boundary 9" annotation(Dialog(
			group="Heat Absorption",
			tab="Boundary 9 - II"));
		parameter Real alphaBoundIn9(
			quantity="Thermics.HeatTransmCoeff",
			displayUnit="W/(m²·K)")=7.5 if Bound>8 "Inner heat transmission coefficient of boundary 9" annotation(Dialog(
			group="Heat Absorption",
			tab="Boundary 9 - II"));
		GreenCity.Interfaces.Electrical.LV3Phase Grid3 "3-phase connection to Grid" annotation(Placement(
			transformation(extent={{470,-710},{490,-690}}),
			iconTransformation(extent={{140,-210},{160,-190}})));
		GreenCity.Interfaces.Building.ZoneTemperatures ZoneTemperatures[min(max(NumberZones,1),MaxNumberZones)] if(contactBound1>0) or (contactBound2>0 and Bound>1) or (contactBound3>0 and Bound>2) or (contactBound4>0 and Bound>3) or (contactBound5>0 and Bound>4) or (contactBound6>0 and Bound>5) or (contactBound7>0 and Bound>6) or (contactBound8>0 and Bound>7) or (contactBound9>0 and Bound>8) "Temperatures of building zones" annotation(Placement(
			transformation(extent={{605,-520},{625,-500}}),
			iconTransformation(extent={{340,-110},{360,-90}})));
		GreenCity.Interfaces.Environment.EnvironmentConditions EnvironmentConditions "Ambient Conditions Connection" annotation(Placement(
			transformation(extent={{603,-449},{623,-429}}),
			iconTransformation(extent={{340,90},{360,110}})));
	protected
		__iti_Alias AmbientConditions=EnvironmentConditions;
	initial equation
		assert((Bound>=BoundMin), "Number of Boundaries is too low");
		assert((Bound<=BoundMax), "Number of Boundaries is too high");
		assert((Mass>=MassMin), "Number of inner Masses is too low");
		assert((Mass<=MassMax), "Number of inner Masses is too high");
		assert(NumberZones>=1 and NumberZones<=MaxNumberZones, "Number of Zones out of limits");
		assert(ZoneIndex>=1 and ZoneIndex<=MaxNumberZones, "Zone index out of limits");
		
		if (LoadCalculation) then
			TZoneAct=TZoneRef;
		else
			TZoneAct=TZoneInit;
		end if;
		
		EHeat=0;
		Eel=0;
	algorithm
		when(initial()) then
			for i in 1:Bound loop
				if (Boundaries[i].contactBound>0 or Boundaries[i].groundContact) then
					if (Boundaries[i].groundContact) then
						reinit(Boundaries[i].TBoundOut,TAmbientBound[i]);
					else
						reinit(Boundaries[i].TBoundOut,TAmbientBound[i]+((TZoneAct-TAmbientBound[i])-deltaTBound[i])/2);
					end if;				
					reinit(Boundaries[i].TBoundIn,TZoneAct-((TZoneAct-TAmbientBound[i])-deltaTBound[i])/2);	
				else
					reinit(Boundaries[i].TBoundIn,TZoneAct-((TZoneAct-EnvironmentConditions.TAmbientAverageAct)-deltaTBound[i])/2);
					reinit(Boundaries[i].TBoundOut,EnvironmentConditions.TAmbientAverageAct+((TZoneAct-EnvironmentConditions.TAmbientAverageAct)-deltaTBound[i])/2);
				end if;
			end for;
		end when;
	equation
					for i in 1:Bound loop
						if (Boundaries[i].contactBound>0 or Boundaries[i].groundContact) then	
							if (Boundaries[i].lambdaBound>1e-10) then
								deltaTBound[i]=(TZoneAct-TAmbientBound[i])*(Boundaries[i].uBound)/(Boundaries[i].lambdaBound/Boundaries[i].dBound);
							else
								deltaTBound[i]=TZoneAct-TAmbientBound[i];
							end if;
						else
							if (Boundaries[i].lambdaBound>1e-10) then
								deltaTBound[i]=(TZoneAct-EnvironmentConditions.TAmbientAverageAct)*(Boundaries[i].uBound)/(Boundaries[i].lambdaBound/Boundaries[i].dBound);
							else
								deltaTBound[i]=TZoneAct-EnvironmentConditions.TAmbientAverageAct;
							end if;
						end if;
					end for;
		
					if (Mass>0) then
						for i in 1:Mass loop
							if (i==1) then
								Masses[1].cp=cpMass1;
								Masses[1].rho=rhoMass1;
								Masses[1].V=VMass1;
							elseif (i==2) then
								Masses[2].cp=cpMass2;
								Masses[2].rho=rhoMass2;
								Masses[2].V=VMass2;
							elseif (i==3) then
								Masses[3].cp=cpMass3;
								Masses[3].rho=rhoMass3;
								Masses[3].V=VMass3;
							else
								Masses[4].cp=cpMass4;
								Masses[4].rho=rhoMass4;
								Masses[4].V=VMass4;
							end if;
						end for;
					end if;
					for i in 1:Bound loop
						if (i==1) then
							assert(uBound1>1e-10,"Boundary 1 - uBound=0");
							assert(alphaBoundIn1>1e-10,"Boundary 1 - alphaBoundIn=0");
							assert(contactBound1>=0 or contactBound1<=NumberZones,"contactBound1 out of bounds");
							assert(alphaInclination1>=0 and alphaInclination1<=pi,"alphaInclination1 must be within 0° and 180°");
							assert(alphaOrientation1>=0 and alphaOrientation1<=2*pi,"alphaOrientation1 must be within 0° and 360°");
							if not contactBound1>0 then	
								Boundaries[1].groundContact=groundContact1;
							else
								Boundaries[1].groundContact=false;
							end if;
							Boundaries[1].ABound=ABound1;
							Boundaries[1].AWindow=AWindow1;
							Boundaries[1].AOthers=AOthers1;
							Boundaries[1].rhoBound=rhoBound1;
							Boundaries[1].cpBound=cpBound1;
							Boundaries[1].dBound=dBound1;
							Boundaries[1].gWindow=gWindow1;
							Boundaries[1].uBound=uBound1;
							Boundaries[1].uWindow=uWindow1;
							Boundaries[1].uOthers=uOthers1;
							Boundaries[1].epsDirt=epsDirt1;
							Boundaries[1].epsShading=epsShading1;
							Boundaries[1].epsFrame=epsFrame1;
							Boundaries[1].NormalVector=normalVector(alphaInclination1,alphaOrientation1);
							Boundaries[1].alphaInc=alphaInclination1;
							Boundaries[1].alphaOr=alphaOrientation1;
							Boundaries[1].alphaBound=alphaBound1;
							Boundaries[1].contactBound=contactBound1;
							if not contactBound1>0 then	
								if (groundContact1) then
									Boundaries[1].alphaBoundOut=0;
									Boundaries[1].depthBound=depthBound1;
								else
									assert(alphaBoundOut1>1e-10,"Boundary 1 - alphaBoundOut=0");
									Boundaries[1].alphaBoundOut=alphaBoundOut1;
									Boundaries[1].depthBound=0;
								end if;
							else
								assert(alphaBoundOut1>1e-10,"Boundary 1 - alphaBoundOut=0");
								Boundaries[1].alphaBoundOut=alphaBoundOut1;
								Boundaries[1].depthBound=0;
							end if;
							Boundaries[1].alphaBoundIn=alphaBoundIn1;
							if not contactBound1>0 then
								if (groundContact1) then
									Boundaries[1].lambdaBound=(dBound1)/((1/min(uBound1,alphaBoundIn1-1e-3))-(1/alphaBoundIn1));
								else
									Boundaries[1].lambdaBound=(dBound1)/((1/min(uBound1,((alphaBoundIn1*alphaBoundOut1)/(alphaBoundIn1+alphaBoundOut1)-1e-3)))-(1/alphaBoundIn1)-(1/alphaBoundOut1));
								end if;
							else
								Boundaries[1].lambdaBound=(dBound1)/((1/min(uBound1,((alphaBoundIn1*alphaBoundOut1)/(alphaBoundIn1+alphaBoundOut1)-1e-3)))-(1/alphaBoundIn1)-(1/alphaBoundOut1));
							end if;	
						elseif (i==2) then
							assert(uBound2>1e-10,"Boundary 2 - uBound=0");
							assert(alphaBoundIn2>1e-10,"Boundary 2 - alphaBoundIn=0");
							assert(contactBound2>=0 or contactBound2<=NumberZones,"contactBound2 out of bounds");
							assert(alphaInclination2>=0 and alphaInclination2<=pi,"alphaInclination2 must be within 0° and 180°");
							assert(alphaOrientation2>=0 and alphaOrientation2<=2*pi,"alphaOrientation2 must be within 0° and 360°");				
							if not contactBound2>0 then	
								Boundaries[2].groundContact=groundContact2;
							else
								Boundaries[2].groundContact=false;
							end if;	
							Boundaries[2].ABound=ABound2;
							Boundaries[2].AWindow=AWindow2;
							Boundaries[2].AOthers=AOthers2;
							Boundaries[2].rhoBound=rhoBound2;
							Boundaries[2].cpBound=cpBound2;
							Boundaries[2].dBound=dBound2;
							Boundaries[2].gWindow=gWindow2;
							Boundaries[2].uBound=uBound2;
							Boundaries[2].uWindow=uWindow2;
							Boundaries[2].uOthers=uOthers2;
							Boundaries[2].epsDirt=epsDirt2;
							Boundaries[2].epsShading=epsShading2;
							Boundaries[2].epsFrame=epsFrame2;
							Boundaries[2].NormalVector=normalVector(alphaInclination2,alphaOrientation2);
							Boundaries[2].alphaInc=alphaInclination2;
							Boundaries[2].alphaOr=alphaOrientation2;
							Boundaries[2].alphaBound=alphaBound2;
							Boundaries[2].contactBound=contactBound2;
							if not contactBound2>0 then
								if (groundContact2) then
									Boundaries[2].alphaBoundOut=0;
									Boundaries[2].depthBound=depthBound2;
								else
									assert(alphaBoundOut2>1e-10,"Boundary 2 - alphaBoundOut=0");
									Boundaries[2].alphaBoundOut=alphaBoundOut2;
									Boundaries[2].depthBound=0;
								end if;
							else
								assert(alphaBoundOut2>1e-10,"Boundary 2 - alphaBoundOut=0");
								Boundaries[2].alphaBoundOut=alphaBoundOut2;
								Boundaries[2].depthBound=0;
							end if;	
							Boundaries[2].alphaBoundIn=alphaBoundIn2;
							if not contactBound2>0 then
								if (groundContact2) then
									Boundaries[2].lambdaBound=(dBound2)/((1/min(uBound2,alphaBoundIn2-1e-3))-(1/alphaBoundIn2));
								else
									Boundaries[2].lambdaBound=(dBound2)/((1/min(uBound2,((alphaBoundIn2*alphaBoundOut2)/(alphaBoundIn2+alphaBoundOut2)-1e-3)))-(1/alphaBoundIn2)-(1/alphaBoundOut2));
								end if;
							else
								Boundaries[2].lambdaBound=(dBound2)/((1/min(uBound2,((alphaBoundIn2*alphaBoundOut2)/(alphaBoundIn2+alphaBoundOut2)-1e-3)))-(1/alphaBoundIn2)-(1/alphaBoundOut2));
							end if;	
						elseif (i==3) then
							assert(uBound3>1e-10,"Boundary 3 - uBound=0");
							assert(alphaBoundIn3>1e-10,"Boundary 3 - alphaBoundIn=0");
							assert(contactBound3>=0 or contactBound3<=NumberZones,"contactBound3 out of bounds");
							assert(alphaInclination3>=0 and alphaInclination3<=pi,"alphaInclination3 must be within 0° and 180°");
							assert(alphaOrientation3>=0 and alphaOrientation3<=2*pi,"alphaOrientation3 must be within 0° and 360°");				
							if not contactBound3>0 then	
								Boundaries[3].groundContact=groundContact3;
							else
								Boundaries[3].groundContact=false;
							end if;
							Boundaries[3].ABound=ABound3;
							Boundaries[3].AWindow=AWindow3;
							Boundaries[3].AOthers=AOthers3;
							Boundaries[3].rhoBound=rhoBound3;
							Boundaries[3].cpBound=cpBound3;
							Boundaries[3].dBound=dBound3;
							Boundaries[3].gWindow=gWindow3;
							Boundaries[3].uBound=uBound3;
							Boundaries[3].uWindow=uWindow3;
							Boundaries[3].uOthers=uOthers3;
							Boundaries[3].epsDirt=epsDirt3;
							Boundaries[3].epsShading=epsShading3;
							Boundaries[3].epsFrame=epsFrame3;
							Boundaries[3].NormalVector=normalVector(alphaInclination3,alphaOrientation3);
							Boundaries[3].alphaInc=alphaInclination3;
							Boundaries[3].alphaOr=alphaOrientation3;				
							Boundaries[3].alphaBound=alphaBound3;
							Boundaries[3].contactBound=contactBound3;
							if not contactBound3>0 then	
								if (groundContact3) then
									Boundaries[3].alphaBoundOut=0;
									Boundaries[3].depthBound=depthBound3;
								else
									assert(alphaBoundOut3>1e-10,"Boundary 3 - alphaBoundOut=0");
									Boundaries[3].alphaBoundOut=alphaBoundOut3;
									Boundaries[3].depthBound=0;
								end if;
							else
								assert(alphaBoundOut3>1e-10,"Boundary 3 - alphaBoundOut=0");
								Boundaries[3].alphaBoundOut=alphaBoundOut3;
								Boundaries[3].depthBound=0;
							end if;
							Boundaries[3].alphaBoundIn=alphaBoundIn3;
							if not contactBound3>0 then
								if (groundContact3) then
									Boundaries[3].lambdaBound=(dBound3)/((1/min(uBound3,alphaBoundIn3-1e-3))-(1/alphaBoundIn3));
								else
									Boundaries[3].lambdaBound=(dBound3)/((1/min(uBound3,((alphaBoundIn3*alphaBoundOut3)/(alphaBoundIn3+alphaBoundOut3)-1e-3)))-(1/alphaBoundIn3)-(1/alphaBoundOut3));
								end if;
							else
								Boundaries[3].lambdaBound=(dBound3)/((1/min(uBound3,((alphaBoundIn3*alphaBoundOut3)/(alphaBoundIn3+alphaBoundOut3)-1e-3)))-(1/alphaBoundIn3)-(1/alphaBoundOut3));
							end if;
						elseif (i==4) then
							assert(uBound4>1e-10,"Boundary 4 - uBound=0");
							assert(alphaBoundIn4>1e-10,"Boundary 4 - alphaBoundIn=0");
							assert(contactBound4>=0 or contactBound4<=NumberZones,"contactBound4 out of bounds");
							assert(alphaInclination4>=0 and alphaInclination4<=pi,"alphaInclination4 must be within 0° and 180°");
							assert(alphaOrientation4>=0 and alphaOrientation4<=2*pi,"alphaOrientation4 must be within 0° and 360°");
							if not contactBound4>0 then
								Boundaries[4].groundContact=groundContact4;
							else
								Boundaries[4].groundContact=false;
							end if;
							Boundaries[4].ABound=ABound4;
							Boundaries[4].AWindow=AWindow4;
							Boundaries[4].AOthers=AOthers4;
							Boundaries[4].rhoBound=rhoBound4;
							Boundaries[4].cpBound=cpBound4;
							Boundaries[4].dBound=dBound4;
							Boundaries[4].gWindow=gWindow4;
							Boundaries[4].uBound=uBound4;
							Boundaries[4].uWindow=uWindow4;
							Boundaries[4].uOthers=uOthers4;
							Boundaries[4].epsDirt=epsDirt4;
							Boundaries[4].epsShading=epsShading4;
							Boundaries[4].epsFrame=epsFrame4;
							Boundaries[4].NormalVector=normalVector(alphaInclination4,alphaOrientation4);
							Boundaries[4].alphaInc=alphaInclination4;
							Boundaries[4].alphaOr=alphaOrientation4;				
							Boundaries[4].alphaBound=alphaBound4;
							Boundaries[4].contactBound=contactBound4;
							if not contactBound4>0 then
								if (groundContact4) then
									Boundaries[4].alphaBoundOut=0;
									Boundaries[4].depthBound=depthBound4;
								else
									assert(alphaBoundOut4>1e-10,"Boundary 4 - alphaBoundOut=0");
									Boundaries[4].alphaBoundOut=alphaBoundOut4;
									Boundaries[4].depthBound=0;
								end if;
							else
								assert(alphaBoundOut4>1e-10,"Boundary 4 - alphaBoundOut=0");
								Boundaries[4].alphaBoundOut=alphaBoundOut4;
								Boundaries[4].depthBound=0;
							end if;
							Boundaries[4].alphaBoundIn=alphaBoundIn4;
							if not contactBound4>0 then
								if (groundContact4) then
									Boundaries[4].lambdaBound=(dBound4)/((1/min(uBound4,alphaBoundIn4-1e-3))-(1/alphaBoundIn4));
								else
									Boundaries[4].lambdaBound=(dBound4)/((1/min(uBound4,((alphaBoundIn4*alphaBoundOut4)/(alphaBoundIn4+alphaBoundOut4)-1e-3)))-(1/alphaBoundIn4)-(1/alphaBoundOut4));
								end if;
							else
								Boundaries[4].lambdaBound=(dBound4)/((1/min(uBound4,((alphaBoundIn4*alphaBoundOut4)/(alphaBoundIn4+alphaBoundOut4)-1e-3)))-(1/alphaBoundIn4)-(1/alphaBoundOut4));
							end if;
						elseif (i==5) then
							assert(uBound5>1e-10,"Boundary 5 - uBound=0");
							assert(alphaBoundIn5>1e-10,"Boundary 5 - alphaBoundIn=0");
							assert(contactBound5>=0 or contactBound5<=NumberZones,"contactBound5 out of bounds");
							assert(alphaInclination5>=0 and alphaInclination5<=pi,"alphaInclination5 must be within 0° and 180°");
							assert(alphaOrientation5>=0 and alphaOrientation5<=2*pi,"alphaOrientation5 must be within 0° and 360°");
							if not contactBound5>0 then
								Boundaries[5].groundContact=groundContact5;
							else
								Boundaries[5].groundContact=false;
							end if;	
							Boundaries[5].ABound=ABound5;
							Boundaries[5].AWindow=AWindow5;
							Boundaries[5].AOthers=AOthers5;
							Boundaries[5].rhoBound=rhoBound5;
							Boundaries[5].cpBound=cpBound5;
							Boundaries[5].dBound=dBound5;
							Boundaries[5].gWindow=gWindow5;
							Boundaries[5].uBound=uBound5;
							Boundaries[5].uWindow=uWindow5;
							Boundaries[5].uOthers=uOthers5;
							Boundaries[5].epsDirt=epsDirt5;
							Boundaries[5].epsShading=epsShading5;
							Boundaries[5].epsFrame=epsFrame5;
							Boundaries[5].NormalVector=normalVector(alphaInclination5,alphaOrientation5);
							Boundaries[5].alphaInc=alphaInclination5;
							Boundaries[5].alphaOr=alphaOrientation5;				
							Boundaries[5].alphaBound=alphaBound5;
							Boundaries[5].contactBound=contactBound5;
							if not contactBound5>0 then
								if (groundContact5) then
									Boundaries[5].alphaBoundOut=0;
									Boundaries[5].depthBound=depthBound5;
								else
									assert(alphaBoundOut5>1e-10,"Boundary 5 - alphaBoundOut=0");
									Boundaries[5].alphaBoundOut=alphaBoundOut5;
									Boundaries[5].depthBound=0;
								end if;
							else
								assert(alphaBoundOut5>1e-10,"Boundary 5 - alphaBoundOut=0");
								Boundaries[5].alphaBoundOut=alphaBoundOut5;
								Boundaries[5].depthBound=0;
							end if;
							Boundaries[5].alphaBoundIn=alphaBoundIn5;
							if not contactBound5>0 then
								if (groundContact5) then
									Boundaries[5].lambdaBound=(dBound5)/((1/min(uBound5,alphaBoundIn5-1e-3))-(1/alphaBoundIn5));
								else
									Boundaries[5].lambdaBound=(dBound5)/((1/min(uBound5,((alphaBoundIn5*alphaBoundOut5)/(alphaBoundIn5+alphaBoundOut5)-1e-3)))-(1/alphaBoundIn5)-(1/alphaBoundOut5));
								end if;
							else
								Boundaries[5].lambdaBound=(dBound5)/((1/min(uBound5,((alphaBoundIn5*alphaBoundOut5)/(alphaBoundIn5+alphaBoundOut5)-1e-3)))-(1/alphaBoundIn5)-(1/alphaBoundOut5));
							end if;
						elseif (i==6) then
							assert(uBound6>1e-10,"Boundary 6 - uBound=0");
							assert(alphaBoundIn6>1e-10,"Boundary 6 - alphaBoundIn=0");
							assert(contactBound6>=0 or contactBound6<=NumberZones,"contactBound6 out of bounds");
							assert(alphaInclination6>=0 and alphaInclination6<=pi,"alphaInclination6 must be within 0° and 180°");
							assert(alphaOrientation6>=0 and alphaOrientation6<=2*pi,"alphaOrientation6 must be within 0° and 360°");				
							if not contactBound6>0 then
								Boundaries[6].groundContact=groundContact6;
							else
								Boundaries[6].groundContact=false;
							end if;
							Boundaries[6].ABound=ABound6;
							Boundaries[6].AWindow=AWindow6;
							Boundaries[6].AOthers=AOthers6;
							Boundaries[6].rhoBound=rhoBound6;
							Boundaries[6].cpBound=cpBound6;
							Boundaries[6].dBound=dBound6;
							Boundaries[6].gWindow=gWindow6;
							Boundaries[6].uBound=uBound6;
							Boundaries[6].uWindow=uWindow6;
							Boundaries[6].uOthers=uOthers6;
							Boundaries[6].epsDirt=epsDirt6;
							Boundaries[6].epsShading=epsShading6;
							Boundaries[6].epsFrame=epsFrame6;
							Boundaries[6].NormalVector=normalVector(alphaInclination6,alphaOrientation6);
							Boundaries[6].alphaInc=alphaInclination6;
							Boundaries[6].alphaOr=alphaOrientation6;				
							Boundaries[6].alphaBound=alphaBound6;
							Boundaries[6].contactBound=contactBound6;
							if not contactBound6>0 then	
								if (groundContact6) then
									Boundaries[6].alphaBoundOut=0;
									Boundaries[6].depthBound=depthBound6;
								else
									assert(alphaBoundOut6>1e-10,"Boundary 6 - alphaBoundOut=0");
									Boundaries[6].alphaBoundOut=alphaBoundOut6;
									Boundaries[6].depthBound=0;
								end if;
							else
								assert(alphaBoundOut6>1e-10,"Boundary 6 - alphaBoundOut=0");
								Boundaries[6].alphaBoundOut=alphaBoundOut6;
								Boundaries[6].depthBound=0;
							end if;	
							Boundaries[6].alphaBoundIn=alphaBoundIn6;
							if not contactBound6>0 then
								if (groundContact6) then
									Boundaries[6].lambdaBound=(dBound6)/((1/min(uBound6,alphaBoundIn6-1e-3))-(1/alphaBoundIn6));
								else
									Boundaries[6].lambdaBound=(dBound6)/((1/min(uBound6,((alphaBoundIn6*alphaBoundOut6)/(alphaBoundIn6+alphaBoundOut6)-1e-3)))-(1/alphaBoundIn6)-(1/alphaBoundOut6));
								end if;
							else
								Boundaries[6].lambdaBound=(dBound6)/((1/min(uBound6,((alphaBoundIn6*alphaBoundOut6)/(alphaBoundIn6+alphaBoundOut6)-1e-3)))-(1/alphaBoundIn6)-(1/alphaBoundOut6));
							end if; 	
						elseif (i==7) then
							assert(uBound7>1e-10,"Boundary 7 - uBound=0");
							assert(alphaBoundIn7>1e-10,"Boundary 7 - alphaBoundIn=0");
							assert(contactBound7>=0 or contactBound7<=NumberZones,"contactBound7 out of bounds");
							assert(alphaInclination7>=0 and alphaInclination7<=pi,"alphaInclination7 must be within 0° and 180°");
							assert(alphaOrientation7>=0 and alphaOrientation7<=2*pi,"alphaOrientation7 must be within 0° and 360°");
							if not contactBound7>0 then	
								Boundaries[7].groundContact=groundContact7;
							else
								Boundaries[7].groundContact=false;
							end if;	
							Boundaries[7].ABound=ABound7;
							Boundaries[7].AWindow=AWindow7;
							Boundaries[7].AOthers=AOthers7;
							Boundaries[7].rhoBound=rhoBound7;
							Boundaries[7].cpBound=cpBound7;
							Boundaries[7].dBound=dBound7;
							Boundaries[7].gWindow=gWindow7;
							Boundaries[7].uBound=uBound7;
							Boundaries[7].uWindow=uWindow7;
							Boundaries[7].uOthers=uOthers7;
							Boundaries[7].epsDirt=epsDirt7;
							Boundaries[7].epsShading=epsShading7;
							Boundaries[7].epsFrame=epsFrame7;
							Boundaries[7].NormalVector=normalVector(alphaInclination7,alphaOrientation7);
							Boundaries[7].alphaInc=alphaInclination7;
							Boundaries[7].alphaOr=alphaOrientation7;				
							Boundaries[7].alphaBound=alphaBound7;
							Boundaries[7].contactBound=contactBound7;
							if not contactBound7>0 then
								if (groundContact7) then
									Boundaries[7].alphaBoundOut=0;
									Boundaries[7].depthBound=depthBound7;
								else
									assert(alphaBoundOut7>1e-10,"Boundary 7 - alphaBoundOut=0");	
									Boundaries[7].alphaBoundOut=alphaBoundOut7;
									Boundaries[7].depthBound=0;
								end if;
							else
								assert(alphaBoundOut7>1e-10,"Boundary 7 - alphaBoundOut=0");	
								Boundaries[7].alphaBoundOut=alphaBoundOut7;
								Boundaries[7].depthBound=0;
							end if;
							Boundaries[7].alphaBoundIn=alphaBoundIn7;
							if not contactBound7>0 then
								if (groundContact7) then
									Boundaries[7].lambdaBound=(dBound7)/((1/min(uBound7,alphaBoundIn7-1e-3))-(1/alphaBoundIn7));
								else
									Boundaries[7].lambdaBound=(dBound7)/((1/min(uBound7,((alphaBoundIn7*alphaBoundOut7)/(alphaBoundIn7+alphaBoundOut7)-1e-3)))-(1/alphaBoundIn7)-(1/alphaBoundOut7));
								end if;
							else
								Boundaries[7].lambdaBound=(dBound7)/((1/min(uBound7,((alphaBoundIn7*alphaBoundOut7)/(alphaBoundIn7+alphaBoundOut7)-1e-3)))-(1/alphaBoundIn7)-(1/alphaBoundOut7));
							end if;
						elseif (i==8) then
							assert(uBound8>1e-10,"Boundary 8 - uBound=0");
							assert(alphaBoundIn8>1e-10,"Boundary 8 - alphaBoundIn=0");
							assert(contactBound8>=0 or contactBound8<=NumberZones,"contactBound8 out of bounds");
							assert(alphaInclination8>=0 and alphaInclination8<=pi,"alphaInclination8 must be within 0° and 180°");
							assert(alphaOrientation8>=0 and alphaOrientation8<=2*pi,"alphaOrientation8 must be within 0° and 360°");
							if not contactBound8>0 then
								Boundaries[8].groundContact=groundContact8;
							else
								Boundaries[8].groundContact=false;
							end if;	
							Boundaries[8].ABound=ABound8;
							Boundaries[8].AWindow=AWindow8;
							Boundaries[8].AOthers=AOthers8;
							Boundaries[8].rhoBound=rhoBound8;
							Boundaries[8].cpBound=cpBound8;
							Boundaries[8].dBound=dBound8;
							Boundaries[8].gWindow=gWindow8;
							Boundaries[8].uBound=uBound8;
							Boundaries[8].uWindow=uWindow8;
							Boundaries[8].uOthers=uOthers8;
							Boundaries[8].epsDirt=epsDirt8;
							Boundaries[8].epsShading=epsShading8;
							Boundaries[8].epsFrame=epsFrame8;
							Boundaries[8].NormalVector=normalVector(alphaInclination8,alphaOrientation8);
							Boundaries[8].alphaInc=alphaInclination8;
							Boundaries[8].alphaOr=alphaOrientation8;				
							Boundaries[8].alphaBound=alphaBound8;
							Boundaries[8].contactBound=contactBound8;
							if not contactBound8>0 then
								if (groundContact8) then
									Boundaries[8].alphaBoundOut=0;
									Boundaries[8].depthBound=depthBound8;
								else
									assert(alphaBoundOut8>1e-10,"Boundary 8 - alphaBoundOut=0");
									Boundaries[8].alphaBoundOut=alphaBoundOut8;
									Boundaries[8].depthBound=0;
								end if;
							else
								assert(alphaBoundOut8>1e-10,"Boundary 8 - alphaBoundOut=0");
								Boundaries[8].alphaBoundOut=alphaBoundOut8;
								Boundaries[8].depthBound=0;
							end if;
							Boundaries[8].alphaBoundIn=alphaBoundIn8;
							if not contactBound8>0 then
								if (groundContact8) then
									Boundaries[8].lambdaBound=(dBound8)/((1/min(uBound8,alphaBoundIn8-1e-3))-(1/alphaBoundIn8));
								else
									Boundaries[8].lambdaBound=(dBound8)/((1/min(uBound8,((alphaBoundIn8*alphaBoundOut8)/(alphaBoundIn8+alphaBoundOut8)-1e-3)))-(1/alphaBoundIn8)-(1/alphaBoundOut8));
								end if;
							else
								Boundaries[8].lambdaBound=(dBound8)/((1/min(uBound8,((alphaBoundIn8*alphaBoundOut8)/(alphaBoundIn8+alphaBoundOut8)-1e-3)))-(1/alphaBoundIn8)-(1/alphaBoundOut8));
							end if;
						else
							assert(uBound9>1e-10,"Boundary 9 - uBound=0");
							assert(alphaBoundIn9>1e-10,"Boundary 9 - alphaBoundIn=0");
							assert(contactBound9>=0 or contactBound9<=NumberZones,"contactBound9 out of bounds");
							assert(alphaInclination9>=0 and alphaInclination9<=pi,"alphaInclination9 must be within 0° and 180°");
							assert(alphaOrientation9>=0 and alphaOrientation9<=2*pi,"alphaOrientation9 must be within 0° and 360°");
							if not contactBound9>0 then
								Boundaries[9].groundContact=groundContact9;
							else
								Boundaries[9].groundContact=false;
							end if;
							Boundaries[9].ABound=ABound9;
							Boundaries[9].AWindow=AWindow9;
							Boundaries[9].AOthers=AOthers9;
							Boundaries[9].rhoBound=rhoBound9;
							Boundaries[9].cpBound=cpBound9;
							Boundaries[9].dBound=dBound9;
							Boundaries[9].gWindow=gWindow9;
							Boundaries[9].uBound=uBound9;
							Boundaries[9].uWindow=uWindow9;
							Boundaries[9].uOthers=uOthers9;
							Boundaries[9].epsDirt=epsDirt9;
							Boundaries[9].epsShading=epsShading9;
							Boundaries[9].epsFrame=epsFrame9;
							Boundaries[9].NormalVector=normalVector(alphaInclination9,alphaOrientation9);
							Boundaries[9].alphaInc=alphaInclination9;
							Boundaries[9].alphaOr=alphaOrientation9;				
							Boundaries[9].alphaBound=alphaBound9;
							Boundaries[9].contactBound=contactBound9;
							if not contactBound9>0 then
								if (groundContact9) then
									Boundaries[9].alphaBoundOut=0;
									Boundaries[9].depthBound=depthBound9;
								else
									assert(alphaBoundOut9>1e-10,"Boundary 9 - alphaBoundOut=0");
									Boundaries[9].alphaBoundOut=alphaBoundOut9;
									Boundaries[9].depthBound=0;
								end if;
							else
								assert(alphaBoundOut9>1e-10,"Boundary 9 - alphaBoundOut=0");
								Boundaries[9].alphaBoundOut=alphaBoundOut9;
								Boundaries[9].depthBound=0;
							end if;
							Boundaries[9].alphaBoundIn=alphaBoundIn9;
							if not contactBound9>0 then
								if (groundContact9) then
									Boundaries[9].lambdaBound=(dBound9)/((1/min(uBound9,alphaBoundIn9-1e-3))-(1/alphaBoundIn9));
								else
									Boundaries[9].lambdaBound=(dBound9)/((1/min(uBound9,((alphaBoundIn9*alphaBoundOut9)/(alphaBoundIn9+alphaBoundOut9)-1e-3)))-(1/alphaBoundIn9)-(1/alphaBoundOut9));
								end if;
							else
								Boundaries[9].lambdaBound=(dBound9)/((1/min(uBound9,((alphaBoundIn9*alphaBoundOut9)/(alphaBoundIn9+alphaBoundOut9)-1e-3)))-(1/alphaBoundIn9)-(1/alphaBoundOut9));
							end if;
						end if;
					end for;
					
					for i in 1:Bound loop
						if (Boundaries[i].groundContact) then
							Boundaries[i].TGround=ground(Boundaries[i].depthBound,EnvironmentConditions.DayOfYear,EnvironmentConditions.LeapYear,EnvironmentConditions.cGround,EnvironmentConditions.lambdaGround,EnvironmentConditions.rhoGround,EnvironmentConditions.GeoGradient,EnvironmentConditions.TAverageAmbientAnnual,EnvironmentConditions.TAmbientMax,EnvironmentConditions.MaxMonth);
						else
							Boundaries[i].TGround=0;
						end if;
						TGround[i]=Boundaries[i].TGround;
					end for;
			
					for i in 1:Bound loop
						if (not Boundaries[i].contactBound>0) then	
							if Boundaries[i].groundContact then
								TAmbientBound[i]=Boundaries[i].TGround;
							else
								TAmbientBound[i]=EnvironmentConditions.TAmbient;
							end if;
						else
							if(contactBound1>0) or (contactBound2>0 and Bound>1) or (contactBound3>0 and Bound>2) or (contactBound4>0 and Bound>3) or (contactBound5>0 and Bound>4) or (contactBound6>0 and Bound>5) or (contactBound7>0 and Bound>6) or (contactBound8>0 and Bound>7) or (contactBound9>0 and Bound>8) then
								TAmbientBound[i]=ZoneTemperatures[Boundaries[i].contactBound].ZoneTemperature;
							else
								TAmbientBound[i]=0;
							end if;
						end if;
					end for;
							
					CZoneAir=EnvironmentConditions.cpAir*EnvironmentConditions.rhoAir*AZone*hZone;
					if (Mass>0) then
						CZoneMass=ThreeVectorMult(Masses.cp,Masses.rho,Masses.V,Mass);
					else
						CZoneMass=0;
					end if;
									
					if (DINcalc) then
						if useDayTime then
							CoolLoadFactorPerson.u[1]=EnvironmentConditions.HourOfDay;
							CoolLoadFactorLight.u[1]=EnvironmentConditions.HourOfDay;
							CoolLoadFactorMachine.u[1]=EnvironmentConditions.HourOfDay;
							AppliedLoadFactorLight.u[1]=EnvironmentConditions.HourOfDay;
							AppliedLoadFactorMachine.u[1]=EnvironmentConditions.HourOfDay;
							NumberPersonDIN.u[1]=EnvironmentConditions.HourOfDay;
							PelDIN.u[1]=EnvironmentConditions.HourOfDay;
						else
							CoolLoadFactorPerson.u[1]=EnvironmentConditions.HourOfYear;
							CoolLoadFactorLight.u[1]=EnvironmentConditions.HourOfYear;
							CoolLoadFactorMachine.u[1]=EnvironmentConditions.HourOfYear;
							AppliedLoadFactorLight.u[1]=EnvironmentConditions.HourOfYear;
							AppliedLoadFactorMachine.u[1]=EnvironmentConditions.HourOfYear;
							NumberPersonDIN.u[1]=EnvironmentConditions.HourOfYear;
							PelDIN.u[1]=EnvironmentConditions.HourOfYear;
						end if;
					else	
						if useDayTime then
							ElectricalPower.u[1]=EnvironmentConditions.HourOfDay;
							ReactivePower.u[1]=EnvironmentConditions.HourOfDay;
							NumberPerson.u[1]=EnvironmentConditions.HourOfDay;
							BaseLoad.u[1]=EnvironmentConditions.HourOfDay;
							NormLoad.u[1]=EnvironmentConditions.HourOfDay;
							MachineLoad.u[1]=EnvironmentConditions.HourOfDay;
							LightLoad.u[1]=EnvironmentConditions.HourOfDay;
							InnerLoad.u[1]=EnvironmentConditions.HourOfDay;
						else
							ElectricalPower.u[1]=EnvironmentConditions.HourOfYear;
							ReactivePower.u[1]=EnvironmentConditions.HourOfYear;
							NumberPerson.u[1]=EnvironmentConditions.HourOfYear;
							BaseLoad.u[1]=EnvironmentConditions.HourOfYear;
							NormLoad.u[1]=EnvironmentConditions.HourOfYear;
							MachineLoad.u[1]=EnvironmentConditions.HourOfYear;
							LightLoad.u[1]=EnvironmentConditions.HourOfYear;
							InnerLoad.u[1]=EnvironmentConditions.HourOfYear;
						end if;
					end if;
					for i in 1:Bound loop
						AngleBound[i]=angleMinMax(diffAngle(EnvironmentConditions.RadiationVector,Boundaries[i].NormalVector),pi/2,0);
						if useWindowShading then
							QTransWindowAbsorp[i]=-Boundaries[i].gWindow*Boundaries[i].AWindow*(1-WindowShading[i])*(1-Boundaries[i].epsDirt)*(1-Boundaries[i].epsShading)*(1-Boundaries[i].epsFrame)*((EnvironmentConditions.RadiationDirect+0.25*EnvironmentConditions.RadiationDiffuse)*cos(AngleBound[i])+0.75*EnvironmentConditions.RadiationDiffuse*0.5*(cos(Boundaries[i].alphaInc)+1));
						else
							QTransWindowAbsorp[i]=-Boundaries[i].gWindow*Boundaries[i].AWindow*(1-Boundaries[i].epsDirt)*(1-Boundaries[i].epsShading)*(1-Boundaries[i].epsFrame)*((EnvironmentConditions.RadiationDirect+0.25*EnvironmentConditions.RadiationDiffuse)*cos(AngleBound[i])+0.75*EnvironmentConditions.RadiationDiffuse*0.5*(cos(Boundaries[i].alphaInc)+1));
						end if;
						QTransWindow[i]=(Boundaries[i].uWindow+uHeatBridge)*Boundaries[i].AWindow*(TZoneAct-TAmbientBound[i]);
						QTransOthers[i]=(Boundaries[i].uOthers+uHeatBridge)*Boundaries[i].AOthers*(TZoneAct-TAmbientBound[i]);
						if (Boundaries[i].groundContact) then
							QHeatBridgeAbsorp[i]=0;
							QBoundAbsorp[i]=0;
						else	
							QHeatBridgeAbsorp[i]=-uHeatBridge*(1-Boundaries[i].epsShading)*(Boundaries[i].ABound-Boundaries[i].AWindow-Boundaries[i].AOthers)*(Boundaries[i].alphaBound/Boundaries[i].alphaBoundOut)*((EnvironmentConditions.RadiationDirect+0.25*EnvironmentConditions.RadiationDiffuse)*cos(AngleBound[i])+0.75*EnvironmentConditions.RadiationDiffuse*0.5*(cos(Boundaries[i].alphaInc)+1));
							QBoundAbsorp[i]=-(Boundaries[i].uBound)*(1-Boundaries[i].epsShading)*(Boundaries[i].ABound-Boundaries[i].AWindow-Boundaries[i].AOthers)*(Boundaries[i].alphaBound/Boundaries[i].alphaBoundOut)*((EnvironmentConditions.RadiationDirect+0.25*EnvironmentConditions.RadiationDiffuse)*cos(AngleBound[i])+0.75*EnvironmentConditions.RadiationDiffuse*0.5*(cos(Boundaries[i].alphaInc)+1));
						end if;
						QHeatBridge[i]=uHeatBridge*(Boundaries[i].ABound-Boundaries[i].AWindow-Boundaries[i].AOthers)*(TZoneAct-TAmbientBound[i]);
						QBoundIn[i]=-Boundaries[i].alphaBoundIn*(Boundaries[i].ABound-Boundaries[i].AWindow-Boundaries[i].AOthers)*(Boundaries[i].TBoundIn-TZoneAct);
						
						if (Boundaries[i].dBound>1e-3) then
							QBoundChange[i]=-(Boundaries[i].lambdaBound/Boundaries[i].dBound)*(Boundaries[i].ABound-Boundaries[i].AWindow-Boundaries[i].AOthers)*(Boundaries[i].TBoundOut-Boundaries[i].TBoundIn);
						else
							QBoundChange[i]=0;
						end if;			
						if (Boundaries[i].groundContact) then
							QBoundOut[i]=QBoundChange[i];
						else
							QBoundOut[i]=Boundaries[i].alphaBoundOut*(Boundaries[i].ABound-Boundaries[i].AWindow-Boundaries[i].AOthers)*(Boundaries[i].TBoundOut-TAmbientBound[i])+QBoundAbsorp[i];
						end if;
						QBound[i]=(Boundaries[i].uBound)*(Boundaries[i].ABound-Boundaries[i].AWindow-Boundaries[i].AOthers)*(TZoneAct-TAmbientBound[i])+QBoundAbsorp[i];					
						
					end for;
					QAirLeak=EnvironmentConditions.cpAir*EnvironmentConditions.rhoAir*LAirLeak*AZone*hZone*(TZoneAct-EnvironmentConditions.TAmbient);
					if (DINcalc) then
						if not useVentilationSystem then
							QAirComfort=EnvironmentConditions.cpAir*EnvironmentConditions.rhoAir*LComfortVentilation*NumberPersonDIN.y[1]*(TZoneAct-EnvironmentConditions.TAmbient);
						else
							QAirComfort=EnvironmentConditions.cpAir*EnvironmentConditions.rhoAir*LComfortVentilation*NumberPersonDIN.y[1]*(TZoneAct-EnvironmentConditions.TAmbient)*(1-VentilationHeatExchangeRate);
						end if;
						QPerson=-(QBody+QPersonColdWater+QPersonElectricity)*NumberPersonDIN.y[1]*CoolLoadFactorPerson.y[1];
						QLight=-PLightInstall*CoolLoadFactorLight.y[1]*AppliedLoadFactorLight.y[1];
						QMachine=-PMachineInstall*etaMachine*CoolLoadFactorMachine.y[1]*AppliedLoadFactorMachine.y[1];
						QBase=0;
						QInner=0;
						QNorm=0;
						QelHeat=-PelDIN.y[1];
						Pel=-(-QPersonElectricity*NumberPersonDIN.y[1]*CoolLoadFactorPerson.y[1]+QLight+QMachine+QBase+QNorm+QelHeat);
						Qel=0;
						if (QAirComfort>1e-10 and useVentilationSystem) then
							PVent=LComfortVentilation*VentPower*NumberPersonDIN.y[1];
							QVent=PVent*tan(acos(cosPhiVent));
						else
							PVent=0;
							QVent=0;
						end if;					
					else
						if not useVentilationSystem then
							QAirComfort=EnvironmentConditions.cpAir*EnvironmentConditions.rhoAir*LComfortVentilation*NumberPerson.y[1]*(TZoneAct-EnvironmentConditions.TAmbient);
						else
							QAirComfort=EnvironmentConditions.cpAir*EnvironmentConditions.rhoAir*LComfortVentilation*NumberPerson.y[1]*(TZoneAct-EnvironmentConditions.TAmbient)*(1-VentilationHeatExchangeRate);
						end if;
						QPerson=-(QBody+QPersonColdWater+QPersonElectricity)*NumberPerson.y[1];
						QLight=-LightLoad.y[1];
						QMachine=-MachineLoad.y[1];
						QBase=-BaseLoad.y[1];
						QInner=-InnerLoad.y[1];
						QNorm=-NormLoad.y[1];
						QelHeat=-ElectricalPower.y[1];
						Pel=-(-QPersonElectricity*NumberPerson.y[1]+QLight+QMachine+QBase+QNorm+QelHeat);
						Qel=ReactivePower.y[1];
						if (QAirComfort>1e-10 and useVentilationSystem) then
							PVent=LComfortVentilation*VentPower*NumberPerson.y[1];
							QVent=PVent*tan(acos(cosPhiVent));
						else
							PVent=0;
							QVent=0;
						end if;
					end if;
					QHeatCoolLoad=sumVector1(QBoundIn,Boundaries.dBound,1,Bound)+sumVector2(QBound,Boundaries.dBound,1,Bound)+sumVector(QHeatBridge,1,Bound)+sumVector(QHeatBridgeAbsorp,1,Bound)+sumVector(QTransWindow,1,Bound)+sumVector(QTransOthers,1,Bound)+sumVector(QTransWindowAbsorp,1,Bound)+QAirLeak+QAirComfort+QPerson+QLight+QMachine+QInner+QNorm+QBase+QelHeat;	
					QTotal=sumVector(QHeatBridge,1,Bound)+sumVector(QHeatBridgeAbsorp,1,Bound)+sumVector(QTransWindow,1,Bound)+sumVector(QTransOthers,1,Bound)+sumVector(QTransWindowAbsorp,1,Bound)+QAirLeak+QAirComfort+QPerson+QLight+QMachine+QInner+QNorm+QBase+QelHeat;	
					
					if LoadCalculation then
						HeatCoolLoad=QHeatCoolLoad;
					end if;
					
					if (LoadCalculation) then
						der(TZoneAct)=der(TZoneRef);
					else	
						(CZoneAir+CZoneMass)*der(TZoneAct)=QHeatCool-QTotal-sumVector1(QBoundIn,Boundaries.dBound,1,Bound)-sumVector2(QBound,Boundaries.dBound,1,Bound);
					end if;		
																																
					for i in 1:Bound loop
						if (Boundaries[i].dBound>1e-3) then
							(Boundaries[i].ABound-Boundaries[i].AWindow-Boundaries[i].AOthers)*Boundaries[i].dBound/2*Boundaries[i].rhoBound*Boundaries[i].cpBound*der(Boundaries[i].TBoundIn)=QBoundIn[i]-QBoundChange[i];
							if (Boundaries[i].groundContact) then
								der(Boundaries[i].TBoundOut)=der(TAmbientBound[i]);
							else
								(Boundaries[i].ABound-Boundaries[i].AWindow-Boundaries[i].AOthers)*Boundaries[i].dBound/2*Boundaries[i].rhoBound*Boundaries[i].cpBound*der(Boundaries[i].TBoundOut)=-QBoundOut[i]+QBoundChange[i];
							end if;
						else
							der(Boundaries[i].TBoundIn)=der(TZoneAct);
							der(Boundaries[i].TBoundOut)=der(TAmbientBound[i]);
						end if;
					end for;
																			
					for i in 1:3 loop
						GridConnection.Phi[i]=calc_Phi(Pel+PVent,Qel+QVent);
						GridConnection.Ieff[i]=calc_current((Pel+PVent)/3,(Qel+QVent)/3,GridConnection.Veff[i]);
					end for;		
																																	
					if LoadCalculation then
						QHeat=0;
					else
						QHeat=max(QHeatCool,0);
					end if;
					TZone=TZoneAct;
					der(EHeat)=QHeat;
					der(Eel)=Pel;
				
					for i in 1:Bound loop
						TBoundIn[i]=Boundaries[i].TBoundIn;
						TBoundOut[i]=Boundaries[i].TBoundOut;	
					end for;
	equation
		connect(GridConnection.LVFlowCurrent,Grid3) annotation(
			Line(
				points={{480,-644},{480,-649},{480,-700}},
				color={247,148,29}),
			__esi_AutoRoute=false);
	annotation(
		Icon(
			coordinateSystem(extent={{-350,-200},{350,200}}),
			graphics={
							Bitmap(
								imageSource="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",
								extent={{-365,215},{369,-228}}),
							Text(
								textString="%ZoneIndex",
								extent={{-444,164},{-125,33}})}),
		Documentation(info="<HTML><HEAD>
<META http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\"> 
<TITLE>Building zone including inner heat losses and yields with variable 
 ventilation losses, dependent on presence</TITLE> 
<STYLE type=\"text/css\">
table>tbody>tr:hover,th{background-color:#edf1f3}html{font-size:90%}body,table{font-size:1rem}body{font-family:'Open Sans',Arial,sans-serif;color:#465e70}h1,h2{margin:1em 0 .6em;font-weight:600}p{margin-top:.3em;margin-bottom:.2em}table{border-collapse:collapse;margin:1em 0;width:100%;}tr{border:1px solid #beccd3}td,th{padding:.3em 1em; border-width: 1px; border-style: solid; border-color: rgb(190, 204, 211);}td{word-break:break-word}tr:nth-child(even){background-color:#fafafa}th{font-family:'Open Sans Semibold',Arial,sans-serif;font-weight:700;text-align:left;word-break:keep-all}.lib-wrap{width:70%}@media screen and (max-width:800px){.lib-wrap{width:100%}}td p{margin:.2em}
</STYLE>
  
<META name=\"GENERATOR\" content=\"MSHTML 11.00.10570.1001\"></HEAD> 
<BODY>
<H1>Building zone including inner heat losses and yields with variable 
 ventilation losses</H1>
<P>Based on GreenCity's 'Building Zone Simulation of Inner Heat Losses and 
 Yields'</P>
<P><BR></P>
<P>Changes:</P>
<UL>
  <LI>Ventilation losses are not constant, defined by the connector   
  'LComfortVentilation',</LI></UL>
<HR>

<DIV class=\"lib-wrap\">
<TABLE class=\"type\">
  <TBODY>
  <TR>
    <TH>Symbol:</TH>
    <TD colspan=\"3\"><IMG width=\"414\" height=\"159\" src=\"data:image/png;base64,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\"></TD></TR>
  <TR>
    <TH>Identifier:</TH>
    <TD 
      colspan=\"3\">CoSES_Models.Consumer.Submodels.BuildingZone_VariableVentilation</TD></TR>
  <TR>
    <TH>Version:</TH>
    <TD colspan=\"3\">1.0</TD></TR>
  <TR>
    <TH>File:</TH>
    <TD colspan=\"3\">BuildingZone_VariableVentilation.mo</TD></TR>
  <TR>
    <TH>Connectors:</TH>
    <TD>Zone temperature</TD>
    <TD>TZone</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heating and cooling power feeded to building zone</TD>
    <TD>QHeatCool</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Air volume flow of ventilation due to comfort</TD>
    <TD>LComfortVentilation</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>3-phase connection to Grid</TD>
    <TD>Grid3</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Ambient Conditions Connection</TD>
    <TD>EnvironmentConditions</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>Parameters:</TH>
    <TD>Table look-up in one dimension (matrix/file) with n inputs and n       
      outputs</TD>
    <TD>CoolLoadFactorPerson</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Table look-up in one dimension (matrix/file) with n inputs and n       
      outputs</TD>
    <TD>CoolLoadFactorLight</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Table look-up in one dimension (matrix/file) with n inputs and n       
      outputs</TD>
    <TD>CoolLoadFactorMachine</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Table look-up in one dimension (matrix/file) with n inputs and n       
      outputs</TD>
    <TD>AppliedLoadFactorLight</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Table look-up in one dimension (matrix/file) with n inputs and n       
      outputs</TD>
    <TD>AppliedLoadFactorMachine</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Table look-up in one dimension (matrix/file) with n inputs and n       
      outputs</TD>
    <TD>PelDIN</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Table look-up in one dimension (matrix/file) with n inputs and n       
      outputs</TD>
    <TD>NumberPersonDIN</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Table look-up in one dimension (matrix/file) with n inputs and n       
      outputs</TD>
    <TD>NumberPerson</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Table look-up in one dimension (matrix/file) with n inputs and n       
      outputs</TD>
    <TD>ElectricalPower</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Table look-up in one dimension (matrix/file) with n inputs and n       
      outputs</TD>
    <TD>ReactivePower</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Table look-up in one dimension (matrix/file) with n inputs and n       
      outputs</TD>
    <TD>BaseLoad</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Table look-up in one dimension (matrix/file) with n inputs and n       
      outputs</TD>
    <TD>NormLoad</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Table look-up in one dimension (matrix/file) with n inputs and n       
      outputs</TD>
    <TD>MachineLoad</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Table look-up in one dimension (matrix/file) with n inputs and n       
      outputs</TD>
    <TD>LightLoad</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Table look-up in one dimension (matrix/file) with n inputs and n       
      outputs</TD>
    <TD>InnerLoad</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Specifies current and phase angle, extracts voltage of a 3-phase       
      connector</TD>
    <TD>GridConnection</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Zone Index</TD>
    <TD>ZoneIndex</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Number of Zones</TD>
    <TD>NumberZones</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Number of Boundaries</TD>
    <TD>Bound</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Number of inner Masses</TD>
    <TD>Mass</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Initial zone temperature</TD>
    <TD>TZoneInit</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>If enabled, only cooling and heating load calculation</TD>
    <TD>LoadCalculation</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>If enabled, database = HourOfDay, else database = HourOfYear</TD>
    <TD>useDayTime</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>External shading of windows, separately for each boundary is 
     enabled</TD>
    <TD>useWindowShading</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Net floor space of the zone</TD>
    <TD>AZone</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Height of zone</TD>
    <TD>hZone</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Installed electrical power of light</TD>
    <TD>PLightInstall</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Installed electrical power of machines</TD>
    <TD>PMachineInstall</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Efficiency factor of machines</TD>
    <TD>etaMachine</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>DIN calculations enabled/disabled</TD>
    <TD>DINcalc</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Table name for DIN cool load factors</TD>
    <TD>CoolFactorTable</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Table name for DIN load factors for light</TD>
    <TD>LoadLightTable</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Table name for DIN load factors for machines</TD>
    <TD>LoadMachineTable</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>File name for DIN cool and load factors</TD>
    <TD>DINfile</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>File name for number of persons while DIN calculations</TD>
    <TD>NumberPersonDINFile</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Table name for number of persons while DIN calculations</TD>
    <TD>NumberPersonDINTable</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>File name for electrical power while DIN calculations</TD>
    <TD>PelDINFile</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Table name for electrical power while DIN calculations</TD>
    <TD>PelDINTable</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>File name for inner loads</TD>
    <TD>InputDataFile</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Table name for inner loads due to body heat of that number of 
     person</TD>
    <TD>NumberPersonTable</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Table name for inner loads due to basic loads</TD>
    <TD>BaseLoadTable</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Table name for inner loads due to normal loads</TD>
    <TD>NormLoadTable</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Table name for inner loads due to machines</TD>
    <TD>MachineLoadTable</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Table name for inner loads due to light</TD>
    <TD>LightLoadTable</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Table name for inner loads due to other loads</TD>
    <TD>InnerLoadTable</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Table name for further electrical power characteristics</TD>
    <TD>PelTable</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Table name for further electrical power characteristics</TD>
    <TD>QelTable</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Body heat dissipation per person</TD>
    <TD>QBody</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Individual heat losses by cold water usage per person</TD>
    <TD>QPersonColdWater</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heat dissipation by usage of electrical devices per person</TD>
    <TD>QPersonElectricity</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Air leak of zone</TD>
    <TD>LAirLeak</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>If enabled, ventilation losses and gains are modified by       
      VentilationHeatExchangeRate</TD>
    <TD>useVentilationSystem</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heat exchange correction factor (heating and cooling) for ventilation  
           losses by using ventilation systems</TD>
    <TD>VentilationHeatExchangeRate</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Electrical power of ventilation system [W/(m3/s)]</TD>
    <TD>VentPower</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Power factor of ventilation system</TD>
    <TD>cosPhiVent</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Equlivalent additional heat transmission value for heat bridges</TD>
    <TD>uHeatBridge</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Volume of inner Mass 1</TD>
    <TD>VMass1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Specific heat capacity of inner Mass 1</TD>
    <TD>cpMass1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Density of inner Mass 1</TD>
    <TD>rhoMass1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Volume of inner Mass 2</TD>
    <TD>VMass2</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Specific heat capacity of inner Mass 2</TD>
    <TD>cpMass2</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Density of inner Mass 2</TD>
    <TD>rhoMass2</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Volume of inner Mass 3</TD>
    <TD>VMass3</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Specific heat capacity of inner Mass 3</TD>
    <TD>cpMass3</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Density of inner Mass 3</TD>
    <TD>rhoMass3</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Volume of inner Mass 4</TD>
    <TD>VMass4</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Specific heat capacity of inner Mass 4</TD>
    <TD>cpMass4</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Density of inner Mass 4</TD>
    <TD>rhoMass4</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Boundary 1 is connected to: '0'-Ambience, '1,2,3 ...-Zone 1,2,3 ...</TD>
    <TD>contactBound1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Surface area of boundary 1</TD>
    <TD>ABound1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Window surface area of boundary 1</TD>
    <TD>AWindow1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Other surfaces of boundary 1</TD>
    <TD>AOthers1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Thickness of boundary 1</TD>
    <TD>dBound1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Density of boundary 1</TD>
    <TD>rhoBound1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Specific heat capacity of boundary 1</TD>
    <TD>cpBound1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heat transmission value of boundary 1</TD>
    <TD>uBound1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heat transmission value of window in boundary 1</TD>
    <TD>uWindow1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heat transmission value of other surfaces in boundary 1</TD>
    <TD>uOthers1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Boundary 1 has contact to ground</TD>
    <TD>groundContact1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Depth of boundary 1, if it is ground contacted</TD>
    <TD>depthBound1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Dirt correction value for window in boundary 1 (0: fully irradiated,   
          1: fully shaded)</TD>
    <TD>epsDirt1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Shading correction value for boundary 1 (0: fully irradiated, 1: fully 
            shaded)</TD>
    <TD>epsShading1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Frame correction value for window in boundary 1 (0: fully irradiated,  
           1: fully shaded)</TD>
    <TD>epsFrame1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Inclination angle of boundary 1</TD>
    <TD>alphaInclination1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Orientation angle of boundary 1</TD>
    <TD>alphaOrientation1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Total translucency of window in boundary 1</TD>
    <TD>gWindow1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Absorption coefficient of boundary 1</TD>
    <TD>alphaBound1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Outer heat transmission coefficient of boundary 1</TD>
    <TD>alphaBoundOut1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Inner heat transmission coefficient of boundary 1</TD>
    <TD>alphaBoundIn1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Boundary 2 is connected to: '0'-Ambience, '1,2,3 ...-Zone 1,2,3 ...</TD>
    <TD>contactBound2</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Surface area of boundary 2</TD>
    <TD>ABound2</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Window surface area of boundary 2</TD>
    <TD>AWindow2</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Other surfaces of boundary 2</TD>
    <TD>AOthers2</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Thickness of boundary 2</TD>
    <TD>dBound2</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Density of boundary 2</TD>
    <TD>rhoBound2</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Specific heat capacity of boundary 2</TD>
    <TD>cpBound2</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heat transmission value of boundary 2</TD>
    <TD>uBound2</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heat transmission value of window in boundary 2</TD>
    <TD>uWindow2</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heat transmission value of other surfaces in boundary 2</TD>
    <TD>uOthers2</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Boundary 2 has contact to ground</TD>
    <TD>groundContact2</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Depth of boundary 2, if it is ground contacted</TD>
    <TD>depthBound2</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Dirt correction value for window in boundary 2 (0: fully irradiated,   
          1: fully shaded)</TD>
    <TD>epsDirt2</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>shading correction value for  Boundary 2 (0: fully irradiated, 1:      
       fully shaded)</TD>
    <TD>epsShading2</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Frame correction value for window in boundary 2 (0: fully irradiated,  
           1: fully shaded)</TD>
    <TD>epsFrame2</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Inclination angle of boundary 2</TD>
    <TD>alphaInclination2</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Orientation angle of boundary 2</TD>
    <TD>alphaOrientation2</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Total translucency of window in boundary 2</TD>
    <TD>gWindow2</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Absorption coefficient of boundary 2</TD>
    <TD>alphaBound2</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Outer heat transmission coefficient of boundary 2</TD>
    <TD>alphaBoundOut2</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Inner heat transmission coefficient of boundary 2</TD>
    <TD>alphaBoundIn2</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Boundary 3 is connected to: '0'-Ambience, '1,2,3 ...-Zone 1,2,3 ...</TD>
    <TD>contactBound3</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Surface area of boundary 3</TD>
    <TD>ABound3</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Window surface area of boundary 3</TD>
    <TD>AWindow3</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Other surfaces of boundary 3</TD>
    <TD>AOthers3</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Thickness of boundary 3</TD>
    <TD>dBound3</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Density of boundary 3</TD>
    <TD>rhoBound3</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Specific heat capacity of boundary 3</TD>
    <TD>cpBound3</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heat transmission value of boundary 3</TD>
    <TD>uBound3</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heat transmission value of window in boundary 3</TD>
    <TD>uWindow3</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heat transmission value of other surfaces in boundary 3</TD>
    <TD>uOthers3</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Boundary 3 has contact to ground</TD>
    <TD>groundContact3</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Depth of boundary 3, if it is ground contacted</TD>
    <TD>depthBound3</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Dirt correction value for window in boundary 3 (0: fully irradiated,   
          1: fully shaded)</TD>
    <TD>epsDirt3</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Shading correction value for boundary 3 (0: fully irradiated, 1: fully 
            shaded)</TD>
    <TD>epsShading3</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Frame correction value for window in boundary 3 (0: fully irradiated,  
           1: fully shaded)</TD>
    <TD>epsFrame3</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Inclination angle of boundary 3</TD>
    <TD>alphaInclination3</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Orientation angle of boundary 3</TD>
    <TD>alphaOrientation3</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Total translucency of window in boundary 3</TD>
    <TD>gWindow3</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Absorption coefficient of boundary 3</TD>
    <TD>alphaBound3</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Outer heat transmission coefficient of boundary 3</TD>
    <TD>alphaBoundOut3</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Inner heat transmission coefficient of boundary 3</TD>
    <TD>alphaBoundIn3</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Boundary 4 is connected to: '0'-Ambience, '1,2,3 ...-Zone 1,2,3 ...</TD>
    <TD>contactBound4</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Surface area of boundary 4</TD>
    <TD>ABound4</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Window surface area of boundary 4</TD>
    <TD>AWindow4</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Other surfaces of boundary 4</TD>
    <TD>AOthers4</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Thickness of boundary 4</TD>
    <TD>dBound4</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Density of boundary 4</TD>
    <TD>rhoBound4</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Specific heat capacity of boundary 4</TD>
    <TD>cpBound4</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heat transmission value of boundary 4</TD>
    <TD>uBound4</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heat transmission value of window in boundary 4</TD>
    <TD>uWindow4</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heat transmission value of other surfaces in boundary 4</TD>
    <TD>uOthers4</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Boundary 4 has contact to ground</TD>
    <TD>groundContact4</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Depth of boundary 4, if it is ground contacted</TD>
    <TD>depthBound4</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Dirt correction value for window in boundary 4 (0: fully irradiated,   
          1: fully shaded)</TD>
    <TD>epsDirt4</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Shading correction value for boundary 4 (0: fully irradiated, 1: fully 
            shaded)</TD>
    <TD>epsShading4</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Frame correction value for window in boundary 4 (0: fully irradiated,  
           1: fully shaded)</TD>
    <TD>epsFrame4</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Inclination angle of boundary 4</TD>
    <TD>alphaInclination4</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Orientation angle of boundary 4</TD>
    <TD>alphaOrientation4</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Total translucency of window in boundary 4</TD>
    <TD>gWindow4</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Absorption coefficient of boundary 4</TD>
    <TD>alphaBound4</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Outer heat transmission coefficient of boundary 4</TD>
    <TD>alphaBoundOut4</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Inner heat transmission coefficient of boundary 4</TD>
    <TD>alphaBoundIn4</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Boundary 5 is connected to: '0'-Ambience, '1,2,3 ...-Zone 1,2,3 ...</TD>
    <TD>contactBound5</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Surface area of boundary 5</TD>
    <TD>ABound5</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Window surface area of boundary 5</TD>
    <TD>AWindow5</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Other surfaces of boundary 5</TD>
    <TD>AOthers5</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Thickness of boundary 5</TD>
    <TD>dBound5</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Density of boundary 5</TD>
    <TD>rhoBound5</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Specific heat capacity of boundary 5</TD>
    <TD>cpBound5</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heat transmission value of boundary 5</TD>
    <TD>uBound5</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heat transmission value of window in boundary 5</TD>
    <TD>uWindow5</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heat transmission value of other surfaces in boundary 5</TD>
    <TD>uOthers5</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Boundary 5 has contact to ground</TD>
    <TD>groundContact5</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Depth of boundary 5, if it is ground contacted</TD>
    <TD>depthBound5</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Dirt correction value for window in boundary 5 (0: fully irradiated,   
          1: fully shaded)</TD>
    <TD>epsDirt5</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Shading correction value for boundary 5 (0: fully irradiated, 1: fully 
            shaded)</TD>
    <TD>epsShading5</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Frame correction value for window in boundary 5 (0: fully irradiated,  
           1: fully shaded)</TD>
    <TD>epsFrame5</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Inclination angle of boundary 5</TD>
    <TD>alphaInclination5</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Orientation angle of boundary 5</TD>
    <TD>alphaOrientation5</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Total translucency of window in boundary 5</TD>
    <TD>gWindow5</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Absorption coefficient of boundary 5</TD>
    <TD>alphaBound5</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Outer heat transmission coefficient of boundary 5</TD>
    <TD>alphaBoundOut5</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Inner heat transmission coefficient of boundary 5</TD>
    <TD>alphaBoundIn5</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Boundary 6 is connected to: '0'-Ambience, '1,2,3 ...-Zone 1,2,3 ...</TD>
    <TD>contactBound6</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Surface area of boundary 6</TD>
    <TD>ABound6</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Window surface area of boundary 6</TD>
    <TD>AWindow6</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Other surfaces of boundary 6</TD>
    <TD>AOthers6</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Thickness of boundary 6</TD>
    <TD>dBound6</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Density of boundary 6</TD>
    <TD>rhoBound6</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Specific heat capacity of boundary 6</TD>
    <TD>cpBound6</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heat transmission value of boundary 6</TD>
    <TD>uBound6</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heat transmission value of window in boundary 6</TD>
    <TD>uWindow6</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heat transmission value of other surfaces in boundary 6</TD>
    <TD>uOthers6</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Boundary 6 has contact to ground</TD>
    <TD>groundContact6</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Depth of boundary 6, if it is ground contacted</TD>
    <TD>depthBound6</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Dirt correction value for window in boundary 6 (0: fully irradiated,   
          1: fully shaded)</TD>
    <TD>epsDirt6</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Shading correction value for boundary 6 (0: fully irradiated, 1: fully 
            shaded)</TD>
    <TD>epsShading6</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Frame correction value for window in boundary 6 (0: fully irradiated,  
           1: fully shaded)</TD>
    <TD>epsFrame6</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Inclination angle of boundary 6</TD>
    <TD>alphaInclination6</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Orientation angle of boundary 6</TD>
    <TD>alphaOrientation6</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Total translucency of window in boundary 6</TD>
    <TD>gWindow6</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Absorption coefficient of boundary 6</TD>
    <TD>alphaBound6</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Outer heat transmission coefficient of boundary 6</TD>
    <TD>alphaBoundOut6</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Inner heat transmission coefficient of boundary 6</TD>
    <TD>alphaBoundIn6</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Boundary 7 is connected to: '0'-Ambience, '1,2,3 ...-Zone 1,2,3 ...</TD>
    <TD>contactBound7</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Surface area of boundary 7</TD>
    <TD>ABound7</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Window surface area of boundary 7</TD>
    <TD>AWindow7</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Other surfaces of boundary 7</TD>
    <TD>AOthers7</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Thickness of boundary 7</TD>
    <TD>dBound7</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Density of boundary 7</TD>
    <TD>rhoBound7</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Specific heat capacity of boundary 7</TD>
    <TD>cpBound7</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heat transmission value of boundary 7</TD>
    <TD>uBound7</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heat transmission value of window in boundary 7</TD>
    <TD>uWindow7</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heat transmission value of other surfaces in boundary 7</TD>
    <TD>uOthers7</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Boundary 7 has contact to ground</TD>
    <TD>groundContact7</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Depth of boundary 7, if it is ground contacted</TD>
    <TD>depthBound7</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Dirt correction value for window in boundary 7 (0: fully irradiated,   
          1: fully shaded)</TD>
    <TD>epsDirt7</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Shading correction value for boundary 7 (0: fully irradiated, 1: fully 
            shaded)</TD>
    <TD>epsShading7</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Frame correction value for window in boundary 7 (0: fully       
      irradiated,1: fully shaded)</TD>
    <TD>epsFrame7</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Inclination angle of boundary 7</TD>
    <TD>alphaInclination7</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Orientation angle of boundary 7</TD>
    <TD>alphaOrientation7</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Total translucency of window in boundary 7</TD>
    <TD>gWindow7</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Absorption coefficient of boundary 7</TD>
    <TD>alphaBound7</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Outer heat transmission coefficient of boundary 7</TD>
    <TD>alphaBoundOut7</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Inner heat transmission coefficient of boundary 7</TD>
    <TD>alphaBoundIn7</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Boundary 8 is connected to: '0'-Ambience, '1,2,3 ...-Zone 1,2,3 ...</TD>
    <TD>contactBound8</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Surface area of boundary 8</TD>
    <TD>ABound8</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Window surface area of boundary 8</TD>
    <TD>AWindow8</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Other surfaces of boundary 8</TD>
    <TD>AOthers8</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Thickness of boundary 8</TD>
    <TD>dBound8</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Density of boundary 8</TD>
    <TD>rhoBound8</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Specific heat capacity of boundary 8</TD>
    <TD>cpBound8</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heat transmission value of boundary 8</TD>
    <TD>uBound8</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heat transmission value of window in boundary 8</TD>
    <TD>uWindow8</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heat transmission value of other surfaces in boundary 8</TD>
    <TD>uOthers8</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Boundary 8 has contact to ground</TD>
    <TD>groundContact8</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Depth of boundary 8, if it is ground contacted</TD>
    <TD>depthBound8</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Dirt correction value for window in boundary 8 (0: fully irradiated,   
          1: fully shaded)</TD>
    <TD>epsDirt8</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>shading correction value for  Boundary 8 (0: fully irradiated, 1:      
       fully shaded)</TD>
    <TD>epsShading8</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Frame correction value for window in boundary 8 (0: fully irradiated,  
           1: fully shaded)</TD>
    <TD>epsFrame8</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Inclination angle of boundary 8</TD>
    <TD>alphaInclination8</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Orientation angle of boundary 8</TD>
    <TD>alphaOrientation8</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Total translucency of window in boundary 8</TD>
    <TD>gWindow8</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Absorption coefficient of boundary 8</TD>
    <TD>alphaBound8</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Outer heat transmission coefficient of boundary 8</TD>
    <TD>alphaBoundOut8</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Inner heat transmission coefficient of boundary 8</TD>
    <TD>alphaBoundIn8</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Boundary 9 is connected to: '0'-Ambience, '1,2,3 ...-Zone 1,2,3 ...</TD>
    <TD>contactBound9</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Surface area of boundary 9</TD>
    <TD>ABound9</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Window surface area of boundary 9</TD>
    <TD>AWindow9</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Other surfaces of boundary 9</TD>
    <TD>AOthers9</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Thickness of boundary 9</TD>
    <TD>dBound9</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Density of boundary 9</TD>
    <TD>rhoBound9</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Specific heat capacity of boundary 9</TD>
    <TD>cpBound9</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heat transmission value of boundary 9</TD>
    <TD>uBound9</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heat transmission value of window in boundary 9</TD>
    <TD>uWindow9</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heat transmission value of other surfaces in boundary 9</TD>
    <TD>uOthers9</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Boundary 9 has contact to ground</TD>
    <TD>groundContact9</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Depth of boundary 9, if it is ground contacted</TD>
    <TD>depthBound9</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Dirt correction value for window in boundary 9 (0: fully irradiated,   
          1: fully shaded)</TD>
    <TD>epsDirt9</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Shading correction value for boundary 9 (0: fully irradiated, 1: fully 
            shaded)</TD>
    <TD>epsShading9</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Frame correction value for window in boundary 9 (0: fully irradiated,  
           1: fully shaded)</TD>
    <TD>epsFrame9</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Inclination angle of boundary 9</TD>
    <TD>alphaInclination9</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Orientation angle of boundary 9</TD>
    <TD>alphaOrientation9</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Total translucency of window in boundary 9</TD>
    <TD>gWindow9</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Absorption coefficient of boundary 9</TD>
    <TD>alphaBound9</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Outer heat transmission coefficient of boundary 9</TD>
    <TD>alphaBoundOut9</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Inner heat transmission coefficient of boundary 9</TD>
    <TD>alphaBoundIn9</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>Results:</TH>
    <TD>Desired zone temperature</TD>
    <TD>TZoneRef</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Zone temperature</TD>
    <TD>TZone</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heat power</TD>
    <TD>QHeat</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heating and cooling power feeded to building zone</TD>
    <TD>QHeatCool</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Control output for resulting heating and cooling load when       
      Heating-Cooling-Load-Calculation is used</TD>
    <TD>HeatCoolLoad</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Vector for external shading of windows for each boundary (0: fully     
        irradiated, 1: fully shaded)</TD>
    <TD>WindowShading</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Effective ventilation power</TD>
    <TD>PVent</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Electrical effective power of the zone</TD>
    <TD>Pel</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Energy, used for heating the zone during simulation time period</TD>
    <TD>EHeat</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Electrical energy demand of the zone during simulation time period</TD>
    <TD>Eel</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Air volume flow of ventilation due to comfort</TD>
    <TD>LComfortVentilation</TD>
    <TD>&nbsp;</TD></TR></TBODY></TABLE></DIV>
<H2>Description:</H2>
<P>From 'Building Zone Simulation of Inner Heat Losses and Yields':</P>
<P><BR></P>
<P>The Building Zone model  simulates various influences on the internal 
 temperature of a building.  It additionally includes and considers the behavior 
 of persons inside a building  which have effect on the electricity and heat 
 demand of the energy system. A  zone model can be coupled with other zone 
models  via the temperature  interface. That way, it is possible to model a 
complex  building with different  rooms or zones and heat and electricity 
demand. Apposed  to the  'HeatedZone'-model the 'BuildingZone' does not include 
models for  internal heating system simulation (e.g. floor heating). Heating 
power can only  be  provided by external models. Therefore the 
'QHeatCool'-connector has  to be  connected to correspondent model connectors 
(if 'LoadCalculation' is  'true').  This way several heating or cooling systems 
can be used to supply the associated  power to the  building zone.</P>
<P></P>
<P>The zone temperature depends on  various influences:</P>
<P></P>
<UL>
  <LI value=\"1\">Heat transmission through  walls, windows and other boundaries   
  (e.g. doors) (q<SUB><FONT size=\"2\">trans</FONT></SUB>)</LI>
  <LI value=\"2\">Heat bridge losses (q<SUB><FONT size=\"2\">HB</FONT></SUB>)</LI>
  <LI value=\"3\">Solar yields (q<SUB><FONT size=\"2\">sol</FONT></SUB>)</LI>
  <LI value=\"4\">Ventilation losses (q<SUB><FONT size=\"2\">vent</FONT></SUB>)</LI>
  <LI value=\"5\">Internal yields and losses  via persons as well as electricity   
  and water usage (q<SUB><FONT size=\"2\">el</FONT></SUB>,  q<SUB><FONT 
  size=\"2\">pers</FONT></SUB>)</LI>
  <LI value=\"6\">Internal heat storage (air, walls,  inner masses) (Q) </LI></UL>
<P><IMG align=\"baseline\" alt=\"\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAA4IAAAJGCAYAAAAOBzt3AAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsQAAA7EAZUrDhsAAP+lSURBVHhe7F0LYBTltT5REPAZERUr1WgTxIhtfLTFRCtoKyRYDWqj+GiItgT6MKEtV+ilBSqtWNpLUttC0lpIq4VSlViFBVsFHwTaaqU1RiTRRkXFBxrxwdvc8/0zszu72cfM7szuzO45vXNDdv/H+b//zzjfnFdeLwuJCAKCgCAgCAgCgoAgIAgIAoKAICAI5AwCB+XMSmWhgoAgIAgIAoKAICAICAKCgCAgCAgCCgEhgnIQBAFBQBAQBAQBQUAQEAQEAUFAEMgxBIQI5tiGy3IFAUFAEBAEBAFBQBAQBAQBQUAQECIoZ0AQEAQEAUFAEBAEBAFBQBAQBASBHENAiGCObbgsVxAQBAQBQUAQEAQEAUFAEBAEBAEhgnIGBAFBQBAQBAQBQUAQEAQEAUFAEMgxBIQI5tiGy3IFAUFAEBAEBAFBQBAQBAQBQUAQECIoZ0AQEAQEAUFAEBAEBAFBQBAQBASBHENAiGCObbgs1x8IBPyhpmgpCAgCgoAgIAgIAoKAIOBTBPJ6WXyqu6gtCAgCgoAgIAgIAoKAICAICAKCgCCQBAJiEUwCNOkiCAgCgoAgIAhkFoEA1eblUV5ZI3VlVpEUZvfjGvyocwpbJF0FAUEgqxEQi2BWb68sThAQBAQBQaCrsYyK6tvSB8Tk1dTbVJ6++WQmQUAQEAQEAUEgCQTEIpgEaNJFEBAEBAFBwD8IFNbNosn+UVc0FQQEAUFAEBAE0oKAEMG0wCyTCAKCgCAgCGQOgXJq6l0dnQzCeseh8ildnQ1Umq7FBWopDy6hfnYL9eMa/Khzus6kzCMICAK+RUCIoG+3ThQXBAQBQUAQsI4AyGAnNUQytuYKyqtNMU9vYR1tYDK5Oh1mx/Im6tWJZ2nVeCq0DoB3WvpxDX7U2Ts7LpoIAoKARxEQIujRjRG1BAFBQBDIGAJm64dhffKVBaqLGsvyqC+/K6S6DS6RQd6s8qYYVkeHN7Jr1QpqYxtk1Xhf0kCFhmtr6GqkMvOZjfx35KGIddajvByIqzPmzVjinujnPVCrW47j4RHru4ytxeE/FpvD+RazjJ4/myBLc08hIETQU9shyggCgoAgkDkEgg9BFUSrI90lYe5qq6cifnAsa/Rwnkr1YF9EHbN6KXq+FjfJYDlVpsEq2NnBiW9Kq8jHPJBcW4NunTWspsZf0+TVuvtv5KGApS/MbXiydvajHJ64OvO8LVUr1N9HqgZmW3eAmOe9i7a2Y6RSaugMd33uDJrF9bWa/9Z1s7Zvrc22wIts7GPMMnX+UsJbOnsCAdQRFBEEBAFBQBDIYQQ6G3rZYxI1ZXv5gTm2mNqV8tOl14QfcHkNpb3WVOvs5edhteawKy4AFla8enIvpTpG3GlW9zLX7PUi/hbQ0ZukYw2m/S1t6I1/WjV94u+bRZ2x/2nan7jnHX+rUddtwiXqOcX3Vv+GrO+4L1pmA2ZpPH++2FNRMiECYhH0BB0XJQQBQUAQyAwCKK2QV1SvXA1hOYhb9YDfOs/SLV5t9Qsoxcg6RxdslIiYvHoD1VnymHTJMlhU7G7imEArNfvcLZTSvYaRw+PGUnY1zqPm0gbqjHf4reoMCyNb1drqi1y1nCc6712rOqiqpa7vurtW0Qq9ksrkylglTkbScEt/Q47+CWd8sKzALE3nL+ObJQo4hoAQQceglIEEAUFAEPAXAub6elYJVHnQ97GZ5nnFRZTjY6pRJ5AzgNor3+cCGYRroj0lbB2aLvj7KbdQjgur9WcxeU+tQZ2dkbR6QxTSZNoZWzrzw7jmSV1NrvyJWDjvnVQc1XVYi3PUXEaLi2IcvapKysUqmFmDmdvnz9YdSxp7HoGENkNpIAgIAoKAIJB9COguRLbd2Ezuoe66QFqF3HB1S8WdzSU3UatLsNGOCYbuyprKem1M6ELT9KxBd/eM66aptbHiyWtbZ+PvJKFbql2AUznvdtxl7eqVre19iplr5y9b9zl31yUWQc9TdVFQEBAEBAGnEQhQbUWzPuhkmmXNl7KvEu1bKeNpYwILCMbA1JKnxLEMeix7YnmTkfjDqgus02cn1nha5spgjUOVjbIsqkUsLWvo2koqVwrLyBh+joHaCmpv6LRkRbatc+F4qkKpEk6wtMBJH+qUznsnIc+Qsgf6tfRIuo5zcB6fYubW+Us7/jKh2wgIEXQbYRlfEBAEBAGPIaBionSdShum23MD6+zQXcu8sCgmH/O0laT+YBuDDCJTajrIYJSyB57Ozmrafi3bbDVRi0FSjTIabVRflOYsmoZeCc4p3KIraDVtSPYlSMLjX0jjFRMkap7nlAtviuddxTmqvxZflx5JCL2TDXyLmRvnz0lgZSyvICBE0Cs7IXoIAoKAIJAWBAK0QJnQIPatgSpWypAESThcX44p8UUsq489HTJBBtk6C+sZJ+wZaZQ4QDp/PeFIWksR2AOLW2u6zyvu5BIMZgtlOTXpRe+dJUK2FVSkp08snBEX6GIsJzQtHD5SU7htBa1ywnSe4nkPtOqvf3xeeiSZU5BsHz9j5vj5SxZE6edpBIQIenp7RDlBQBAQBJxFwGwNpMn2k0KoWmq6xM46qDeIVazbQoFrKwTIUuIL2/ClkQwqK2CFlrGSyV+Il4QsP+1bnWAQtkGw0AGuoKx7rJcJhmuaIkId1GlhRCebhF5YRGbAZPJatIKqOpvsWcKTUS6YQbaNVjjABFM77wEyeCD7ysbNoprMUrOzj88xc/j8Zecey6qECMoZEAQEAUEgZxDoolVG7nhec0Ii1wcX04NRvKyDRj9VrDu8mLXV360Ya0Kk1Ol099HJYOrupyZAQQJV2Q4u6t0nY6URl2TfYpuuo9zVWK3FZsZ8mVBIhkEsXTqZ5wmejdJiMifH1OICWyyWGElR88LhpNsEmQunToVTOu9BF8dk/u5TxMGv3f2OmcPnz6/bKHrHR0CIoJwQQUAQEARyBoFQ4oO46eNj4WF6MKLJs9LzMB1zb7rI7KXq/BZGkEEuTeFcPBlb06pBAlHxIpplil0rFYF2z2ql6kfCMptM/KNRvgC1J6fHKjRg2p8IMpbsXqWkM0/qflxgnJXFSaxkbV2pnfeQhXQyxSwfmOzGZGm/rMLMC4m9svSc+H1ZQgT9voOivyAgCAgCVhEwZVLkXIo2i0aH3BVBImMTAKvK+KBdMENjgmLjdpdiGjcmj7I7pq32pjjRJLJaBl0U48aaOZ1t0Y7OJtJkuEGmKS7Q1jaoxnbWZX90rYfJEyAJd/BkZ3Wln8vu5iGdswgzVzZCBs0WBIQIZstOyjoEAUFAELCDgF0rjUFeMEfGrYF2FppkW7huqhIb0Vw3kxxTfyh3LtNpsnqU0/QGLaMlcXyiPTIaekCO6yobfOngVIZKOzqbSKjKFAMLbJriAm1viZ112R5c54GryPAIL41ZRT7JsdPdzWV38+ByTIl5fI9ZuvdI5vMVAkIEfbVdoqwgIAgIAplAILzu4GorAXyZUNOxOZFQBK6bbPl0PKlIiKQ4k+k0uUUX1m3Q4jf7xCcmGC/4gByf4AUWaK6vTr40SFbnQG0RrahKU1xgEtuR7LqsTmVOMlM1vtBqt5xu5w3MzLU5a9l2LCIIOI+AEEHnMZURBQFBQBDwJgJJZnJEgg2j/pgtYuSqG5d7yUiM9Za6kVQkzD039jHpCgTYjuU9seYWaiQVYmtqJl4amIvJdyxwuV6gxT1KOVNnsufd5OIoZSMsbpZXMEOcci91wnqfqktvyufPInTSzHcICBH03ZaJwoKAICAIJItAqMgwl7mmVguvmFEsXHlIwriz2lwrzoIOLrtxFRXr7o3UTk5VWVAJRZRHqJPJYaJjFas0BHSobrWAb9qbmB6Q4zxYakTaDWuqxQWbisk3815mhIxCVRMhdcK9MKnzbnZxrBovZSOsHCFPYabFkCZ1fhw+f1agkzb+Q0CIoP/2TDQWBAQBQSBpBArrWsgID2uuiO9uFCKBeKg317lLenpHOxaOr2K6AWkjB7Lzc96OWipCTQTU9XPLkmVO6V5fROH1EjVXsKKOWbSB5/ecE5/pATnWRmpnBufF5ksDR0+GMVgGyShUCBJSZ+Ikkznv3nBxdGVzXRvUU5gpMpfk+XH4/LkGuAycUQSECGYUfplcEBAEBIF0I2Aui9BMFXlRyKDu0gnLWGlDJ8eSeeGhPgpOJlfXlAuvu5YcJlJvLg2xenLww+YKLuGAMg7qQiwb4+0WCU3xqIUekHmg5goqazQ7r3JcJa+hop1JdIbPi5H23xXXXhsYBssPOOWSafe8B8t8OPiyxMb6fdnUY5ipv7kkz4/j58+XGypKJ0SAg8VFBAFBQBAQBHIRgc6GXrao9fJ/KCKu0l62APpDVk/WdC9t6E1e5dW9TM14nDSuuw/2Fuc29WOSzntk6A79J/NvbkloHszLcUuePTPMs3vZtdctICyO29nLlneFkbZPDomF867WH/XvWv88wd9K9P4R59PQQ58nBHf4OVGrDraNcsYj/g4ytW2pYqbWGfa32aDuKZF/o9rvUc5GjH01zrL5783aeXLp/Dl0jGUY7yCArGEigoAgIAgIAjmLAB4YLJIQT2JkPPAku4bQA1OmHkLtw6o9bE9uAJE3yJ/+AO7WIuI9zNtfQPb3MEhBSi8oosGU6nlPBP3q3oYw4qrNZz5WGmkKvXTQSIr5JUSoj/oOnRUe4X+jkf3U747jlWi9znyvrSW0Pg0j83rx94nfjfuthpEidfjbAkbqb8yMo/Y3Xcr3Z4P8Rc4TU3vXzp8zeMko3kFAiKB39kI0EQQEAUEgzQgYDyd2puU+bpENO2qY2xoPPUnoZVgCrL1lT1ZBh/tFtR7oBCEJDKxoF7SY+PRB3coanWzTlwg4OHoK592eFn1JYF/SxyPq+gSPnkFo+Gfw7yqS5MQiPU5aT+0tNvnWai3xSa5B8hoaJuveFvrLnNWh+6k6M+a/L508T15tsihHYh1Da1fPX/JISU8PIiBE0IObIioJAoKAIOA6AuqBwq4rIR4M7fZxfSXaBDo5ssWDDEJlq5OV9eAhzz2coltOdOuBKw/SUdz9rMCQq230c+Xqy4Vkzrut/ehLAg035D7riiBC2vlkK5bp7yrcXdcgQZpChtujq3jZWrudxtH/7iJJnYHJZOPvUyfCkycb9wmThVCfPurfeRTLah9t03H+7EAkbT2NgBBBT2+PKCcICAKCgAsIRMT3mOOJYnKiKG+9XdAspSGNB0pLvM5N1ylg5ZrlrO8DY4gIJ+semwD24Hlxj9ymtPFe6qyfq3SQGlvn3RZG9s5YuKuo4bra11U03DpoimO09AdrawHpa9zHsqneSpniAxXV1eJFTfeEPnsXheAB18hzlNB9No3nL30gy0xuIiBE0E10ZWxBQBAQBDyGQN8kHwkSSxhJJ1wjNg4DZOltuJvJYdx10TQeMsOfnd20BoZiKDOfgMXhs+L0cK5b6aIobOm821loDBIIOtMnFlB9qBJOhQhLlLMYQXKijqOGanAx2ZEdDKy37ePOGcTJHFcZgxia/oj7Erxwq6nSKJFbaCbOn3WopKVHERAi6NGNEbUEAUFAEHAcAXPMjnnwmNlDU83G6fgKLA+IB7TohgZ3k8O47ubWxzIrSWIsHwo3G+JvKIMvS2Kfd3uLjmaFWs0ETUWpRRKRaLGKUSxkQZLD36m/yShWq2BSGXvqZrx1ZOIchR+7xaqkL7zOBqw3xt9snwQ8/MFqw1U00nU/kaUvw+cv4xshCiSNgBDBpKGTjoKAICAICAJ+Q8C15DAR7rZuuQZGs+j62bPOb+cnm/WN5S0Qdr7CznlfV+RorovBREORFjBTiQu3/l5c368o5S+COOovBvpg0ocsR385Fb4fLrl9uw6QTOB1BPKgYMJig9JAEBAEBAFBQBDwOQJdjWVUVN+WllXwMy85Xxe+ixrLtKLzG+oK07IOmUQQEAQEAUEgexE4KHuXJisTBAQBQUAQEAR0BAK1aSOBnEqeiovcQL6TOpjHjhwuJNANdGVMQUAQEARyDQEhgrm247JeQUAQEARyDYGuRiqraE7jqkeSK1wt0ErNNJkqy9O4FJlKEBAEBAFBIGsRECKYtVsrCxMEBAFBQBAAAl2rVlB6HEJ1vEuLyVmDIFxC8yhPkdlmqsjLo9qA7K0gIAgIAoKAIJAaAhIjmBp+0lsQEAQEAUFAEBAEBAFBQBAQBAQB3yEgFkHfbZkoLAgIAoKAICAICAKCgCAgCAgCgkBqCAgRTA0/6S0ICAKCgCAgCAgCgoAgIAgIAoKA7xAQIui7LROFBQFBQBAQBAQBQUAQEAQEAUFAEEgNASGCqeEnvQUBQUAQEAQEAUFAEBAEBAFBQBDwHQJCBH23ZaKwICAICAKCgCAgCAgCgoAgIAgIAqkhIEQwNfyktyAgCAgCgoAgIAgIAoKAICAICAK+Q0CIoO+2TBQWBAQBQUAQSC8CAarl2n15ZY3Uld6JZTZBQBAQBAQBQcA1BKSOoGvQysCCgCAgCAgCgoAgIAgIAoKAICAIeBMBsQh6c19EK0FAEBAEBAFBQBAQBAQBQUAQEARcQ0CIoGvQysCCgCAgCAgCvkYgUEt5cAkVt1Bfb6MoLwgIAoKAIBAdASGCcjIEAUFAEBAEBIFoCJQ3UW9nA5Xyd6VV46lQUBIEBAFBQBAQBLIIASGCWbSZshRBQBAQBAQBZxHoWrWC2pgKVo0XGugssjKaICAICAKCQKYRECKY6R2Q+QUBQUAQEAQ8i0BnRxvMgSQ80LNbJIoJAoKAICAIJImAEMEkgZNugoAgIAgIAtmOQIBam8UtNNt3WdYnCAgCgkCuIiBEMFd3XtYtCAgCgoAgEB+BQCs1i1uonBJBQBAQBASBLEVAiGCWbqwsSxAQBAQBQSA1BLq2tutuoV3UWOudYvI9PT00btw4mjBhAm3ZsiW1RUpvQUAQEAQEgZxFQIhgzm69LFwQEAQEAUEgHgIqPrCtnoryqomm13kia+iaNWto2LBhtHbtWmptbaWzzjqL5s+fLxspCAgCgoAgIAjYRiCvl8V2L+kgCAgCgoAgIAgIAmlDAFbAadOm0dKlS9WcBx2URxeXnkJ/feJF9fuoUaNoyZIlNGLEiLTpJBMJAoKAICAI+BsBsQj6e/9Ee0FAEBAEBIEsRwDk75RTTgmSwP79DqJVv7uWHvrDDRRYeh0NPfZw2rRpk1gHs/wcyPIEAUFAEHAaAbEIOo2ojCcICAKCgCAgCDiAwPbt26mmpobgDmqWZb+4kq758sjgRz07d9O0W9fS0ns2q8/EOugA+DKEICAICAI5gIBYBHNgk2WJgoAgIAgIAv5CAFbA008/XZHAQwf1Dyq/ZMHlYSQQX+QfOZDwuVgH/bXHoq0gIAgIAplGQCyCmd4BmV8QEAQEAUFAENARiLQCnnvmJ+jJZ15T3y78wViqv3FUXKzEOihHSRAQBAQBQcAqAmIRtIqUtBMEBAFBQBAQBFxEwGwFhJXvO187j9q3vqlmnF13YUISiHZm62DBsHyJHXRxv2RoQUAQEAT8joBYBP2+g6K/ICAICAKCgK8RiLQCjruwkL5+zdl0Xf19tHvPfkUC59SPtr1G9J3b+CjNX/SE6ovYwUWLFlFJSYntsaSDICAICAKCQPYhIEQw+/ZUViQICAKCgCDgEwRgBURZCJSHgDUP7p8lxUNpzMQWgpvnpKtKVPxfKrLp6W1UM/1+2vLC22qYGTNm0OzZs2ngwIGpDCt9BQFBQBAQBHyOgBBBn2+gqC8ICAKCgCDgPwSiWQFB+La/9YGjJNBAJtI6iHqDqDsIK6GIICAICAKCQG4iIDGCubnvsmpBQBAQBASBDCEQGQtoZPwEWZtQ+ydlCYR7aKqWQPPyBg7oR7f9z8W08b6baMSnhtCWLVvovPPOo5kzZ9Lu3bszhIRMKwgIAoKAIJBJBMQimEn0ZW5BQBAQBASBnEEglhUQBeG7t/UoSyB+ggSubLqaQN7cELEOuoGqjCkICAKCgP8QECLovz0TjQUBQUAQEAR8hoAWC1jPsYDvEYjfonnjqfKSEWoVsACeNb5JkcBRZw2jdcuqXSOBZtgkdtBnh0jUFQQEAUHAYQSECDoMqAwnCAgCgoAgIAgYCMAFc+rUqbR+/Xr1EZK/ICEMEsMYJBCWwM0d21WSGJBA47t0oCjWwXSgLHMIAoKAIOBNBIQIenNfRCtBQBAQBAQBnyMwf/58mjt3rorBgxUQMX9w+zQEJOy8K+7MGAk0wyvWQZ8fNlFfEBAEBIEkEBAimARo0kUQEAQEAUFAEIiFAKyANTU1qpg7JNIKiM+MxDBrHu0iFH6HJRA/MyliHcwk+jK3ICAICALpR0CIYPoxlxkFAUFAEBAEshSBRFZAr5JA83aIdTBLD6csSxAQBASBCASECMqREAQEAUFAEBAEUkTAihXQmALF3Zfes1nFAhrlHFKc3vHuYh10HFIZUBAQBAQBzyEgRNBzWyIKCQKCgCAgCPgJAStWwGgkEO6gSBDjZdnywtsE4gorIWTGjBk0e/ZsGjhQS3YjIggIAoKAIOBfBIQI+nfvRHNBQBAQBASBDCJgxwoINafdupYafrdJlYaAJdDrJNAM7fxFT9DcxkdVbOPQoUNpyZIlNG7cuAyiL1MLAoKAICAIpIqAEMFUEZT+goAgIAgIAjmHgB0rIMCZ07BeESmQQBSLN2cP9Qt4kdbBSZMm0cKFCyk/P98vSxA9BQFBQBAQBEwICBGU4yAICAKCgCAgCFhEwK4VEMPCmjbzpw/7mgSa4RHroMXDIs0EAUFAEPA4AkIEPb5Bop4gIAgIAoKANxCwawWE1kgKgxg7COoIopRENohYB7NhF2UNgoAgkOsICBHM9RMg6xcEBAFBQBCIi0CkFbD+xlE0u+5ClfUznmQrCTSvWayD8scjCAgCgoB/ERAi6N+9E80FAUFAEBAEXERg9+7dBCvg7bffTvj3iE8NUVa9UWcNSzgrCsWXT7pbtbvtfy6mGVPPT9jHrw3EOujXnRO9BQFBINcRECKY6ydA1i8ICAKCgCDQB4FNmzZRTU0NwRoIAZGDFRDJXhIJSOCE2j+pDJvoM6d+dKIuWfG9WAezYhtlEYKAIJBDCAgRzKHNlqUKAoKAICAIxEcAlr+5c+cqSyDEjhUQ7VFvb8zEFkUCQR5hDcwlEetgLu22rFUQEAT8joAQQb/voOgvCAgCgoAg4AgCqVgBocDmju2KBPbs3K2SwsCNNFdFrIO5uvOybkFAEPATAkIE/bRboqsgIAgIAoKA4wikagUUEhh9S8Q66PhRlQEFAUFAEHAUASGCjsIpgwkCgoAgIAj4CYFUrYBYa/e2HmUJxE8UikfBeCuxhH7CKRVdF9/9pKqjCEvp0KFDacmSJTRu3LhUhpS+goAgIAgIAg4gIETQARBlCEFAEBAEBAF/IeCEFVBIoPU93/7WB6qeIhLpQCorK2nRokWKGIoIAoKAICAIZAYBIYKZwV1mFQQEAUFAEMgQAk5YAaE6LFznXXEnwQUSJSXWLasWS2CCPUVtxWm3rlXY5efn08KFC2nSpEkZOgkyrSAgCAgCuY2AEMHc3n9ZvSAgCAgCOYOAU1ZAgwTCHRQJYkqKhyoSmKjAfM4AnWChkdZBuInCXVSsg3JCBAFBQBBILwJCBNOLt8wmCAgCgoAgkAEEnLICQnWUhgAJRKkIlJfYeN9NQgKT2FOxDiYBmnQRBAQBQcBBBIQIOgimDCUICAKCgCDgLQQirYCw3i2aN165ciYjIIEoFo9Yt4Jh+coSiJ8iySEg1sHkcJNegoAgIAg4gYAQQSdQlDEEAUFAEBAEPIfA+vXraerUqbRlyxYVuze77kJV5D1ZERKYLHKJ+4l1MDFG0kIQEAQEAacRECLoNKIyniAgCAgCgkBGEejp6aFp06bR0qVLlR6w/qG4O9w4UxFkvQRhQSwg3EFTHS8VXbKxr1gHs3FXZU2CgCDgZQSECHp5d0Q3QUAQEAQEAVsIrFmzhmpqamj79u2OWAGNyc0kEO6gcDEVcQcBsQ66g6uMKggIAoJAJAJCBOVMCAKCgCAgCPgeAbesgAAGxdDnL3pCEUuQwGTjC30PchoXINbBNIItUwkCgkDOIiBEMGe3XhYuCAgCgkB2IOCWFRDozGlYT3MbH1UkcGXT1TTuwsLsAM0nqxDroE82StQUBAQBXyIgRNCX2yZKCwKCgCAgCLhpBQS6sALCGggJLL1OSGCGjhysgyhCv/yBdqWB1B3M0EbItIKAIJB1CAgRzLotlQUJAoKAIJD9CLhpBQR6sEQhLhCCRDOTrirJflA9vkKU7MCegBjm5+fT7Nmzqb6+3uNai3qCgCAgCHgXASGC3t0b0UwQEAQEAUEgAgG3rYBCAr195Hp27lbWQRB1yKhRo2jJkiU0YsQIbysu2gkCgoAg4EEEhAh6cFNEJUFAEBAEBIG+CLhtBcSMsDqhYDxqBt72PxenVHdQ9tA9BMzWwYEDByrr4IwZM9ybUEYWBAQBQSALERAimIWbKksSBAQBQSCbEEiHFTCSBKL4/Jz60dkEY9atRayDWbelsiBBQBBIMwJCBNMMuEwnCAgCgoAgYB2BdFgBoc3mju103hV3Kktg/Y2jaOEPxlpXUlpmFAGxDmYUfplcEBAEfIyAEEEfb56oLggIAoJAtiIQaQVE2QYkbRl67OGOLxkkcMzEFoKFCUlhMI+IvxAQ66C/9ku0FQQEAW8gIETQG/sgWggCgoAgIAjoCCxdupSmTZtGIIP5Rw5U1jm3snZueeFtZQkUEpgdx0+sg9mxj7IKQUAQSA8CQgTTg7PMIggIAoKAIJAAge3bt1NNTQ3BHRTiphUQ43dv61GWQPzEXCgYj8LxIv5GQKyD/t4/0V4QEATSh4AQwfRhLTMJAoKAICAIxEAgnVZAIYG5cQzFOpgb+yyrFAQEgeQRECKYPHbSUxAQBAQBQSBFBNJtBYS6sBjBEojYwJLiobTxvpvEEpjiPnq1u1gHvbozopcgIAh4AQEhgl7YBdFBEBAEBIEcRCDdVsBoJHDdsmoVhyiS3QjAOjh11irlBix1B7N7r2V1goAgYB0BIYLWsZKWgoAgIAgIAg4gkAkrINRGaQhYAjc9vY1GfGqIsgQKCXRgQ30yBPZ/buOjNH/RE0rjUaNG0aJFi6ikpMQnKxA1BQFBQBBwFgEhgs7iKaMJAoKAICAIxEEgE1ZAgwROqP0TwTJUMCyfYAnET5HcQwAvAmqm30/IGAuZMWMGzZ49W1kKRQQBQUAQyCUEhAjm0m7LWgUBQUAQyBACmbICGsstn3S3kMAM7b0Xp420Do4YMYKWLFmirIQigoAgIAjkCgIH5cpCZZ2CgCAgCAgCmUEAVsDTTz9dlYWAKyYKtgeWXudKcfhoK4T1B5ZAzI0SEWIJzMw58NKsKBNy2/9crNyD4Sa8ZcsWOu+882jmzJm0e/duL6kquggCgoAg4BoCYhF0DVoZWBAQBASB3EYg01ZAoA8SuPSezYoEwh0UWUJFBAEzAmIdlPMgCAgCuYqAEMFc3XlZtyAgCAgCLiKgxQLWU0/Pe8ryt2jeeKq8ZISLM/YdeuZPH1aJQWD9gQVy9KiCtM4vk/kLAYkd9Nd+ibaCgCCQOgJCBFPHUEYQBAQBQUAQ0BGAi93UqVNp/fr16pNJV5XQwh+MTXt2zjkN61WGSJBAuIOOu7BQ9kgQSIiAWAcTQiQNBAFBIIsQECKYRZspSxEEBAFBIJMIzJ8/n+bOnatirGAFRCxgJghYw+820bRb1yooYAnMhA6Z3AeZO3UExDqYOoYygiAgCHgfASGC3t8j0VAQEAQEAU8jACtgTU0Nbdq0SemZKSsg5kY8IOICISCi0EVEEEgGAbEOJoOa9BEEBAE/ISBE0E+7JboKAoKAIOAxBLxiBQQsyx9op4k33ysk0GNnxO/qiHXQ7zso+gsCgkAsBIQIytkQBAQBQUAQsI2Al6yAUB7lIVAwHlac2XUX0pz60bbXJB0EgVgIiHVQzoYgIAhkIwJCBLNxV2VNgoAgIAi4iICXrIBCAl3caBm6DwJbXnhbuR7DSgiZMWMGzZ49mwYOHChoCQKCgCDgOwSECPpuy0RhQUAQEAQyg4DXrIBAYXPHdjrvijuVJbD+xlEqQ6mIIOA2AihLgqy0OHdDhw6lJUuW0Lhx49yeVsYXBAQBQcBRBIQIOgqnDCYICAKCQHYi4DUroEECx0xsoZ6du1VSGCSHEREE0oVApHVw0qRJtHDhQsrPz0+XCjKPICAICAIpISBEMCX4pLMgIAgIAtmNgBetgEC8e1sPnTW+SZHAa748kpb94srs3ghZnWcREOugZ7dGFBMEBIEECAgRlCMiCAgCgoAgEBUBL1oBDRIISyDIIGoEomA8CseLCAKZQkCsg5lCXuYVBASBVBAQIpgKetJXEBAEBIEsRCDSCojYO2TizD8y8wkxQP6EBGbhocuSJYl1MEs2UpYhCOQIAkIEc2SjZZmCgCAgCCRCYPfu3QQr4O23307494hPDVFxd6POGpaoa1q+hxsoSCASxJQUD6V1y6o9QU7TsniZxDcIiHXQN1sligoCOY+AEMGcPwICgCAgCAgCRJs2baKamhqCNRAyY+r5ygroFZdLIYFySv2GgFgH/bZjoq8gkHsICBHMvT2XFQsCgoAgEEQAlr+5c+cqSyDEa1ZA6IQU/eWT7qb1m7qpYFg+Pb2qViyBcoZ9gYBYB32xTaKkIJCzCAgRzNmtl4ULAoJAriPgdSugQQIn1P6J1jzapUgg3EHxU0QQ8BMCYh30026JroJA7iAgRDB39lpWKggIAoKAQsAPVkBjq2AJBAkceuzhtPG+m4QEyhn2LQJiHfTt1onigkDWIiBEMGu3VhYmCAgCgkBfBPxgBTS0rpl+Py29Z7NyA4UlEAliRAQBvyOw+O4naeZPH1Y1MIcOHUpLliyhcePG+X1Zor8gIAj4EAEhgj7cNFFZEBAEBAG7CPjJCoi1CQm0u8PS3k8IbH/rA3XGYe2GVFZW0qJFixQxFBEEBAFBIF0ICBFMF9IyjyAgCAgCGULAT1ZAQDSnYT3NbXxUZSwNLL2ORo8qyBByMq0g4C4CsHhPu3Wtsg7m5+fTwoULadKkSe5OKqMLAoKAIKAjIERQjoIgIAgIAlmKgN+sgJEkcGXT1TTuwsIs3R1ZliCgIRBpHYSbKNxFxTooJ0QQEATcRkCIoNsIy/iCgCAgCGQAAb9ZAQERYqemzlql0AIJrLxkRAaQkykFgcwgINbBzOAuswoCuYyAEMFc3n1ZuyAgCGQdApFWQCRYWTRvPI06a5in14qHYMRMQZYsuJwmXVXiaX1FOUHADQTEOugGqjKmICAIxEJAiKCcDUFAEBAEsgSB9evX09SpU2nLli0qvm523YU0Y+r5nl/d8gfaaeLN9woJ9PxOiYLpQkCsg+lCWuYRBHIbASGCub3/snpBQBDIAgR6enpo2rRptHTpUrUaWP9gVRvxqSGeXx2yJqJg/O49+xVxnVM/2vM6i4KCQDoQEOtgOlCWOQSB3EZAiGBu77+sXhAQBHyOwJo1a6impoa2b9/uKysgYBcS6PPDJ+qnBQGxDqYFZplEEMhJBIQI5uS2y6IFAUHA7wj42QoI7Dd3bKcxE1tU2vwp152r4hhFBAFBIDoCYh2UkyEICAJuICBE0A1UZUxBQBAQBFxEwM9WwEgSiKQwcGMVEQQEgcQIiHUwMUbSQhAQBKwjIETQOlbSUhAQBASBjCLgdysgwOve1kNnjW9SlkCUh0CZCBFBQBCwjgCsgyhCjyRLEKk7aB07aSkICALhCAgRlBMhCAgCgoAPEPC7FdAggXAHBRlEoXiQQGQ3FREEBAH7CCDGFiVXQAzz8/Np9uzZVF9fb38g6SEICAI5i4AQwZzdelm4ICAI+AGBbLACAmc8rJ53xZ1CAv1w6ERH3yAAyzqsg3AZhYwaNYqWLFlCI0aM8M0aRFFBQBDIHAJCBDOHvcwsCAgCgkBcBLLBCogF4mEVlkAkiEGB+3XLqin/yIGy+4KAIOAQAmbr4MCBA5V1cMaMGQ6NLsMIAoJAtiIgRDBbd1bWJQgIAr5FoLW1lW6//XbatGmTb9cgigsCgkBmETjxxBNp27ZtmVVCZhcEBAFPIyBE0NPbI8oJAoJAriGAwvANDQ25tmxZryAgCLiAQG9vrwujypCCgCCQLQgIEcyWnZR1CAKCgO8RmDNnDs2dO5fg2rV79261nt7e2b5c1+7d+2nChD/RmjVdVFCQT+vWVaufIoKAIOAeAnPmrOd7yKPBCYQIuoe1jCwIZAMCB2XDImQNgoAgIAj4HQEzCVy5cqXfl0MTJ96rSODQoYcLCfT9bsoC/ICAQQIHDpRMvH7YL9FREPACAkIEvbALooMgIAjkNAJLly5VlkAIMv6hLpifpabmfmpt3cIp7QdSIHCdWAL9vJmiuy8QWLp0c9ASuGTJ5b7QWZQUBASBzCMgRDDzeyAaCAKCQA4jABJYU1MTJIHXXHONr9GYOnUV4aEUJBDuoCUlQ329HlFeEPA6Avh7w8sX7UXS5XTNNSO9rrLoJwgIAh5BQIigRzZC1BAEBIHcQ8AoD4GVL1y4kCZNmuRrEOCatnjxkxzj2I+WLbtSSKCvd1OU9wMCcL82SODChWP5HlLiB7VFR0FAEPAIApIsxiMbIWoIAoJAbiEAEjhhwgSVFAY1vxAjaJa8vDz1q1+SxZjjk1auvJrdWws9saHDh/+aBg0a5AldRIn4COzatYu2bv2GwGQRAZBAJGRCYqbZsy/ke8joYM+8PM3VXJLFWARTmgkCOYqAEMEc3XhZtiAgCGQOgfXr11N5eXlMEgjN/EQEYQWESygEJLCyckTmwI2YecCA2+jrX/8snXzyUZ7RSRTpi8Djj79Ca9c+T3v2zBR4LCCwfn0330PujkoCtfuHEEELMEoTQSDnERAimPNHQAAQBASBdCKwefNmGjNmDPX09ChXUCSHiSZ+IYKR8Ulec00DEfztby+lG244M53bLHPZROCuu9rpppseECJoAbfNm7fzPaSF7yG7lStotOQwQgQtAClNBAFBgCRGUA6BICAICAJpQsAqCUyTOilPg8ygRnzSokXjJT4pZURlAEEgPgJWSKBgKAgIAoKAVQSECFpFStoJAoKAIJACAt3d3SomEJZAlIeIZQlMYYq0dkV8EmoFQhCfNGXKuWmdXyYTBHINge7uHhUTCEsgYnClTESunQBZryDgPAJCBJ3HVEYUBAQBQSAMAZBAuIPiJ0ig3wvGx0tSIVsvCAgCziMAEgh3UPwECUQsroggIAgIAqkiIEQwVQSlvyAgCAgCcRCABdAggaNGjVIkcODAgb7FDK5psAQiUyHik8yZCn27KFFcEPAwArAAGiRw1KhhigSiRIuIICAICAKpIiBEMFUEpb8gIAgIAjEQMJPAkpISCgQCvieBiZJUyGEQBAQB5xAwk8CSkqF8D7lOSKBz8MpIgkDOIyBEMOePgAAgCAgCbiCA+oCwBCJBDEjgunXrKD8/342p0jImXNKQrh4PpigPIfFJaYFdJslhBGB1x4sXWOFBAtetq+Z7iH+9CXJ4K2XpgoBnERAi6NmtEcUEAUHArwiABCIxDEhgQUGBcgf1OwnEA+n27R+o+KRly67069aI3oKALxAACURiGJDAgoJ85Q4qJNAXWydKCgK+QkCIoK+2S5QVBAQBryNgkMA1a9YoEghLIH76VcyuaaNHg9RKfJJf91L09gcCBglEUiaQQFgC8VPESwgc8JIyoosgkDQCQgSThk46CgKCgCDQF4GpU6cSSCAsgIgJzBYSCNc0IYFy4gUB9xGYOnUV30O6lAUQMYFCAt3H3N4Mr3HzF+x1kdaCgEcRECLo0Y0RtXIVgQDV5uVRXlkjdSWCoKuRyrhtWWPClolGku8dQqCmpoaWLl2qSCAsgSNGjHBo5PQPY1gCJT4p/djLjLmLQE3N/XwP2axIICyBI0YMyV0wPLvyrazZ857VThQTBOwgIETQDlrSNi0IBGqZCIEMhV21FNBnT/R9WpRkmtZYFk3P8M9qDaUdVqqrsYzyiuqpzeFxZbjkEZg2bZoigSgNARKIBDF+FbimoUSEEZ8Eq4TEJ/l1N0VvvyAwbdpaRQJRGgIkEFZ4Ea8hAJfQbr5e5+sjrykn+ggCthEQImgbMungNgLlTb3U27uaJusTTV6N35uoXP9d+76TGkq1DyK/d0y/QC3FJnKFVLfBpGdpA3X24nfj0vRvrmBiaIsNllMTxthQR4VxFlJYt4F6OxtIh8CxJctAySEwZ84camhoUCQQiWH8TgKRpMIcnzR06OHJASO9BAFBwBICc+as53vIJkUC4YItJNASbBloBBK4V58XlkERQcDfCAgR9Pf+ZbH2RVSsWE4pFRfFW2ai75OFiC1+85otdDb0jGwKQqeT1eaKOITSwhSxmhQOp5EpdJeuziAwf/58mjt3bpAEjhs3zpmBMzQKXNOM+KRcS1LR1XgneyLMjX+VbWJ/gHfYIyBBOx6nrPGdDO1iqtPGWZ9av4iTCMyf/wTfQx4NkkBk5hXxKgLm2ECJE/TqLole1hEQImgdK2mZMwjA7bOI6lP2uyyk4TpTa98qj07ZeHzgCjpz5ky1tEWLFnFpBf+TwOXL24PxSbmWpKKw7ia26s+m3tXn9D2uk6/Vvtswiq31g9kjgP/Nv3c2DOvTdvJq7bsNdYMzeOw7qdY2aeM+igjfoe5/pQ3f1tasX2qtbWupSLV5MOiun8FF+n5quILOnPmwfg8Zr8qziHgVAVgCXzEpt4P/3eNVZUUvQcASAkIELcEkjXyFgJ5EJRhj2Mc1s298XyjhSjgJVK6dHKtoy7szCFYXbW3Xfhk5PPQfdxXfp48ZjHcMThAvWYz+nRE7WdsafVvYpbVvjKW2jrDEMglx8tWup11ZkEAkh4EsWbKEJk2alHYdnJwQmQrNSSpy2jWt/LSga7qB8eTK6K4JhcOPj9iGc6jS8GN3coNsjtXV+BhZ8WkI3a42cfKpPwb7gMxGEllFlIMk+SmqyLuTJFeVzY0xNcffGyzw2j3kcr6HlCQ/mPRMAwKwAEaWjRD30DQAL1O4iIAQQRfBlaEzgABIUDVRixGrt5oj9dg10xynF6hlax+FYvrQpK2+Wn+g0WP/8CGLFn/YS01JPNipeWBVnLxa768R0CLd1Ng+r4xaK3vZolBKpfB/VQSuIvrDmyJtFdTe0KnHIbLbaXtz37YYo6I5qHco1nIyreZ1bKjTCakFnDKwe76ZEuUhDBJ42223+Z4EIj5p8eInlWsaisXnNAn0zSmMo2jgQb7PbLO+ki4mgUVrQ8mnSsfS9Fj3vPJLSb898vjbqL5IyKB1oEMt4X5tkMDbbrtYSGAyIKa9TzTPHiGCad8GmdBRBIQIOgqnDOY8Am38oBEtO2c0103E9bVTQ4sp0Ur5dC2pTPM8neiFrHSGruWVIH1t1NGZgvZt9ewuFa4n8zGNkAVZZDjJpKoWRRCR+EURtPKmsCQ5Zm0CCzhDKCekaTGIHDun1bX0TRYTaIUNYLLJIlFO0zUAqDWYwdQKTilgkeVdQQInTJigVjl79myaMWOGr1cMEijxSb7ewnDlmQTmVTxlY0EcD1htIoG4g8yC+2tsKa80u84yGayWuEEbgKsYXCRk0u4hF/I95Hw73aVtRhB4n2dFptBIQeZQ1BUUEQT8iYAQQX/uWw5pXUoNneZsnMa/Q1lDg2B0raIVbZHE0SCMBtHTyZielVO5ZoKxpSp9sob2qrfmmmtpWVT3KbO7aGj6KMln2BqIvDWlVePDH84sJospVIGKpqQ6lnBKFZDs7L9p0yZFAnfv3q0IILKF+lngmgYSCIFrmsQn+Xk3WXfbJBB9+J4ZFg9twbU10nWW4wYXuFQqx+c70kf9TZu2KRKIEi0ggHPmjM62JWbpeuIlhhGrYJZuek4sS4hgTmxzLi0yFnE0u3eGYgThmtkb8nNyFCiUuYDbJ6yN9UWhOoi2J+nssFwvsHw6rITNVBGMOdSzn5ZW0fiwV/xWcLKtaVZ32Lx5M5WXlysSiHhAuIT6WSLjk665RnLQpmM/A7UR2UZr47kiGMlbwvtEy0aqxo20BAYTu8TOYBpojbAelg6huImaFUjH6FmdQ4g1t6biUpEO5DM/B+pylpffrUgg4gHhEiriFwTikb1uXkRk7KBf1iV65joCQgRz/QRk3foTuXjqyWD0GMFkYv/sQFY4vkqv9ddOqSYObbPiu1pYRxuMuEjlqqrHQ/apS5gIJzurzP62IIFjxoyhnp4eRQKRHMbP0tq6JRiftHDhWIlPSsdmIg6Ps21qLuOmjKPNf6S8KNk9NcL4RyK9bW/vt4O1U9vq7+jTp7wJY14bnuSGY/069Yyf0TOYvhNMaJUyBO07pKxEHBBBAseMaeF7CF4klSgLvIhfEEiUHRTZREEGMyNGArpYSeKsfJ5cQrzMrFdmdRYBIYLO4imjZRIB3VWyuSKK9S3QqLlnKrdIxMDEL9ju2DKC1ryRZEocam/48krt4a65NWq69jCCiCQwrZWmwvZRitNbwcmehlnduru7W7mDggSiPATKRPhZEJ80ceK9agmIT6qvH+Xn5aRN9+aKGHUDLcXjsWXPSMZiSsRSWPcF7W+bLXfVppqDqGdoeKy3bzVqEQ6m8VWmUhVtz9KqlKvS7KCOpMrkDA6WxgluQNvbJDbB6Mexu7tHuYOCBML9etGi8Wk7tzKRBQTiZNrWSNQQvpDMLd5VGJatOyxDtwUVUmmCPAOa95EuUUJVkPQu6mXbI0r3qCpr1F/8BKiRH65ARt1bczrmTMccqeyye32FCLqHrYycEgKd+gNKLMtVtO+5iLu6qbFrpKnkg3pb1jqcgnlWFKcyAlq4JIMpRrArEOj7Vptj9Gpj5kg39IiyWD2DJ76ZvLqJjCR8XXpNCeu1BUMJXyqCN18eNNCqZQ1FVlT+DxRWpJLFJCxgbx2nlLYwCzqDBMISiJ8ggStXrlSF4/0q69eD1GrxSSCBEp9kfScNK565rl7MmoMRw5pLOZRWDY+aiKWNA/WMu1JnRyjjp/nz8GG3pZbgyvrSpWUKCIAEwhKInyCBK1derbLzingIAZWojYlSpykBWxiZ+gN/jzbRrluDlnrtv/Ua4Qpm6E7TMsPIIJLXmZ8V4umAtfNzk/XnEeRZ4BwN1KFe/HQ1zqMV/LOwbhbNSvptdxwF+TmqNuD8nMHSXcEkfwtoeDrXlaZzYWUaIYJWUJI2aUVA+wMNlVHQEq6ErHxxv8dNTb+ZGzUAizpmhTJ3sutkC96cKfKEcVup0tS+emuR9pCmZxtVY3A5iulmFqnQMOIMdT2jZA3VktBoZRs0F9Tw8hFt9UXs3mW8VVN3VHYd05PbqPFCaw7e5M3ztGJ09V8e9R8oTKHFCBpJaiKzrZqS1iTCKa077s3JYAFETCBI4KhRo3xPAuGaZpBAuKYJCUzXuXuHVq2IVcrBHGv3RtB9vHz6WN2lHH/fpwVfIjmvcd9YP2tzRHEptRRbaG30bGkFCyBiAkECR40aJiTQ6xtbOJ6qTIY1TV1kBEVmUAtSOjN22RUL3VNtkjwZrKQqW5MXah4B/MyyACxQ/ZNjKJMosxV3WjwTVbQTqmsx1XR0TuRwMPJDlKqyXHiGcnYOW5BmsLEQwQyCL1NHR0D9gfZxYwhZ1BJ9z6+maIO5f0QgIG6WofF5XFP70Fs8PbsoxukTX6fdlOo2xHC1CNM9pHfUPuaxI/XWyZ2BUrjeKEvRRE2Yy7w+dkUdqb+RDMNQkd02WmH2JUuAUy6fT5BAWAK3bNnCNfVKKMCWYj9bAiU+KZOnOdz9UsX3caygdt1hythpsvAVjuJ7mBZH2NuEGqNcEoLb26oNaGnJUVw8LfWL0mjkMXFLTiQ7rF/7gQTCErhly9uqLmcgcJ1YAn25mXYygr6R8RXiOSHo7WnZMlhOdX1edidaSjvNW8AvyWcxI+xYQAtovMM8kF+cV3PZrDA1nJ1T886aTLPC1u7sHIlQ9ML3QgS9sAuigyDgBAJ4ezavOPobST0uMHrJCicmz54xkBUUlkAkiBkxYgStW7eO8vPzfbvAyPgkSVKR4a2cfK1G8KJcfZJX6QSQHSTYs2A2xwGZYgQdWkZ4TUAe1FKsX9/YwsmViXONOqSy54eB6zUsgXgBM2LEEL6HVPM9xL8u5Z4H3DUFkQm028boH3Bb1BvMrOBluX0yaF/nqularoW2dn7u0MkUXpo6IYHaIuoYCZ+n8PwKkXOmMl8nAqQnV/YhsG6uywlsnB5DiKDTiMp4gkCmEEBiGn4DWN0nnhEuqRXUzu4PbmdJzdTSnZoXJBCJYVAvsKCgQFkC/U4CI+OTnMJKxrGKQIT7paXsmlzkvcwoBzGMa6le6vDbdpPukTUB6SkKhlDHWmLgeS0+OSgWag9ahcvn7UAC4YKNeoEFBfnKEigkMP6mhrJecjiEStySQrklR89PN4+GjKB2BBbEUImqPmvBC9tgik7OUYAQFRdSdqZOBnXdgjF0oVATJIUpb9qg5V1AmInh2cR7N4/Da1IWHqeCVtP0YrbYlRYHy9n0mTOl+QKElAqlmt9pUFxdV8rAuDOAEEF3cJVRBYH0I6DH/XHRwrDsZXkIcmxJf/B6+gFIbUaDBK5Zs0aRQFgC8dOvYrimwSI4enSBxCdlbCMj3C9jFF/vanxQy2zMEqg1uYyWnhFRA9TphRRxkq1zwgZtnrcpbimIyNqDk1e7SFSdXq6L4xkkEJl5QQJhCcRPkVgIGHHzp6lY+t7eSto6L/zhP1ns+iYDiYyZz7OQ5TJeEflYmqGPHjqizHLhpaMCC9jdsX2r/vfFidvMCWqSXWyMfn3J4FxrJV5UvgLOf6DyD2ghMJqFUct5EDsRTjFVhRcstr8i3bOpk99aK4tdXElhvq6tvDOlFvVNYR77CKS9hxDBtEMuEwoCLiLQJ84QN3H9zZ2L02bD0FOnTiWQQFgAYQnMFhKI+CTJVJjZExqW/IVVQSkKsxEA5SKq+aFE867qVG+qgxJ01eykBfWxks7EWJ/Rl11MoxWhD/YqvzTc7TQGWVXteSxTomUqbfi2eBroQE6duorvIV3KAghLoJDA+H93cP+rb/s6k4uL2OL9EDcewlcblVaNTzneNHougfC4/viZPfezLq8kcePo4T5vav1U6SdT5nNYusJN6fznznH9lfayrGgWVFPytzhaljftNLmJzoniMdS3syKryJpq04Uo0FofnofANLQ1nREXuIKqWuBy2qXVOB0ZPcuyuhXFmQ/fx5uza9UK3hlrZb0SzZPEIfFUFyGCntoOUUYQEAQygUBNTQ0tXbpUkUBYAhEb6FeBVQLuoIhPAgmU+KQkdrKP6yNKzkSvkhdpHaNorpWc/KUlIr7PXJewaMUZ1FI3WFc0MpPnU1wOB4llnqfKSMsdahvWmvUqokr15t4QvS/HGM4Kjh8dj8K6mziLXsgyCP0iySMIa56pbiJKakQvVJ8E5j7vUlNzP99DNisSiL85xAaKxEGALT/z4JrX8D9MAj/DDbv5+oMqGzVy+KEegA5F5BEjmIw8H9ZJK83AJGdrpVbvr00rvWB8ZpNvWVQI+q/naxl7bzZpZJDJXYvVpDBBHbmfTmBLG6bHdVEH+U6lbIb2YqCNnZpgvdUzqMdZbfLzdXEm5+jxgdGmS34ei1uV4WZCBDO8ATK9ICAIZBaBmTNnKhKIrKCwBCJLqF/FcE0DCYQ1ApZAiU+yvpuK6IB0RSsS3/xH7bsyuE3qMXz8e583/DydQfLMREoRrU5TWQhdLVjUejeMMllABlNdS3g7rYYhu1+Wl4bVLFN9kVXUJOVNs0MWAPX5OWxxsei6yZZBJLExktKEZzg1ZS3VE9648wBrfb+80nLmzIcVCUR9QFgC8QJGJD4CmkXGyNh4Gjc+mAnHZo49vYAqyx/k31v56k4axtRdQ99Kem6il7gvSGQRFevlKLoaOcXm+HDLX7TPrEyqZRCP5ekDaySsq/fyZWQ8bWcvg6/S6qgZ0PvOWN7EdQJLtXrMqswW3+RQHzEVkhdfZ9ZBjwsMZTtfrcpjRcbwWcHHaBN7Tq3+cypj29HD623zGPRerysp+gkCgoAg4AYCc+bMoblz5yoSiGLxKBrvFcF/gCF4MLciEp8UHaUBA26j3/72UrrhhjOtwChtTAiAGIeXrEDimpt0F1Znobrrrna66aYHaM+emc4O7PJoc+as53vIo4oE4sULisZ7QfDSQrt/ePMRD0Stop3dD4Pk5P84ccp3qbm0ij+72PRiJJ9XUcLX8DTAiphF3RLVR49Y07/JfX6glYEJ6wPSt0cbj7NfNhRP10o0IBkOsgB3FlPrqvHUZNVCl3D1cGPdzNfrES2h3zLOE/Csrb9buFUuGL4hPW7fiAtEKgMzUcVnRfWqHJbjL5zUHrTzvUzCZnBYxCKY8I9LGggCgkA0BNSbwjgX6vDFu0DC4l3r169XJRzckvnz5ysSCPEaCUxmzXBNk/ikZJCTPrEQKKybEGaBJNpG9dXxE8nkEprz5z+hSKB2D/EOCfTNHgTdD5Gh8lnkImEudWZEfGAPL2c9X0xm6Dm+wt01VRxYWaO1JChpBQbWOL1AObvADg8jfGxtY+JjlFxITa1u7g7rH8o2RJJA8M4fUMesx2yRQJDVovqRbJlNTTNLvUHKijpoVqS1ElnQLQ1gtxGTfeWTXOVyEi67emWuvVgEM4e9zCwI+BoBw2Ll1iKMeD03XDXhCoq4QMiSJUto0qRJbi0j6XHtWAQj45PENS0Eu1gEkz6CwY6B2kgXWOctg36zCMIVFH932j3kcr6HlKQOtIMjeN0iyJk8lMVHe9hHNspKalWmsqYEFiDED3IRcyrm6xC+mETWEjU5YjZy0iLIrq40iTnVN6BcKLYumvUrqX0H0XyKrzh1CwN3UV7raHYf/5HNGUDMOWtosBf2x7QGm6NFbR62/9wCyWkUGYyc2/xdahPjpUGRMt2GBC6vyR8dPi+NnWzpTQdjTm3t8XqLRdA9bGVkQSAnEBh26gj6zKiLqejMz8W87AJhlG/IVRJoB69p09YG45OQpEJIoB30pK0VBBB3CBflYJFqWAaLkMDGuB5U9ohcEa+TQF/sQ1iGayYZKp3/jWyFAoGCwKVRqymYV4v0kSxdD3NZgxv4syu51Mof+QMmQoF7yB3T1Sd5fCRPSnSBlBpi7lPCH76vErWE0QSsO2j90usNBi2aASYWXSrbJWr19RVYQ5/h6y6+1qvxYwqwmncCZ/680dZx0GIrW6lSLxvR2xuKF4yuk63hQ40jM5wHMeGSGsG5keWV56d6KrKMUWx9tJjB8MyxGgk013PEv7U6lsH6lkjxrOpb5nG2Z/17VWKD3X7rK8IyQCeJRka7iUUwo/DL5H0RML2RC/vShTdSAn/SCKDm3qBBg1T/URdPoBvqf5L0WNte3EIN3/8q7fpQ+4+amzX8UB4CBeOh/2233UYzZsxIWm+3O1qxCHo1PsltbOyMLxZBO2hlrq1fLIJwv0bBeMTk3nbbxXwPOT9zoMWZ2fMWwQjdlbVmBeIDP8dWIZAdJoKNb7K1RSdaIDZFr9Os3uupXFm6StjSNZKfz+9mi9t8Jltod0SKe2G2CJrjF+MNm0wf83jov4CGb2iiIsagmlo4KUsnJx0q5+RQRjsUtQcmcI39yMIa25nMbGYyV8e4XGmhvd7EiF+MYv1T+9MxizHPhPXLCkbWlxm1pdlS28VknFZR9YLhtGH6VirDT07K1ciBjCvQeWQVtTTVUWdtGW2d7v84Q7EIpnh2pLvTCOiFWHu1jFHKXUC9wXHYLcFptXNsvO3btzuy4h1vvkrNP/5WkATCArhx40ZXaviZSeDs2bM9TQKtgCsk0ApK0kYQcA4BMwmcPftCz5JA51acrpG0dP5a/cDT9UmPo7rhm4PWlq5VTxI1XKKsa11bX+WMj8fxvzgbJpeeKFckCTGE6/mKYyVL13JszaPHETIRWaBYBixR7Pap+BZI30a+dOunJRIIS+oqKu5kwqysmRYl0EiNKsSwmeZFWiNZt+p6hn96JkggdIqHkcX1JWpWOJ6qCGU9mHSu6qRO1FJsrtDiF0F+u1YRKk5UtWxgUqi5sLa2Z0ecoRDBRIdDvs8QAqG0yxlSQKa1iMCRRydXLwuWwJ997xoCGYSABKKG39ChzqdeR9IZwxJYX1+vktT4WeCaZiSpWLRovGcyFfoZU9FdEIiHAEqyGJbA+vpRfA8ZLYA5gIDmiqhl6myrL2KXyLd51P7UWPswdZVfT5Wtdyk3vc6OF7m+IJM/tgyClFSN539zuYn24jeU5VATxM2BEKJ8Auro+UXaaR5Xl5g+i62aHQtoAV3Ia/uZvhaQXFgErUlX4xJODnMLJ4c5hjsUWOsE8jOPWegXmriW6GS1D2GJ4JDRM2a5CotTpNwsEqPxcWsaJj1dYBWX+SjiYvZcqqeTjRCruZAJH0CUO6GGllDSnUArtasXF/4XIYL+30NZgSCQUQT69UfAvj0x3EF3vov/6JMq2wASiAQxTgtIILKXwh0USWEWLlzo9BRpHU/ik9IKt0wmCHD24u18D2lR7qBICrNw4VhBxSEEUKzbHLel1ao7lDqaV1ARx2pVtJ/A1fjYQFZ5AdfnRIbJJ6mqE0RHswy21b/OGTlhHTRLN/+CTJoP8PWaQ5q6O0zVdFiZdlNbe3+aPvxmmrd1N09os6A9u8wWdXBJCmW4s2oNNFxbR9JwQF/OZDAijq7XYv1BdxFi8q8w4hcG7cUOZVw1awyrI2dzbR3OZ6uQxleRVti+tVLh2cmFB0cqgDTp2tquv7iIFsvpNhLOji9E0Fk8ZbSMIqAH/AZLGpRxQHmkQpFtEPxrbpPoe9wBECRsKp0QPgA3sDBGmFp6wHhwzFrOgpYXI1g8owAHJwepSkV2vvsW7d8Xest5+eWXu0ICt2zZokhgT0+PIoHIEOpngWuakakQD6Ney1ToZ2xFd0EgGgJbtrytSGBPD14klagMoSJuI3A1JwxZq0JCeo2agmwdVL/3aiQQUlh3C/8OF8hYAl9HWAeTcBcNlrZwe63gXogzY9JXfhmv99NMdk7QLJ52BDGUFY+zZ+cdWoKdvFPilncKWfyMuonFinB7VTSMWDsQVZeIqXopocdABhPL6L/jO3N4pPG99uLC3yJE0N/7J9obCChyhtTTxttFZLpqU290QjwNhGse+86b25ghTPQ9t0UwtXKT0MdAGj34kQcnsTBG2JRa5qkVVZ3Bt3CdDe3UHMrb7Mk9TjVGsPicC2jy9++g/ocMUOubOnUqZ75c6uhau7u7Odi+XJFAWBwXLVrk6PjpHsyIT8K8iE+Ce5qIICAIuIdAd3cP30PuViQQheLhhi2SLgSsWrTi6QNvlS/zZTGJjB4Hpo3YrFwCwwWEEhZG0xX4sVZMHtJWTwuSTp+LbKnQ9RgKtK6gFasMd1cLeCN5TtGK1OrujRyeFW6OFtCSJhEISNZQORIeRUB3V+DEwVptmXiitx25OiKjlVGPxsg4qv3e3tDJWbn0EZnY1ZJRtyjR95gHLNCcJcpwq4A/OT5PNIZ5HTH01uvr8IAhPT22Syj2DksbBBlDkTk0Gdn08Er6Q8P3g10DnJoZpC1VAQmEfviJ8VAwfuDAgakOm9b+5qyhmzZtC7qmIUshshWKWEMAWUMvvPBk+sIXTgp2iKyBGasmppV28eppJvsdFE22Tmey/ayh6V6rl1/eSYsXb6I9e2a6N4mNkUECYQnET5BAFIwfOLCfjREy29RvWUOjowVrXneSQBokELFyCURly4z99rW04Vb+b3GEhQ7kCxa4GFLa8C/uc1aimaN8D08ZuLQmG+OIOosT+TLKcCShgnTJKQSECObUdvtpsTaIYBzihED0imaDpJlLU0QrR5Hg+8gCqBFwaoVJE81h6qSPN7JPQdMoZNJjW+cUEcSyzGQQZA2kLRUyCAsgSCBiA40spH4jgcDFeKB/+ulacU1L4fx/+tO/i/sSwC2yluy4fulnPqN2tyfWGnfu3En//Od1dodzvD0sgCCBiA1EXc6NG2/yFQnU9mauwgXxXv6VblYdZNCu2CCBwaFBvDAfrmRJWKSe+fwBagt+ii87rp6pkMHzeK4z7QIm7XMYASGCObz53l66DSKov80rjWJBU7Vv2G9DI2naijVyaKy+LyGM+b0ibis4UD1x3ZhEc+iKqLeQZt10DcMtlxFvK1V7tmOa32BG+yy4vyjBkdCqau80oBQD3C4hqVgEjVlX/fGXtHrZr9SvIG0oIZFMMflIEuhWAhp7aCXX2nhYzs8fKPFJyUEovQQB2whEksB166o5ftlf3gRYdHYQQawESV/sEDO7JLCbx0eJhiTiCG2dLljq4O5qlMdI1DkZMijWwESoyvd9EZAYQTkV/kUAbp3wxy8qplL+0dbRGWMtpVRsioI2spQhvA9xABVljZw8OSTxv2+jmNNYHsMm5AiO7mzgNWrpjBWhtfCZlvmLYyWpnor6JLSxqUNE81RjBCNnH3/tt6hi4jfVx0hEY1j07GiJfiCnsASOGDHCtSykdnRKti2ItiFGfJIkqUgWTeknCFhDAFlBERMIS+CIEUP4HuJPEmhttX5pZSdW0A4JRJxfK19JJpOxDR9qAsKVFMUCuy30trMWY7jP8D/EJdQCuNLEhIAQQTkOPkUAdW+IKkGKUAgUTLB5Xp8soUj5y1VqabwKCWSXSxMhAuHrbOCOwexgCb4vHE5c5UelsO4TD45irIpNJprDBHd5JYGLNveNSHdwTwqproVJZHNrX50dmuWY4050ZCSQwQvKr1FjGZY9xPhZEZBA1AnctGmTKkaPWEM3SlFY0SWVNlh3TU1N0NqKsWCNmD//i6kMa7vvJ3/9NvW5Fu2gTza/Qyf9tke77nyPTlqyk6/3nbmWYhweD+NGu36nfffJxaxHhH62FygdBIEIBEACUScQ8bgFBfl8D7nOl5bA7NvYAl6ShTg/skqceng8kL8H+bKRkMUxYI35EQeYaH6ra4JyIIBwQRURBOwhIETQHl7SOm0IdBI4XIikhU8cqOWUxyMr9bTRTHZmgVJxltBqk3WPLYYqPrDFlGyGM3yWRdaUKDWlTY77fTk1KTMiWxG51IPBKeF+mqdqz+g6JpojuJRyqlTDhesUqK3gGZyTwIJ6aptsYOXcuG6MdM03ZgcTz9ghgyCBsKKBBMIdFD/9JtD/9NNPV9lT848cSKNLiAZxUlVYBEeN+i2TwScys6Q8djM7pB/l9TuIet/7iPY9t432drxCe/71An308H/oo79tTu566Gn6cO1T2rVGvx74J+383cP03m8eCl3N/G++3v9zG+1tf5nyPu6lvP7y1jszhyF7ZwUJRGZekEBYAvFTxCsIJLIKWiVMKM5u1SL3JieH4xCMMi5sr2BoV4Xruxpv52eIRATOCm4obdHKF9xS44nVtRXzIHAN1ctRBT2dAqx3F+td5umSVFYQkzbuICAxgu7gKqMmjYA52Ur8QfrEBPZJ5hIZ/2dkETWNGxY/l+h7vV/kPJPN2UotjmFSITyekDhmcDVRRUR205iJaoxEODF0w8dh+iW9MWEdFy9erEo+QOp/0kJFZ35O/Xvf3j30zpuv0vHDTk1pol/NmUwdT2kZ2UDqnn766ZgWPljQFHniYvQggcnEFqakbIqdQXinTZsWLJ8x7sJCWrLgcmr69c9pN4eJbN87lJbes13NMmrUMFXHDG5rbgosboaAAO7r3E4fPvJv2vfaO0Qff8yk8GDqPfAx9e7dj2wUSaly0BGD6OCjDtP68osV4v8jJnm9+7ie1sFcpzOogDZF7669dODtndTvk0PoyKvOp4NPyFftIa98w108klqgdPINAqjNuXTpZmUBBAlEghi/S/bECBo7AQLXE2VbrBAlFGZfz9cLNrcVZPAhGr7heipiAlhNNZwJ9E22Fo9krw2bQ8VtfgJ/O5YvrCWWxIsZxIsxZAoFEYTgOWoB693Eepex3i2sdyfrXe6w3k5iIGNlCgEhgplCXuYVBGIiECVraLRENRY/04hmtCypyW/BnDlzaO5cLSvd9362nE457TOKBDb/5Nv03y2bmRz+noadOiLpCYyxDDIIchct8YvfSSCsgFgDYi5hBVz4Ay4Sf1WJws3AFzUD1zz6DtVMf562v7VXZS/EZygj4ZYoInjwQSpz6Z7N/6WeJX+jg4ceTYeedxodcvonQxY5EDglIGRB6mZBLbbqHdKfDhrYX2uriCBfivHx7zy3+rcxPuJd9+2nfS++Qe+v3Ei9H+2lIbdep8go2gkRtAC5NImKgBskcPv2D1ScIcpOZEqyjwjCmhdpPbNCApEEBq6gdhLOhHYtUHsX0fQTqLX6SWqvqmFK9Qx11l0cp4h9sjuOWoeX8BXPDTYWGUSWUGQLNetdy3oXs94rWO8W1nsV613ngt7Jrlf6eQUBcQ31yk6IHoKASwiUT0eimWjFcZ2Z8Mijh9CuD9+nxu9XKyse/t3w/a/SDrYMJisoNI+C8waZRAIYJIJBLKAhM2fOVFY0o+SEnyyB5lhAkEBYAZ/72zeDJDASt3EXDubvP8vfD2UM9tPMmQ/TeefdSVu2hCx3yWIdtR94GZOx/a/uoJ33bKBDv1BMx3zncjr0iyXU7/h8OnjwEdp19OH6Zf638Vm8n0dQ3qEDqJeJnrpYiV5YA/ETfBDWRpA//NT/Tf360SFnnESDv/1lyjt8IO35z0uUN8A/dd0c3R8ZzBEE8HcESyBerqBOoBOWwD17DtBXvvJnWr68Xbl1iziFgOH6aIxnhQTChfN+vpIjgdpMr9K8BcypZnEsfMdDtIBLMzhqDAzCA8KKuMHuOIBFWzOsgUgSEyntut6c2aBjAes93iW9ndpfGSdTCAgRzBTyMq8gEAuBrq0cjRAvC6o96LpWreDoyfDMqfZGiN961wca8fvv8/8ONlTEcGZ1ymTQbFlEIhjEAoIMwiI5f/78IAkcPXq0k0tydazIWEC4gQaWXkdDjz087rz5R/Zjl9HTuO2Z3PYQldTirLOaXIkdzOvfj/b/90366JH/UL8TBtMRV3BSJY4T7GVf1d79Bxy5CNY8uHYaFyyAkf9WFkLjcyaFe/ZR3pGD6MivnE+72p4j2s9jBK2Srm6bDJ5lCMyZs1797RgkcPTogpRX2NX1Dt1ww330xBMv03/+8wa98caHKY+Z6gB4WZYdYiY8VkggyB+IFbJ1piZV0y8m2Hbb2k+g6VxYPhDAf6HdEFj8YL18Jc7gkWsfzm0Nl9DwblXTtfwIbe3FrLdmnUYiNRFBwIyAuIbKeRAEPISAUfcwpBK7dKqQwVD6GNt1BHmwvrUKU1s0rHEgYpBBhx2hrIAQWOVwGQ8fyCgK11FYDZOVne++TT/73jVBUnnmmWfSM8/ATUj7j1oqxeeT1SmZfrFiAWMRQLNraOR8PTv307RbX3AtdvAkztD5/h8fpd2bX2TSdQENOPtU5ZrpCYEHKnPDt2b+ngZ/t5KJ6tH08teP9oRqooQ/EGho2MRxuWv1e8h1jrhwwh30llv+Rv/413u07eUddNHoT6h43sGDB2UEFMM1FJP7u6i8GT7E+qGu4MV8xXOhBPmDJdCF2oCBu6hs6yUcc2enQLzdIwCyV8lXfpyOhpvo6ARYmIbgBHplW6ez7plzWbaLhLR3HwGxCLqPscwgCFhGoLBug+YSF7ya2CWS6wiaPgvWEUzwWZ8+lrVI3NBcR9BMAhHHt2TJkiA5g3vor+Z8PUgUE4/ctwVIZN1tLWSUqTBIoHmeZMZNZ59krYCxdHTdOsgJYQ688wHHAvajfsOOYbdNPIB5SA7Ko49hnfyQXe/EIuihjfG+KnAFNUggiJoTcXw7duyi733vIXr8Hx9RacWXaegnT6RNf3+VDkasq4iDCMAqeGUC4oN7lZu1AU+gqvFukkDABZIHyx1+xhKDLFoprWGMUcy6Cwl08EBmxVByl8qKbZRFCAKZRQBWOXMyl5UrVwbJ4LYXtyjXUSSASVZAAkEGYX005O9//3uyw6Wtn91YQLuKuRo7yCUa8gbxwwZKNSSXGNTucqy1Rw4ZJoIHH3Okii8UEQSsIoC4PSSHgYAETppUYrVrzHYffLCXZs16hB7628s0+rJxNPKzZ9OAQQPpk8OOoJ07k7/npaIYyG72SqLSMet56U6Ud4iOYKB1Ba1Y5d74oVlhzYTVOt5LuERYhK8h0FrPumvFMEQEAQMBIYJyFgQBQSAlBEACQfzMBdyNBC6jRo1SY4MMIqNoqmQQMYMGGUQJC8QKelWctgLGWqdr1kGQP8TsRZSHQOkIsxUu7HcmZtrvurZM2FTNP/PvHGsY/r3pd2QqNbc3fo9cfN5BdPBhA2zlKfXqORG90oMAagQaJBBZd50ggR/z38evfvVPuu8v2+iab3+TPjf6fBrIJLDwjBF04EAv7diRenyaXXRAAo112u3r//abeQl2S0TYW3V5U5PLbqFmfVBrEAWVnZHypl5xC3UGyqwaRYhgVm2nLEYQSA8CRvbOSZMmqTg9EL9IwWf4zsjmiYyiIIOpCLKIXvX1mcEhEEfntWQIblsBY+HnqnVQnxQk78Cb72nkkOsLotD8x2/zm2v1O1sQmQge2PE+Zxxl8gdCyIll9m97R/2uCB7XCERNwuDvnAF1/0tv6b9zMpr3d9MBoz2S03ywm/a/wv3ZRVXNN5AtlIa7nVFqIpUDJX1zAgGQQBSMR8ZdkMA5c0anvO5XXtlJ3/3uQ3TH4ufoyq/fQKefhRT+RLs+2kUffvAhvf/+Hnr99Q8UIUyX5DYJBOl+Kl1Qp3EeToqVUtbTNKoqU/kSASGCvtw2UVoQyCwCiBGcMmWKigeMJ0aRdxSFh4AM/qHh+0krj8yk9/zmtmB/WCOvueaapMdzumO6rICx9HbNOogJ2bq355mX6Z1fraKPHtpMebv20+4nu+idXz5AH/2VM8bu3ke7HnuW3v3FX2jXhi1EH+6hDwP/ond/9SDt3vg8fdzzEX3wl3/Qu4tX067HO9TvO//8BI/3AO3++1b6+K2d9N5d62kH99/9zy468PLb1PPbv/L3D9LeZ16i3vd20Z4nOxVZ1GoOOr17Ml42IoB6fgYJrK8f5QgJ3M/Zan/2szZatbqTxl9XRZ/+/Ll8JLXHqUMPP4z27NrF1U4OYhL4MccJpsd9ObdJIJBHjUGPxTI79gf1uGMjyUCCQCQCQgTlTAgCgoBtBG655RZatGiRpX6RZHDTwytp+a+1YvR2BCQStQqN5DQggHBJjWaNtDOuE20zZQWMpbvT1kE85GrE7XHat/1t2nn/Jtq54nF67+71tOd1/v2Bv9P7yx6j9+7dQHu3c+1BbvfBfW30fuBJ2rejh97743p67zdr6f2//Yv273yfdrZupA/v/zt92NZO+3vep/eWP0o7uc2uf3fy7zu5duET9P59G2n3lm7a/06PqmX4Hhe137HoQfrgwX/yshEo6MTOyRjZjABI4JgxLcoSCFfQhQvHprxcxATedtsTdP/q7TSq4io683PnhI3Zy4mWjjn+WOp64b20lY+IJIH8fizHBKUi3HUJzSygiEnszqwKMnvWIiBEMGu3VhYmCLiHgN2SDbAImpPJPB5YTqv++EvLCv5708NhMYZwSV22bJknSGCmrYCxQHTUOggD3K699PHOXcy/8J+NXtr/xruqrt9BeezyyQ+/H/P3KAqfx79/DJfQt9iFlAW/4+G4dy/XAOR/g1TCpVS5eqrftYQHH/NYYHfKsgKSh/hCngtX7/79XFhef9vPY4kIAokQ6O7uUSQQRd2vuWakSg6Tqnz00T768Y8fp5/+dAOdX34JlV5yEfXr3z9s2LyDDlJWwSFDDqWjjx7Ifxrumq6jkUB+P5Zjko0uoZFbmAtrzLFj65HlSh1Bj2yEqCEI5AICmzdv5oezMfxw1qOWWzHxmzT+2m/FXTosiGZ30vr6en6zvzDjcNmtC2hX4Xh1BO2OZbfu4Em/7aGe5oc4HrCH8qeW00H5h3Em8/20c/ljbMV7lvoNzqfBtePoo8efpQ+eeIYGnHwCHVV9Ee28t412P/tfGnjGKXTElz/LFsNHae8rb9Chnx1BR1z6WeppeYT2vPgqHTnuc3ToxZ+md5vW0p6uV+iIi8+mQy8opnd/8xDtffUtOmpCGR1y2ifonTtWqTIRR0/6Ih1yxkm074Xt1P/kIXTQ0UfQjvl/piOu5HZFJ9DLX8u3C4m0z2IEDBKInygPsXLl1apwfKrS3PwUzZrzJF163VV0zoWl7PYZPWvjU4+10bJf/ZaW//EyuvRSFPx2R2KRQIRsmxPqzp492xUFvJGs6zVe24OurM97g45mldw7T95br2iUDgSECKYDZZlDEBAEgghs2rRJkUEj4cwN9T+hURdPiIoQLIdmN1I80Hjh4QNWwJqaGkKsZP6RA2nhD8bSpKtKHN1lJ4mgodiaR9+hmunP0/a39qoHYyTOmDHj/D56m4ng0UwE8446VCV0+eixduq562EadM5wGjy1gnZxbN+7vwkwyfs8HXFVGbtzttF7f9lIR479LB155XlM5B6kXc/8l46u+RIdWnY6vbMoQLue2kpHX38xHXrRp6nnzr/ShxuepSHfvpwGlBTQu78O0Ef8/ZBvXkb9Tz+Rdtx+r7IsDpnxFTr4xMEqGU0vWxthddlx+z10JM/Zv1CIoKMHz+eDuUEC4Q46f/4TdO/93VR26RXsDsolIqIkyDKgW/9AgO797R/o7rsm0GWXneYICY3clngkEG3TUVnFG4XqUW/vFZ+fWqvq53PDKquNpZ0gYAkBcQ21BJM0EgQEAacQQEkJc2wfrH2w+kUKXEfNJBAxiZkmgV6LBbS7JynFDiJLp54B8eDDBqpcLSBlyp0TGULhsml4wcEVlNsfzARSCVxLOcGGUYqil5No4EJ5CjiAIhOoGkt3+1RuoPheF9UWfeA+qn+u+okIAiYE4AaKxDAggyUlQ9l9/EpHSFhT01P0pz89S2eWjqFzv1AalwRCnTPOPUvN+/zzOxyZP3KTE5HA3DkUKLgOi2CuSA8vFJeIIOAcAkIEncNSRhIEBAGLCBi1B43mIHxIBmMISODqZb8K/o7spMhSmknxaiygXUzsxg5GjXDSMyRi7l78b99+TQ3U/TMUYqtdHtdUU2JwuljhUqZahYrgcfxgYsFgQgYT45QbLUACEROIBDEggevWVXNt075lbeyi8fvf/5t+OHcDjbxgHMcFftFS94+4fMRe5ijPPfcWffghYl+dE6skEN6gblzOrcSJkbp5kGzNFBoLn2xOiuPEmZAx7CJg5b+2dseU9oKAICAIJEQAZNAoP4FC86gxaJSXMEigUZgeyWEyJX63AsbCzap1MJxqaUyudw8/5TJ5C35nEDxY7fQJ4b6Zx0XfkxIL+TWQmAbxg0IGk0I4qzohKygsgSCBBQX5jpDAXVweZc6c9fSDH6yjz4/5Ao39yuV0yABr57n/IYfQkRxXe/zxh1P//s49ZlklgdjcOXPcudJ3cLg+aUJrXwxS1PUwleXVUl5te/rUtTRTO9VCr7KHqctSe1Oj4JruTdCTM4x23cbrz6OyRtuz2NVK2mcBAs7dobIADK8voauxjP3+y8hrf9te1cvr+yn6kaoBeMYZZygoQAZ/NWdy0E3UIIGVlZUZgypbrICxAIxlHYzVPm8QPwjzA8bHH3ItP90tVBFDuGsqX9FwBpcXx7IXy5YHC6PZLTQW0YOb6IE3elR2UZHcRcAggevXdztGAoHmunX/pcZf/ptGll1MV3HBeDsyYOAAPsUH0xNPvEyHHBI9oYyd8dDWDgm0O3bm2weYICFjsH6VfZ2J0jLqavwJIQIwusASGMUtNHAX5RWtoDYXF9XVeDvryoQu7LorXFfoEdGmNvZi4msbtqYPuC1IcnTpavwSr//7+vqfj9vWRYhkaB8hIETQR5tVWDeLJtNIGl7oLaW9qpe3UBJtoiEwYcIEevbZZ+nwww8P+xq1Bzdu3MgZ/zJTECtbrYCxTmGkddDczqB2iPnrN/gIOujgfvTxR3u0mD7FwXrpwHsfqRIRfSTSsheb/UVRLdQ4WjdYBFVMofDAnL65wBK4Zk0XDR16uLIEwiKYiqDcwy9/+Q/6znf/Rpd8ZQJdwO6gB8XIDhprHljDBw4apFxT33tvTyrqqL5ZTQK7FrL1qoKaJ9/K75GatKtlJ1UziSqqfykOdt38XRS30PLreYxv87OSe1JYdwvPcSs1lGpzlDZA9+up3Dwl9OisIjTRvm+ipvKR1IT1bbiYbD3G9VlTbPfQwrrfBecleppnX8ZXK1/P8fWRe6DIyL5FQIign7Yu0Mo3y8rwm40X9PeqXl7ARnSIiQCybsLiBtL3+OOPc/bKGaqtUYC+pKQkI+hluxUwFqhm66BWz49bRpAsVQ8QBCzS8pcEGVMcMYl+Zv0lSjAjfyKembSm5n5FAkG4AoHrHCGB9933nCKCw0acS6O/fAnlDznG9noP4zqCxw87gfqxRfyAKemR7YG4Q/aSwG5e3cMUWPAdtl5dQKubjgvBU3gxbdBJVGzMMp0k5jiq26ARzrb6JVE9tbpWPUnEJHBDnWltyRyCPn1ejz9K4fFsMjALCtIjBv8uvh7iaytfuRZb6QjwWTmIEEEfbWvX1naaXLxV+X57yUXUq3r5aGtzTlWQwKVLl4aRvttuu02RwaeffpqTPaSfBOaaFTDWoYN1UIly9Qy1QhKXXlgCez+mgw4fxJlCQ3XZDjqCf2criKOSp0/OpDNmmnoLsYSO6iSDeQYBkECQJJBAWAKRICZVWb26k26uf5iOLzybrYGX839nkzvTPTvepTdfe53eeWcXvf128laY7COBIG/r+VqqExLDsvUqbY0MZ2MyOCuuWW9XqtvtQH+28K2+gMd5keqrI+L+OKavesW51OI4CYTayZ8pom7THjzM/5bkMw4cBF8PkdxdztdLTqB8AH7fJl/1pP7tRhxfF61aQdTeQdTCD0adDUQrVnkhENiremXzIfX32lACAiTQiAE0kz6QwYKCgrQvMFetgLaARgmIffwWme8/Bw08RMXmaQSN75ecLTSqdS+au6h50qA3aYjRBZPM6B/l9T+YcEVKHs9/0CH9Io2TtpYkjf2JAJK4gCShRAOKxTtBApcvb6eZMx+m087+LF0z9UY68uj8pMEZcsLxyp30yCMHcNH55B6zEPMIsmvIiBHEayVec9JqZajjDp53I1+wRqHwO6xRSPKkSVHxqfz/mUgV3d7HqlZUfHIUnY14wrF6DF7ffrEX+iY1loXH9pU1wloWEiP+D/F8gVq9bbykM+y2uVqZBVdQdXAsnqf6SapqiXQBjZMsxkgGY8QVxk10E0mCzTGW53KSnM1RINDnDsYtfo1qAyCBIINL+VrPl9nK2sVYmZ+Fa6m2VhLQZOiPyNVpk7tDuapShgcvb2KSpTt+K1Um02r9jTQeehJd6obghnStohUjZ9GGpjrlW97Z0UYjvRAs6FW93NgDGTNlBEACUSjdIIGjR49OecxUBhArYDLocbIYZOtUJE/37YyRsKV3X0TcYDClKHfF/VQlnIkQvHwbwETTMAhy/cFevX6huSVqF+YdzslrItxUk1mR9PEPAiCBc+c+GiSBo0cXpKz8v/71Ok37zsN09Emfpi/fUJWydXv3hx/RoYcdRv/+95t0xBF8lpMQrGvSpJJgzy1biIvaJzFQRrr08KxP8YX4NGS5fIav6FaswroaPdYOZBDEK5R0pbDuqvBQmK5GFU/ID2X8Z/9HPU5P62clEUug9gdUzwXZO/VYRDyvhdw6NZJYVP+iQqx93u3UWonnwVOptDi+a2d5k+Ei+pBKGNPVuIRWVNVQnTkQUCWPuYOao+0HvqvGS349RhJWxuY74mQ9NWGpY9Le0Kk/n66khvbHI+bB2lZRcac+vim+UVMHxBwEHUSdCXtXPeNcxGswxoTxoZ2aoyqfkQMmkzqIgBDBKGAW1m0wkcFmqihrtJzqt7ypMxhA7OA+gfkRFRdpQ7LVsqK9gabrkcldjbWZyyQaRy+o6phuuNnZ2AdHsc+KwfB2rzZOBjb3F7l48WJFAiHLli3LWCIYY6ViBUx2z7lsxID+XDMQVrr4vpl5A0Luo9FnMzNDrYXyyFDEMuQaahSaN4+hitLv4hptKcYZJouCO/06OXviXE4vv8nyf3Pc0cOboy5e/KQigdo95Eq+h9hKudFnUXv3HqBHHvkvXXfdfXTGqDIafek4OjQicVUySPTnFxnDTi2gQYMOpp07k08Ws2TJ5WFkELdPlIXwpiCTJQgfiB+7LykiGDu7ZWgNiLXTCJcmj1NF1BIL/N+w6npqm7yak66gHcYOxek1V0Rk7ewD0pvE0TVhUl6puXV2dOJjTY9e5erJwkQO8yAxTOIYv5E0XenPupfdHt0lNGYSGyZp816lBrP1sPwS7TmyeVWcZzsN28ACxqS0gV1Qjb+FT1Jdi5akJiRvUkfbi+xFZlg/ea2z9HX2wambcW5knL/N6/6nvo89VDg+csw+HeUDnyIgRDDGxoEMBq17bfVUZJmEFPIf2Ej9xhI+eIDN6pFup5F1XrRSDKF2we/LK2lkfZH2XWslZ53SLIOQwvHTaXxq/z20d3yZiAbfvsXRyyndFCZFHTQruOaIVNOx3Hct75m95afeOhP687lsKaZ5jJWVN6eprzF8BLiCTp06VX2I2oGZLAkhVsDkdhfeEAcfw1lDOTawd9dettIhaygiB2HBY2IYTVTGGYjh52n6FX1NcYZG+Qll6eMrkSBxjbJMBudI1EP7PlDLRAtkK+x6MPiSJNH31maRVk4jAFfQqVNX6feQy/kewr6SKcpjj71Et9zyN/a3HEoTaq6lTxR8MsURje7stswuoe/07KP9bNFORbxNBmFJQjbKB/iC9Q8uoHAFtS9aJs4m03PXCirK+1aICMH7iGtClKoX4mbr4kiqVJ5YUeIMw9TQiZ6esVO5fVYggUp0GTncXoKXoGWTdezrEmrMcRwVhzM0flv+DK/LsIYabqtsuVT1LwySGk1Hdg/lF+Tz2EpXWjU+PAtpn2Qx2rxt9T8IWVyZmGqEOkKUPuwLV4l0MyCbIPRM7Avf0hPQeCE20/75kh6xERAiGOd0lDf1hpNBq0/QRcVUHGVcjNfLwX24D0xWrg29/MYlnMGBgKo2/IanM+z7ck47rLummv96EdO4oNNeKuJU/iJgmatoDxoniR03ouqFOZzQjccoWqG5cgTvWchSanbZ1TEtDbpGaDhPjrw5prJuJ/tmSv/COtrQu5r4dWtayeDy5cs51qVGIQgSmMni8GIFtHqQVTU/JQaVUzY63ZXz4/f5QWzffvViSrWJJGOxDIWRrqE8RqQo9/vITIu9sc1+dg2C5U2z+d57bTC9/OTV+P3S4P1F+/7bQc+OyO+tIpiwXeDBKH+HRXw/5fk3jErfPT2hoplvgPg9I14ukhglq117+5s0uXY1DTqumG6YNpUONr+USHZQvd9BbNE+mJMnHXzQx7Rt284UR8N906uWwaW8NpCpBFks4yAQqA235JU3wX3RKM3wLCdh0T2y2PsoVBswFGOIoY04Q82yF09CMYJw+wxa/xJ1s/T9cTS+yrBqWupganQqNQTdNg33Te1nVLKmevK9MwyTeHNqJFgzbugWV5MLbljPztdj1GA0zjHiVuEAa8Xaa4xsvPx2I3+GXaylfSQCQgQTnIkwV8/mCvbZtlARlB+466K9acFc6g93MlXG+l5vM3JWyOKX6NhOjjtYot52vuc/5iJ2Q7BRyzA13Xi+CqZ8EVgwj+IQgRAx7OIsOm1Mr6sizKLFXoihjAJvZvVn4s7/NWiuSI+bKIiXQQJnz56dMRIoVkA7f+fR26q0MJychZAdVGVTRPYY/F8v7d/xvlZWQvuU8gbqFsJg/J5O18zxfPxRWMF51ZET0CAeUBFBnWQejGQ02lxhklLG0GP0N/PDTC+1oq070ffJ4voOu4PhTbtIIgRQHsIggbNnXxjmKpmob6zvN27cRtOn/5UOG3IylY29iAYfOyTZoaL269e/Px037BN0gK2BKCHhhHiTDF7CS/sUX4kt+LExiGbJA3HRyWBbByl+xy/Y8RK9TbG9aPOdmuBvGSQwFCMYm2A5sVt2x4hn+Us8loZJYtFItokQlkVkOk08BLf4PF/Y9yMstdYa8XOH/sLeRidpmiYEnLlDJVTW5ArHREpzf0zPg2hC1RI2YJe6Daa4PyaDke6cCYcwNQi0wo5fTHq0X9SuIApWuV3X1mLLbe3oGa1toHYeFTdYz4aTqm5djfOomS2jRiykoRNuZmYejcQ5FElO45HxVIFIsX/G9S+fztaOZprX6G7WWZBAFIzfvXs3gQQiUUwmRKyAyaEe4dSpDaKyg/I3iOFTDbQaEx9/uFsnb/pcQcIXIofqG8NyiJ+4+usxhKaQQPalI2Vx1D/LGzggRCyTW4rHejEJLLtDd/3ymGoeUwckEAXjd+/ez/eQC/keMjplDVHgvbJyOe3YfTxd+bUb6OQiEBnn5Y1XX2c36kMIiWicEjtkELdbN67wtRTwrxfzNYkv7A1+tyvsFrkgInjPPITxvFQ4nqpU3Nw8dhcNJyGdHZzgpfTc+CEyhsvjLJvF3O0ux2573Y0zaoxj4OE4MYKMAYfmqCey5tao8f9tHUZMIGcMNWUhxTOIislse10j2WYpL1FjNrcaewIXWcQTXqS3OoV/pkL87QIk7d1GwH0iqMoxVFAwo1HlVg6kVY7eccmQ2wu3Nz7I4OqgK1Ebx+olRwYDpHhgXJdFbkNWi8Zz6QYanpYC8yDv84pbaDzxzcHS3qWqG8pS8DkZOTyBi5SGKTu0pwUHe+fGSutM6F9Iw9n9v23FKtcSUmzevJkmTpyoSOCUKVMyQgLFCmjl/MVu0zeNC7cNqxWol43AEEgcY5A7/I4YP5BGlVCGBaQO5BGWPfU7/2QLYu8eTvaCX9FW9TlYWRh7OYmH+gx9OBZQK24fYQK06xOaGhyh3l2bOKOeKcawNvJRCkQvPAaxrPEdvX84CWyu0NqFHE2iJ4vparwz1I5dSoPxjX3m5mnM30fEQob0iAQjUmd2W+VYytjtnQIz9jibN2/ne8i9igROmXJuyiQQ7yaeeOJluuqqFXTcycNpXNUEGspWO7cEReUHDcijo45ytt6DVTKIxDJuXNHxwt/5cL5gKbqeLxAHGzF2yJAZYZ1C5k3EyYU8gpB/ARSlTXcXPVRThTNuVjSza2WfUg38Xfsbff4bFyI4TI5MMYJdgXbVtmvrq2rY9q3hZSWsnxO71j2jFqHmsmncC1QZi9bjwzOPKsWMNWH95ZykRrHj8KSGgc1a1lDgariA8r8jS2VQ6QlRnsP1mEvV/nM8SCVfp3Okz4SITKTm8hIml0+VxdTIc+EXg4/13c3Glu4SQRVPxseRszwFY+HKh9NI8EAX47eiJWXpUxvQiotn2I6Hm7ZBBm0PoWLD+rowhk3TxSl8jeyg8U6cIticb3h8PB9Th44s72N1B5eu4HhGzfqWQJzQTQ8MT+haynjhvZUWQO5DyZD+RSpyfAW5UYoSJHDMmDEEIoZ4wEWLFqV9Y8QK6DzkuIf27vxIJYnp3cMxOnv304GeD9VEyiKI+EG+QNcO7PiAetmqd+CNHv6NXUfffI/zO+ylj3dqiQbUOHvY8vfeh5pr6fZ36WPus/9txKFoFsYD/O+PuR3+ve81EKlMMT8TliBZKs074gj5Wn0OP2z9kUMGQmQwUMvWPhrLcc1aGy1F/Ur9zf5gfqmo9+NhtfjD2VockCJwf4x42NIIWlH9NqVE+zwmhK2nhc0d9t8hjFHxVHDcUCzkOexOP5vv4YP7HgxFbO/gVPHf1sblq7PhjYymigcJHDOmhe8hu5Ur6KJF41M+0Js2baN58x6jpzbv4JjAKQ4mhomu2uDjhnAU1wC1BqfFKhl0el5r44GgnM5XJV8T+QKZyI/T9QIV6tHbQlQdrHGHMg4n8ufrwmPkuLyXyqGABH55N2h1BCsQKnJLiDCZyzTwf+OK8vQ6g1ygvgVWMEWO8Py0mSo7tUyYCJWo5kevVabyESqxilXXSTVnqPQExjOXwVCLV3UC9SQwSi9TbCQyipp0UWN1jKfeJiRswb3BVHpC9V3A9xPtJVswy73CBASM6wi2ovAZC2f+7O29PviSXEsWoyWkKeJi95164hxtElhZz+Srioz8GG31Z2kJCvlqrQwZQzSdFgTLS3Q26HqyXbK2aAVVdWr5LFZPZoJq+0HZ2imTVs4hkMeblVKkRWxV8LagiN/ooA6fOdEH/nDbOTB2Q983Hc6ty72RQG5VnJz6KwtfW4JZYVUrqh8Ztw/KLawa3+QqNpoeHKnICWsS+8nDrZdtlGoP9T0duZpvUM4Q0Ji6gEwiPjCBjlp/8u15ypj+FvG1+4fU3d1NZ511liKByAy6EhWQ0yiYd9q0aapgPWTchYW0ZMHlNPTYw9OohTNTGaU24BKXbjnpbyXU85uH6MCbPZQ/pZwOzj+M3TV38Wdrac9WJiVsuTvsvNNp9/OvMmHrYdfNAXTUpZ+nDx59hva99S4dxOnzB502jHZt2cbWvX108FGH0YCC4+mjZ7qZJR6gfsfl02Glp9POVf+kj9kVtN8xR9KAk4fSh09tZbrXSwOGf5L6n3A0vf/of3jpvTTo05+i/MljNYsk/ycrj11K3/rh3XToF86gw8edTS/VHGkTIqvumcP43nKTfj9GHz7PLcbvmNIYx2in/w4iaCR8MZGz4G0z2mdqBbAIMhksNfXnT2ERBBksbUBKd53MgcAVreWbX+gzZDytaAbpCyW/MfqCdPa9bev6jryW7+mml2lRxrYJcNLNu7t7+B7SpAgUMoOiYHyq8uqr71PNjffTu7uPoy9ecSmdnIb48ef+9R+6u/FXdPO3Suh73yulQw+NkVk3hcUhdhLZVA1hD/xgeQlz/ia45rsh9tz9e1gFZBjle4DlRCOwMo6OoTryNbzixrJ8MGY+61gVQ0/EHluNPz6E28I1Glci6zieBTXvPmXYCT4Lm56D8Vwxr5jvfXqOC9WGM77j+VH9GyTRp8/+PjgVyaronkXQSPXbMD3MZU+LkatKb7mDZNGJ1g+ZF1XqpVKV5ck6HdJdHeO6VXKbjmJPYROoreA31PxWR70VArH3lvUtanygk/sdZywnLM+Z1N9pmEACDUvguHHjVK3AdIpYAR1G2+wbyn//H3+wm/Z2w10KCV320152oTrwFj/ccbuPd+G7N9ii957y4PyYXYL3sZVPuX4i90vP+7T3pTe4n+YKeoAtgft4rI/37dXav/MB7Xt9B2yB/C1bCN/9gA58iPprmhKYG66kzgsInG7dM6x86mcoa2hwTrber2jbxsWrzW6fRqzfNr1kkG7x00mgKkXBFjrrYiSxCe9ROPx49cHI4SaLXuExejr3+KNrfWMkvVFrgmd9hEeFxbGtr8taS5BAwxKIGoGoFZiqvPzye3Qjk8AXmTOUXjImLSQQOh997DE08LAj2Uje6woJxBxWLYMgbG5c9vYmn5ufxxeshJfyBashiEiyMijZjlnQL5W1w5II4gc33kl8wY03EQmMApnKQq4VmsfzYdDwZyT3yQKUc2UJrhHBqJkc9ZonkXFf5gdqdZiUa6HuYxxMLmOuwRc/Ba0TD+ixD4CeyXK13bcanVzQM4FLLEztxRH1YHRFnMRIlajgP+BERj0tLrBTtdWuCNcA1k1L/JN8SmCrukTfj0zE14U0UeVAgtjE+HdckN3TP9V9sXsD3L4drlxjCGQQJBCWwIEDnY2NiaWTxALa3S0r7fWMoPuYmHHmQ1VDcPDhdChbAUHWDj7sMDps3Dn8+wj+7WMacMoJdOiFI2lg8SfV9wNO+QQddd1oGjDiRP79AA0q+RQdVfNFGsiWPnx/6OdPo0PHnsVWwhOUModdcjYdOeE8OmToEP7+IDqUrYWDRp1G/fKPpIMOYeviKK4Zh+yLEVlHrazE2TaxiKPZ2haKt2utDLmBOqtH9NHKp4/lV5RPsTuW4aqqZyctPSP6C8bOt2Okio8YPyLuUPvvtClW0YhzjIyfjFGrMZr227d/oEggyCBIICyBAwfqyYSSBA9WxVtvfYye7+6lr0y5iU4/+zNJjmSv20fvf0CPB/5Khxz0AV32ZVi13BOrZNA9DZIZGcQDBGQSX8lmHtVejuSmJLP2AoZqtI45Evzgdxuih7EEM5TyczpyZahnOGQib+WbgkpeY0pEhyz5vs3fYAMbnzd1jQhquIykkAcGuxUu4KKULJFxX0aJhqAbIPuBdyIAlmML4YJoFHc3au/1rh7JWaZil3FI/QE99q7CQgbTeCIS1XeEIq2gZ8w0vyCYRLMi6goa4ziNUcJza4oLDLbVbwQjTW41hXWz+A/fvM8JR7bWQE8V3b41TmZLFXPZ9zxZm8ADrVzUP9G+dG1VkZWWwlETIQUiVl5erkhgSUmJsgSmiwSKFTDR7iT5vcrYyRTvA47R0+MAiUtHHHHleXTUFRdQ/qSLaRC7ZR5Rxf+uLKOjvnoR9T/9RDrqhjGUXzWa8m/8EvU/4yQ66vqL6KjLzqMjJ15Ih4w8mY6a9EXKv+5iOuKqMupf9AnKZ3KYX3MJHX7Z5+iQs0+lo7/2JRr89XFMDEtowKdPpqNrx9HRNV9iklmc5EKc7mZY/mKNa3INNWL/nFYh3niFo9hjRY9bVCRMj1dMtS5h+aUcwwSSqRFh9d+/aJ/hv/rsqqpiDU3ttVjJNyjW7RyErbz8bkUCS0qGKktgqiQQdQJvuukv9Njfd9N1355Mw045OS078TG7Pj/yl9X07D8307xbR9O55yZhbbGpaTQyaHOIDDYv4LmTyTyanv3MIDBxpgZmVsTI+IkEPiDceClhP+OnerFshEShjJqe9R+5MpTRBnGa2k1BlYlgtwntc7iJagHQeukxTvRTJAlkrOxcOtu4RgQLkZaQ03hoN37ElnGEffHIGDX0YC0Lr60Hl7kQYYTlJPQ93EszkRwEfwwVZEp8Y2un9IxXUWsRwveaSzPEdTVNH0bqjx4JESLZbrTipSAzbrzx0VNFxybOfKbmgQY6Q2ZsbaUjjV3WP8G+KJdUB1y0QQJhCUSCGJDAdevWUX5+viMIxRtErICuQ6wmQG1A1PVTaVrgmtmfYwNhyftMgXL7zBt0CB1WcQ4d/ImjqXc3/86xgIde/Gk6+Lgj+fe9dPCQI+iw8Z/lzw+l3l38O6yKYzghAY+D/gcPPZoGlbG1D3Nx/34nHUsDP88PK5wttHffAer/qaE04NxCrbagG56hdmDU3SWbKx7sm6o9sElLBmO4Ws7KUEF4WOmMZDKGq2s8Elh+mp4q3lodsoRwMRFtipaQBo+ITebYytBIIIGwBCJBDEjgunXVfA9JzZsA1sX//d9H6Mmn36Zrv/11+uSnTnG0YHw8HB5uXUWvtLfRj+d+ljOUpu8FRiQZTLhXnmsQLfPoMXG0RFIaG5lJPbfeZBVKtG4kfUGCHrjgVvIFF1w9w2qSUxqeWyEPKA6LQuKeoEeUKUxKdxlV3xmxgiCI0domqY90cxYB14ggqVplYP9w6QSr2EDDOxAfGKVshLKMGHFomgtohYn44T+u7abvWyt7Q1lIncUj9mhsBleJXuybAkNjqj8cdq9Ub1TMrq5IxpLA1TQdGOkuuUgkw2nuqKisUU+9rNeBRAZYluYK1l3/DpalycVb9XTBybuI9gW+kMajaFD71j7pnzU3WS1eUaWSxhkL6qqPZHYvDrqumtMd62+l9HaqHIjRJ+jsbqp/GTl+CufOkv7BZWjnpKyMyTl0MOmouX/qvvn658HU03H3pYtgEEw1cy9KQ6BOIEhgQUEBBQKBtJBAsQKmcPjsdIUbpnLF5MtI2KmIIbuKMklTgn+z6yjcR4O/G5+hJ/6N4vCqQLz+O+IG9Xi/XmQZVXGEGsvDuOp343v8ztlJw1xCjTWkRAx3KFd9olgWvmjfF1ETrG1wvTSVfFClHVqPCUvw1dxqECtO/mKKEewKdPYt2cLulLXB8hLRN6hr6xt9v+jaoTImt3XsCH4XaOV4RM5iaj1RXxFVIuSd+5hLRQRqI7OX2jk41tuiNATqBIIEFhTk8z3kupRJIGavq1tDL7w2kMZ/dRId72KJCPNK9+7ZQ3+99y+06o/3Us2kT7M18iw65BD71hfr6PVt6X8yaKzJyDyKLJbxpCAVuHzaN5ElFFa/Er7sFHz3KRSitiMIuEcEufpb3QYjbgokJ/bDJ8hEKbtbBt8uID2wiTAi3pD9UbTv+bv2eQZBcQSDxIOoMhjIdGonOUysYc1vRgx8Eo+bFozC3vDEepuj66ze9CABDnO1DqRTR9Aw0QoH6xEo90YmpJFewFFdf4NvnjTcu4qma+eFfdcnq3hOkLoi6pil6Y8AZ1VQXb2wYHemjgX8MFep2mtiZEvVzlxpwnqGiY+R0cKK/poVPS8YozmLa64o4qbrO5mrTVZTi0pNT60cU8u6B1VPtC8ci4psvrHckK2sxCCB69evVyQQlsChQ4da6Zp0G7ECJg2d/Y6o987WvrxD+quXDWHWuMhE03Z/t69N9B7QC5ZCm6ISuJjKNGi1/EJWvrjfB90h8UJMSxpT1PGFUMZNtoi1NAzTSkoo18znOUU9XCq19tVbj9HqopZzsjH+UI3B70mnw4qml3FQL7ja1nIqeOgUXj5Ctef4P0U+OWOo4rJqLk1/LUYwpFuw3qDS5c6oxanLm4wSF0irr62ptfLaYN3ccHgjkuUYOtjcAzQ3SOD69d2KBMISOHRoatl9kR20tvZBWvPQK3RB+Zfo058/NwnNkuuyeeOTtGHVA3TnbyroG9/4bHKDONAre8igFTCQ9CTXJBfXnGt7nN71ulg+ImIhMVPH6m6jbDE0wuNg6cBDrlF7MFBbRlunG98bbpR2k7UkC6yWMpfzcScRF5jsnJH9PIoR9nTBcNqgW0lh6YK1NhWjaR/EVJkDwJ+YLEftC3LHCvU9U4au2v426/Goxhqmb9VKbCgpbQilQ3ZqSxONg3XrumukUCOxTeWsb9k8ah/JdR2byKQ7/q2X+Yi7L86cZ1gCW1tbFfnbuHGjIoNuCqyANTU1hKQ0+UcOpIU/GEuTripxc8qMj53R8hHrzqYPA/+i3X/fSoeVn00Dz2H3zH1smfOIqPIRtyylI64opYGlp9HLNx7lEc0yrAa7htZyRsY+92Db5SC0MhbtfcpVPMvp300unmrciM8MCOJ9x21gCWxt3aLI38aNNykymIrs3XuAC6g/Sr9f/gpN/NZNdOoId5O0GLruYc+I9Q+spc2PPUL/O+OzdM01I+nww1PJhpkKCqG+IPSGuFYlzBlVUxyllfsjm3EuCCyliPcTEQScQ8BFi2C4koEFXHsvakwSYt/Ck40gfimUkITjA9tD5Sa6GudxjaV0lZ/AA3hyyWFQD1DFjDgiHsWIYwaD2UaYuFS0N9B06/U0rCEDK+VqYlcse26nym1SEaki6uJ90Mo0aKJiPQ1d4XILoqcHNBuxqCpGlcm/sh5WraBq5zbT0roRB2vEyAZqtXqclSrmmvXlv5dZ0NesuzkmMOa+OEMCQchAAhELCHdQN0mgWAEtHRfnG7Er5yFFJ1D/gmNpz+b/aq6Z5sJkzs9ofUTOHtq7aw+7pHIM4SnHa66nIppFcd6Q6PdgPb4xrPxEBjFD/TuQQMQCwh00VRK4bdtOZQn881/epKop1XTKacrumhZ5fPXfaMOaR+i7XHz7a1872xMkMC0L98wkp3lGE/cVSc/LDffXITN4CQHXiaARx6TCyxB3pmcbUiCouCa9Tp2Wj5rfQiI+EK4tHMMFywa+V/20WCkVpxfhBugWoOoBnIunG5ZJ6/MEiHmvKWOq9Z59WnoZI04VPNLIDgXS5da+KJfVWdRRbdElWMVzMvFTsZjVtIpBLZ/eEMxkVbSiKmjhUy63cLlU51GPVeWzWM6BMyoWks+c2Tqdwk7a6lrEKWaN+Vu1dA6cEj7A4bJwo9Zqc6qkSbruqj4nr1fFOkbdF7zUQEKi1Cy2U6dOVcXaQQLhDooEMW6JxAK6hWzicVWiFiZZKNuwu/0l2v2PTjpoILuJ9uOYJ07kkpnrIM1VtTePPlj1JA3iEhQHH8+WQCaEIowASkGwS2l1n3hDuJdq1j3L3hpR4g9tYxyjNMXUqatUEXSQQLiDIkFMKrKf41NnzXqE1qx5gcZfV0VFI4v5vu36o41S+Z+PblDuoN+aMkJZAr0okyZN8qJaDuqEZCjxkso4OFVGh4I1EDHKIoKAswikzzXUWb1dHw0E1kwYrE+ouxpmwp3QupLSUhCwjQAKEsNdEaUhUCcQ9QLdEFgBp02bpggnZNyFhbRkweU09NjU4ofc0NXNMTPpGvpJLtED90uQrA8e/Cd98PC/6fAvltCgC4rpIM4AiiLwbom5jr0xh/rs449p3wvb6aN1z9DuZ1+i439+IxPDQ9gieIBe+cYQt9Tx17i6C2jI/wHqo+RD9Iyd0RaH+MOi+m2mr86h1fDKMCW9mbyaS0gQZyiN/Ez3CIkcQ7Xn7+bMWa/cN1EaAnUCUS8wVfnhD9fRb1tepIsrK+jzF3+B+vXvn+qQCfvv37dPuYM+whlCb6w+jX72M6Tm95YYrqHZ7RZqYN7N/3jIWxvguDbn8YiJkuc4PqkMmAMICBGMtskqLk3LkJm06DFnSfeXjoKAhxBIFwnMxVjAWNucaSKo9IL1j10vP1rfTh8+8m/KO7gfHXTEID2LaHpLOiCbKGoaHnx8Ph0+9mwacNapwbhFIYIeulnEUMVpEvj22x/Rbbc9Qc3NT9EVX7+RzvvSmLSB0MkZ0v74f//H5SFOp4ULx1I/dlf2muQWEQT69/IVyqDrtf1ITR9YA1EOIr1ZaFPTWXr7BQEhgpE75QQJ5DGRBdW+S6lfjo3omUsILF68mOASCoElsLKy0vHlixWwL6SeIII6GczjYvIH3uihPf/upn2v8cOWixbB6Ierlw4aNIDjFj9Bh4wYRnmHDtDKTOgiRNDxP0lHB1y8+Em+h8BJH/eQq/keotWOTEXmzXuMfvHr52jM5eNozGVOB6fHOIW9H9Pjq/9Kjz24hr4xeQR99aufoWHDjkxlGa71zT0iCBIIMpiNAotzQTYuTNbkAQSECHpgE0QFQcCrCMA9E8lhIEuWLCE34k3EChh99z1DBHX1VHwgX5nMGaMK3KOGIbuJmkWIoFfvIKTiAZEcRruHXM73kJKUlP3gg73KxfTP971E4667horP/gwNYHf1dMizT22mB37/J7pkdD4tWnQpHXywUWAzHbPbmyP3iCDweZivF+wB5fnWx7GGlZ7XUhT0LwJCBP27d6K5IOAqAsgMijIRkEWLFtGUKVMcnU+sgPHhzCQRdHSjHRisZ+d+mnbrC7T0nu1qtFGjhilSMWKExAY6AK9rQyAzKMpEaPeQ8XwPSa2uH0pE3HHHP2j+/CfoS1dPpC+MT19sXvs//0VLF9xB1V89g+rrR1FREdd+9LDkJhFE4qhWvrLFRRRF4S/nC66hIoKAOwh4z7HdnXWmPKqW/dReCYOUJ5UBBIEMIQAr3cSJiEkgmj17tuMkUDKCZmhjfTpt/pH9OGHQaRRYeiYnDTqENm3aRmed1aQIgYg3EVizpovvIZqr3uzZF6ZMAjHOr3/9T/rh3A10YeWVdPYFSJ6RHoEl8L7f3U3nl51Av/hFuedJYHpQ8eIsiKHDy4FsIE7ZtBYvnhXRyUBAiKDFs1BYN4uT+IfXO7TYVZoJAr5CACQNlsDdXCgZJBCJYpwSqQvoFJK5Oc64CwfTc3/7LE26aiifz/00c+bDdN55d9KWLW/nJiAeXTVIICyB2COQwDlzRqek6a5d+wlxhg2N/6Tyq6+gUV+8kA4/EtYS92X7tteo9bdLaeyYIXTXXVd42h3UfTS8MMM/WIl4JWNwLkAG/Z5Y5WJeQ6KyGImw8MJ+iQ5eR0CIoNUdMhfsttpH2gkCPkNg8+bNyhIIEoh4QCdJoFgBfXYYbKq7e8/HVD7pmaD7ps3ulpuLddAyVBlpuHnzdmUJBAlEPGCqJBCLuPfeDvqfmY/R2ReVqzIR6SCBB/bvp+7nu5Q76FeuOJm++93zaMiQbLA0ZeRYODRpN4+zmS+UiohHBhFXN9qhOTMxzOd40oIEE6/XsejIhIIyZxYhIETQ4maikPfk4q1c4B5FxsVF1CJs0sxHCIAEjhkzhmC1AwlEchgnRKyATqDo/TFqpj9Pax59h/AT8Xxui1gH3UbY/vgggWPGtPA9BC+SSlQcZyry3nt7OMvoFrq57iEqv+ZK+txoDtE4KD2PLZ3tz7E76F1UeFIvF6z/Ao0cCXIhklkEntKnf4V/JiKDn+I26XMfdg4X1AossUACt+pt/s0/45Fi5zSTkbITgfTcUX2PXRetWkHEpYOopbeXOhuIVqzq8v2qZAGCgIFAd3c3lZeXKxKI8hBOkUCxAubGGZu/6GVa/sCbwcU2/G4bTah9lmAldFPEOugmuvbG7u7u4XvI3YoEojxEqiTwY84Q++c/P8vuv3+j084+l0ZfOpbyhyRylbOnc6zWb772Oq288/dUOGwf/e53l9PgwVw7UyTDCOD+Yk4CY4UMglTBTfSQDOtuZXq4sl7AVyLyup7bGCQQ437El1gFrSAsbaIjIETQysnoWkUrRs6iDU11VMjtOzvaaORw/EtEEPA/AiCBsARu376dxo0bR8uWLUt5UWIFTBlC3wzQ+tDbNPOn/9X0PYQfZg7rr/6Jz8+74mnq3rbb9bWIddB1iONOABIIS+D27R/wPaSQ7yFXpqzQxo3b6H9/8DidWnIBXfvNr6XNEvjic1vpgT+soE+dfDD96Edj6KSTjkp5LTJAKgh0UWMZe2KVzSbt9Xs7NTa+SV2Nt1NZIyyEiSyDBdymkq/0xJRaW+mbvKZaXtPD+pqe5zWN5DV9jdcUz8iwnoc3k0BjNrtWQQPTRn3+AM/fxfOXJZjf2uqklb8QECJoZb86+W1LcZHWkgvOV7Q30HS9fm1XYy3F/bu1Mr60EQQyhAAIG0ggyODo0aNVwfiBKdbkEitghjYzA9Nu7viAJt78XGjm73J5gNu/QDRMe+jC9yCDm57e6bp2Yh10HeKoE8ACCBIIMjh6dIEqGD9wYL+UlFm2rJ2+9a3VdM7oMXTeJRdR/wHpsejs/ugjenjlX+iYgW9Q0+JL6dxzP5HSOqSzEwgUUt2Gf1ADPUudPFxXI7+Y55+FdeNp1nC461qxDOZzO7ycOMEJhRwY4zhe0628ptd5Tcfwmp7gNR3Da5rFa4plZFjP80YjgVDHrlUQmHby/B06pvN0TOPNb2/Zgdo8qg3Y65OTrZlT5GUYKCGCVk5eeSWNrC/i2EB+K9VaSb0bNMsgpHD8dBovxkErKEobjyFgJoElJSUpk0CxAnpsg11WB5a+MPfPG4qJPs8PWiCBIIMjtRp/29/aS2Mm/jvMddRN1cQ66Ca64WObSWBJyVBHSOC//vU6/eKOp2jA4CL60lWX0bEnHJ+WBb343PP02/kNdMJRPbRgwSX0qU8dnZZ5ZRIrCLxLw0dyu66HaQFYIP7Z+AaR/kLeGhnEy4QKvuB66dSLBd2yl8cP88YVtPJBy3aqNX1XxpbMkJzAazqWF9LNa9JenHQ1MtELrsmMy3r+JRYJNNqZXshFg7SrkWrDrBaFOqaNJkxjzW9lj4w2mrVxXnEnNWEtPK+WWyP2Fd8KamduB9qmW9/yJuosnsfWYcM668AabA4hRNASYOXUxLGBvbjUydYFTH5BZ5AUWhpKGgkCHkDAIIFIEAMSuG7dOsrPz09aM7ECJg2dLzsi9g8kMOj2Oe4UfuE+PLQWuIf+kB+48DkL2sNyOKehOy3rFeug+zAbJBAJYkAC162r5nvIwKQnRrH4e+7poKuvvocOG3oGVU6aSIMOTU+Wzte6X6HA8pX0wrPPUUvLBDrzzOPooIPykl6LdHQSAcQF4r7xKs1bQDR91okcEvcQLaAzFWcKBNr1yaxYBhGHh7jBa/k6h69US0zAsscP8g2n8lgX0OreJjYUXGx6JhzJz45s+Ss9lRo6m2hDnZFwCDqgTu92XlM/XhOz3I4FvKbx+prMprT13C4RCQQEPTpO0bAPUG1RPVEfa2O7jmn4/BghEEjOnBeoLaIVVZ28Vs1C0sUJNtpKG6hTPUOv5jJsRKUNndrzdC9bJUsn0yy9rZOnJtmxMqFvYd0G6qxaQUUZsgwKEUz2tOj9JldGfX2T4qjSXRBwDwGUhkCJCJDAgoICdcNPlgSKFdC9ffLyyCB1cPtUAsvfjXhdHyGIF5zyGaKb8NCjydzGlxQhdDuJjDGfWAfdOUUoDYESESCBBQX5fA+5LiUSCC1Re/D22zfQB3sPpQk116YtMUzPjnfowT/+mYYd8z49uv6rdMwxkhjGnVOT7KhGplCiqukayWprP4Gmg1QF7qJ5W83ZXK2QQegBiyCIIMhY6P6UrIadHS8STS6JbsyjN6lj5HjSuA4ymWJOWCW1lxxV0zUPs7b2Yl4T/4sNDPO26qFItJ6/sUICDc1DWJnXEqitoGYqDUY4mb/rMz++DNPBBip66FSLidh1UhV1Gl50XVvZRsr/yTAT0qrKGLjZmNfBppnSt7CuhRraKzLiTpvHrLzXQQxzaqiuxkbqrKvz1CHOqQ2QxdpGACQQxeJhwQMJhCUQP5MRjFFTU6OSzOQfOZAW/mAsF/ouSWYo6RMFgblz56pPUZDbS4LEMMgSquQ4fphZOCaYICamnn9/negX/yL6cJ9qUlJ8OAWWnklDj3XKRSsxQkZpC7iqIoYNuM6YcX7ijtIiDAGQQBSLB3EDCYQlED9TERDKqmtaaeinzqRxV0+gwcdqbsVuyztvvU2tS5fR7h1dNP+2i6iiwngAd3tm98fPy9PuH355xEOikqL6Nta4lK1ns6ijaB4Vd65hAhUneVngYWosulgnWWZMP8m/2Ckq/z6379YvvlfZErh/3kG0uklzhYyUwD1USz/l7wr4Gwt/J4FGXlMdr2k9t7dDAo2JsW7MpQlwXcBkrL1+BVV1boiCVTSdDR3sAAGX0HBrYGRvbY9HKsupH0wo6dZXzbfCRJztwJ9CW7EIJg0el5Sg4b44zEkvUTpmHQIgbiBwsAAmSwLFCph1x8Lygpbesz1EAg33Tz1LaNxBEDs4j0kXiCOLkUQmaFW0rEHyDcU6mDx25p41NfcrEgg30FRJ4IEDvdTW9gpNnbqKjj6xiMrGXpQ2Erh/3z5ad3+Aet9/kZYuuSyrSKAzO52+UZBYRCMIcBdsoeEL5lFzaRXnXzDcPqPrEmhdwaW8zHF3RjurlkGjPZJbwTL4Zb4m8TWaL1jvLLiOBjazte0CCncOK+C+KAVxPQVaT+HvSvjf+ZYADbTW85ru5rbJkEBMYbIKcrzbAmqhpuEdxLnu+3qGxtBI08FuibRO4oT6cTLqowwbN5jsLQtg7E1Jv76FCIRtW0G2obd0smI3EiKYDICIDcyrJhrvh3caySxQ+mQjAiCBy5cvT4kESixgNp4Ma2tav6mHps5C3j5dkCFUzw5qaYRTOA0/ksjgJwviC5FRFGUm0iUSO5ga0iCBy5e3O0ICoclzz71F8+c/QR/1HkdX3Hg9nVyEh2/35d23dtDSn/2StnVsoqamS6VYvPuQx5wBVpCKZlgBDSuRcpSk0qqL2GUyfn288iZz3F3kFPbIIMioltBkAF+n8fVFvrhsiZHspRYvsUbzBZfS0BVofZyNmBdTEV3Kn0/iC1FwsMqdztej1MqlK+w8KZY3reP4ug9T2BEjppLjAvkxVbmb2pTypt5gjJ/lrsrtM7r7qTaGRhRLjQz8lgfOVMMM6FtUzAi2UYfpP7PpWL0QwWRQ5iw/vb0WTezJjC99BAGHEZg6dSotXbo0SAKRIMaOiBXQDlrebwv3SDsErE+GUMT9nZ1ENsejOZmIKaOokUQG+qRTxDpoH21Y7ZYu3RwkgUgQk4r8+99v0KRJrbT9/WPp6m98jY4anJ4snTvf7aH7W5bRqy90qmLxZ599Ah2CeFaRDCAQoAXsDlra0GJyWQxQKxPDqvGIQT6Qok7WySDIj5bAJMbVdD3rgoRYZiL4JuvK5KbqOiatKDUS4eoeaOUShnZo4HoeI1lLoBmqZzjMj+MC2+qpCOS2AkoWM1l1UbjMGhx7YwpjgTjFqjSn2Q8R/BhZS2MlaMmQvi7uUMyhhQhmAnWZUxBIIwJz5syhxYsXq/qAKBZvlwSKFTCNm5WmqRCbh6yfDb/blnDGnp37qXzSM4SfSr7MVhtcycqbXPPqv+8Fey9ZcFpaYwWNicU6aH0D58xZz/eQJ1VsJYrFp0oCUSz+G99YRa+92UvV3/0Gu4MeY12ZFFs+vPJByvvov7Tw56PpvPOGpTiadE8Fga5GdgFlC5o5a6T6rLSS3ULjWwOtzQuCn8/XHmvN7baKlvzENIY9HoiXYXBRjZcpVy9HURvfZbarsZ5aK98OktrVMFKOHO5Qhnu2NIJcRhIoZc2KLQGNMae93Fpigh+dqGdKX7tH0In2QgSdQFHGEAQ8igBIIJKOgASiWPy4ceMsaypWQMtQ+bIhiNC0W19Q7p7xsngiy+eWF1CwmAVWQFMWUNsLR7KYH20MJo2ZMfUkuubL5qx/tkdMuYNYB+NDCBI4d+6jigSiWPy4cfZdzSJn+CYXiz/4qOF0ff036eCDUys+b/UA9OzYQct++Rt6qf2fNHPm+XTNNVEy3VodTNo5gkCn5isYslRxTFs1LIRVBUxaUrEGmrOChjJ0xlM6actRLHdIXss8W26hkTqDFEYKylGwR1pTnLOLWotUw8lpjFjBLtoanzfa3Eu9nFpkZpzC4RyFGMutUdfBMTJqU2XbzZ3VVztbZRRWxjGaTsqqGs+91vZCLHUQImgJJmkkCPgPAbiCGpknlyxZYosEihXQf/ttV2MQQcjiu18Lt/iZBgJJRLZNJYgHRFxgssJ14ui2vxPBIshSeckQuu1/tDqDmRaxDkbfAbiCggRCliy5PGUSuGnTNrrkkj/QrgOD6bxLxtCpp5tqT7p4CHo//pgeX/03em3rv+iXd3yJLrvsNBdnk6GtIlBUzDaktg6OHmNBIe/qDhpZeh67D+40DcFF2xutMhlY00D8jDqB1utQJmU5KqyjWZPbqL6olsKq7mEtRR00K2oa0UToGLUOUWZiNF/5iTqEvudyGkhfoUprqCyoiBdMV6xbEWE727dGSTITWEBICOubcmsO61s+vYFKLVhDu8DYLbSzfiCstRQiaA0naSUI+AoBkEAkh9Ee4Jbw2+9rLOkvVkBLMGVFo4JhoeLfSASDxC1Byx+vEG6jIIlK7GQIjYXO4n/zU4KWGAblI5b9AskUvCViHQztB0ggksNo95DLU7agvfrq+/xA/3fa+hLRDd/5Bp1ymqsRS8GF9Ly9g+773d3U3vYI/d//jaWLLvLGywdvnfzMaFNYN4sdQ5upAq6GTGBaWoo54cgF7D6oWwPZulWW9wOqr7+DamuZ5HDillouIF+bd5dGvNT3nLyvdgV/tpjP12Pc5pf83ctcysBwX0RZAz0+zIWC3SCQnQ3t2hqMC2txpEQCXpRU8YXkM/E8J3SX0QpOXMNZJ6sb9Uyqga+yTqghyB/XF1FeWSN18f8UHurfkADjxp9y0p6yhCareOekkOpmTebpV+njamMrN1LEKLI0V5jnNY2lEjAa+OmkGmRafaZb0lQbfKfrr+8l9FZ9Hdlbi/oautXyeWT9amuhA+umPoe+mo4GnihSP3Jkh4rXjK2mlqV08iytrmQ6ReoIphNtmUsQSAMCra2tqlYgZOHChfwf0XpLs0pdQEswpa2R23UE4fK5/IHw1OuwjK1sOkO5iiIuUAkSafyQ37KjcHyyci8nQPiDFvMDArrxvrMyEhdoR/1crjvY2rpF1QrU7iFj+R4yyg50fdq2t79Js2Y9Qv/ZcoCur5tCnyhAnTf35eMDB+ie3/6BnntqM/2u+SIqL0/3I5b7a4w1g9/qCGIdXY2lVE1XcsbKkFtkoPZ22jr9Fk4mw5bBsiW0Ag1HnkstTcfTgryHuNbgKqrr/CmTDS7l1zudttau4gbcajrXIlxAnBW2iIlOJ9XVWU3aAhL6hkMbl8/jWLdKJp4UL+b4hRohCY5VuZIbRsbggqgsoOEbmqiIiVQ1l5jYUNdJgUA5/41YHTd6O7hBzivutJV1tIuJU2Eh/20aNRRJt6iCTIMAtlayOyzvY+TeTt9KZQuG0wbjZ1IWWLvrBVlEjUtOGNnJugXPXTWtaK+iqpFc0oQNe1VVI/kUTmcciLHm76pm0YbhrfpaooAcXGeKG2B3OdxeLIJJgCZdBAGvIgAyN3EiXEpQiHy2JRIoVkCv7qa7ehmuoWoWneQZiWFAEoNyI8ejpEICUUxeJ4EDBxykiGY6C8kni2KuWgdRI3DixHv1e8iFKZPA7ds/oGnT1tLfn9zBb7u/kzYSiAWsWdFKb7/4L/rRD8+liy8WS2Cyfwvp6tfZsZFzmphj49qptf1cLcFI1zOEMnRVLbfQBmTwbGyj9oYHmSDqiatQn65rFXW0r6COSjykt1K7KlXAlip+ALdnMHqE+z3owJVKnGM01JGZFEQB5M5qwq7NUQYqJJSsgzvuAsWs8U9+WecABylv6qSqFVwT1IZ1USOBIHzDVfZYWNCoYbpSB+6SquRElL0NLKintuYKykvaDdf+yUYyo3ZzltvguauiWRvGs9cLV2yctYH4X1qGVNZ7xUgmgfwiIriWiGmVVXNeMXWmhcj2XbNYBO2fA+khCHgSgfXr1/PbvHLavXu3IoFIFJNIxAqYCKHMfL9lyxb60580i4xbsp6fD3ApWTiG6IlXiWC5M8uV7Jp0Q3HyKiA76C2PESE+kOWai4hGnJT8cJnq2cXQtD5B9MGuTGng73kH5R9Pnyj+Ah15XHrI2P69u+jdbR30Wsfj9PH+9JYm8dpOoRyCL6RrIcfVPUizeq8O8RGOeSvbegk/RB/HROV2tlzhgRqP2DuVlYVamPAp61E9jVzdS01Uy+1hhSlkXlHGlsQWogWraHxTHXWyGx+bBy1yHXaxJNPLsKQAPIF7oUC9m/I+D46kMC/wFYt0IuYQL4fDLZPAZx67nbZUdlB1K7/rK55OTUnUHIy1OpCbBcM3cNKaxOtH26KOWcrq19VVSJ0L8jjrKe9nEfZ2BVXp1rc+e1utnwG2zNXy7luZK7E28VrAkhrn3I1fpVkoYb00WVw1HGBJ5KqSkS7DGbQEGisVi2Bqp0J6CwKeQGDz5s3KHRQkcNKkSQlJoFgBPbFtUZVYu3atIoFHHnmkq0oePsg0PLJ5gvDdfLbmCgr5PD/IpEICkRQGyWF0EvhFLr/lRxIIKApPJPoWe1uX5I5noWNn75BBR9KwMy9KGwmE4u+9tpW2/efhnCeB+fn5ju2jewPpMV9F3+GMiY9wrJ0e/8cTdm19lWPbfsDWpcOos+NFthYi7h2xcrBoIUkLYguRYIbjz+Y1UiMTGq0UBWoR8vdMFFY0a7X0Ktrt1NFzIplQOm4WsJ6O5gtEj2u7RtYxVJsGggh30r5SNV2LR2tjbJIpPB/vTBTWWSOBsAQWIZMMLHscKArH3vJKjhxFPKFBAmEw7LO3q2g4h0+qM8Cuo+6TQPVfgrjnTsUCom4krIBtzTSPraKF46uoHWtR7qRRXkSgLnl6lI+5XWIRdO/uJiMLAmlBACRwzJgxBHIHEojkMPFErIBp2ZakJoFV99FHH6V+/frR1VdfrcVNuCTLH2iniTdrLoCKAF6km+qe5yyhcOVEXGCyhbZB/mAJ1OsFTrnuXFo0D2/y/S9rHu2imun30/a3PlBlWWB9nzFjhq8XZvcekmixH3zwAX3/+9+n5ffcT9d880dUfPb5ibo48v2e3R/R2hWLaeu/1tE3ar9GkydPpsMPP9yRsf0ySColgzK7xrt4er1MjVIEL6TgjQAfxmilFNzWdhlPAItbMgLdb+ArosB8MkPZ6gPrN2K7Yc2MxLKvVdDW0NI4axEQi2DWbq0sLBcQ6O7uVpZAkEDUCIxHAsUK6O0TkU4SCCSGHmt6QIZF0JDTBhPN4wf3ZEkgxvn5k0ESOHpUAS38wVhvg29Du3EXFtJzf/smTbqqRFngZ86cyYXJzyO48/pR7NxDrKxv27Zt9J3vfIcCj7TRl2+op9PPildm2sqI1ts8vnoZPfnoKrrh2quVDkICrdeNtY6yGy27TcTFSj09N3SIHDOV0iZIhpRuEgj9Y2EX2yqYDiRlDm8jIETQ2/sj2gkCMRHAAxwsgfgJEoiC8bFE6gJ6+yDBIgNLIOTyyy931RJoIBGTCKYKFayJSBDDUjAsn5PDXE0DB6SnaHiqqlvtn3/kQFqy4HIKLL1OEepNmzbRWWedRfPnz7c6hCfa2bmHWFH43Xff5eygs+iBBx6kK7/2ffrs6MvYJSo9jxlPPvYgrV1+B323bip9+9vftqJuVrVJpW5s5oFAnFvyNQDd0d9qMpZos6fS14nVRKtFiKzNZiuhE/PIGNmAQHru0NmAlKxBEPAQArDuGSRw9OjRigTCTS1SxArooU2LoQpI4P33a/XaQAJHjoQrlPsCMhMUvch7yrM+vi2YcAbjgyiFzZPyBN4awM/WQav3EDuIz5v3Y3pg9UN05dRbadip6akTuX/fXtqw5k/0t3t+w/W8aummm26iwYPZqp1DkmzdWG9AhKLniG+LF+eWCU3zedJ4tfti6QSrXEEmFI4xp1GL8GL+XntBJyIImBEQIijnQRDwGQLmB7iSkpKYJFCsgN7fWNRPMkjg2LFjCfuZLnHcIohi8Xc8rdSHBRCWwBGfSqH2YLqASHEeP1oHrd5DrELz9ttv049+9CO6t/UBqpryAxpRUkr9+qfHNa7zmb/T2mWN9NWJV9DPfvYzGjIk+8+ceV+MmG98hrqxiBP3l6DGHciKnqTKU8onY9lDHy+upYD1SmY9ntoQUcYFBIQIugCqDCkIuIUAYpJgCYQVCaRh3bp1FJkZTqyAbqHv7LgggUaJiAsvvJBGjUqtaHcy2gXJoDlGMJmBIjKEIiYQsYG5JH6xDlq5h9jdt8WLF9P/Nf6Kzr3oSvrMeZekhQT29n5M//n73+j+pT+lb37zGyoxTK4JSCBixCFW68bmGkaprTcZ4pRMn9S0lN6CQCoICBFMBT3pKwikEQE8wOE/+iCBBQUFyhIYSQLFCpjGDUlhKsRmgQTu37+fQALh3psJCbptpuIaChL5o41EOpmsv3EUIUtoLorXrYNW7iF29u3NN9+kW2+9lX61+E664sZb6IIKuPelR57esJbuu/OndMmY81Vc4rBhw9IzsUdmQXIpo2SQ1bqxHlHdR2ogbhGJX6wKspui6LuIIOAfBIQI+mevRNMcRsB4gAPRAwmEJRA/DREroH8Ox/bt24MkEFbdTJFAIBa0CPbsSR5AZAjdpqVZh1UsmzKEJguKF62Die4hdteKEhG/+tWv6Be/+AWd/YXx9LmLLqcBA8OLVtsd02r7lzqfoQdbFtCVl42jefPm0cEHe9EVz+pq7LezWzfW/gzSI4SAHQufnbaCsSDgDQSECHpjH0QLQSAuAjU1NQQSCAtgIBAII4FiBfTP4QEJbGlpUWUHQAKRHCaTEiSCqPunF363pc9iLlT8rzdUF4yFuEARDQGvWQfj3UOS2bP77ruPfvHrZhp9RS2XiZiWzBBJ9UF20Pt+dztd/ZUr6Oabb6bjjksmoUdSU3uik9M1Hz2xKE8rYSfmL5WSE54GQZTLYgSECGbx5srSsgMBPMAtX75ckUBYAkeMGKEWJlZAf+0v9gvuoCCBKBSfaRJokJUgislYBfuH/hOCAuvTbl1Lu/fs99fGuKytF6yDse4hySx979699NOf/pR+9vP/o/JrvkGfv6gymWGS6vNq9/P0NBPB4lOGKpfU0047Lalx/NrJ6ZqPfsUhvXrD2mzF0ocXEvnpVU1mEwQcQECIoAMgyhCCgFsITJs2jZAaHKUhQAKNrJJiBXQLcXfGBQmEJRA/QQKvvtoblrPjhxwWWvC7u+0v/iZO+37z2cHi84vvfpLKJ91NPTuTGMv+7L7pkUnrYKx7SLLgrVixgv7whz/QSWd+gb5QcS0dfuTRyQ5lud+B/fto67830W9vu5ku/PyZdMcdd+RcsXinaz5aBl8aWiSCVsiigCkIeA8BIYLe2xPRSBBQCMyZM4caGhoUCURiGJBAsQL673DAAmiQQCS0AAns188bBdZR8D0oyWYOvegkolvLiA7rr4Zav6mbzrviTtryApeTEAlDIN3WwWj3kFS25PHHH6dvfPNbdMYFV9LFlTemMpStvs89vYHuW3I7HZt/qCpTkWuJYczlPpBdOFbdWFugSmMbCCBhTKL4VyGCNgCVph5CQIighzZDVBEEDATwADd37twgCRw3bpyKETz99NOVhTDSwiDIeRMBMwkcOnQoXXfddZ4hgUAsrNh7Mq6hBuwggbAO6mQQJBBkEKRQJByBdFkHo91DUt2LX/3q13RQvwGcHfQaGnQYMiS6L3t2f0ir/9hI48aU0oMPPphzlsDImo+IEcfLQZF0IxCP6FkhiunWV+YTBKwhkNfLYq2ptBIEBIF0IACih5geyJIlS6iyspIM9y58BqvCkgWXhzI+pkMpmcM2AigNceeddxISxIAEVldXe+4BDkRtzMQWbW03FBNdqSc7gJvoqx9on6O0hFFewvxvfJ/AnRSF5ZFFNFfLSSQ6NHChRVzl0ns2q6aw9uBv3ogDTtQ/1veR9xAnioy//vrrVFVVRT17+9HVU35IQ4ayJdhlefG5p2n1sjvotJOPpZkzZtC55+ZWWRK8SDrvvPPi1o11eQtk+CACb/K/WmPgcTF/LhZBOSz+RECIoD/3TbTOUgQiH+BAIEAKQSZgScBD9aSrSrJ09dmzLJBAJIZB0Xgk+QEJjKz56IXVdm/roVMuaNRUOYSTIiSTOdTCQvDiQs5tbKDWPNpFNdPvJyTcgbUHdeFmMPFJRtwggdADSWKmTJlCq//6KN3846U0+Fh366Xt2fURv/D6Dg096mD69a9/TaeeemoycPi2j9PlPnwLhKcUX8Ha9ERohGQyk/jKrRImntoWUSYlBIQIpgSfdBYEnEMArp/l5eVqwJ/85Ce0detW5QYKESugczi7PZJfSCBwgEXq6M/cbhuSEZ8aErRI499G0pmS4qFBd1Pzv21PkIMdnLAOmu8hCxcupPr6eseQ3Llzpxpv5QMBmjq7iU761BmOjR050OsvdXKJiPl00rGH0e23305nnHEG5eXluTaf1wYWEui1HTH0eYr/gcss8KIY7VWFRS9BICECQgQTQiQNBAH3EcAD3IQJE1RpAcSRPfzww2IFdB92V2a4//77lSsXLDs33XQTDRkyxJV5nBo075S5hKQxRuIY/Dz5xKPU8ObPzeTPqbllnL4IJGsdNN9DYFFEjKDTcuWVV1LbPzfTpO/9nE4u4phQFwTF4h/4/f/RgY920BOPP0bHHHOMC7N4e0h4gahYcPYm2LhxY8quwt5erZ+0e5+VXRahMF7eIkZQRBDwJwJCBP25b6J1FiGwadMmGjNmjCKBZ555Jj3zzDNqdWIF9N8mm0kg3EHh2isiCNhFwK510HwPgUvpbbfdZnfKhO3hGjpr1ixqaPwFfX1mI535+S8m7JNMg0U/qqXTTx5CdXV1Kj4u18RMAs0lg3INB++ut5VVQ7wgBJlEr/euqqKZIGABAckaagEkaSIIuIUALEdwBwUJHDRokCKBkhHULbTdHXft2rXKEojSEEIC3cU620e3k1nUfA9BUhg3SCDwxrkePHgwHXbEUdSvv/NZK9956zX65Q9vpKMO2a/ionORBDpd8zHb/04ys77TTNPqybUyo4jMKgg4goAQQUdglEEEAfsI4AFu9OjRqjYgZNeuXcoK+NzfvimJNezDmdEe69evJ1hl8LCMOoFiCczodmTN5InqDuIeAm8C3ENAApFx1E2Bq+JH7/dQ3sHOPjrs2f0R/aXl/2gQfUSLF/2axo4d6+YyPDm20zUfPbnIrFDqZF6FkRhGMoVmxZbm+CKcvZvnOJiyfEHAKgLd3d2E2oDvvfee6iJWQKvIea/dE088QY8++miQBBYWFnpPSdHItwjEsg7ecsstKq4YJBD3ErdJ4EEHHUQ7duwgZoH0/rtvU2/vx45g+lr3Vrqr8fuU99F2ampqolz8+5k/f36furGOgCuDuIAA3EGRMTefr9yLX3UBUBkywwhIjGCGN0Cmz00EUBh+y5Ytubl4WbUgIAg4ggAyacJ6tnLlyrTUqHzsscdo/JcrqbLme1Q29uqU17Dz3bfo7jtmUc/2bnr4r2tykgS6Ve4j5c2RAeIg8AJ/h8QxJYKSIOB7BMQi6PstlAX4EQEhgX7cNdFZEPAWAr29vWkjgSiL8s4779AArje57cXnHAGidcnPqN/ed+n22+YJCWS3Xrj3ivgBgQJWUuID/bBTomNiBMQimBgjaSEIOI6AUROrt3e242PLgO4jsGZNFyf5uVtNdNttF3Px7/Pdn1RmEARMCOTlzVW/gQymSx5//HH6StXV9NmLv0Ljr7s56Wl7dmyn9Q/8gbb8Yy39orGRLrvssqTH8mtHc81HJPhBtlcRQUAQEATSjYBYBNONuMwnCAgCvkYAJHDChD+pNcyefaGQQF/vpihvFQEQzgEDBtDAAYfQCx1PUe/HycUIfnxgPz28cglt+fsaWvK73+UsCUR8p3YPmS0k0OohlHaCgCDgOAJCBB2HVAYUBASBbEVg06ZtigTu3r1fEcA5c0Zn61JlXYJAGALwYkBimgMHDtCQoZ/kn/ttI9Tz9na6n7ODvv3fp+knP/kJXXjhhbbH8HsHZBcGCUTJIFgBkS1URBAQBASBTCEgRDBTyMu8goAg4CsENm/ertxBQQInTSpRLqEigkAuIYAkVyeddBJ9wCUk2CnV1tJhQbz/9z+nf6xrpR/Pu5WuvfZaQiZSr8vMmTMdS+yVrpqPXsdU9BMEBAHvIOD9u7B3sBJNBAFBIEcRAAkcM6aFLSK7FQlcsuTyHEVClp3LCPz3v/+l/v37064P3yfU/rMjT6xdQa8+/yQtmP9j+uIXv2ina8baoqwDLhS3R63QVCTdNR9T0VX6CgKCQO4gIEQwd/ZaVioICAJJINDd3aPcQUECx40rpEWLxicxinQRBPyPwDnnnKMyhx58cD/LBsG9e3bR2j830frW39Ctt95Kl19+OR1yyCGeB6O1tZVgDYTAJXbMmDG0ePHipPRG3VhzzcdFixYlNY50EgQEAUHAaQSECDqNqIwnCAgCWYMASCAsgfgJErhy5dVcr40fgkUEgRxEYN++fZSfn09vv/4SHdTP2t/Bxofuoec4McysmbdQdXU1HXvssZ5HDta7iRMn9tFz6tSphMuOgASCROLnuHHj0lbuw46O0lYQEARyFwEhgrm797JyQUAQiIMALICICQQJHDVqmJBAOS2CACMwdOhQGnjoEfThznfj4nFg/z7623130n8eb6VvTZ1MN9xwgy/w2759ezCZCxQe9aVhdPEVpwZ1h1UQxA5WwkSCNuXl5YoEjho1SkhgIsDke0FAEEg7AkIE0w65TCgICAJeRwAkEJbALVveppKSoRQIXCeWQK9vmujnOgJHHHGEKiFxYN+uuPULkRjmycdW0doVi6l87BfpW9/6Fh1++OGu65fqBMjkCUsgiBuk6NPH0IWXFdC5Yz5BX5l6Bg0YpFlBES+IuMEtW7bEnNJwJ0WbkpISvocE+B4yMFUVpb8gIAgIAo4iIETQUThlMEFAEPA7AsgKCksgEsSMGDGE1q2rZne4XHuA66RaLlieV7aJuuxuaNcmKkPf2s7EPfW2ZY3vJG4rLTKOwPvvv8/xgQfTrl276KMP3oupzwsdT9LfljfQrXN/SPPmzcu43lYVmDZtWjApzHHDDqPLJp0W7Hpq8dF0w3c/Q0cN1u4FIHixksiAUMISCBfTESNG8D1knXKpFREEBAFBwGsICBH02o6IPoKAIJAxBEACkRgG9QILCvKVJdAggV2Nd1IeCE7Y9SAFMqZt4okt6Rx4sM+6apNdFMYqWkttiVUjpZvFthaGkyZpQABkprS0VBWT3793b58Z9+/bS3+797f0l6UL6H//93/p+uuv940VrKGhIZgM5rAjD6Ervn469esf/oh0zPGDqGZGCZ1UdJRae7QkMiCBSAyDeoEFBQXKEhiLBKK/FRfTNGytTCEICAI5ioAQwRzdeFm2ICAIhCNgkMA1a7oUCYQlED8NKay7id3hZtPqyfhkGDV0zubfL6VyDwOp6fxtaijVlCxt+HZfncsvpd7OsYQm2vezqam8iJr4Z++GUVRoZ30Yq/daUhAlEKWbPm+itvK9NxDYy+TvhRdeYBK4m957580+SnX863H6+7r76bLyi2jKlCk0ZMgQbyieQIs1a9YQrIEQkD+QQMPyF9kV7qFwEz3r/KHBr4wkMgYJxHgggbAE4mc0MdrGcy/1BXiipCAgCPgaASGCvt4+UV4QyAUEdDfFvDup0bafonV8pk5dRSCBsADCEmgmgX1HOZ6G22JI1vVwvuVgqtugkbO2+pVRMexa9SwRk8ANdYOdnz7eiIXH0Mj0ziizpYAAyj4g6+fAw4+i998LufPu+ugD6mz/By274/v0vZtrqb6+PoVZ0tsVRMycIbTiuiL6RMERcZUAWbzk6sI+SWROOeUUvoesURZAWAJjkUAMbrihIjmNiCAgCAgCmUJAiGCmkJd5BQFBwDMI1NTcT0uXblYkEJZAxAZml7CFb/U5vKRtVF8dEffHcXrVK86glnSTwOwCOGdWc+ihh9KBPR/SoYcfGVzz5raH6A8LZ9LYL2mJYYYNG+YLPIysnoZ7JjKEnn6O9fIWkUlkQOoQQ7lkyRIVGxhLzG6o4hrqi6MiSgoCWYuAEMGs3VpZmCAgCFhBYObMhxUJRH1AWAKRJdSuGLF4KrbOHHMXkTDFajs1v5F0xYhJjDNWoFaPXYyXoIXdNpVba9taqg4mZ3mHGqufpaqWSBfQOMliEugVHzvDumvo+3yU5hFteP1Jxyza3UhpHxcB1BFE5sudO9+jD9/voQMH9tP2bS+qYvFfr7lOESAQIT+I4ZoZmSHUru6RSWQOHDhANTU1waQzkeOZ3VDxnTG/3XmlvSAgCAgCTiAgRNAJFGUMQUAQ8CUCc+asp/nzn1AkEMXiUS/QnjCRKptLRfXbVLf2eZwApfU0FWfXCwtc8x91EmO1nT47yGQ1UQvGMY2lZeLsO1Zr5WzqbBhGpcXHxFW/vMlwEW1TSW66GlfSiqoJVGd2c1VE9o/UHG2kuHolQE4RyD9Sux6HqGIX25+KmAdre4yKVfwlrlB8o719kdZuINC/f3/6zGc+QwUnn0x79+ympzesod/9dBrdVH29Ij+DBg1yY1pXxoyXIdTuhFaSyGDMSDdUfPbGG2/YnU7aCwKCgCDgGAJCBB2DUgYSBAQBpxAIz3ZpkBJ2aywyZe20Up4gjkIggHPnPqpagASOG5dM0B/i7zQSpoRJVW9TkfbvoiEqAUv7VsRSWW2HjkyG5r1BDWYrXXmplvCl+TGO8dPGUkRTn7OJM9Yg+UriGL8imq50fYoqyu6M7hIaM+FLIr3i735gAWcTLR1rckHldbRoSWpCsoM62rbRilVG/Bm3maWv06nDJeMkjUBvby+9+eab6nr79ZfpLy3/R2NKz6Hp06dTYWEyfz9Jq5JSR7NrJgZCwfjIDKF2J4iXRAZjRbqhGuOLa6hdpKW9ICAIOImAEEEn0ZSxBAFBwBcIwBUULqGQJUsuT5IEhpZaOPx49cvI4aZkK1ESoVhq17WVVjAZCiO9eXdQvarJsI06Isrzhc1pAf3CugkaqeTx+rqEGgMcQ8XhDI3Nh/b0ClOFrYHz2MRYWjU8PAtpH4y0edvq72CrpF6ag4kpiK5I5hHIy8ujs846i11CD9DjgeV08YWl9OMf/9hXlkCgOG7cuLAYvvt+8xy93Bm7LqJV5GMlkRkzZowqKWF2Q0WJCogki7GKrrQTBAQBNxAQIugGqjKmICAIpISAUapBcw80yhEYJRt0t0HD8mZzJpBAJIeBgAROmlRic4R0NI9Yq+Eiqko7pDr/YBpfZdcF1pgzSb0637ZUW9CwnGolOthqqeIjvV2rMdXd8Fv/119/nQYPHqwKpre0tPgmMYwZZyRy2bhxI40ePVp9vGfXfvrzomfp6SecyeAZmURm/fr1fQrVDxykxVIKEfTbX4DoKwhkFwJCBLNrP2U1goAgEAcBlIdAmQjIbbdd7FESCO36Wv68sbGp6dXWscPSMsqbNLIfJIRlEZlOLY0ijdxAACRqxowZ9Jvf/IZQTsKvghIPqPOHeoeQ/fs+pof+1EUP3/eiI0uKTCKDQc2F6sUi6AjMMoggIAikiIAQwRQBlO6CgCDgDwRAAidM+BOhcPzs2Rfyw+z53lRcd5dsrohiCQtscrWWYlxAUtGr/DStyHzz8ypJTaSECCJnDDXFfoIQqvjLtrcpwiPWm3uXA1ohIQwKqJ944olZsdpFixYRLkOeXPeasg7CSpiqmJPIRBaqNwrWS4xgqihLf0FAEEgFASGCqaAnfQUBQcAXCGzevD1IAuvrR9GcOaNT1PsN2moqbt+1NUrmv64d1M6zmK1g1toZNf8010ijdIJKoNN6TDDDpzGWlowmGbFr3bOmV1CT9h0UgsicpMZk3Qs8r2UN5eyqQRdQ/ndZsLyFPlrpENJT8CSzUOkjCMRFAFZBWAdhJYS82PEu/eHn/6b33tmdMnJGEpmJN58ZVqh+wKGhMhteKyHx4a699MK2t2lL9xuOXk8/v43WP9VFT3a84ui4hp7Q+b0PUt+zlDddBhAEfIRAHmcB6/WRvqKqIJAVCCDpAgTubyLuIgASOGZMC2ft261cQREXmIyAiBllIkL9uWRD6TZqU4lcdJl8LXUWPxbR1mq7c2h176WkwgBRbqGIM22axtUykqLEgpE8Rv+Ss3F2boisBRhllSj/UPFUxBemOaPNSwm+5/UGM6X2GR8xhTeFyGskhpPPocnNXEIiOAZqCEaUrrC6tmQ21cd98vglgXYPkf+EO7WNKO+ApC74CQGJu+Lrp9NJRUc5NUVwnE1/3UaP/qVb/Y54xVGjRjk+R7IDdr3yFr3z/m7a+VHqVlGzDtvffk+dV/z3b+gQ5zE98tB+lH/YABp+8nHJLl36CQI5h4AQwZzbclmwFxAQIpieXdiy5W0677w7UyaB6dFWZhEErCMgRNA6VnZawlUTZBAJXiBw6byIy0ucdf5QO8MkbPvM39+g1XdpDs+BQEBlMvWKwMK27e2P+PrQUZXeemcnHdKvH+1nMnjMUYc5OjYGGzbkML4OpREFWhZnEUFAEEiMgLiGJsZIWggCgoAPEeju7uHMhncrEogagYsWjffhKkRlQUAQSCcCbieRMdZy2BGhRDtezhz6ieMGU/LXZvpz+ZlUc8u91MvjBOWNP9ECfP6bzSmMHa4X0ePU8NlT6fQrm00u6ek8OTKXIOBPBIQI+nPfRGtBQBCIgwBIINxB8RMkEAXjBw7sJ5gJAoKAIGAJgVtuuYWOOeaYYFsnk8hg0MP1OoL4d2oxgl3sKp6n3C3DLiO4OLiCyHZlmUk8tXk+fa9uIXVY2gVpJAgIAm4jIETQbYRlfEFAEAhDYPv2D2j+/CcUUcM1bdpaQhyfUwILILKDggSWlAwVEugUsDKOIJAjCBjuoTt27KDCwkI66igtns3RJDKmZDHvvZdKMftCqtvQS71arRWWUo7L5d/7FBzV2mnNJnMs8oZg7K4j27rhFmrcEDnSRVT31Ku0dsnXKZhjtmQG/Wz5QqpIZdKoc11A9f98kZ67dzIVpjK29BUEcgwBIYI5tuGyXEEgkwighMPpp/+KZs58mGNwutXV0LCJzjqrSf1MVUACQS5BLEEC162rFktgqqBKf0EghxAACRwzZgzfQzbzPaSE/vnPf9KmTZsI9RMhO97YRUvmb6aXO1Mhb0RG+QiM6UgJifLp1FCK0dqoI0Gtlcmrm7SEVI5JN6387V2OjRZ/oHTOlaYlyTSCQAYRECKYQfBlakEglxCAJXDixHtVzF40gWVw06ZtSUOC+oCICQQJHDFiiCKB+fkDkx5POrqPAF4EzJmznuvSrQpaiEHka2ruV5+3tmrZG0UEgXQgsHv3br6HlCsSCOJnlJTAv5HZc/To0UoN1BhErcGnn0jNk8EoKp+aa6iBDFv8ZmlWwebWaNU68U2AWtsbaLqjLJCJWU0ZLf5POnYonXOlYz0yhyCQeQQka2jm90A0yEEEvJw1FA/ieEB3U5B/byFf+XzN5GuzPtmoUcP4gesm21ODBMIdFBbHgoJ8RQLxU8R7COCFwNy5jyqSh38nEpD5ysoRVFf3eWXlFdEQkKyhzp4EkEBkC12zZg3fOwoUCcTPSJk6dSotXrw4+PG5Yz5BF3NW0WTkt/OeUhZGEM3nnnsumSEi+iAOsIjq2+Ae2tf1s6uxjKqphTbU6c6TXY1coqbeVKJmtXIpNbKG/uu3V9AtTZup4hevUh3dQmNv1q1+V/yB1v7vRTx3dGKm2pdBtUeo8ZwbaPWn59Dv2D307S3detbQNnrkmmm0OjiOsYy+4xV/dwMtvBb7EH+u1968n+4p/watOvtH1PnUDyLcQwNclqZCq1mqpC8+wKaovo0mr+6lJqrlMjt668kaJiKCQLYiIBbBbN1ZWZcgkCQCIFGob+j0ZX6IBwm8hi8kTF9p0jPZWEEhgUludhq7gazDynfKKY38IP2kJRII9WBBXrp0s3IfhuXQCnlM47JkqixBwAoJxFIXLVqkLkNSSSJjWAQdcQ1VChlWwTaqXxBpFQzQgvqRNMsggQEmO9VELVzKAbX9VIxhcwXlqSQz3XTfjacqEgjp/u1lNHb9WFqLeL9fXE903w16PGABTViif8btQADRRpFAjuMbCxJo43z848dsWSQmjZiHr1uvIOr4+c208hUMEn+uGpDAaHOB7DIJ5KBIbZ29nexCy/gU5ZGWT0dLogMSCGmfV0Z5rZVhmPTJu2NjTdJUEPA6AkIEvb5Dop8gkCUIgAgYUmBaE2w8hgOnuY3VZcONEJZAWI6QHVQsgVaRS187EHwQQFgCzXt80ieOpSnXltNvbvs2/aX5B8FrxS9nUH3N5VRU8IkwJUEgEWO6fHl7+pSXmbIegZqaGmUJROmIlStXRrUEmkGYMmUK1dfXBz969b/v0252F7UrRpygo+UjjFjB5nlhWUG7GudRe8N0PTaQyc+8dmpoqQtZzkz9fv9SAV3xuxfp9toSbUlf+oVuAeR/n1RIxfyj+6Xu+Mstu53J3B9sJIXpple7wof83GgmnfQUvfxyAmR5riWBX1PfAkG8zmq2eLJVL2TUQ9Kc1ZwuB7y3lp1ltSQ6nVqAJVFVS8gCWFTMtkMmh1sjFLO70dJeEPAwAkIEPbw5opogkE0ImC2Cc3lhPfri4BpqRA0its+OgATCWgQSCEumuA7aQS89beECet55d4ZZ8srOLaa1LT+ipx/8Bf34e1+lK8aWEj4zrotLP0M/+PY1tOm+n6ur5qovBpWFhRCxprAuiggCqSIAErh06VJFAuEOigQxiQTF5g33UBScv+Lrp4clf0nU3/h+gClzqDNxghg5mlWwi1atMFkDu1bRijbNKhYqOQGXUvRvoxf+q2l43IlF6mfByQWhJX3yU2ybsyqn0kmfttpWt/jpGUb/8eMTQ66oloY4mU46M6KhWic7ghZr6whJOVWqcMp2Mjhe4fCR6uuRw005RwuHk/apiCCQvQgIEczevZWVCQKeQqC6+jNBfdbwv47maxBfDSYta2vPsawzMo+CBKI+ICyBQgItQ5e2hiCBcNs1rIBHHXEo/eHn31WWv3PPjHw4i64WrII/+/5NtH7Z/DALIayLOAMigkCyCMycOVORwIED4U2w0hIJBGGDGyliCiEXcXzgSUVaeQm7MsBU29Q591DWItIqGFhA9SMrIzKF6mUmDNdQ08+5o+2uxKn2iANkAnjOibRxdMjlNOnROztC8Y8RgxQVw9aXOMNq0nNLR0HAJwgIEfTJRomagoDfEUBh9ylTzg1bhjl/KL6vrx9laZmwBqEWoUEC3U5uY0kpaRSGANxBYbkzBG6ga1tupYox4WfAKmxnnnay6g+roSE4A5JZ1CqC0s6MwJw5c/geMj9IAo2MoPFQAllDVlGDtCFRzFnnhycweu+d3aq0BC7EDz6x+mV1LfvFM+pacvvTdPu3n1DXhkDI59FRIshWwfFVGtGpX9CouYH2SRXqNRKkJ4PRYwS1ZDMpiu7a2RaznkYp9TEWpjildBcE/IaAEEG/7ZjoKwj4GIFFi8bTkiWXh8Xxwa3zttsupkDgOksrQ71BWIMgsASCQOJ3cRW0BF9aGsF902wJBAmMtOglowgsirAmwpXUELgHd3f3JDOc9MlRBBoaGvieAQd13ENW8j0EaaviCyyAEydOpC1btJImcAl9c9uHfcjd4tlPBknfw/e9qMgeLoMcok80cc41VBu9sG6WioOj5nq2Bs4KLx6vuzxqMXIREmik37+UCA0Xvn/lr/QYl6Co+Jqp+Hyq0xSOJ8WHI+IlMWxnB3xGq2i8VJ9PFWXp73MEhAj6fANFfUHAbwhMmlRC//1vXTAr6bvv3kIzZpxvaRlwBUW9QQgIJUigIUIGY0OY7np92AuDnA04pD8h+QtInFPyy7lTgm6iIJ3GmXBqfBknexGAK+i0adP0e8gSSyQQjdEHCWUM2b/v44TkLhqKo0aNUvUIcc2ePVtdCxcutKyH9Z0pp+l6ApTJlZHlD8qpCVlCuaBCRZ6RPZPzZ3IJhbzW4fTVk7VZ3nw1SmX6V17gnKKczfO/L0ZX5ZXfUOMf0cKCdL1Ar0Y0W73+Ef0TLj1hlKvgT17d8EiftpRwLlO8ZHUj5wfVhTOmVjSza6wpWU7X1igJqLq2chQh21VjWhQtrFGaCAIeR0DqCHp8g0S97ETAy3UEvYo4MkUaroYggSCUhhg11fD77NkXsnVwtFeXkTa94JrZ2Ph3lVHVSskFuNmiXt/VV5+hfiYrmAsZQo24QGQENVvwMO7Lr71F961tY3J4GF172YUEshhNVq97kp7Z2k1IHhMZU9jZ/RqNuuK7wW6wKJtfDCSrv1/6SR1B+zu1fPlyZdWDLFmyhO8hkywNAguiQR6jdTDcSpFw5jOf0WKhhw4dquoDQvATv6dfuH5e2VaavsGUHdSsRMw6gn+nX1w2ihY9Y2rMNf9+d0oD3fjzp0wfXk+3PnU7fc5c40+vGXgik7RplXOoI9j6errx7qn06fafUf1t5qJB59CU1r/QhE8y2fvjZabxeezWQlqmjxG1nqBprm9yu1Buz8lcLaIpFBMZuU62lYa+N2ovmpbFWUY7i+cFS0po30SMmf7NlBkFAVcQECLoCqwyqCAQHwEhgvZOCMiM4WoYjeiZiSBGzmUyCEscLGSpxM6NGjWMrRRjCT/tChK4IHYPgrg+uISaZdlfHqVvzQkV5NZiB39Exx2TH9au6lvz6eG2fwc/+5/aK+mW2qvC2tzw3Z8TyCJk9GgUAefCaDkiQgTtbTSseUaSF1jhECNoReASilhCiJnQIbsoiF82ilFQftvbH9Injhvs2BL/HSwo30tnFjHzc1Bee/MdGjbkML4OpREFxzs4sgwlCGQ3AkIEs3t/ZXUeRUCIoPWNSUQCMVIkEcRnuUgGQf5gNY2sxwiyVTH6XDrnzEI63kS4du/dR08+00mB9Wx5e75vYBDIoNUEPsaOwhpouIUiQ6g5Ocwenq9k/M305o6esAOAWoIoI2EIyB1IXqSAVIJcGgKdx1b/gDAuBG7GiDnNBREiaH2XkyWB1mfIrpZCBLNrP2U1gkA8BCRGUM6HICAIeBYBuDcalkAQEjsun7kWM4gkOuYELdhUuFSCPMWr1wcrG9o899dFqoi72U0TlkUkY4kklrEODPbLIIGw8EVmCH3j7Z4+JBBjPbM1nITCHTSatD8f/jlI4fmmLKKpWEE9+0cgiqWEwObNm4OWQBSBt2oJTGlS6SwICAKCgE8QECLok40SNQUBLyGAODC4/40Z06IuEAaQACcF42FskBDEA8I6ZUVKP/eFYLNcIYMggeaEKbAAIrsmkrSYLWjx8ANxQxH3zat+ERaPhwQ95jIQ8cYwE7HxUcpEHD8kP2rSGLOVEuMjdjCaFJ3yiT4fl7Ol05C1a1+wckSkTY4gABI4ZswYVfMP8YBIyiIiCAgCgoAgEEJAiKCcBkFAELCFAFw1Tz/9V6qYN7JR4gIROeusJvXTCYFVCSQQGSGvuWakyhBqVX72419RLpFBkC8zCURSFVj4zPX2rGKHdiCEf/nND2giJ3ExBHNYKd7+0kvvBfuUnnN6n2lhbbx50mVhnyObKOL/zFJz1Rf7EFjoE60IvdkiuGXL23aWKm2zGAGUYwAJRH2+a665RiWHEREEBAFBQBAIR0BiBOVECAIZQMCvMYKwBIIEgqDFko0bb4qaZMRqnT+M3dLybzVHYeFglcWyX7/476yMuoLQ6clHt9LevXvoe//7TWr7x2NBNbMxZhDEBwTccN0EUQKJi5WF0+5R/9+f/Z4W/zFUaSxRZk6Qd7wYgMAiGYuMbniyg554qkPpiYyisGBGynvvf6QyiyKesKjgE30yjxrt0e7UC29Svw4deji9/nook6jd9RrtjRccb7zxIdeNC5HLgoJ8Ovnko6ikZGhKmVWT1cvcT2IEY6NokED8RI1A1AocODA3YkedOFsSI+gEijKGIOAPBIQI+mOfRMssQ8BtImh+IHcNusM4m9wXvkU04HCiDc1Eb2nJu5FpEmQwUqIldHFDNxBBSC6QQcQEGu6YRtF2J+v1AUdz9s4RI4bQ00/X8kN1v6hbh5cEBnFCXGI0gufGnn9i1FeDCWN6e2cnNQVecuCFAvC0Um4DSWlQZqOu7vOKGKZbhAhGR1xIYOonUYhg6hjKCIKAXxAQIuiXnRI9swoBt4mgW2DB+hSMBSz/IdFpF2lT7eT4wN9do/4JkrBr1/9mnAhmOxnEPmA/DInMqInPl9zzN1r50EYVlzdlYnlUCx1q+v20+V5V2++zbFGE66aZTMIih0yfRmbOeJlEzRlD00kEYRGEZRBilwjCmop419tv32A5KU7k4Z4y5VyVpRYWyXSJEMG+SMMNFO6giA1EeYd169ZlbYkHN8+ZEEE30ZWxBQFvISBE0Fv7IdrkCAJ+JYJmiw9d/WuiE4q1Hdu/l2jxpdrPGA/jZovg5Enfdm2nJ9eEj52tlkGzNRDZOVGqwSyRbp1ww1zbcmtY7B3IHYqygwQaEq323613LKeGJferJrAKPvfcN6Pun9kSjdqA0WL6nN54rAEWQQisdCghYVVApsvL7+5jAYxXbqPtqedo1bp/EgramwVzL1o0XsW0pkOECIajLCTQuVMnRNA5LGUkQcDrCAgR9PoOeV6/ANXmVVBzaQN1bqijQsf0dWtcxxRMaSC/EkFkj1y+vF1be8HniGAVhGvoo78kevqeuETBTAQN982UQLTROdvIIKxYJ5zw82CsZqQ1ENax0780JWjFM6BCPN5vbgsRZVgMv/eTO/sgiWyjKD1hCMgWxjOsbiCCIISRYj4fkTUEbWyXraYgsWddenPcsxdtwGg1FxHT+EPOnGqFwIIINnH8JDA0S7piUYUIhlBHVtDy8nKOT11PBQUF7L78tFgCbf0VhTcWIpgCeNJVEPAZApI11KkNC9RyUes8S1dZoxZLJSII+A2B6uoQOaDufxAtYivgLy8JkkCsp7b2HM8t65BDBlA2ZRNFMhMjYQ8seJElIt57/8M+JBCb8kZEIffIwu7Gxr3J9f7MAmtixZjPBj+KVa/PXMw9Vi1Apw8HEs8YgmQuVgT6m2suwhUWxBUJbqyQQMyBBDY/+/5NKkMr/m0I4gytZFi1oqe0SYwASOCECROCJFDcQRNjJi0EAUFAEDAQECLo5FmAVay3l2NUcHVSQykPHvZZL62e7OSEXhirnJqwXketgViXW+OmH7OlS5emf1KXZhw3rpAQDxUmujsoPsP3KPzuRckmMmiul2euo2fgDtdGMzkxPq8w1dzDZxWjQ+TOaAPSd3GZifDrX1RcGNr3Rx8NLwBv9B079lPBrX+k7T9pOQaPbAzNY54/1uRwBzXXRQRWcJmFe20yAhKO/uYMqYg5lOL2yaBpvw9I4Jo1azg+c6iKCYRFMLekixrLor2ErqVQvt/cQkRWKwgIAtYRECJoHasELYupoSWxa2R502qqcmxOGcjrCIAE1tTUeF1NW/ohDgp1/czWF1iCbrvtYkJ5AS9LtpBBc1bLM4dHf/CNLCY/5dpywmUWkBgUkTeSw4AU/eH/vqtqCUbKSG5rSKx6fXgRYGQUffKZzj5xdOgfGVtn9bzABdRIWGP0we8Pt20ODoEsnvEEVlSzJdDItBqNNFvVC+2AH6yJcL01pKbmfkI9TBH3EMC9FSQwPz+f7z2BHCSBwLaQ6jbg5fNqUu+Zgy+fm/h1qoggIAgIAvERECLo1Akpr6M6SwFy5Zxu3FJDpzSTcTKEQDaSQAPKSZNK6L//rVMZGnEhQceMGednCGl702YDGTQTwU9GqcEHRAySs+NfywjXj7+nJVSJlPqay+nFR+9UbZDp0xwbaG5rLgURq7wCSCDKhxjyozuWhU23et2TKjnNDd/9OT3zfHSrYqR+cF9F4hvEAUbG4+F3I24RMYuJXEPhtmmQM1g+QZadLLfxy7lTgpZYkM5p09baO5zS2jICIIG4x4IEwhKILKG5LUVUHHoPkdtQyOoFAUHAMgJCBC1D5WzDrsYyFU9Yy74bgVrdrQO/KOnr6hEZV2juzwOEYhODYxj6IulKuNuIuUnYOF2NVGa0LWtkLfrq0md4dj5R4wfbW5uXVx1Xr+D3fcbF+JF9yygy7NI6Ps7uqzFaNpNAdxBL76gGGSw46dTgxCAJS5duTq8iSc5mtjQ5SWQSqWNYCo0C9tHao66eISB+ZsL302YtoRA+Hz1xBn1rzmJCjF+kpQ9t8DkIIEpXGEXtG5f8RRWYh6APfjckUWwqyOvixU8G25tJm/EhrI7IjgqCGU0n87pub7qHYPU0C8glLKqGwD10zRqJCU90rux+P2fOHEUCUSQexeKFBNpFUNoLAoKAIKAhIEQw7SdBI3lF9W1q5vZ5ZdRa2UudHFBYWlykPgvUFlE9heINEVfYVl+tk52+/fNaK7W4RDRsrlDkUhO0nUfFnRFxi/q3IKCGHtTKZLKaqMUYp62eqhsbmaypD4Mxj80VprgDRUA5Y2gfDOPPm0gvjdhGGxdLAlmt4CdJ85raqL5II9UGiTbjGxsfdzZfSKA7uDo96tK7m6n75ReDw8KtMV2p/1NdizkpSzzCkuo8kf1jJZcxt4N7JrA0BFlJoSMsd5HWy2V/eZQum3yrKv8Aix/+DYvhMWdPVP8GATSv7/ghR9Ebb7+nhv4uj2vog/p9fWJXI5RvbPx7sE4gXGLNbpxoCl2gA0plQGfoEW29Vd+aryyaP226l8ZW/5BACM0CN1NzvCHqE4o4hwBI4Ny5c4MkcPTo0c4NnnMjJX6pSvQINZ5zIo01XY1hRzrR9wzqK7+hadz/f64ro/qrP0/f++3GCKQtjBHWo5tW1ph1uoWW/uJMqltmzcsg57ZZFiwIxEFAiGDaj4fuz29kjalqoSZ25C+s20AblMtoF23Vs/MbqpVXwvO/jTrUy2etP4ijEu7fiwEgRcWET9u3Gm+gO6mjrY1WrDJ+576zQtlqypt08sh9monJpJHwpXy6SnTTVt9Blb0bdJfXQhpfpUan4PDlTaG4hDAc48/LUUJx9aKY4zLBrK6ntsmrFWaaAA8tNkIjqXbwcX7zhQQ6j6kbIzYvuYOal94RHBrEZeXKq4PxbW7M6eSYZhfIyAyfTs5jHstMihK5YCJe1BBYzb41e7FywTQyc5oTqxjtYI2DFTBaDCHIFfoaZTJAEEHcDEHJBiM2Mdb6g2VPuMH/TL4qrBnI5o+YAJoF+pgtjvgOlsyH2/4d1g6EMNLNFePDOggxZ3h1a29yZdzFixcrEghZtmwZv3AYlytLd36dcV6qzl4f/KtkwtVAJ7W+SmufwrWBpnzarAoIWbzvue2GW2gsVxn6Hvf/6d0bqGHmBKK/TaOxP35EH8jCGOYpFakso8e+tEHX6VX63Xefo0clM47zZ0RGzAkEhAhmeJtHDo+MF9SJok7KlNtoRV+bW+FwrWhxWP/C4RReyliLGWirL2ILm27JY5IVIlGhxU+ujBJWXlpMmo0ynkSLS0g0b6LvMV+UcbtW0Qo2pBqW05BW5aS4somkWsMn0drsfZ91JDDwIJ+buWFXWeM79kDRW3vJ5dLvJBCQwgJmyDNb0/MW3Fx03jx/tANRUjKUFi4cG/zqvrVtys0TAhKIxCq4aq76Yli2TfNYhtXul3Om0Kb7fh60ssFt0xgL7RGvmsgaiEyhhjst3FsjM4S+weUyoln/IrGNVRKj/fnuMBig+/m8TkMkg2hSt42wTri/Tp06VX22ZMkSqqysTH3QnB0h/kvVFTXTiYsDsbxEL//nKXrsceN8F9CEr11vQu3FBN8zyfvtczTlR1+nE41eJdfTZcP5l/saaOUr+DDRGOZN4vF+OIc6rvgDLby2IPjFiRd82cEaxjl7KGThOYqAEEFPbnwoRhBuo8rlMynRSKXWvZkqVPxfOlJKJ5o30fcxFtvZwXbR6FKkouQNq2lSYKXUKZIEHlfYNy1/ShP4uDMsMcig6AXJBhIIHD//+eBjFT0SYaFyC+fA+qeCQ5sTwsSaD2VEzAQNVryvz7wj6OoJQog6fCCESFQDax/+vbblR8Hff3Pbt2niZRcGpwABhNumIdADWWwTiZmIjY9SJuL4IflRk8YcH5E99agjDos6VdEpoTqCRgNzWQ9zuY9Eusr3fRFYvnx5MPsySOCkSZMEplQQSPhS9Tnatg0TnEwnsQWw4+dl7Bp6i0YOy26nujJj8lPjf//KX+kxJpKLKzU3Ts019Er6y1b0f4pefhk/E4xhXqcaD2VvLgpf/Sc/FSKaqeAifQWBHERAiKDnNh0kMBQjGM16Z1dl5QLKsX9BQhg1AYvdURO3TzRvou/7zKC7vrZpPrJRpJT0MMvEyjnYIhoJ/PzEHzk4Q4aGKr80mBXUyA66oW6wLWWQKENIoC3ILDU2l0l4IkayFUsD2Wi0at0/g60vv/w0Sz1B0sxkEJZBJH8xu3UaA8GKBnIYraA7XEaRXMZIGoM+sDqiXEkil1C0feklLa4QUnrO6X10hxvnzZMuC/scrqz/U3tl2GewYEJPs4CoRtPZbBGMVW7DEog53gjlIYwSPLNnzxYS6MR5SPhS9UmdpJ1EE5a8SrdegUnvoh+oOEGdECo92EIY93u0OYem6K6lyjX0T3+nny3fpNw6NUJpZQx90S93UYcT65cxBAFBIIiAEEGvHQb9Td3kWYlrEiZWnQPBTWk+QbxUbGEbx+Ek7pxCi0TzJvo+xtSF40mFKTbP65MltLMDPqNVND7NlTlikcCD+h0StggkODBfxpdz5qznz1O7UtgoV7uCBBo12xDDZRZlmXPpiraobLEEGmtDspjRowvUr4hviyyrgJi10780tU+ylUQbjhg4JEzBT7PgdyN2zzx3ovHwPcigOWYQLpjIFop5YOGLzLxpjIn5kMETBBCJY8xxeCDCGzfexKUDBlpRIayeX6SVzxgAZTRgkQT5Q21FWCgj6wuCMN7f/ENlyUQ7WCzhuhpNzLUYY5XbsKR8DjcCCUTB+N27dxNIIO6hIikgwInY1CNBwpeq59JJJ4Xm+dz/ajGCQUJY8xt61aRG/O8Ny198vRPNkcKqHen6/+29DXAs13XfebDlSCrLsaX4Q3JipbhlzBOFTFT0SpWSBqk1n7NeEYASD9cuWJJlQ7QqAzFeGeAqkMkV7PdoQ6acV1oORLsoICWTT9YHhcQmlAgYMrvJo6oWEDclbd5qYZjCjMt0SbvWt2itFUtZZ2fPubd7prune/p2T3/cnvk369Xjm+m+99zfvX2nT5+vHifPQxhiJijRiGUE5thS1LdMpikRx7HsnbY4weVoYVcpbyCZLRvtrpMkxhm2BHDXdEIUnQRGsnrpDJotzpS5JVvREn/uXC+fDayGEdeeefpQ/R6sUtdNDCMZOjkG0S+H06cUpnXPE0k4XnF5v0HtrptARmT2WDAH5+rro/uN+z6qXSWEjpn0yqY+O/PJ5fIdz2eypRanBH78yjBhxmQ9jb9arHW2HRKTdfnydZJaamIREmVA4g2LOD79SeV3NDimTQl0B9ZuPz2oUydKh8TRuaUkJKulq8zJd7/Gio3XxTI4D3KulHZwlS2xej15/TdUwhNRNF+39quD78Tl0xv/Zzqn8mLg7ruPxhZZF8talGIo/YjiJy8VRIYkxyte8TvkWuWkVqK3JmKSdpKeK9lQ3aynWd+n7v00rT/hN2/e5D3kMu8hz/Ee8jbeQx5Oin/Gzg/7LfYikO+v0aUTeR5xn0+Cv+fO7/ynf52u772Z/r+vPkH/4p//ddp419AV8//6yD+iX3zvK+g3PvNb9Pcko+i7afz3r/p5OqY3q/Of/8yz9Lzv+i76K37s/LtffoIe/9v/mO58WVwb3jFIdlFuj2MEn/TIJJlNf5M//8r/cIN+/+2voFtveUm2c6+eMSRZ+eizXLYdoTUQKJ4ALII5MNd1Adm9UwW0ObF5gbp8bnkDlcjF66o5v0HXxWrHZSCkzuDc3CE1u22VDXR/eY7W+Bn3yFN+Qj6b41d8qm6eKJCqS7l2GAuok8XoWoJeJdCbiGYgh7d0A5eQqM1JjT6dYlrnrNGlGlRdQ5V1zBmnOtcffxjVr4s88vtx7UpGUeGh+nPqI6oN2lVO/eU1TPikWQJxSmCaNqflGq8SKIk8TGK48hr7tCqBwksUbCmiLoe2sukHZSnT8OnPDmvXuRY4Kckg1jVREqXkgcTrSfkD+TxY4P3iT/5vbkP7DYhVzlUQJUnMr/zKIEAo0bRJZtY/+ZMNpURGWfKilEBx/xTlT65PqgSKkOPqHiYaRMKTX/B8nTkURzICXiVQ4gGhBJrwk2zc8hMd7vGjylLVm6wEyuFmEOff8zW3ZjB/zL//8rL3vv+pRYOo1z/4ebrnI8/6BXjl/DAmb+z3P0Eb75PkMtqt9A+chLtf7fxjet1TP8pKoNNsXB+D3n+CXituqoHz//27f56GOYSfVSW61DOP82zlqyssbXlqJusazW4ZjeHzjrpemU/5O/Xwo5/lRmspm8wNzgEBewnAImjv3EAySwmYKoHP3Lie2wg+95TOwChH1paGSYSWzIw/9mN7yhIo7ntSksE9xAU2r0OKwbuHaxGcZiXQHaskQRH3W/cQ90ZxaxQrlChwe5ygRRRD00MsgBIHt3HXPyKxJEqpBKmb5x6ixKVRxML6l7IKH//450heHMj/Bw9JBCNxgK973Y+qtTTJIdZptw9JRhMW0zdJ+2HXyhyIRVAOUXy/8Y1fybSLabUIPvvss7yH/JiyBEpmUCkYj2McAde6F08p0gNpcKn2YPovn/0SfeGr/5H/sEVw6Z+wRc9zvPIq/e4jbhZQx0IX+b3zhZR8aHK2T/e8/+ZBevK3Vp1/Gbbh6ePfv/tv0a/+wfCD5ff9Hn3rl70Wwf+dX15LDWX3BbGEoxDtuV5Wixe0pTyYRAF0ziPHG4uLUSnLn/KwOqft4P/HY8YZIFApAlAEKzVdELZsAqZKYN5yet1ObVEERQmUB275u+i6fF63U1EEZ0EJdNeYuFu+//3DmL53/9NfoLe9Sb/3FyXw/R85psef/FRofT63DXGVlEQt72z99MBtUhK0iKXQVSQlJtE0OUve6z9p+2984++TW0dQ6hEGy0ckbc/kfCm3IXGQcojl9o/+6JdMLjM+ZxoVQVECxR1U/pYagaIEvuAFZnGgxuBwYiyBZwaK4Lfob/5QsgRh4xr/P7yuoTXXHBgrjsEJo66hKjzkfFuH2HR2abe2oWsiu+ElnlZVCElNFL8DWnWVR6UIOv9WSqKjFBpIg1NAoEoE4BpapdmCrKUSsEUJLBVCROeSDKMsJTAo0iwpgTJ2sdK5iWPk35KARZKxiEVKYgZ/Zf1nVPyglGgQa5gkOJFEJ5LkxC3dIHFz8m83dk6siZKgxVUCpYD8Rz/600YZOm1cn15X1KhagFnLLYq0ewg/HOMJfPGLElcMJRDrJBsC8xvb1FKJ5dhienFJK4HuITkYOE7R/ZNFdvZspEYrIFA8ASiCxTNHjxUkACUwetLEDXRp6cPKEiiufGUrDPuPPjQQtmjLZBlLW+LnxAXXW9tPyjNImQZvuQWRTVwi/7vXNZRyKMljxAroPcQVVOIIf+OhxwYfS1ygtB9XRL6MsZv2Ke6l7vHvTrkQWQHHv/vUsB9v/wV0XbkuxA10iZOgiSXwtttu4z3ko7AEVm4WSxT483+sspieP/snHiGWaKtNnNNgjWhFe0ioY6nJCuKyJ9avw54OJcqOrkGgZAJwDS15AtC9/QRsVAJtcQ0VJVAsgRLnJUrgjRtrxin9s5z5sIyks6AEehlKQhRxE3300Zs+tGLlW7791XTn614bGhsnZRqkRuDhv/mUr0SDNCLKZdWVQBmHsHnxi39rkDRGLKTB0hDCIfiZyRoVF1ApSC/xle4h1thX/OTbBhZVSXKTtVVwWlxDRQkUS6AkiBEl8MaNG7yHvMgEPc7JiUCVXEN1FtPPeEhwVtH+B52kON7YQM8pPvdQiQls0qGTnZ3zs4/990icZU5zgGZBoCgCUASLIo1+KknARiVQQNqgCMrDtVgCJQmHPORKXbeyrEZBRXDWlEDvzSXxgpI8Z1ztOpMyDZIdVBLDmBRsr8LN7U0YIzGCEivoHlI+Q+Ih5fN3tn5mpGh82PgkG+vuI/9KWV29cZlyrnwmLrpy5BEfKO1OgyIo9QHFEvjUU0/xHnIL7yGf4j3kpVVYTlMto1cRzHKgX/n6NwflI77/+16YZdOqrR/5gRfyn+/OvnxE5pKiQRCwhwAUQXvmApJYRkAeTuRNtXt8zw/8bbp89x4Fi8WXIXbZiqAogZKtUmrDiRIolsBwi8fXOZX3Q04pFSH1Kmq1PkNnC2/n+pnZJSHwKoKzrAS6a1EstVJncHf3f1MZXE0PUfqkLIUogWUp9aayJj0vmGFVCsZLvUQ5xB3WW7Be3Gbf+Pr/ml79yprP0ifnSuzf8VOfpkf+5f8yqBEoGVY/+dgDKtOqWAPFLVcURTmyzLTqHXPVFUFRAqVYvBSNFyVQLIHyN47yCVz86ZfpuW99h775H/8qU2H+7Cv6nujTHP3NH/y+TNuWxr73u7+L/zwPimDmZNHgNBOAIjjNs4uxTUzgrrvuYle7RwftvPz2X6BbL3PMQclH2YqgKIHyYC3KglgCQ5XA3tOcae1JLkQ3VPp6ux+g2uYXqOH5LAuU7kMxlMBRmkWWaRg3l08//QVfPT9vyYjvfOc/qxhTiS/N8xALtry8kEOsov/qn/8qffs7/6+qwShWwbBDXGtfxn++/NXnIjOvikL50NW7lWIpiXokRlMOuT/ELTQPq2rVFUFRAg8PD5UFUCyBUALzXPnJ2v7an3+LvvKNv0h2kcHZf/4Xf0nf+OZf0ve+8AX0N77vuw2uSH7KizlB1ku+/68nvxBXgMCMEoAiOKMTj2GbE7BRGSxTEbzrro+rODTJxCiWQIkNHD0cS2D9TZy+uzb8OkQ5NJ+J6DPloRhKYBYko9sQK7Aoc+4hrqfPPPPVwb//9E//XClz7iHfjXNPDfYkLxNEacrzkFhWqXPpHpI4R7KoyiGWvt/a/331t+khMYW/9vY3DspReF1CpY2HH15RFtY8jiorgu6eKrGAYgmU2EAcIAACIAACxROAIlg8c/RYQQK2KYNlKYJuzbrxSiBPsKPw1Y+vkD81d5cL+H6EzjK2CIqlR5Ka5GF5qeByzVzkq1efUnGHeR4yd3/5l+/KswvVtrjM3nMPW6qdQ2ouSoyfe4gi+Dgnzrng5DFhSqFY/Wq3/C36ide+UmVedQ9xFf2nv/mBwb/f8pbb6JFHfiq38VRVEbz77ru57uX7VUIYKIG5LQ80DAIgAAJGBKAIGmHCSSBAZJMyWIYi6CoDbrkCscBFHp1P0NzyZ6iVShHUyuI+/Qi1u2/113+K6FCsVVAC871LxQosLwKEddzReOUrfae81vNvya75X73iFYPvf+djB3Tj09ots9+/Etd0Jt+7LzTcxsQy+Nv3v20kHlC+l9jBb/4/36LnP/+vhWZdlXMkMYy3VIdkWxVreZ5rsoqK4NWrV/mFwv2qNIQUi5ei8ThAAARAAATKIwBFMBP2XLB0seZJiOE2KmmI95w0xpl0hEZKJmCLMli0IphICZQ5mkgR5OuVRfEPadVQESx5WcxM9xJf98Y3/v4gAc0PvfjF9J5ffjtdfvWrWYl6XioO977vIfrg0ZG69s/+7B2FJakJKoOS6OXX3v4Gn5UvbkBiMXzXez/oSzRTVBmVqimCUALjVhO+BwEQAIHiCUARzJQ516yRWjSNNnVPNmiMvSTTXtFYsQRMlcFnblzPTbDPPaVT08uRtxVFyhHIQ7Mc4n7ZbN5qMC7HqtcKxAiSoWsoFEEDxuWcInF2kizIjQecf9nL6MPv3qGXveQlqQR67+99iN77oQ+pa/OotzdOqPe853+l++77t75TJqm7KPeGJLzJ0xLoClslRVBcQcUlVO8hj/Me0ky1VnARCIAACIBAtgSgCGbK07EMEhTBTLFa2JiJMui12uU5hDwVQXEHlOQwcki8k8Q9mR6d9ftpeZ98GULDPnPjCU+54UE20YoogmIhEyXZmyTFlE/e50nylStXfjzRnJnKJOMVZVCUQjnEMijK4N/50R81bWJw3m9/7GP0m7/7iPq3uFPefvstiduY5AKTOTSpuyispe5iUUdVFEFvLdZHHnmE1+NbikKEfkAABEAABGII/BcgBAIgkJxA8IFGLHR5WgCTSzj5FVIewlUCJfthEiVQel/au0LHLaLTzYdU8Wv5c9h8E/FHnoMthFyN4zrHhvX7b6L65uO0q7P7V+IQPjYqgQJP5HItuVnDdGtHunGiX/7GN+j1m/cMYv2S9PeDL86unmSSft1zZQxiiZR6f5IEKez49P/ZDf1cLH+i/Mn1RSqBacZZxjVSHkJemsnx8MMPQwksYxLQJwiAAAiMIQCLYKbLI41F0HEnHcjR4AQZJ4EEGcFziJNw9D3ZGOO+58Z7uxxztUlidVFH65jT+i95Rm/Qho9VMC6yxYXC97lQeJcLhc+OU+w4y6DXInjlij8JhiRMkEOsCJMeV6/ePmkTI9eLlUQsPpIYRGTMro+Aa6gTS+gVQCWYqVUjRtBbyD7zSciowTwtxlJO4rWvHWbKfPAd76Cf/W9/MpHkT5ye0i/e/+vqmqRW50QdGZ5sS93FOHFttwhKoXipFSiF42X/kxhBHCAAAiAAAnYRgCKY6XwkVAQd5aw+UOqGytVQ0ZPPxGTiKof6nPNtVxGM+54H2FmnuZ2FYdyi/Ft89gbKoEEbXk6O3KyxDpS+3u4iFwo/Zde+2VIEBUuUMuhP6NL3rbS5uTn17zwf0tMu7fyUQJEoRBE8fLm/1qCcVhHXUK8i+Dv/Wse52XD80j9880CMvNaYWBxFCXRrBb7jzW+md/z8sF9TDqef/Sz9zNY71ek2KIKmcpd9ns2KIJTAslcH+gcBEAABMwJwDTXjlMNZrHytsYWOlbGhYW6eNk6Olevc/vI6dVSvXTrnN+YHR66/HJ+z7XWui/ue+9k5o/Z1T/KapS1qN6STHccNL64N7/CHcnstf/MrqyRNzuIxTW6iEvMlWSHFEiiuoNlZAp2V0fsanfH/np5/TX+w9HJq7X+E1vViV+u9M/j/WVxN1Rjzc899my5fvj5QAsUKmEYJlNF+3wtfOBi0rW621ZgVO6S8efMm7yFvVJZAiQeEJdCOeYEUIAACIBBGAIpgWeuid0QH7KfZWKgFJFiiptLzzuhC6X41WmAN63SzxjFWjnK4tOdRHmO+V/2c0mZtjq93/7ilLk7pXIW+xPXhEdGRu9X0upXy9/OXqF4WSwv6DVMGLRArkQiiBMrDvTzk51EMu7f7AZqrPandk1n5m5v7BL/sqNHe8av4xYeOIZyb+xwrh2w1VOd9gdetnIPDJgLykmBp6cOD2EgpHfGet789tYjf+z3fM7j2O9/5z6nbwYXlExAl8PLly7yHPKeUQNkXcYDAVBIQzyj3mcyWAUImW2aiUnJAESxrurrnw3i9gAw10fz4W62kiZWwr5Ju8NMzLStlzrUWmnwv50jcYZ/dEEf/aGtkXB8eAcfIXRZKW/qtckY8scTIw70ogZICX1z0sj7mN96qXGGHf16va2wuvT7wGSuHg/Occ7IWBu2lJiAWY4kNlEOyhD58372pawhKG16LoOtmmlo4XFgagWeffZb3kCWlBEp5CCiBpU0FOi6CwPwGndhWJxoyFTHzU9cHFMGip5Tj85QbXG1BuVKeam0v5GiQ11i4tKeVuIFCuLhL3uSK4793lcrxg43rIymq3u7uzFlzqqgMihLouvlJBkWpg4YDBMII3HPPkyTZZOWQuoFSMsJr0UtDzXu9WBtxVI+AKIFiCfziF79Id9xxB+8hH63eICAxCEQQ6Kxrb6rFxUWak2cvZXnjf3OKa8mPMDe3yGE2kmthzhPmkC9OyJQv31lqHYpgobMt8XpEyqtyfoVWfXF6Q0G65+IzukorKvkmZ/McBlBxSv4+dSXA7/Sco6kMvndcNocxh54Bd3adGMG4PjzXLDV1DONhjMMeK7y1zfNC6drSWZWUQTfWS5RBqd8mBeOLKIZty1xBDnMCUny93X5aXSDKmyiBUj8wi8NVBpNbBL/OD1+uW7H8/QneL+/nB7SvZyEW2jAgIBZAUQJFGbz99ttVwfgXvCC8DIdBc9U5hX/jRBHAUR4BUcI8j0c5CKKVux3Ohi4v4rfrnBBvdYXm2fImqRrql+ZpfmObn4nqdH5N1UHyhO3kII5qcsZlwn2XamGNu1egCKZCGnWRJF3h7wZKmv+8zjrH5tWb2h1O3DFV0heO31vzWPd4kS/vsyunN7nL/vLoD05jgaOrnGPs90scg6VUN+VW6m6a6i3W4aVhmYq4PgZDcWIYA+d31pe5B/dgxVKykg76lNIU8kaN35rtcsZS9fZMKlrImzQnbnFg4fSc23P/n88Z7PZ6E9TX6XZsPKqgDHqVwNtueymUQBsXkiUyPfbYGd13379V0jz/ec+j373yazT/spdlJp3rHprIIiiZZeceooPVtw9ci7vtL9H+cCPKTD40FE7AqwTedtttM6ME6t/P5kipJNdKM4zHL+c3yhY5wlaN73d/kLcg3e/5/MZ1WtjRlrlcjs41fmY7dua5Rxec6UyUP1HGLs5a+qV+74LOGme00AyW/cpFIrYN5CvT6NoZhiL5584TopSzTC7J0fvO84zoW0venBjl3IPjZ794ucfdK1AEM7lXXeXEVYbcWD7vYpxjBS+QHIaTvvS7bWqcblLNXcTLRMf90Q1FJ4vR7dUOVoelIBz5x37v9iOq2bLTxvl2oI6gm5Amug8XlVgldaHwoUyHTZ3tVB+sfMq4+JNjfou2x3Ej+t+s9J43+aFNxteha5t19X1fNXZAOjGq59zaITXle7l2/1C7mfKGc7Cq385123anp7FZGXSVQEkQI0rgjRtrkcW0M7lF0EhlCUhdvbvu+vhA/jbXCmy88pWpx9P7/Ofpvb/nL7XxQ39DWxbNLYJsCVzjhEKtN/FD2rAg/fzK35nZ7MWpJyTlha4SKAliRAm8ceMG7yEvStladS5TpZJCfj/Vr5eEcOj4DVXrV//WFT82W+QIG/n8xon2avLlLuhyJnNJapf0oV3yG3Rp9aCWi2Wwc7hPbmI89SL/1FX+OAkf6ZfxvaMD1g63aSWQPy+vWc9bJrV21PMazxCXA+t74iBl7tTyltJjns/zlklYht53nUPab7Sp6+S/0OtKP3fqnBj8XDrwrstrRlK0W4rc0fcKFMEUczh6iU62EpaMJfjZSLF1FdzrvXbPsRi6vbBiFEzycuIpBSGK09jvnXaC/fiKyRu24Rm4G0/ojs/XXCRTtnRuubul9OmM1YmX9F8mCW68LJwsqnwu/1qohDndjb1SfmSTLBkblUGxukjCD1ECb7nlRVyu4eegBCaZ1Bk695lnvspFwT+myonI8T/+4l30U7f/eGoCX/7GN+jn3rVN7/3Qh+juBx6g7/yn/6Taev5fe576W15QGB38Fl6yLreagazL898/09mLjdhlcJKUhpASEaIE3nLLLbyHdGZCCZRQjWub5PkdG4XZE7MRP5wOfuoy4J2mCVvkiH4ccMNf5Iyhh1Rk2oTIhvja6206G5TcSkMr/BpJ3Oe+PD/UQTG0zN5Jovyd8gv8a/x2WkJ56mwaLErfL1Imbf30HOKxRqwEBh748pcp/L5jfYqOB8/DPTrSqfiH3nIs+oK48ma3JDJpqTy5w+8VKIKZTCsaSUVACtuLlbPG9RRNG3AU2m77zOfqanp5GefZlD1PHujlwV6KxosSKJbAl750mL6/DD7o004C3kyyIuEvrKzQf/+zP5taWFH6RAn8/Je+pNr4+FOfVP/+5l/8Bf2gYxE0VgS7XzXfM1JLjAvDCIgSeOedd/Ie8oRSAsUS+NKXvnQmYPU4yH+/tT3mBaTzMFq/lO3DZ+K4qJzkyGiWRXlSsXae9pTiynaokYpaJn2qmL192snYRVQsYIOX3XvswSUv3VkJcj8XfUheipu9CDcZSPw5hcikssMH5kIS5IjHWshg85Yp6r5b4jkZGmJ1aJZ/XS3RRhkm+ZhpLFXukHsFimD8fYczTAiInzyfF50FNdCIKIE7C9qk77ghmHRDzg+i2njYRyE2aY1Ro7Nzkrj4iRL4ohe9QCmBogziAIEgAVHI5IWBW+Bd1Qr85fS1AqX9X7z/1+kP//iPfV2dfvaz9PrNe+grX//G4HNjZRDTVgqBu+66SymB4gYqSqAog2mOYbwRxxqpl4LeskhpWsz7Gq1cjdb+9farH0ZH6uzmLdpI+7bIETbwDrHHpRNrp79Xbn+bAm6ckj0eolilTg+OfNnUjbE7WUBtyT0QjKPMNyHOKCWtlNdpaBDk8Ke1A1r1eWkZ053wRJP7jrsQd0uROmjFnLD33C8vQe7gvQJFMPdZnv4O1KblWvU4iYz6QVfZSnWs5CKXkVhX33tiACT7qBsbyRuMSpqj4gM4iHZwrjwYBP/tiU2MeDs1/cTTjVCUQEn6ASUwHb9ZucrrOixjllqBkhxmkuPe9z1ENz79adWEvHz4D/9hXcWmqodAjhkUhdA9jBTBpZc72Yujyu9MIi2ujSIgSuBjjz02oRKoY+prbox4v0kXO+JO6XfpymsWRpNh+GP5VZmAMMtSj+PCWFcZ+6CpHupSWrWyHLAtcoSNyXnwdV0uVd6DTXa3lVrHE5jW5i9xzoBBrgFzmGo91ETJ0SE6/F6aDnTCghIOfW+s0fVhjBtLEZr1PUfpdOb64f0o8ZHn2+XEu7Ifbvx9J78jSnl1YjhzZJN102XIHbxXoAhmPasz2J7XLUC7UYi5fhh3eLKx4YljdDcTT1ziyYkTJynfeeMV/e2odiXxzSAmMhhPOYPwDYd8991H9OijNwdKoPsQbng5TpshArJWxGosh1srUDKFpj1++2Mfow8eHanL3ZcQboIiKVkSPIwUQY4CaaqQnY/4SkV01j/iyV7c5WzFUlLiA5yt+BP8t/P/3mc8lXlUl5/QJSeC1/C1PW+JCvl3WhLVvu7uu+/mPeTRgRIoCWLSHG7SjeNBsgmJ8xx1FUzTtsk1wfj2sNj+kVh+aTjMXS7QoSTNGJZ+MpEmn3PKkmNYUy96XG7sovIGGiTWyUDJULkGRmsmj5NJvlvel+Qibv8Si8YxfxlblUy4CDG5NyQZ3nD9LdGWSoDi5EjIcLlEy6SzozIE7brrxAVOoKMbSx0qk8F9J1lcw+IDjTsu7cSS5A7cK1AES1sA6BgEiiFw9epT9P73f1rVB5Ri8VACi+FexV5krcgLAzmktt+/vPbPJqoV+LF/8z/Tb/7uI6o9WX+SmMh1RxalUP79hjf4s/+aKYISm3PFyV78kKPk3U+HzTd5shfXOFvx6/jh8AucrfjlqsSEvO3fXHvacR9jpU+V/rrC372J6puPs5IXvOattNE9HZSo6LZfUsVpnVjmq1ev8h7yflUfUIrFp1UC2QeQdkRXam+NxPZk/fA98aATNxB4gE58/fCCEaslpxz3ZulWLoyR/oLZyTHBECIuDcQumtYlzl4Q0XCU0udfi/pFdBFKz8iQnNJhq7qAdODwumnmAmOkUe0CzR5ZEsJTCpAk4wyLD0xyffpzU3sYqC7Lk9s7YiiC6ecfV4KA9QTkwf7++z+pHsKlWPwdd9iWP8t6hDMjoLwskLUih1gAP7yzoyyCaQ9xBb33oYcGl8tLiNe85kd8zbkvJ+699+8PPjcvIaGVQVHw3D/hzys/wlkedXZRVV7i9Kv88yvPOJ+j/dMnuXSPWATFkvgFGmYsHF5DtR9g7VGUzU9wpuLXW5+pOO18RV0nSuD999+vlEApFn/HHXek7kJlW2RVfdubwEG5Chbn0jXZg9uYoTsubLHxgYN4tOhSCSNWS7ac6VT+ngzjUQ/npnKknsXoC7V30DjrXjB20alLfHYxjO0b8PHHjPa4BnEaa3ykTI77bLjilS2ceC4S4hZmTXbi43wvTrKRLVompx62bJHrO7TgrWmdTdeRrZhwCr24hDg7V47UHgbqNyifuEZTC7Q7BiiCOS9sNA8CZREQy477YP/IIz8FJbCsiahAv+IKKi6h7vHwfffSq15xa2rJJSnM3Q+8Z1Ae4sEHX0fNZnR7DzzwD+jhh1dUf4mKyqeW0LmQ6xDGKscuv+gAAEmrSURBVJLzr2HXdbEmfoljnu/PpV7ZpMPI63pxBRUlUA7JfjyJEihtBGOPlMVBF9j1pXzPazzSbuoHtwjXw4GsY1zYhkqMxLyf07ZS6LbpvJZDghwjOfIkPKbtkNjFJfHx9sT2dbg+R51rMEpm8GEW0A4d0db4lzBGLoRD2UYToujver0yfL91Ap1gJlVVPJ5rF/penOQ9dU7iPzpYYw+LDFx2J5U37r6TOUN8oI/y/MY2v1obY0UO3CtQBCddpLgeBCwkIEqgWwRclMCg+52FIkOkEgl8/OOf8/XulnhII5JcKxlCpSyEHGLt29x8TWxTb3vbq5XV2tQ1NLTB3tec7MVfC//66A+5CP3LtVuiJJzhGMOhh12XXVVDLut8QsUPzm+8lWOaXsWZimcjQY0ogZIcRg5RAt/whjfEzqHRCafn2iIrSuDcoeR3GH0ANmpo3EncdtapFudXaJXDtc4uwhQFTvKhfF69tfG0fCoj5sECKY8/UYRaTcctVqxh+3QYtuZSj99QjtTtuxem4Rshm3IP5WRxa7uRGT8764d0KaYMgI49HOUfNVSVMINt0UNl00nUMnwfNjEl4wYcy5Av67pk0pWEeJ7C7cbtTXKiUhL4WL1ejotsUPax953eR8TFl1P1BmpwTwKhiGtzlNu3z4yOJXivQBEsYr7RBwgUSODw8JmBEiiWmLe85bYCe0dXVSQg1jive+aV9++R/El6iPInSqCrSMoLCLH2mR5iNRSFMM3R2/0AZ/97Uj/EsIInrpz6GZtjBGs6IUxt8yVcB8stQs/xgKLYLevv5uZYGV7iuEHVhlwzTAxzqlxD+RyVqThQxD6NsJZfc3h4OFACH3zwQd5D3pKJxEtbbY7Z1Nmk51gJbHLGUMnuM4wP1A/jg1IS4ia46CoIojg6GT7lM6cOrcrw6dakFeVP/f8y7e/vpHIljB7oPK2wJhgskaTdsGpsueEr3UzYrpwqI+YwEY48gHnLT0ga96wOMznqdFQC31HZvG6xjnuow+7w70lxeJ1VVlnCeD4Pm/GJ4cJqE45ly4nnupyIZRh7qQKGPYla+OrBGus46zIio+yEk6jdQtvU5nLtuoQF/zlsOon3Jmw84eVuMp/r1tTfC7/vJEGM3iv4Xld7vmY38v7H3RsUV3fdudd69pqo/UTxC+w9CZn6TzeUWy0/vRYWF3mP8ex5Eh/slhhR43Vkd8cuc9hauOBEaN4xD6UI3itz7HPen2hMuBgEQCAxAbm55RC3tCwPcfGT+m/iXnflyo/T1au3Z9k82goQEOXAPX7nX3/IGj6/9A/fPJAlyRrzWpKlgTsaDRI3UZOsoVIwXpRAt0yEZASVZDASB1jaIVlBa3/IqeE56cuUhce6ay/rn3CpESgF46Vw/JUrV3gPuZrf9Imip1wlvQ/68qAkD+XaLa3DZtolNuGK9bAp58k11y7RCSvku4uc1r7O9WSJH5qbh/rhmWPnOuuLdLGVh1ubPBBy3FQ3Xdvy8CalAdyskPLva5dOCra82Mw3uNTE8kjEdcOZuzzwN7jMRAj70HWUxbIVVqLkO/12+SWDs8ayaF23IWtqmc44BjQ0W212HVW4pfT3nbj6zs/rFwrrtMf3mubNplZ13w3vSYrYT8L2nmEZ+3yg6nXnZpAVhXBnQdbHUMazhS3aPq/RIdvTZf875pcIh00Zk76/D+qrdH1PXeDbcyRhV3DPhUUwn1lEqyBQOIGnnnoWSmDh1KerQ7Eei/ImGT3leOL0lH7mne8cuHmOG60khnGVwFtv/QHl5lmqEjhdU1PIaJ566qnilEAekUoeMxIfKBYA0ol7+KHlgh2+ers7/LDjWBJFR1SJUnRSC6UEivLHVhWdqIXjrc7MXQSTgeWsksf1sW6M49oTd0SvRZG98EglZyz0sJmvH4S4hDZlrtnVTRSlvrC/NupLK3GFnBEqe9dASbzDdrqukwAnaNHNZNqcZEmFxgFmIniRjaS/71wlUBR4rfjtqLXk5loS65j2SAjfT8L3npzHLrGh9WPnxYDOAjyQkV+GnPGed7LRVXGlev8j/n8n4Zas2fo2vyjbUOU/huPTMofdK1AEc55PNA8CRRC4efOLAyVQHuZhCSyC+nT2IZllb9xYo5e+9HvUAD/zR8/Q6zfvGbh7ho36vb/3IZJSEXLIdV5lsjRKyho46uZZmjyWd3zz5s2BEiiuoLlaAhULJyPi6oquVxY4JBavw/FaK/zwJg8zLX6Drwp+rx7QmnIH5Xg7dqfTqe0l2YbzICSfuzXQ8mAuLoUsQ23gspqgE4mH2z90XJbzVFjjZbKWryu6oUvo0FqSg8lf4uU89fQG7qrxeI3PUG6hlYtvMx5ediemvO+UC6Wy4tY4EZCTsMqRStWRPGvTltpCwveT0L0nu1GFtjR8qaVrS0rCIP2Oi2U8ZZdp5+XIYP/zxgR63y5JSRJ3fHL5wLLov1egCOY8oWgeBPImIErg5cvXVZINUQIlOQwOEJiEgNSa/NSn3kpi2VOP7J//PP3kP/klkmygwUMUwPd+SLvFBmsFTiLDxNc62T51VtDpcw2dmI+nAVECL1++zHvIcyoeUJLD5Hno2BcdVycxWirOz3Moyxl/fnhJv9WWzJL7HDcmLvWua6WyzrhKpLKqsMWQg2TUgzXHCwXbzHI8Ks399rlWSBMdYtkgJ0ay2NT8VeKr3NccC46Se2mLVg9qHKPrWn31aORBXtzh8nKpdNeSitmTenpZJ25xage2lSaCI45A4vuO+UqMro4fXOPMs7KU2lwOiNeSxO8erFKX/S1lj4naT8L2njg5J/1eYofd/U5cP8XuJ3ubktGxfMvadPc/357HL5vqzviUAuyOb8y9ghjBSWcM14NACgJZxQg+++xzSgmUv8WSI5YYHMURmLYYwSA5ebkgMafidiyHxApKzKDEDsohrqA/967twWWy/lCrspj1l1WM4LPPPquUQPlbykNITB4OEAABndVWxaUCBghMMQFYBKd4cjG06SYQVAIlJgsHCGRJQGIFRblzy4+4CWE+eHSkrIOSHMY9JPMolMAs6effVlAJlILxOEBg5gmoovaSnMZbXmLmqQDAlBKAIjilE4thTTcBsdS4lkDJzojEHNM932WOTtw9P/rRn/bVArz3fQ+puEFRDOWQDLVpyz6UObZZ7lvcQF1L4O233857yOPs2quTBOEAgZkmML9BJxyPKjGpebmdzjRfDN4qAlAErZoOCAMC8QS8SqDEckEJjGeGMyYnIDUpxernHq4SiOREk7MtugWvEnjbbbdBCSx6AtAfCIAACFhCAIqgJRMBMUDAhIDUBxRLoCSIESVQsju6qf5Nrsc5IDAJAbH6eV88iCuoVzmcpG1cWwwBqQ8olkBJECNK4I0bN3gPeVExnaMXEAABEAABqwhAEbRqOiAMCEQTECVQEneIEnjLLS9SD+RQArFiiibQbN6qMoqKS7K4jKJWYNEzkL4/UQKlWLwogbfcIi7lj0MJTI8TV4IACIBA5QlAEaz8FGIAs0DAVQKfeKKnlECxBMrfOECgDAKwRpdBfbI+XSXwiSeeUEqgWALlbxwgAAIgAAKzSwCK4OzOPUZeIQJ33fVxEiXQzeIIJbBCkwdRQcACAnfddRfvIU8oC6CUiIASaMGkQAQQAAEQKJkAFMGSJwDdg0AcAVECH3vsTCmBYgl0i3zHXYfvQQAEQEAIiBL42GOPKSVQLIG33norwIAACIAACIAAQRHEIgABiwncc8+T9OijN1UcliiB4pKHAwRAAARMCdxzzz28hzyqSkOIEigJYnCAAAiAAAiAgBCAIoh1AAKWErh69Slqt59WSqAkhoESaOlEQSwQsJTA1atXeQ9pKyVQEsNACbR0oiAWCIAACJREAIpgSeDRLQiMIyBK4P33f3KgBEqafhwgAAIgYEpAlMD7779/oATecccdppfiPBAAARAAgRkhAEVwRiYaw6wOAXEFFSVQDqnRBiWwOnMHSUHABgLiCipKoN5DHuY9BEqgDfMCGUAABEDANgJQBG2bEcgz0wRECZTkMHI88shP0VvecttM88DgQQAEkhEQJVCSw+g95BHeQ96SrAGcDQIgAAIgMDMEoAjOzFRjoLYTkPIQrhL44IOvgxJo+4RBPhCwjICUh3CVwAcffBBKoGXzA3FAAARAwDYCUARtmxHIM5MERAm8886PqbFfufLjtLn5mpnkgEGDAAikIyBK4J133unsIVd4D9lM1xCuAgEQAAEQmBkCUARnZqoxUFsJPP30F5QS+O1v/xXde+/fp6tXb7dVVMgFAiBgIYGnn35aKYHf/va3eQ+5l/eQqxZKCZFAAARAAARsIwBF0LYZgTwzReDmzS/S0tKHlRIo8YAPPPAPZmr8GCwIgMBkBG7evMl7yJJSAiUe8IEHHpisQVwNAiAAAiAwMwSgCM7MVGOgNhK4fPk6PfecPMDdppLD4AABEACBJAQuX77Me8hzSgmU5DA4QAAEQAAEQMCUABRBU1I4DwRyICBKoJSHgBKYA1w0CQIzQECUQCkPASVwBiYbQwQBEACBjAnM9fnIuE00BwIgEENgbm4OjEAABEBgYgKiBD7++OOqcDwOEAABEAABEEhCABbBJLRwLghkROA1r0FW0IxQohkQmFkCP/zDPwwlcGZnHwMHARAAgckJwCI4OUO0AAIgMKME3vOe99B9991n7ejf9ra30cMPP2ytfBAMBEAABEAABECgPAJQBMtjj55BAARAAARAAARAAARAAARAoBQCcA0tBTs6BQEQAAEQAAEQAAEQAAEQAIHyCEARLI89egYBEAABEAABEAABEAABEACBUghAESwFOzoFARAAARAAARAAARAAARAAgfIIQBEsjz16BgEQAAEQAAEQAAEQAAEQAIFSCEARLAU7OgUBEAABEAABEAABEAABEACB8ghAESyPPXoGARAAARAAARAAARAAARAAgVIIQBEsBTs6BQEQAAEQAAEQAAEQAAEQAIHyCEARLI89egYB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\" 
border=\"0\" hspace=\"0\"></P>
<P><BR></P>
<P>To simulate the temperature  characteristic in a building zone various system 
parameters must be defined  before simulation. Firstly the model parameter 
dialog and the  model itself, have to be configured:</P>
<P><BR></P>
<UL>
  <LI value=\"1\">Zone number visualizes the  parameterized zone model in a 
  complex simulation model. If the zone is  coupled with other neighboring 
  building zones, the number of zones in the  desired simulation model must be 
  specified. </LI>
  <LI value=\"2\">Number of boundaries (max:  9, min: 1) defines how many 
  boundaries (wall etc.) should be modeled. Number  of inner masses (max: 4, 
  min: 0) defines the number of internal additional  heat storages (e.g. inner 
  walls and ceilings).</LI>
  <LI value=\"3\">To initialize the simulation  system the initial indoor 
  temperature must be defined.</LI>
  <LI value=\"4\">LoadCalculation specifies, if  the model should only be used to 
  calculate heating and cooling  depending on outer influences (i.e. the zone 
  temperature follows  reference  zone temperature level - TZoneRef has to be 
  connected) or if the zone  temperature should be simulated taking heat yields 
  and losses and the  heating system into consideration. Note that for this the 
  heating and  cooling load connector must be defined by the external  heating 
  system.</LI>
  <LI value=\"5\">useDayTime configures what time format is used. If the input 
  data sets 				(i.e. for the persons' behavior and electricity demand) are only 
  defined for a day, 				the parameter should be set to 'true.' If input data 
  sets are defined for specific times in a year 				(i.e. 0 to 8760h) the 
  parameter should be set to 'false.' </LI>
  <LI value=\"6\">useWindowShading offers the functionality of considering the 
  shading of windows in each boundary using an external signal (i.e. 0: fully  
  irradiated, 1: fully shaded). If this value is set to 'true' the external  
  WindowShading signal vector (dimension is number of boundaries) has to be  
  defined with external data for each vector component. Otherwise, numerical 
  problems could  occur. This feature is mostly used in combination with 
  building energy  management systems.</LI>
  <LI value=\"7\">DINcalc in the parameter  dialog 'Heat and Cool Factors I,' 
  defines if internal heat loads,  electrical power demand and the presence of 
  persons in the zone should be  modeled using DIN standards (DIN 2078) or 
  external  free-parameterizable input data sets.</LI></UL>
<P><BR></P>
<P>Internal heat yields  per person have to be parameterized (e.g. heat of body, 
heat losses due to cold  water usage, heat yields due to usage of electric 
devices). The ventilation  losses are defined via air leakage through 
boundaries. To assure an acceptable  CO2-level and an adequate humidity, in the 
zone, further ventilation is needed.  The losses are thus defined by an 
additional air volume flow between the zone and  atmosphere 
(LComfortVentilation, normally 25m3/h per person). This air volume  flow can be 
ensured through window or active ventilation. An  active ventilation system 
causes additional electricity demand depending on  the resulting volume flow. 
Note that a heat recovery rate of the system can be defined.</P>
<P><BR></P>
<P>Inner masses can be seen as additional heat  storages within the building 
zone. To simplify the simulation process it is  assumed that these masses always 
stay at room temperature level.</P>
<P><BR></P>
<P>Each boundary has to be  parameterized separately. Therefore boundary 
specific surface area  (e.g. walls, windows etc.), heat transmission factors 
(U-value) and  material  constants (i.e. heat capacity and density) must be 
defined. To  configure the building zones, the alignment of each boundary must 
be  determined via inclination and orientation angle:</P>
<P><BR></P>
<UL>
  <LI value=\"1\">Inclination angle: 90°  vertical wall, 0° flat ceiling or 
  floor.</LI>
  <LI value=\"2\">Orientation angle: 0° -   boundary normal points towards north, 
  90° - east, 180° - south, 270°  west.</LI></UL>
<P><BR></P>
<P>Additional correction factors  allow for a more detailed description of the 
solar radiation absorption. Note that the frame and  dirt correction factors are 
only used to reduce solar radiation absorption of  the windows. The shading 
correction factor is additionally used to variate the heat  absorption of the 
walls. Note that internal building boundaries (i.e. internal wall or ceiling) 
 are not irradiated by the sun and thus the associated shading correction factor 
should be set to  1. Generally, these correction factors reduce solar yields 
(i.e. maximum shading:  1).</P>
<P><BR></P>
<P>If a building consists of  several building zones and heat should be 
interchanged between these zones  during a simulation process, it is necessary 
to connect neighboring zones  within the simulation model. To enable this the 
maximum number of zones should be set to greater  than 1. This in turn allows 
for the parameter 'contactBound' to be set to the number of the neighboring 
 zones of each boundary (1, 2, 3 ....). If this parameter is set to zero, the 
 boundary is connected to the atmosphere.</P>
<P><BR></P>
<P>If the boundary of a zone is to  be the ground surface, the parameter 
'groundContact' must be set to 'true' and the  depth of the connected ground 
surface defined. For vertical walls  with ground contact, use the average depth 
of the wall. If a boundary is  connected to the ground, main heat transmission 
takes place via heat conductance. So,  the outer heat transmission factor is not 
relevant. Normally for outer walls, this  factor is set to a value of about 
20W/m2. For inner walls, the heat  transmission factors are normally set to a 
value of about 7.5W/m2. The  additional absorption coefficient describes the 
influence of the outer wall  color regarding solar heat absorbency (white 0.2, 
dark grey 0.8). </P>
<P><BR></P>
<P>Overall, a reduced set of  result characteristics can be visualized via the 
corresponding result  dialog. Additional output characteristics, like solar 
gains,  ventilation losses, etc., can enabled via the TypeDesigner by setting 
corresponding  and predefined output variables from protected, to public.</P>
<P>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </P></BODY></HTML>
"),
		experiment(
			StopTime=1,
			StartTime=0,
			Interval=0.002,
			__esi_MaxInterval="0.002"));
end BuildingZone_VariableVentilation;
