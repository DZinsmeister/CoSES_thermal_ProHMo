// CP: 65001
// SimulationX Version: 4.2.3.69223
within CoSES_Models.Storage;
model HeatStorageCombined5Inlets "Heat storage with variable temperature profile with 5 inlet ports"
	output Modelica.Blocks.Interfaces.RealOutput TStorage[n](
		quantity="Thermics.Temp",
		displayUnit="°C") "Output of heat storage layer temperatures" annotation(
		Placement(
			transformation(
				origin={265,-375},
				extent={{-10,-10},{10,10}},
				rotation=-90),
			iconTransformation(
				origin={-125,-363.3},
				extent={{-10,-10},{10,10}},
				rotation=-90)),
		Dialog(
			group="Temperature",
			tab="Results 1",
			visible=false));
	protected
		function sumVector "sumVector"
			input Real u[:];
			input Integer first=1;
			input Integer last=20;
			output Real y;
			algorithm
				y:=0;
				for i in first:last loop
					y:=y+u[i];
				end for;
			annotation(__esi_Impure=false);
		end sumVector;
	public
		GreenCity.Interfaces.Thermal.ExtractVolumeFlow FromFlow1 if use1 "Input signal flow pipe 1" annotation(Placement(transformation(extent={{180,-30},{200,-10}})));
		GreenCity.Interfaces.Thermal.DefineVolumeFlow ToReturn1 if use1 "Output signal return pipe 1" annotation(Placement(transformation(extent={{200,-95},{180,-75}})));
		GreenCity.Interfaces.Thermal.DefineVolumeFlow ToReturn2 if use2 "Output signal return pipe 2" annotation(Placement(transformation(extent={{200,-215},{180,-195}})));
		GreenCity.Interfaces.Thermal.ExtractVolumeFlow FromFlow2 if use2 "Input signal flow pipe 2" annotation(Placement(transformation(extent={{180,-160},{200,-140}})));
		GreenCity.Interfaces.Thermal.ExtractVolumeFlow FromFlow3 if use3 "Input signal flow pipe 3" annotation(Placement(transformation(extent={{180,-265},{200,-245}})));
		GreenCity.Interfaces.Thermal.DefineVolumeFlow ToReturn3 if use3 "Output signal return pipe 3" annotation(Placement(transformation(extent={{200,-315},{180,-295}})));
		GreenCity.Interfaces.Thermal.ExtractVolumeFlow FromReturn6 if use6 "Input signal return pipe 6" annotation(Placement(transformation(extent={{340,-95},{320,-75}})));
		GreenCity.Interfaces.Thermal.DefineVolumeFlow ToFlow6 if use6 "Output signal flow pipe 6" annotation(Placement(transformation(extent={{320,-30},{340,-10}})));
		GreenCity.Interfaces.Thermal.DefineVolumeFlow ToFlow7 if use7 "Output signal flow pipe 7" annotation(Placement(transformation(extent={{320,-160},{340,-140}})));
		GreenCity.Interfaces.Thermal.ExtractVolumeFlow FromReturn7 if use7 "Input signal return pipe 7" annotation(Placement(transformation(extent={{340,-215},{320,-195}})));
		GreenCity.Interfaces.Thermal.DefineVolumeFlow ToFlow8 if use8 "Output signal flow pipe 8" annotation(Placement(transformation(extent={{320,-265},{340,-245}})));
		GreenCity.Interfaces.Thermal.ExtractVolumeFlow FromReturn8 if use8 "Input signal return pipe 8" annotation(Placement(transformation(extent={{340,-315},{320,-295}})));
	protected
		Real TLayer[n](
			quantity="Thermics.Temp",
			displayUnit="°C") "Temperature of each heat storage layer" annotation(Dialog(
			group="Temperature",
			tab="Results 1"));
		Real TOut[8](
			quantity="Thermics.Temp",
			displayUnit="°C") "Vector of output temperature of each pipe" annotation(Dialog(
			group="Temperature",
			tab="Results 1"));
		Real TIn[8](
			quantity="Thermics.Temp",
			displayUnit="°C") " Vector of input temperature of each pipe" annotation(Dialog(
			group="Temperature",
			tab="Results 1"));
		Real THEin[n,8](
			quantity="Thermics.Temp",
			displayUnit="°C") "Matrix of (virtual) input heat exchanger temperatures of each heat storage layer and pipe" annotation(Dialog(
			group="Temperature",
			tab="Results 1"));
		Real THEout[n,8](
			quantity="Thermics.Temp",
			displayUnit="°C") "Matrix of (virtual) output heat exchanger temperatures of each heat storage layer and pipe" annotation(Dialog(
			group="Temperature",
			tab="Results 1"));
		Real deltaTin[n](
			quantity="Thermics.TempDiff",
			displayUnit="K") "Vector of temperature changes of each heat storage layer due to supplied pipe volume" annotation(Dialog(
			group="Temperature",
			tab="Results 1"));
		Real Qloss[n](
			quantity="Basics.Power",
			displayUnit="kW") "Heat losses through the heat storage isolation" annotation(Dialog(
			group="Heating Power",
			tab="Results 1"));
		Real PHeatExchanger[n](
			quantity="Basics.Power",
			displayUnit="kW") "Vector for supplied/abstracted heat power of HE in each heat storage layer" annotation(Dialog(
			group="Heating Power",
			tab="Results 1"));
	public
		Real PStorage[8](
			quantity="Basics.Power",
			displayUnit="kW") "Supplied/abstracted heat power of each pipe" annotation(Dialog(
			group="Heating Power",
			tab="Results 1",
			visible=false));
	protected
		Real PelIs(quantity="Basics.Power") "Electric heating power" annotation(Dialog(
			group="Heating Power",
			tab="Results 1"));
		type VoltageEnum = enumeration( 
			LV "Low-Voltage", 
			MV "Medium-Voltage", 
			HV "High-Voltage") "Voltage-Level Enumeration" annotation(initValue=LV);
	public
		type Enumeration1 = enumeration( 
			alternative "alternative");
		Modelica.Blocks.Interfaces.RealInput Pel(quantity="Basics.Power") if UseElHeater "Power of electric heater" annotation(
			Placement(
				transformation(extent={{-45,10},{-5,50}}),
				iconTransformation(
					origin={75.7,-363.3},
					extent={{-20,-19.3},{20,20.7}},
					rotation=90)),
			Dialog(
				group="Heating Power",
				tab="Results 1",
				visible=false));
	protected
		Real PLayer[n](quantity="Basics.Power") "Electrical heat power in each layer" annotation(Dialog(
			group="Heating Power",
			tab="Results 1"));
		Real GridPower(quantity="Basics.Power") if UseElHeater "Dedicated electrical power" annotation(Dialog(
			group="Heating Power",
			tab="Results 1"));
	public
		Real PGrid(quantity="Basics.Power") if UseElHeater "Electrical power from grid" annotation(Dialog(
			group="Heating Power",
			tab="Results 1",
			visible=false));
		Real SOC(
			quantity="Basics.RelMagnitude",
			displayUnit="%") "State of charge" annotation(Dialog(
			group="State of Charge",
			tab="Results 1",
			visible=false));
		Real EStorage(
			quantity="Basics.Energy",
			displayUnit="kWh") "Stored heat energy" annotation(Dialog(
			group="Energy",
			tab="Results 1",
			visible=false));
		Real EHeat[8](
			quantity="Basics.Energy",
			displayUnit="kWh") "Heat input/output" annotation(Dialog(
			group="Energy",
			tab="Results 1",
			visible=false));
		Real Eel(
			quantity="Basics.Energy",
			displayUnit="kWh") if UseElHeater "Electrical energy used for heating" annotation(Dialog(
			group="Energy",
			tab="Results 1",
			visible=false));
	protected
		Real ELayer[n](
			quantity="Basics.Energy",
			displayUnit="kWh") "Energy of each heat storage layer" annotation(Dialog(
			group="Energy",
			tab="Results 1"));
		Real EMax(
			quantity="Basics.Energy",
			displayUnit="kWh") "Maximum stored heat energy" annotation(Dialog(
			group="Energy",
			tab="Results 1"));
		Real EMaxLayer[n](
			quantity="Basics.Energy",
			displayUnit="kWh") "Maximum heat energy of each layer" annotation(Dialog(
			group="Energy",
			tab="Results 1"));
	public
		constant Real g(
			quantity="Mechanics.Translation.Accel",
			displayUnit="m/s²")=9.81 "Gravitiy" annotation(Dialog(
			group="Buoyancy",
			tab="Results 1"));
	protected
		Real rho[n](
			quantity="Basics.Density",
			displayUnit="kg/m³") "Density of heat storage medium of each heat storage layer" annotation(Dialog(
			group="Buoyancy",
			tab="Results 1"));
		Real FBuoyancy[n](
			quantity="Mechanics.Translation.Force",
			displayUnit="N") "Differential buoynacy force of heat storage medium of each heat storage layer" annotation(Dialog(
			group="Buoyancy",
			tab="Results 1"));
		Real vBuoyancy[n](
			quantity="Mechanics.Translation.Velocity",
			displayUnit="m/s") "Differential buoynacy speed of heat storage medium of each heat storage layer" annotation(Dialog(
			group="Buoyancy",
			tab="Results 1"));
		Real sBuoyancy[n](
			quantity="Mechanics.Translation.Displace",
			displayUnit="m") "Differential buoynacy displacement of heat storage medium of each heat storage layer" annotation(Dialog(
			group="Buoyancy",
			tab="Results 1"));
		Real VMix[n](
			quantity="Geometry.Volume",
			displayUnit="l") "Differential mixing volume of neighboring heat storage medium layers due to densitiy differences" annotation(Dialog(
			group="Buoyancy",
			tab="Results 1"));
		Integer nHeatedLayer "Number of electrically heated layers" annotation(Dialog(
			group="Usage",
			tab="Results 1"));
		Boolean ElOn "On conditions for electric heater are true" annotation(
			HideResult=false,
			Dialog(
				group="Usage",
				tab="Results 1"));
		Boolean use[8] "Vector for usage definition for each pipe" annotation(Dialog(
			group="Usage",
			tab="Results 1"));
		Boolean HE[8] "Vector for installation type definitions of each pipe" annotation(Dialog(
			group="Usage",
			tab="Results 1"));
		Integer index[8,2] "Layer index array for flow(1) and return (2) pipes" annotation(Dialog(
			group="Usage",
			tab="Results 1"));
		Boolean indexRange[n,8] "Usage definition of each (virtual) HE-section" annotation(Dialog(
			group="Usage",
			tab="Results 1"));
		Integer HEsize[8] "Vector for HE-pipe sizes - number of heat storage layers of a HE" annotation(Dialog(
			group="Usage",
			tab="Results 1"));
		Real qv[8](
			quantity="Thermics.VolumeFlow",
			displayUnit="m³/h") "Vector of volume flow of each pipe" annotation(Dialog(
			group="Volume Flow",
			tab="Results 1"));
		Real VPipeIn[n,8](
			quantity="Geometry.Volume",
			displayUnit="l") "Matrix of input volume of each heat storage layer depending on HE-pipe" annotation(Dialog(
			group="Volume Flow",
			tab="Results 1"));
		Real VPipeOut[n,8](
			quantity="Geometry.Volume",
			displayUnit="l") "Matrix of output volume of each heat storage layer depending on HE-pipe" annotation(Dialog(
			group="Volume Flow",
			tab="Results 1"));
		Real VIn[n](
			quantity="Geometry.Volume",
			displayUnit="l") "Vector of layer-specific supply volume" annotation(Dialog(
			group="Volume Flow",
			tab="Results 1"));
		Real VOut[n](
			quantity="Geometry.Volume",
			displayUnit="l") "Vector of layer-specific abstraction volume" annotation(Dialog(
			group="Volume Flow",
			tab="Results 1"));
		Real VDiff[n](
			quantity="Geometry.Volume",
			displayUnit="l") "Vector for volume difference between supply and abstraction of each heat storage layer" annotation(Dialog(
			group="Volume Flow",
			tab="Results 1"));
		Real CalcVDiffPot[n,8] "Calculation variable for volume shifting potential" annotation(Dialog(
			group="Volume Flow",
			tab="Results 1"));
		Real VDiffPot[n,8](
			quantity="Geometry.Volume",
			displayUnit="l") "Matrix of volume shifting potential of each heat storage layer due to volume supply/abstraction" annotation(Dialog(
			group="Volume Flow",
			tab="Results 1"));
		Real AHeatExchanger[8](
			quantity="Geometry.Area",
			displayUnit="m²") "Vector for HE-surface area" annotation(Dialog(
			group="Heat Exchanger",
			tab="Results 1"));
		Real VHeatExchanger[8](
			quantity="Geometry.Volume",
			displayUnit="l") "Vector for  HE-volume" annotation(Dialog(
			group="Heat Exchanger",
			tab="Results 1"));
		Real rhoHeatExchanger[8](
			quantity="Basics.Density",
			displayUnit="kg/m³") "Vector for HE-media densitiy" annotation(Dialog(
			group="Heat Exchanger",
			tab="Results 1"));
		Real cpHeatExchanger[8](
			quantity="Thermics.SpecHeatCapacity",
			displayUnit="kJ/(kg·K)") "Vector for HE-specific medium heat capacity" annotation(Dialog(
			group="Heat Exchanger",
			tab="Results 1"));
		Real alphaMedTubeHeatExchanger[8](
			quantity="Thermics.HeatTransmCoeff",
			displayUnit="W/(m²·K)") "Vector for heat transmission coefficients of streaming heat exchanger medium in a tubular heat exchanger" annotation(Dialog(
			group="Heat Exchanger",
			tab="Results 1"));
	public
		parameter Real VStorage(
			quantity="Geometry.Volume",
			displayUnit="l")=0.75 "Heat storage volume" annotation(Dialog(
			group="Dimension",
			tab="Heat Storage"));
		parameter Real dStorage(
			quantity="Geometry.Length",
			displayUnit="m")=0.75 "Diameter of heat storage" annotation(Dialog(
			group="Dimension",
			tab="Heat Storage"));
		parameter Real QlossRate(
			quantity="Thermics.HeatCond",
			displayUnit="W/K")=3.16 "Heat conductance of heat storage isolation" annotation(Dialog(
			group="Dimension",
			tab="Heat Storage"));
		parameter Integer n=10 "Number of heat storage layers, if >10, T[n>10] = T[10]" annotation(Dialog(
			group="Simulation Parameters",
			tab="Heat Storage"));
		parameter Boolean LinearProfile=true "If true, the temperature profile at simulation begin within the storage is linear, if false the profile is defined by a temperature vector" annotation(Dialog(
			group="Simulation Parameters",
			tab="Heat Storage"));
		parameter Real TupInit(
			quantity="Thermics.Temp",
			displayUnit="°C")=313.14999999999998 if LinearProfile "Temperature of upmost heat storage layer at simulation begin" annotation(Dialog(
			group="Simulation Parameters",
			tab="Heat Storage"));
		parameter Real TlowInit(
			quantity="Thermics.Temp",
			displayUnit="°C")=313.14999999999998 if LinearProfile "Temperature of lowmost heat storage layer at simulation begin" annotation(Dialog(
			group="Simulation Parameters",
			tab="Heat Storage"));
		parameter Real TLayerVector[20](quantity="Basics.Temp")={313.15,313.15,313.15,313.15,313.15,313.15,313.15,313.15,313.15,313.15,313.15,313.15,313.15,313.15,313.15,313.15,313.15,313.15,313.15,313.15} if not LinearProfile "Vector of temperature profile of the layers at simulation begin, element 1 is at lowest layer" annotation(Dialog(
			group="Simulation Parameters",
			tab="Heat Storage"));
		parameter Real TAmbient(
			quantity="Thermics.Temp",
			displayUnit="°C")=291.14999999999998 "Ambient temperature of heat storage" annotation(Dialog(
			group="Simulation Parameters",
			tab="Heat Storage"));
		parameter Boolean UseElHeater=false "Use electric heater" annotation(Dialog(
			group="Electric Heater",
			tab="Heat Storage"));
		parameter Real ElHeaterPower(quantity="Basics.Power")=10000 if UseElHeater "Power of the electric heater" annotation(Dialog(
			group="Electric Heater",
			tab="Heat Storage"));
		parameter Integer iUp=5 if UseElHeater "Upmost electrically heated storage layer" annotation(Dialog(
			group="Electric Heater",
			tab="Heat Storage"));
		parameter Integer iLow=5 if UseElHeater "Lowmost electrically heated storage layer" annotation(Dialog(
			group="Electric Heater",
			tab="Heat Storage"));
		parameter Integer Phase=3 if UseElHeater "Number of Phases for electric grid connection" annotation(Dialog(
			group="Electric Heater",
			tab="Heat Storage"));
		parameter Real DeltaTHeater(quantity="Thermics.TempDiff")=10 if UseElHeater "Temperature hysteresis for electric heater" annotation(Dialog(
			group="Electric Heater",
			tab="Heat Storage"));
		parameter Real TMax(
			quantity="Thermics.Temp",
			displayUnit="°C")=368.14999999999998 "Maximum layer temperature" annotation(Dialog(
			group="Maximum Temperature",
			tab="Medium"));
		parameter Real cpMed(
			quantity="Thermics.SpecHeatCapacity",
			displayUnit="kJ/(kg·K)")=4177 "Specific heat capacity of heat storage medium" annotation(Dialog(
			group="Medium Properties",
			tab="Medium"));
		parameter Real rhoMed(
			quantity="Thermics.Density",
			displayUnit="kg/m³")=1000 "Average density of heat storage medium" annotation(Dialog(
			group="Medium Properties",
			tab="Medium"));
		parameter Real alphaMedStatic(
			quantity="Thermics.ConvCoeff",
			displayUnit="W/(m²·K)")=465 "Heat transmission coefficient of heat storage medium for neighboring heat storage layers" annotation(Dialog(
			group="Medium Properties",
			tab="Medium"));
		Curve rhoTable(
			x(
				quantity="Thermodynamics.Temp",
				displayUnit="K")=":128:
789C34CD4B0D83401405D0291290301248BA274840028BEE3BFDB047021290301246021246020AFA3B7DC9CB59BCDC774F2184F37B2F9F69AFFDD7C88E03474E
4C5CB8726366E1CECA834DFAD932B2E3C091131317AEDC9859B8B3F26073D3CFC88E03474E4C5CB8B2FEF37777EE8C0F7916B64FFF99D9CCFAE7FE050000FFFF" "Spalte 1",
			y[1](
				mono=0,
				interpol=4,
				extra=true,
				mirror=false,
				cycle=false,
				approxTol=0.1,
				displayUnit="kg/m³",
				quantity="Basics.Density")=":253:
789C4C5031680241107C41101E44110322C44710792544828949D0D72D046DDF5A2C53A7B2D0DAD2DD3A69636DAD6D6CB5B64D6A6D22689D3D6F04079EF9BDDD
995936E238CE937EDE64172E9A42558396D03E5CE426CADDDF517AAE7CF2FBF27D555FFA97F9CD5AA17A77FBF51E287F7E2802BC37841C0365D376EB423D95EF
5ED17F81DFB390A61CFD9AD0799F47F857E1F7005D0573F742A60CEFC065B08F3D8A42F38E2E5C109A69EC368F1C4FC8D8E76E9193855F0639374225F390824F
5228303F71A1D5510FE1E20E31E8A3A823E03FB6BA1FB6791BF092E9CD60C6762F66AB1FB2DD7BC0344E6BA78DB932DB7B25D8DEE930A57F000000FFFF" "Spalte 2") "Table including temperature specific density of heat medium" annotation(
			Placement(transformation(extent={{-10,10},{10,30}})),
			Dialog(
				group="Density",
				tab="Medium"));
		parameter Boolean use1=false "True=pipe 1 is used" annotation(Dialog(
			group="Usage",
			tab="Pipe 1 - Heat Supply"));
		parameter Boolean HE1=false if use1 "Pipe 1: true=heat supply/abstraction via heat exchanger; false=heat supply/abstraction via heat medium transport" annotation(Dialog(
			group="Usage",
			tab="Pipe 1 - Heat Supply"));
		parameter Integer iFlow1=10 if use1 "Layer index array for flow pipe 1" annotation(Dialog(
			group="Flow/Return Pipe",
			tab="Pipe 1 - Heat Supply"));
		parameter Integer iReturn1=1 if use1 "Layer index array for return pipe 1" annotation(Dialog(
			group="Flow/Return Pipe",
			tab="Pipe 1 - Heat Supply"));
		parameter Real AHeatExchanger1(
			quantity="Geometry.Area",
			displayUnit="m²")=2.2 if use1 and HE1 "HE-surface area 1" annotation(Dialog(
			group="Heat Exchanger - Dimensions",
			tab="Pipe 1 - Heat Supply"));
		parameter Real VHeatExchanger1(
			quantity="Geometry.Volume",
			displayUnit="l")=0.0129 if use1 and HE1 "HE-volume 1" annotation(Dialog(
			group="Heat Exchanger - Dimensions",
			tab="Pipe 1 - Heat Supply"));
		parameter Real cpHeatExchanger1(
			quantity="Thermics.SpecHeatCapacity",
			displayUnit="kJ/(kg·K)")=4176.9999999999982 if use1 and HE1 "HE-specific medium heat capacity 1" annotation(Dialog(
			group="Heat Exchanger - Medium",
			tab="Pipe 1 - Heat Supply"));
		parameter Real rhoHeatExchanger1(
			quantity="Basics.Density",
			displayUnit="kg/m³")=1000 if use1 and HE1 "HE-media densitiy 1" annotation(Dialog(
			group="Heat Exchanger - Medium",
			tab="Pipe 1 - Heat Supply"));
		parameter Real alphaMedTubeHeatExchanger1(
			quantity="Thermics.ConvCoeff",
			displayUnit="W/(m²·K)")=675 if use1 and HE1 "Heat transmission coefficients of streaming heat exchanger medium in a tubular heat exchanger 1" annotation(Dialog(
			group="Heat Exchanger - Medium",
			tab="Pipe 1 - Heat Supply"));
		parameter Boolean use2=false "True=pipe 2 is used" annotation(Dialog(
			group="Usage",
			tab="Pipe 2 - Heat Supply"));
		parameter Boolean HE2=false if use2 "Pipe 2: true=heat supply/abstraction via heat exchanger; false=heat supply/abstraction via heat medium transport" annotation(Dialog(
			group="Usage",
			tab="Pipe 2 - Heat Supply"));
		parameter Integer iFlow2=10 if use2 "Layer index array for flow pipe 2" annotation(Dialog(
			group="Flow/Return Pipe",
			tab="Pipe 2 - Heat Supply"));
		parameter Integer iReturn2=1 if use2 "Layer index array for return pipe 2" annotation(Dialog(
			group="Flow/Return Pipe",
			tab="Pipe 2 - Heat Supply"));
		parameter Real AHeatExchanger2(
			quantity="Geometry.Area",
			displayUnit="m²")=2.2 if use2 and HE2 "HE-surface area 2" annotation(Dialog(
			group="Heat Exchanger - Dimensions",
			tab="Pipe 2 - Heat Supply"));
		parameter Real VHeatExchanger2(
			quantity="Geometry.Volume",
			displayUnit="l")=0.0129 if use2 and HE2 "HE-volume 2" annotation(Dialog(
			group="Heat Exchanger - Dimensions",
			tab="Pipe 2 - Heat Supply"));
		parameter Real cpHeatExchanger2(
			quantity="Thermics.SpecHeatCapacity",
			displayUnit="kJ/(kg·K)")=4177 if use2 and HE2 "HE-specific medium heat capacity 2" annotation(Dialog(
			group="Heat Exchanger - Medium",
			tab="Pipe 2 - Heat Supply"));
		parameter Real rhoHeatExchanger2(
			quantity="Basics.Density",
			displayUnit="kg/m³")=1000 if use2 and HE2 "HE-media densitiy 2" annotation(Dialog(
			group="Heat Exchanger - Medium",
			tab="Pipe 2 - Heat Supply"));
		parameter Real alphaMedTubeHeatExchanger2(
			quantity="Thermics.ConvCoeff",
			displayUnit="W/(m²·K)")=675 if use2 and HE2 "Heat transmission coefficients of streaming heat exchanger medium in a tubular heat exchanger 2" annotation(Dialog(
			group="Heat Exchanger - Medium",
			tab="Pipe 2 - Heat Supply"));
		parameter Boolean use3=false "True=pipe 3 is used" annotation(Dialog(
			group="Usage",
			tab="Pipe 3 - Heat Supply"));
		parameter Boolean HE3=false if use3 "Pipe 3: true=heat supply/abstraction via heat exchanger; false=heat supply/abstraction via heat medium transport" annotation(Dialog(
			group="Usage",
			tab="Pipe 3 - Heat Supply"));
		parameter Integer iFlow3=10 if use3 "Layer index array for flow pipe 3" annotation(Dialog(
			group="Flow/Return Pipe",
			tab="Pipe 3 - Heat Supply"));
		parameter Integer iReturn3=1 if use3 "Layer index array for return pipe 3" annotation(Dialog(
			group="Flow/Return Pipe",
			tab="Pipe 3 - Heat Supply"));
		parameter Real AHeatExchanger3(
			quantity="Geometry.Area",
			displayUnit="m²")=2.2 if use3 and HE3 "HE-surface area 3" annotation(Dialog(
			group="Heat Exchanger - Dimensions",
			tab="Pipe 3 - Heat Supply"));
		parameter Real VHeatExchanger3(
			quantity="Geometry.Volume",
			displayUnit="l")=0.0129 if use3 and HE3 "HE-volume 3" annotation(Dialog(
			group="Heat Exchanger - Dimensions",
			tab="Pipe 3 - Heat Supply"));
		parameter Real cpHeatExchanger3(
			quantity="Thermics.SpecHeatCapacity",
			displayUnit="kJ/(kg·K)")=4177 if use3 and HE3 "HE-specific medium heat capacity 3" annotation(Dialog(
			group="Heat Exchanger - Medium",
			tab="Pipe 3 - Heat Supply"));
		parameter Real rhoHeatExchanger3(
			quantity="Basics.Density",
			displayUnit="kg/m³")=1000 if use3 and HE3 "HE-media density 3" annotation(Dialog(
			group="Heat Exchanger - Medium",
			tab="Pipe 3 - Heat Supply"));
		parameter Real alphaMedTubeHeatExchanger3(
			quantity="Thermics.ConvCoeff",
			displayUnit="W/(m²·K)")=675 if use3 and HE3 "Heat transmission coefficients of streaming heat exchanger medium in a tubular heat exchanger 3" annotation(Dialog(
			group="Heat Exchanger - Medium",
			tab="Pipe 3 - Heat Supply"));
		parameter Boolean use4=false "True=pipe 4 is used" annotation(Dialog(
			group="Usage",
			tab="Pipe 4 - Heat Supply"));
		parameter Boolean HE4=false if use4 "Pipe 4: true=heat supply/abstraction via heat exchanger; false=heat supply/abstraction via heat medium transport" annotation(Dialog(
			group="Usage",
			tab="Pipe 4 - Heat Supply"));
		parameter Integer iFlow4=10 if use4 "Layer index array for flow pipe 4" annotation(Dialog(
			group="Flow/Return Pipe",
			tab="Pipe 4 - Heat Supply"));
		parameter Integer iReturn4=1 if use4 "Layer index array for return pipe 4" annotation(Dialog(
			group="Flow/Return Pipe",
			tab="Pipe 4 - Heat Supply"));
		parameter Real AHeatExchanger4(
			quantity="Geometry.Area",
			displayUnit="m²")=2.2 if use4 and HE4 "HE-surface area 4" annotation(Dialog(
			group="Heat Exchanger - Dimensions",
			tab="Pipe 4 - Heat Supply"));
		parameter Real VHeatExchanger4(
			quantity="Geometry.Volume",
			displayUnit="l")=0.0129 if use4 and HE4 "HE-volume 4" annotation(Dialog(
			group="Heat Exchanger - Dimensions",
			tab="Pipe 4 - Heat Supply"));
		parameter Real cpHeatExchanger4(
			quantity="Thermics.SpecHeatCapacity",
			displayUnit="kJ/(kg·K)")=4177 if use4 and HE4 "HE-specific medium heat capacity 4" annotation(Dialog(
			group="Heat Exchanger - Medium",
			tab="Pipe 4 - Heat Supply"));
		parameter Real rhoHeatExchanger4(
			quantity="Basics.Density",
			displayUnit="kg/m³")=1000 if use4 and HE4 "HE-media density 4" annotation(Dialog(
			group="Heat Exchanger - Medium",
			tab="Pipe 4 - Heat Supply"));
		parameter Real alphaMedTubeHeatExchanger4(
			quantity="Thermics.ConvCoeff",
			displayUnit="W/(m²·K)")=675 if use4 and HE4 "Heat transmission coefficients of streaming heat exchanger medium in a tubular heat exchanger 4" annotation(Dialog(
			group="Heat Exchanger - Medium",
			tab="Pipe 4 - Heat Supply"));
		parameter Boolean use5=false "True=pipe 5 is used" annotation(Dialog(
			group="Usage",
			tab="Pipe 5 - Heat Supply"));
		parameter Boolean HE5=false if use5 "Pipe 5: true=heat supply/abstraction via heat exchanger; false=heat supply/abstraction via heat medium transport" annotation(Dialog(
			group="Usage",
			tab="Pipe 5 - Heat Supply"));
		parameter Integer iFlow5=10 if use5 "Layer index array for flow pipe 5" annotation(Dialog(
			group="Flow/Return Pipe",
			tab="Pipe 5 - Heat Supply"));
		parameter Integer iReturn5=1 if use5 "Layer index array for return pipe 5" annotation(Dialog(
			group="Flow/Return Pipe",
			tab="Pipe 5 - Heat Supply"));
		parameter Real AHeatExchanger5(
			quantity="Geometry.Area",
			displayUnit="m²")=2.2 if use5 and HE5 "HE-surface area 5" annotation(Dialog(
			group="Heat Exchanger - Dimensions",
			tab="Pipe 5 - Heat Supply"));
		parameter Real VHeatExchanger5(
			quantity="Geometry.Volume",
			displayUnit="l")=0.0129 if use5 and HE5 "HE-volume 5" annotation(Dialog(
			group="Heat Exchanger - Dimensions",
			tab="Pipe 5 - Heat Supply"));
		parameter Real cpHeatExchanger5(
			quantity="Thermics.SpecHeatCapacity",
			displayUnit="kJ/(kg·K)")=4177 if use5 and HE5 "HE-specific medium heat capacity 5" annotation(Dialog(
			group="Heat Exchanger - Medium",
			tab="Pipe 5 - Heat Supply"));
		parameter Real rhoHeatExchanger5(
			quantity="Basics.Density",
			displayUnit="kg/m³")=1000 if use5 and HE5 "HE-media density 5" annotation(Dialog(
			group="Heat Exchanger - Medium",
			tab="Pipe 5 - Heat Supply"));
		parameter Real alphaMedTubeHeatExchanger5(
			quantity="Thermics.ConvCoeff",
			displayUnit="W/(m²·K)")=675 if use5 and HE5 "Heat transmission coefficients of streaming heat exchanger medium in a tubular heat exchanger 5" annotation(Dialog(
			group="Heat Exchanger - Medium",
			tab="Pipe 5 - Heat Supply"));
		parameter Boolean use6=false "True=pipe 6 is used" annotation(Dialog(
			group="Usage",
			tab="Pipe 6 - Heat Extraction"));
		parameter Boolean HE6=false if use6 "Pipe 6: true=heat supply/abstraction via heat exchanger; false=heat supply/abstraction via heat medium transport" annotation(Dialog(
			group="Usage",
			tab="Pipe 6 - Heat Extraction"));
		parameter Integer iFlow6=10 if use6 "Layer index array for flow pipe 6" annotation(Dialog(
			group="Flow/Return Pipe",
			tab="Pipe 6 - Heat Extraction"));
		parameter Integer iReturn6=1 if use6 "Layer index array for return pipe 6" annotation(Dialog(
			group="Flow/Return Pipe",
			tab="Pipe 6 - Heat Extraction"));
		parameter Real AHeatExchanger6(
			quantity="Geometry.Area",
			displayUnit="m²")=2.2 if use6 and HE6 "HE-surface area 6" annotation(Dialog(
			group="Heat Exchanger - Dimension",
			tab="Pipe 6 - Heat Extraction"));
		parameter Real VHeatExchanger6(
			quantity="Geometry.Volume",
			displayUnit="l")=0.0129 if use6 and HE6 "HE-volume 6" annotation(Dialog(
			group="Heat Exchanger - Dimension",
			tab="Pipe 6 - Heat Extraction"));
		parameter Real cpHeatExchanger6(
			quantity="Thermics.SpecHeatCapacity",
			displayUnit="kJ/(kg·K)")=4177 if use6 and HE6 "HE-specific medium heat capacity 6" annotation(Dialog(
			group="Heat Exchanger - Medium",
			tab="Pipe 6 - Heat Extraction"));
		parameter Real rhoHeatExchanger6(
			quantity="Basics.Density",
			displayUnit="kg/m³")=1000 if use6 and HE6 "HE-media densitiy 6" annotation(Dialog(
			group="Heat Exchanger - Medium",
			tab="Pipe 6 - Heat Extraction"));
		parameter Real alphaMedTubeHeatExchanger6(
			quantity="Thermics.ConvCoeff",
			displayUnit="W/(m²·K)")=675 if use6 and HE6 "Heat transmission coefficients of streaming heat exchanger medium in a tubular heat exchanger 6" annotation(Dialog(
			group="Heat Exchanger - Medium",
			tab="Pipe 6 - Heat Extraction"));
		parameter Boolean use7=false "True=pipe 7 is used" annotation(Dialog(
			group="Usage",
			tab="Pipe 7 - Heat Extraction"));
		parameter Boolean HE7=false if use7 "Pipe 7: true=heat supply/abstraction via heat exchanger; false=heat supply/abstraction via heat medium transport" annotation(Dialog(
			group="Usage",
			tab="Pipe 7 - Heat Extraction"));
		parameter Integer iFlow7=10 if use7 "Layer index array for flow pipe 7" annotation(Dialog(
			group="Flow/Return Pipe",
			tab="Pipe 7 - Heat Extraction"));
		parameter Integer iReturn7=1 if use7 "Layer index array for return pipe 7" annotation(Dialog(
			group="Flow/Return Pipe",
			tab="Pipe 7 - Heat Extraction"));
		parameter Real AHeatExchanger7(
			quantity="Geometry.Area",
			displayUnit="m²")=2.2 if use7 and HE7 "HE-surface area 7" annotation(Dialog(
			group="Heat Exchanger - Dimensions",
			tab="Pipe 7 - Heat Extraction"));
		parameter Real VHeatExchanger7(
			quantity="Geometry.Volume",
			displayUnit="l")=0.0129 if use7 and HE7 "HE-volume 7" annotation(Dialog(
			group="Heat Exchanger - Dimensions",
			tab="Pipe 7 - Heat Extraction"));
		parameter Real cpHeatExchanger7(
			quantity="Thermics.SpecHeatCapacity",
			displayUnit="kJ/(kg·K)")=4177 if use7 and HE7 "HE-specific medium heat capacity 7" annotation(Dialog(
			group="Heat Exchanger - Medium",
			tab="Pipe 7 - Heat Extraction"));
		parameter Real rhoHeatExchanger7(
			quantity="Basics.Density",
			displayUnit="kg/m³")=1000 if use7 and HE7 "HE-media densitiy 7" annotation(Dialog(
			group="Heat Exchanger - Medium",
			tab="Pipe 7 - Heat Extraction"));
		parameter Real alphaMedTubeHeatExchanger7(
			quantity="Thermics.ConvCoeff",
			displayUnit="W/(m²·K)")=675 if use7 and HE7 "Heat transmission coefficients of streaming heat exchanger medium in a tubular heat exchanger 7" annotation(Dialog(
			group="Heat Exchanger - Medium",
			tab="Pipe 7 - Heat Extraction"));
		parameter Boolean use8=false "True=pipe 8 is used" annotation(Dialog(
			group="Usage",
			tab="Pipe 8 - Heat Extraction"));
		parameter Boolean HE8=false if use8 "Pipe 8: true=heat supply/abstraction via heat exchanger; false=heat supply/abstraction via heat medium transport" annotation(Dialog(
			group="Usage",
			tab="Pipe 8 - Heat Extraction"));
		parameter Integer iFlow8=10 if use8 "Layer index array for flow pipe 8" annotation(Dialog(
			group="Flow/Return Pipe",
			tab="Pipe 8 - Heat Extraction"));
		parameter Integer iReturn8=1 if use8 "Layer index array for return pipe 8" annotation(Dialog(
			group="Flow/Return Pipe",
			tab="Pipe 8 - Heat Extraction"));
		parameter Real AHeatExchanger8(
			quantity="Geometry.Area",
			displayUnit="m²")=2.2 if use8 and HE8 "HE-surface area 8" annotation(Dialog(
			group="Heat Exchanger - Dimensions",
			tab="Pipe 8 - Heat Extraction"));
		parameter Real VHeatExchanger8(
			quantity="Geometry.Volume",
			displayUnit="l")=0.0129 if use8 and HE8 "HE-volume 8" annotation(Dialog(
			group="Heat Exchanger - Dimensions",
			tab="Pipe 8 - Heat Extraction"));
		parameter Real cpHeatExchanger8(
			quantity="Thermics.SpecHeatCapacity",
			displayUnit="kJ/(kg·K)")=4177 if use8 and HE8 "HE-specific medium heat capacity 8" annotation(Dialog(
			group="Heat Exchanger - Medium",
			tab="Pipe 8 - Heat Extraction"));
		parameter Real rhoHeatExchanger8(
			quantity="Basics.Density",
			displayUnit="kg/m³")=1000 if use8 and HE8 "HE-media densitiy 8" annotation(Dialog(
			group="Heat Exchanger - Medium",
			tab="Pipe 8 - Heat Extraction"));
		parameter Real alphaMedTubeHeatExchanger8(
			quantity="Thermics.ConvCoeff",
			displayUnit="W/(m²·K)")=675 if use8 and HE8 "Heat transmission coefficients of streaming heat exchanger medium in a tubular heat exchanger 8" annotation(Dialog(
			group="Heat Exchanger - Medium",
			tab="Pipe 8 - Heat Extraction"));
		GreenCity.Interfaces.Thermal.VolumeFlowIn FlowIn1 if use1 "Flow pipe 1" annotation(Placement(
			transformation(extent={{130,-30},{150,-10}}),
			iconTransformation(extent={{-185,306.7},{-165,326.7}})));
		GreenCity.Interfaces.Thermal.VolumeFlowOut ReturnOut1 if use1 "Return pipe 1" annotation(Placement(
			transformation(extent={{130,-95},{150,-75}}),
			iconTransformation(extent={{-185,256.7},{-165,276.7}})));
		GreenCity.Interfaces.Thermal.VolumeFlowIn FlowIn2 if use2 "Flow pipe 2" annotation(Placement(
			transformation(extent={{130,-158},{150,-138}}),
			iconTransformation(extent={{-185,156.7},{-165,176.7}})));
		GreenCity.Interfaces.Thermal.VolumeFlowOut ReturnOut2 if use2 "Return pipe 2" annotation(Placement(
			transformation(extent={{130,-215},{150,-195}}),
			iconTransformation(extent={{-185,106.7},{-165,126.7}})));
		GreenCity.Interfaces.Thermal.VolumeFlowIn FlowIn3 if use3 "Flow pipe 3" annotation(Placement(
			transformation(extent={{130,-265},{150,-245}}),
			iconTransformation(extent={{-185,6.7},{-165,26.7}})));
		GreenCity.Interfaces.Thermal.VolumeFlowOut ReturnOut3 if use3 "Return pipe 3" annotation(Placement(
			transformation(extent={{130,-315},{150,-295}}),
			iconTransformation(extent={{-185,-43.3},{-165,-23.3}})));
		GreenCity.Interfaces.Thermal.VolumeFlowOut FlowOut6 if use6 "Flow pipe 6" annotation(Placement(
			transformation(extent={{365,-30},{385,-10}}),
			iconTransformation(extent={{165,307},{185,327}})));
		GreenCity.Interfaces.Thermal.VolumeFlowIn ReturnIn6 if use6 "Return pipe 6" annotation(Placement(
			transformation(extent={{365,-95},{385,-75}}),
			iconTransformation(extent={{165,207},{185,227}})));
		GreenCity.Interfaces.Thermal.VolumeFlowOut FlowOut7 if use7 "Flow pipe 7" annotation(Placement(
			transformation(extent={{365,-160},{385,-140}}),
			iconTransformation(extent={{165,57},{185,77}})));
		GreenCity.Interfaces.Thermal.VolumeFlowIn ReturnIn7 if use7 "Return pipe 7" annotation(Placement(
			transformation(extent={{365,-215},{385,-195}}),
			iconTransformation(extent={{165,-43},{185,-23}})));
		GreenCity.Interfaces.Thermal.VolumeFlowOut FlowOut8 if use8 "Flow pipe 8" annotation(Placement(
			transformation(extent={{365,-265},{385,-245}}),
			iconTransformation(extent={{165,-193},{185,-173}})));
		GreenCity.Interfaces.Thermal.VolumeFlowIn ReturnIn8 if use8 "Return pipe 8" annotation(Placement(
			transformation(extent={{365,-315},{385,-295}}),
			iconTransformation(extent={{165,-293},{185,-273}})));
		GreenCity.Interfaces.Electrical.LV3Phase Grid3 if(Phase==3 and UseElHeater) "Electrical Low-Voltage AC Three-Phase Connector" annotation(Placement(
			transformation(extent={{-30,-30},{-10,-10}}),
			iconTransformation(extent={{115,-373.3},{135,-353.3}})));
		GreenCity.Interfaces.Electrical.LV1Phase Grid1 if(Phase==1 and UseElHeater) "Electrical Low-Voltage AC Single-Phase Connector" annotation(Placement(
			transformation(extent={{-30,-95},{-10,-75}}),
			iconTransformation(extent={{115,-373.3},{135,-353.3}})));
		GreenCity.Interfaces.Electrical.DefineCurrentAC1 GridConnection1 annotation(Placement(transformation(extent={{40,-95},{20,-75}})));
		GreenCity.Interfaces.Electrical.DefineCurrentAC3 GridConnection3 annotation(Placement(transformation(extent={{40,-30},{20,-10}})));
		GreenCity.Interfaces.Thermal.DefineVolumeFlow ToReturn4 if use4 "Output signal return pipe 4" annotation(Placement(transformation(extent={{200,-420},{180,-400}})));
		GreenCity.Interfaces.Thermal.ExtractVolumeFlow FromFlow4 if use4 "Input signal flow pipe 4" annotation(Placement(transformation(extent={{180,-365},{200,-345}})));
		GreenCity.Interfaces.Thermal.ExtractVolumeFlow FromFlow5 if use5 "Input signal flow pipe 5" annotation(Placement(transformation(extent={{180,-470},{200,-450}})));
		GreenCity.Interfaces.Thermal.DefineVolumeFlow ToReturn5 if use5 "Output signal return pipe 5" annotation(Placement(transformation(extent={{200,-520},{180,-500}})));
		GreenCity.Interfaces.Thermal.VolumeFlowIn FlowIn4 if use4 "Flow pipe 4" annotation(Placement(
			transformation(extent={{130,-365},{150,-345}}),
			iconTransformation(extent={{-185,-143.3},{-165,-123.3}})));
		GreenCity.Interfaces.Thermal.VolumeFlowOut ReturnOut4 if use4 "Return pipe 4" annotation(Placement(
			transformation(extent={{130,-420},{150,-400}}),
			iconTransformation(extent={{-185,-193.3},{-165,-173.3}})));
		GreenCity.Interfaces.Thermal.VolumeFlowIn FlowIn5 if use5 "Flow pipe 5" annotation(Placement(
			transformation(extent={{130,-470},{150,-450}}),
			iconTransformation(extent={{-185,-293.3},{-165,-273.3}})));
		GreenCity.Interfaces.Thermal.VolumeFlowOut ReturnOut5 if use5 "Return pipe 5" annotation(Placement(
			transformation(extent={{130,-520},{150,-500}}),
			iconTransformation(extent={{-185,-343.3},{-165,-323.3}})));
	initial equation
		assert(n>=2, "Number of layers is smaller than 2");
		if UseElHeater then
			ElOn = (TLayer[iUp] < TMax);
			assert(Phase==1 or Phase==3, "Phase must equal 1 or 3");
		end if;
		
		for i in 1:n loop
			if LinearProfile then
				if (n > 1) then
					TLayer[i]=(TupInit-TlowInit)/(n-1)*(i-1)+TlowInit;
				else
					TLayer[i]=(TupInit+TlowInit)/2;
				end if;
			else
				TLayer[i] = TLayerVector [i];
			end if;
		end for;
		
		for i in 1:n loop	
			vBuoyancy[i]=0;
			sBuoyancy[i]=0;
		end for;
		
		for i in 1:n loop
			for j in 1:8 loop
				if (use[j] and HE[j] and indexRange[i,j]) then
					if (j>5) then	
						THEout[i,j]=THEin[i,j];
					else
						THEout[i,j]=TLayer[i];
					end if;
				else
					THEout[i,j]=0;
				end if;
			end for;
		end for;
		
		for i in 1:n loop
			for j in 1:8 loop
				VPipeIn[i,j]=0;
				VPipeOut[i,j]=0;
			end for;
		end for;		
							
		for i in 1:8 loop
			if (use[i]) then
				for j in 1:2 loop
					assert((index[i,j]>=1) and	(index[i,j]<=n), "index out of boundary");
				end for;
			end if;
		end for;
						
		for i in 1:8 loop
			EHeat[i]=0;
		end for;
	equation
		if UseElHeater then
			nHeatedLayer=abs(iUp-iLow)+1;
			when (TLayer[iUp] < TMax - DeltaTHeater) then
				ElOn = true;
			elsewhen (TLayer[iUp] > TMax) then
				ElOn = false;
			end when;
			
			if ElOn then
				PelIs = min(Pel, ElHeaterPower);
			else
				PelIs = 0;
			end if;
			
			for i in 1:n loop
				if (nHeatedLayer>1) then
					if (((i>=iUp) and (i<=iLow)) or ((i<=iUp) and (i>=iLow))) then
						PLayer[i]=PelIs/nHeatedLayer;
					else
						PLayer[i]=0;
					end if;
				else
					if (i==iUp) then
						PLayer[i]=PelIs;
					else
						PLayer[i]=0;
					end if;
				end if;
			end for;
			
			GridPower=sumVector(PLayer,1,n);
			der(Eel)=-sumVector(PLayer,1,n);
			PGrid=-abs(GridPower);
			
			if (Phase==1) then
				if (GridConnection1.Veff>1e-10) then
					GridConnection1.Ieff=abs(PGrid)/GridConnection1.Veff;
					GridConnection1.Phi=0;
				else
					GridConnection1.Ieff=0;
					GridConnection1.Phi=0;
				end if;
			end if;
			if (Phase==3) then
				for i in 1:3 loop
					if (GridConnection3.Veff[i]>1e-10) then			
						GridConnection3.Ieff[i]=abs(PGrid)/(3*GridConnection3.Veff[i]);
						GridConnection3.Phi[i]=0;
					else
						GridConnection3.Ieff[i]=0;
						GridConnection3.Phi[i]=0;
					end if;
				end for;
			end if;
			
			if Phase==1 then
				connect(Grid1,GridConnection1.FlowCurrent) annotation(Line(points=0));
			end if;
			if Phase==3 then
				connect(Grid3,GridConnection3.LVFlowCurrent) annotation(Line(points=0));
			end if;
		else
			for i in 1:n loop
				PLayer[i]=0;
			end for;
		end if;
		
		
				use[1]=use1;
				use[2]=use2;
				use[3]=use3;
				use[4]=use4;
				use[5]=use5;
				use[6]=use6;
				use[7]=use7;
				use[8]=use8;
				
				if use1 then
					HE[1]=HE1;
					index[1,1]=iFlow1;
					index[1,2]=iReturn1;
				else
					HE[1]=false;
					index[1,1]=0;
					index[1,2]=0;
				end if;
				if use2 then
					HE[2]=HE2;
					index[2,1]=iFlow2;
					index[2,2]=iReturn2;
				else
					HE[2]=false;
					index[2,1]=0;
					index[2,2]=0;
				end if;
				if use3 then
					HE[3]=HE3;
					index[3,1]=iFlow3;
					index[3,2]=iReturn3;
				else
					HE[3]=false;
					index[3,1]=0;
					index[3,2]=0;
				end if;
				if use4 then
					HE[4]=HE4;
					index[4,1]=iFlow4;
					index[4,2]=iReturn4;
				else
					HE[4]=false;
					index[4,1]=0;
					index[4,2]=0;
				end if;
				if use5 then
					HE[5]=HE5;
					index[5,1]=iFlow5;
					index[5,2]=iReturn5;
				else
					HE[5]=false;
					index[5,1]=0;
					index[5,2]=0;
				end if;
				if use6 then
					HE[6]=HE6;
					index[6,1]=iFlow6;
					index[6,2]=iReturn6;
				else
					HE[6]=false;
					index[6,1]=0;
					index[6,2]=0;
				end if;	
				if use7 then
					HE[7]=HE7;
					index[7,1]=iFlow7;
					index[7,2]=iReturn7;
				else
					HE[7]=false;
					index[7,1]=0;
					index[7,2]=0;
				end if;	
				if use8 then
					HE[8]=HE8;
					index[8,1]=iFlow8;
					index[8,2]=iReturn8;
				else
					HE[8]=false;
					index[8,1]=0;
					index[8,2]=0;
				end if;	
				
				for i in 1:n loop
					for j in 1:8 loop
						if (use[j] and HE[j]) then
							if (((i>=index[j,1]) and (i<=index[j,2])) or ((i<=index[j,1]) and (i>=index[j,2]))) then
								indexRange[i,j]=true;
							else
							    indexRange[i,j]=false;
							end if;
						else
							indexRange[i,j]=false;
						end if;
					end for;
				end for;
		
				for j in 1:8 loop
					if (use[j] and HE[j]) then
						HEsize[j]=abs(index[j,1]-index[j,2])+1;
					else
						HEsize[j]=0;
					end if;
				end for;
								
				if use1 and HE1 then
					AHeatExchanger[1]=AHeatExchanger1;
					VHeatExchanger[1]=VHeatExchanger1;
					rhoHeatExchanger[1]=rhoHeatExchanger1;
					cpHeatExchanger[1]=cpHeatExchanger1; 
					alphaMedTubeHeatExchanger[1]=alphaMedTubeHeatExchanger1;
				else
					AHeatExchanger[1]=0;
					VHeatExchanger[1]=0;
					rhoHeatExchanger[1]=0;
					cpHeatExchanger[1]=0; 
					alphaMedTubeHeatExchanger[1]=0;
				end if;
				
				if use2 and HE2 then
					AHeatExchanger[2]=AHeatExchanger2;
					VHeatExchanger[2]=VHeatExchanger2;
					rhoHeatExchanger[2]=rhoHeatExchanger2;
					cpHeatExchanger[2]=cpHeatExchanger2; 	
					alphaMedTubeHeatExchanger[2]=alphaMedTubeHeatExchanger2;
				else
					AHeatExchanger[2]=0;
					VHeatExchanger[2]=0;
					rhoHeatExchanger[2]=0;
					cpHeatExchanger[2]=0; 	
					alphaMedTubeHeatExchanger[2]=0;		
				end if;
			
				if use3 and HE3 then
					AHeatExchanger[3]=AHeatExchanger3;
					VHeatExchanger[3]=VHeatExchanger3;
					rhoHeatExchanger[3]=rhoHeatExchanger3;
					cpHeatExchanger[3]=cpHeatExchanger3; 
					alphaMedTubeHeatExchanger[3]=alphaMedTubeHeatExchanger3;
				else
					AHeatExchanger[3]=0;
					VHeatExchanger[3]=0;
					rhoHeatExchanger[3]=0;
					cpHeatExchanger[3]=0; 
					alphaMedTubeHeatExchanger[3]=0;		
				end if;
			
				if use4 and HE4 then
					AHeatExchanger[4]=AHeatExchanger4;
					VHeatExchanger[4]=VHeatExchanger4;
					rhoHeatExchanger[4]=rhoHeatExchanger4;
					cpHeatExchanger[4]=cpHeatExchanger4; 
					alphaMedTubeHeatExchanger[4]=alphaMedTubeHeatExchanger4;				
				else
					AHeatExchanger[4]=0;
					VHeatExchanger[4]=0;
					rhoHeatExchanger[4]=0;
					cpHeatExchanger[4]=0; 
					alphaMedTubeHeatExchanger[4]=0;		
				end if;
			
				if use5 and HE5 then
					AHeatExchanger[5]=AHeatExchanger5;
					VHeatExchanger[5]=VHeatExchanger5;
					rhoHeatExchanger[5]=rhoHeatExchanger5;
					cpHeatExchanger[5]=cpHeatExchanger5; 
					alphaMedTubeHeatExchanger[5]=alphaMedTubeHeatExchanger5;
				else
					AHeatExchanger[5]=0;
					VHeatExchanger[5]=0;
					rhoHeatExchanger[5]=0;
					cpHeatExchanger[5]=0; 
					alphaMedTubeHeatExchanger[5]=0;
				end if;
			
				if use6 and HE6 then
					AHeatExchanger[6]=AHeatExchanger6;
					VHeatExchanger[6]=VHeatExchanger6;
					rhoHeatExchanger[6]=rhoHeatExchanger6;
					cpHeatExchanger[6]=cpHeatExchanger6;
					alphaMedTubeHeatExchanger[6]=alphaMedTubeHeatExchanger6;
				else
					AHeatExchanger[6]=0;
					VHeatExchanger[6]=0;
					rhoHeatExchanger[6]=0;
					cpHeatExchanger[6]=0;
					alphaMedTubeHeatExchanger[6]=0;		
				end if;
			
				if use7 and HE7 then
					AHeatExchanger[7]=AHeatExchanger7;
					VHeatExchanger[7]=VHeatExchanger7;
					rhoHeatExchanger[7]=rhoHeatExchanger7;
					cpHeatExchanger[7]=cpHeatExchanger7;
					alphaMedTubeHeatExchanger[7]=alphaMedTubeHeatExchanger7;
				else
					AHeatExchanger[7]=0;
					VHeatExchanger[7]=0;
					rhoHeatExchanger[7]=0;
					cpHeatExchanger[7]=0;
					alphaMedTubeHeatExchanger[7]=0;		
				end if;			
			
				if use8 and HE8 then
					AHeatExchanger[8]=AHeatExchanger8;
					VHeatExchanger[8]=VHeatExchanger8;
					rhoHeatExchanger[8]=rhoHeatExchanger8;
					cpHeatExchanger[8]=cpHeatExchanger8;
					alphaMedTubeHeatExchanger[8]=alphaMedTubeHeatExchanger8;
				else
					AHeatExchanger[8]=0;
					VHeatExchanger[8]=0;
					rhoHeatExchanger[8]=0;
					cpHeatExchanger[8]=0;
					alphaMedTubeHeatExchanger[8]=0;		
				end if;
				
						
				if (use[1]) then	
					qv[1]=FromFlow1.qvMedium;
					TIn[1]=FromFlow1.TMedium;
				else
					qv[1]=0;
					TIn[1]=0;
				end if;
				if (use[2]) then
					qv[2]=FromFlow2.qvMedium;
					TIn[2]=FromFlow2.TMedium;
				else
					qv[2]=0;
					TIn[2]=0;
				end if;
				if (use[3]) then		
					qv[3]=FromFlow3.qvMedium;
					TIn[3]=FromFlow3.TMedium;
				else
					qv[3]=0;
					TIn[3]=0;
				end if;
				if (use[4]) then		
					qv[4]=FromFlow4.qvMedium;
					TIn[4]=FromFlow4.TMedium;
				else
					qv[4]=0;
					TIn[4]=0;
				end if;
				if (use[5]) then		
					qv[5]=FromFlow5.qvMedium;
					TIn[5]=FromFlow5.TMedium;
				else
					qv[5]=0;
					TIn[5]=0;
				end if;
				if (use[6]) then
					qv[6]=FromReturn6.qvMedium;
					TIn[6]=FromReturn6.TMedium;
				else
					qv[6]=0;
					TIn[6]=0;
				end if;
				if (use[7]) then
					qv[7]=FromReturn7.qvMedium;
					TIn[7]=FromReturn7.TMedium;
				else
					qv[7]=0;
					TIn[7]=0;
				end if;
				if (use[8]) then
					qv[8]=FromReturn8.qvMedium;
					TIn[8]=FromReturn8.TMedium;
				else
					qv[8]=0;
					TIn[8]=0;
				end if;				
				
				for i in 1:n loop
					for j in 1:5 loop
						if (use[j] and HE[j] and indexRange[i,j]) then
							if (i==index[j,1]) then
								THEin[i,j]=TIn[j];
							else
								if ((index[j,1]<index[j,2]) and (i>1)) then
									THEin[i,j]=THEout[i-1,j];
								elseif ((index[j,2]<index[j,1]) and (i<n)) then						
									THEin[i,j]=THEout[i+1,j];
								else
									THEin[i,j]=0;
								end if;
							end if;
						else
							THEin[i,j]=0;
						end if;
					end for;
				end for;
				
				for i in 1:n loop
					for j in 6:8 loop
						if (use[j] and HE[j] and indexRange[i,j]) then
							if (i==index[j,2]) then
								THEin[i,j]=TIn[j];
							else
								if ((index[j,2]<index[j,1]) and (i>1)) then
									THEin[i,j]=THEout[i-1,j];
								elseif ((index[j,1]<index[j,2]) and (i<n)) then						
									THEin[i,j]=THEout[i+1,j];
								else
									THEin[i,j]=0;
								end if;
							end if;
						else
							THEin[i,j]=0;
						end if;
					end for;
				end for;
								
				for i in 1:n loop
					Qloss[i]=QlossRate/n*(TLayer[i]-TAmbient);
					rho[i]=rhoTable(min(max(TLayer[i],273.15),373.15));
					if (i<n) then
						FBuoyancy[i]=max((-rho[i]+rho[i+1])*VStorage/n*g,0);					
						vBuoyancy[i]+der(vBuoyancy[i])=FBuoyancy[i]/(rhoMed*VStorage/n);
						sBuoyancy[i]+der(sBuoyancy[i])=vBuoyancy[i];
						VMix[i]=sBuoyancy[i]*pi/4*(dStorage*dStorage);
					else												
						FBuoyancy[i]=0;
						der(vBuoyancy[i])=0;
						der(sBuoyancy[i])=0;
						VMix[i]=0;
					end if;
				end for;
						
				for i in 1:n loop
					for j in 1:8 loop
						if (use[j] and HE[j] and indexRange[i,j]) then
							(rhoHeatExchanger[j]*cpHeatExchanger[j]*VHeatExchanger[j]/HEsize[j])*der(THEout[i,j])=-((alphaMedTubeHeatExchanger[j]*AHeatExchanger[j]/HEsize[j])*(THEout[i,j]-TLayer[i]))+(rhoHeatExchanger[j]*cpHeatExchanger[j]*qv[j]*(THEin[i,j]-THEout[i,j]))+(rhoHeatExchanger[j]*cpHeatExchanger[j]*VHeatExchanger[j]/HEsize[j])*der(TLayer[i]);
						else		
							der(THEout[i,j])=0;
						end if;
					end for;
				end for;		
						
				for i in 1:n loop
					PHeatExchanger[i]=-((cpHeatExchanger[1]*rhoHeatExchanger[1]*qv[1]*(THEout[i,1]-THEin[i,1]))+(cpHeatExchanger[2]*rhoHeatExchanger[2]*qv[2]*(THEout[i,2]-THEin[i,2]))+(cpHeatExchanger[3]*rhoHeatExchanger[3]*qv[3]*(THEout[i,3]-THEin[i,3]))+(cpHeatExchanger[4]*rhoHeatExchanger[4]*qv[4]*(THEout[i,4]-THEin[i,4]))+(cpHeatExchanger[5]*rhoHeatExchanger[5]*qv[5]*(THEout[i,5]-THEin[i,5]))+(cpHeatExchanger[6]*rhoHeatExchanger[6]*qv[6]*(THEout[i,6]-THEin[i,6]))+(cpHeatExchanger[7]*rhoHeatExchanger[7]*qv[7]*(THEout[i,7]-THEin[i,7]))+(cpHeatExchanger[8]*rhoHeatExchanger[8]*qv[8]*(THEout[i,8]-THEin[i,8])));
				end for;
				
				for i in 1:5 loop
					if (use[i]) then
						if (HE[i]) then
							TOut[i]=THEout[index[i,2],i];
						else
							TOut[i]=TLayer[index[i,2]];
						end if;
					else
						TOut[i]=0;
					end if;
				end for;
				
				for i in 6:8 loop
					if (use[i]) then
						if (HE[i]) then
							TOut[i]=THEout[index[i,1],i];
						else
							TOut[i]=TLayer[index[i,1]];
						end if;
					else
						TOut[i]=0;
					end if;
				end for;
				
				for i in 1:n loop
					for j in 1:5 loop
						if (use[j] and (not (HE[j]))) then
							if (i==index[j,1]) then	
								der(VPipeIn[i,j])+VPipeIn[i,j]=qv[j];
							else
								der(VPipeIn[i,j])=0;
							end if;
						else
							der(VPipeIn[i,j])=0;
						end if;
					end for;
					
					for j in 6:8 loop
						if (use[j] and (not (HE[j]))) then	
							if (i==index[j,2]) then	
								der(VPipeIn[i,j])+VPipeIn[i,j]=qv[j];
							else
								der(VPipeIn[i,j])=0;
							end if;
						else
							der(VPipeIn[i,j])=0;
						end if;
					end for;
				end for;
				
				for i in 1:n loop
					for j in 1:5 loop
						if (use[j] and (not (HE[j]))) then
							if (i==index[j,2]) then	
								der(VPipeOut[i,j])+VPipeOut[i,j]=qv[j];
							else
								der(VPipeOut[i,j])=0;
							end if;
						else
							der(VPipeOut[i,j])=0;
						end if;
					end for;
					
					for j in 6:8 loop
						if (use[j] and (not (HE[j]))) then	
							if (i==index[j,1]) then	
								der(VPipeOut[i,j])+VPipeOut[i,j]=qv[j];
							else
								der(VPipeOut[i,j])=0;
							end if;
						else
							der(VPipeOut[i,j])=0;
						end if;
					end for;
				end for;				
				
				for i in 1:n loop
					VIn[i]=VPipeIn[i,1]+VPipeIn[i,2]+VPipeIn[i,3]+VPipeIn[i,4]+VPipeIn[i,5]+VPipeIn[i,6]+VPipeIn[i,7]+VPipeIn[i,8];
					VOut[i]=VPipeOut[i,1]+VPipeOut[i,2]+VPipeOut[i,3]+VPipeOut[i,4]+VPipeOut[i,5]+VPipeOut[i,6]+VPipeOut[i,7]+VPipeOut[i,8];
					deltaTin[i]=(TIn[1]-TLayer[i])*(VPipeIn[i,1]/(VStorage/n))+(TIn[2]-TLayer[i])*(VPipeIn[i,2]/(VStorage/n))+(TIn[3]-TLayer[i])*(VPipeIn[i,3]/(VStorage/n))+(TIn[4]-TLayer[i])*(VPipeIn[i,4]/(VStorage/n))+(TIn[5]-TLayer[i])*(VPipeIn[i,5]/(VStorage/n))+(TIn[6]-TLayer[i])*(VPipeIn[i,6]/(VStorage/n))+(TIn[7]-TLayer[i])*(VPipeIn[i,7]/(VStorage/n))+(TIn[8]-TLayer[i])*(VPipeIn[i,8]/(VStorage/n));
					VDiff[i]=VIn[i]-VOut[i];
				end for;
				
				for i in 1:n loop
					if (i>1) then
						CalcVDiffPot[i,1]=sumVector(VDiff,1,(i-1));
					else
						CalcVDiffPot[i,1]=0;
					end if;
					if (i<n) then
						CalcVDiffPot[i,2]=sumVector(VDiff,(i+1),n);
					else
						CalcVDiffPot[i,2]=0;
					end if;
					if (i<2) then
						VDiffPot[i,1]=0;
						VDiffPot[i,2]=max(CalcVDiffPot[i,2],0);
					elseif (i<n) then
						VDiffPot[i,1]=max(CalcVDiffPot[i,1],0);
						VDiffPot[i,2]=max(CalcVDiffPot[i,2],0);
					else
						VDiffPot[i,1]=max(CalcVDiffPot[i,1],0);
						VDiffPot[i,2]=0;
					end if;
				end for;
				
				for i in 1:n loop
					if (i<2) then
						der(TLayer[i])=(alphaMedStatic*(pi/4*(dStorage*dStorage))*(TLayer[i+1]-TLayer[i])/(cpMed*rhoMed*(VStorage/n)))-((Qloss[i])/(cpMed*rhoMed*(VStorage/n)))+(TLayer[i+1]-TLayer[i])*(VMix[i]/(VStorage/n))+((PHeatExchanger[i])/(cpMed*rhoMed*(VStorage/n)))+((PLayer[i])/(cpMed*rhoMed*(VStorage/n)))+deltaTin[i]+((TLayer[i+1]-TLayer[i])*(VDiffPot[i,2]/(VStorage/n)));
					elseif (i<n) then
						der(TLayer[i])=(alphaMedStatic*(pi/4*(dStorage*dStorage))*((TLayer[i+1]-TLayer[i])+(TLayer[i-1]-TLayer[i]))/(cpMed*rhoMed*(VStorage/n)))-((Qloss[i])/(cpMed*rhoMed*(VStorage/n)))+(TLayer[i+1]-TLayer[i])*(VMix[i]/(VStorage/n))+(TLayer[i-1]-TLayer[i])*(VMix[i-1]/(VStorage/n))+((PHeatExchanger[i])/(cpMed*rhoMed*(VStorage/n)))+((PLayer[i])/(cpMed*rhoMed*(VStorage/n)))+deltaTin[i]+((TLayer[i-1]-TLayer[i])*(VDiffPot[i,1]/(VStorage/n)))+((TLayer[i+1]-TLayer[i])*(VDiffPot[i,2]/(VStorage/n)));
					else
						der(TLayer[i])=(alphaMedStatic*(pi/4*(dStorage*dStorage))*(TLayer[i-1]-TLayer[i])/(cpMed*rhoMed*(VStorage/n)))-((Qloss[i])/(cpMed*rhoMed*(VStorage/n)))+(TLayer[i-1]-TLayer[i])*(VMix[i-1]/(VStorage/n))+((PHeatExchanger[i])/(cpMed*rhoMed*(VStorage/n)))+((PLayer[i])/(cpMed*rhoMed*(VStorage/n)))+deltaTin[i]+((TLayer[i-1]-TLayer[i])*(VDiffPot[i,1]/(VStorage/n)));
					end if;
					ELayer[i]=cpMed*rhoMed*(VStorage/n)*(TLayer[i]-TAmbient);
					EMaxLayer[i]=cpMed*rhoMed*(VStorage/n)*(TMax-TAmbient);
				end for;
				
				for i in 1:8 loop
					if (use[i]) then
						if (HE[i]) then
							PStorage[i]=rhoHeatExchanger[i]*cpHeatExchanger[i]*qv[i]*(TOut[i]-TIn[i]);
						else
							PStorage[i]=rhoMed*cpMed*qv[i]*(TOut[i]-TIn[i]);
						end if;
					else
						PStorage[i]=0;
					end if;
					der(EHeat[i])=PStorage[i];
				end for;
				
				EStorage=sumVector(ELayer,1,n);
				EMax=sumVector(EMaxLayer,1,n);
				
				SOC=max(EStorage/max(EMax,1e-10),0);
				
				if use1 then
					ToReturn1.qvMedium=qv[1];
					ToReturn1.TMedium=TOut[1];
				end if;
				if use2 then
					ToReturn2.qvMedium=qv[2];
					ToReturn2.TMedium=TOut[2];
				end if;
				if use3 then
					ToReturn3.qvMedium=qv[3];
					ToReturn3.TMedium=TOut[3];
				end if;
				if use4 then
					ToReturn4.qvMedium=qv[4];
					ToReturn4.TMedium=TOut[4];
				end if;
				if use5 then
					ToReturn5.qvMedium=qv[5];
					ToReturn5.TMedium=TOut[5];
				end if;
				if use6 then
					ToFlow6.qvMedium=qv[6];
					ToFlow6.TMedium=TOut[6];
				end if;
				if use7 then
					ToFlow7.qvMedium=qv[7];
					ToFlow7.TMedium=TOut[7];
				end if;
				if use8 then
					ToFlow8.qvMedium=qv[8];
					ToFlow8.TMedium=TOut[8];
				end if;
					
				TStorage=TLayer;
			
		if use1 then
			connect(FlowIn1,FromFlow1.Pipe) annotation(Line(points=0));
			connect(ReturnOut1,ToReturn1.Pipe) annotation(Line(points=0));
		end if;
		if use2 then
			connect(FlowIn2,FromFlow2.Pipe) annotation(Line(points=0));
			connect(ReturnOut2,ToReturn2.Pipe) annotation(Line(points=0));
		end if;
		if use3 then
			connect(FlowIn3,FromFlow3.Pipe) annotation(Line(points=0));
			connect(ReturnOut3,ToReturn3.Pipe) annotation(Line(points=0));
		end if;
		if use4 then
			connect(FlowIn4,FromFlow4.Pipe) annotation(Line(points=0));
			connect(ReturnOut4,ToReturn4.Pipe) annotation(Line(points=0));
		end if;
		if use5 then
			connect(FlowIn5,FromFlow5.Pipe) annotation(Line(points=0));
			connect(ReturnOut5,ToReturn5.Pipe) annotation(Line(points=0));
		end if;
		if use6 then
			connect(FlowOut6,ToFlow6.Pipe) annotation(Line(points=0));
			connect(ReturnIn6,FromReturn6.Pipe) annotation(Line(points=0));
		end if;
		if use7 then
			connect(FlowOut7,ToFlow7.Pipe) annotation(Line(points=0));
			connect(ReturnIn7,FromReturn7.Pipe) annotation(Line(points=0));
		end if;
		if use8 then
			connect(FlowOut8,ToFlow8.Pipe) annotation(Line(points=0));
			connect(ReturnIn8,FromReturn8.Pipe) annotation(Line(points=0));
		end if;
		
		//connect(ReturnOut7,ToReturn7.Pipe) annotation(Line(points=0));
		//connect(FlowIn7,FromFlow7.Pipe) annotation(Line(points=0));
		//connect(ReturnOut6,ToReturn6.Pipe) annotation(Line(points=0));
		//connect(FlowIn6,FromFlow6.Pipe) annotation(Line(points=0));
	annotation(
		__esi_viewinfo[0](
			minOrder=0.5,
			maxOrder=12,
			mode=0,
			minStep=0.01,
			maxStep=0.1,
			relTol=1e-05,
			oversampling=4,
			anaAlgorithm=0,
			bPerMinStates=true,
			bPerScaleRows=true,
			bPerScaleCols=true,
			typename="AnaStatInfo"),
		Icon(
			coordinateSystem(extent={{-175,-367},{175,367}}),
			graphics={
							Bitmap(
								imageSource="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",
								extent={{-283,512},{286,-398}}),
							Bitmap(
								imageSource="iVBORw0KGgoAAAANSUhEUgAAAGkAAADcCAYAAABzhY/8AAAABGdBTUEAALGPC/xhBQAAAAlwSFlz
AAAScQAAEnEB89x6jgAAAHBJREFUeF7twQEBAAAAgiD/r25IQAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAcK0GadsAAShy5MIAAAAASUVORK5CYII=",
								extent={{-175,-366.7},{175,366.7}}),
							Text(
								textString="DZ",
								fontSize=14,
								textStyle={
									TextStyle.Bold},
								lineColor={0,128,255},
								extent={{29.5,-207.7},{262.8,-487.7}})}),
		Documentation(info="<HTML><HEAD>
<META http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\"> 
<TITLE>Heat storage with variable temperature profile with 5 inlet ports</TITLE> 
<STYLE type=\"text/css\">
table>tbody>tr:hover,th{background-color:#edf1f3}html{font-size:90%}body,table{font-size:1rem}body{font-family:'Open Sans',Arial,sans-serif;color:#465e70}h1,h2{margin:1em 0 .6em;font-weight:600}p{margin-top:.3em;margin-bottom:.2em}table{border-collapse:collapse;margin:1em 0;width:100%;}tr{border:1px solid #beccd3}td,th{padding:.3em 1em; border-width: 1px; border-style: solid; border-color: rgb(190, 204, 211);}td{word-break:break-word}tr:nth-child(even){background-color:#fafafa}th{font-family:'Open Sans Semibold',Arial,sans-serif;font-weight:700;text-align:left;word-break:keep-all}.lib-wrap{width:70%}@media screen and (max-width:800px){.lib-wrap{width:100%}}td p{margin:.2em}
</STYLE>
 
<META name=\"GENERATOR\" content=\"MSHTML 11.00.10570.1001\"></HEAD> 
<BODY>
<H1>Heat storage with variable temperature profile with 5 inlet ports</H1>
<P>Based on GreenCity's 'HeatStorageCombined'<BR>Changes:<BR></P>
<UL>
  <LI>Electric heater is included, similar to 'electricallyHeatedBoiler'</LI>
  <LI>The initial temperature profile of each layer can be defined with a 
  vector</LI>
  <LI>In total 5 inport ports</LI></UL>
<HR>

<DIV class=\"lib-wrap\">
<TABLE class=\"type\">
  <TBODY>
  <TR>
    <TH>Symbol:</TH>
    <TD colspan=\"3\"><IMG width=\"113\" height=\"269\" src=\"data:image/png;base64,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\"></TD></TR>
  <TR>
    <TH>Identifier:</TH>
    <TD colspan=\"3\">CoSES_Models.Storage.HeatStorageCombined5Inlets</TD></TR>
  <TR>
    <TH>Version:</TH>
    <TD colspan=\"3\">1.0</TD></TR>
  <TR>
    <TH>File:</TH>
    <TD colspan=\"3\">HeatStorageCombined5Inlets.mo</TD></TR>
  <TR>
    <TH>Connectors:</TH>
    <TD>Output of heat storage layer temperatures</TD>
    <TD>TStorage</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>Parameters:</TH>
    <TD>Input signal flow pipe 1</TD>
    <TD>FromFlow1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Output signal return pipe 1</TD>
    <TD>ToReturn1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Output signal return pipe 2</TD>
    <TD>ToReturn2</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Input signal flow pipe 2</TD>
    <TD>FromFlow2</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Input signal flow pipe 3</TD>
    <TD>FromFlow3</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Output signal return pipe 3</TD>
    <TD>ToReturn3</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Input signal return pipe 6</TD>
    <TD>FromReturn6</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Output signal flow pipe 6</TD>
    <TD>ToFlow6</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Output signal flow pipe 7</TD>
    <TD>ToFlow7</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Input signal return pipe 7</TD>
    <TD>FromReturn7</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Output signal flow pipe 8</TD>
    <TD>ToFlow8</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Input signal return pipe 8</TD>
    <TD>FromReturn8</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Gravitiy</TD>
    <TD>g</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heat storage volume</TD>
    <TD>VStorage</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Diameter of heat storage</TD>
    <TD>dStorage</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heat conductance of heat storage isolation</TD>
    <TD>QlossRate</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Number of heat storage layers, if &gt;10, T[n&gt;10] = T[10]</TD>
    <TD>n</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>If true, the temperature profile at simulation begin within the 
      storage is linear, if false the profile is defined by a temperature 
    vector</TD>
    <TD>LinearProfile</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Temperature of upmost heat storage layer at simulation begin</TD>
    <TD>TupInit</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Temperature of lowmost heat storage layer at simulation begin</TD>
    <TD>TlowInit</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Vector of temperature profile of the layers at simulation begin, 
      element 1 is at lowest layer</TD>
    <TD>TLayerVector</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Ambient temperature of heat storage</TD>
    <TD>TAmbient</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Use electric heater</TD>
    <TD>UseElHeater</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Power of the electric heater</TD>
    <TD>ElHeaterPower</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Upmost electrically heated storage layer</TD>
    <TD>iUp</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Lowmost electrically heated storage layer</TD>
    <TD>iLow</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Number of Phases for electric grid connection</TD>
    <TD>Phase</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Temperature hysteresis for electric heater</TD>
    <TD>DeltaTHeater</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Maximum layer temperature</TD>
    <TD>TMax</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Specific heat capacity of heat storage medium</TD>
    <TD>cpMed</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Average density of heat storage medium</TD>
    <TD>rhoMed</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heat transmission coefficient of heat storage medium for neighboring 
      heat storage layers</TD>
    <TD>alphaMedStatic</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Table including temperature specific density of heat medium</TD>
    <TD>rhoTable</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>True=pipe 1 is used</TD>
    <TD>use1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Pipe 1: true=heat supply/abstraction via heat exchanger; false=heat 
      supply/abstraction via heat medium transport</TD>
    <TD>HE1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Layer index array for flow pipe 1</TD>
    <TD>iFlow1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Layer index array for return pipe 1</TD>
    <TD>iReturn1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>HE-surface area 1</TD>
    <TD>AHeatExchanger1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>HE-volume 1</TD>
    <TD>VHeatExchanger1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>HE-specific medium heat capacity 1</TD>
    <TD>cpHeatExchanger1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>HE-media densitiy 1</TD>
    <TD>rhoHeatExchanger1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heat transmission coefficients of streaming heat exchanger medium in a 
      tubular heat exchanger 1</TD>
    <TD>alphaMedTubeHeatExchanger1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>True=pipe 2 is used</TD>
    <TD>use2</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Pipe 2: true=heat supply/abstraction via heat exchanger; false=heat 
      supply/abstraction via heat medium transport</TD>
    <TD>HE2</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Layer index array for flow pipe 2</TD>
    <TD>iFlow2</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Layer index array for return pipe 2</TD>
    <TD>iReturn2</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>HE-surface area 2</TD>
    <TD>AHeatExchanger2</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>HE-volume 2</TD>
    <TD>VHeatExchanger2</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>HE-specific medium heat capacity 2</TD>
    <TD>cpHeatExchanger2</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>HE-media densitiy 2</TD>
    <TD>rhoHeatExchanger2</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heat transmission coefficients of streaming heat exchanger medium in a 
      tubular heat exchanger 2</TD>
    <TD>alphaMedTubeHeatExchanger2</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>True=pipe 3 is used</TD>
    <TD>use3</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Pipe 3: true=heat supply/abstraction via heat exchanger; false=heat 
      supply/abstraction via heat medium transport</TD>
    <TD>HE3</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Layer index array for flow pipe 3</TD>
    <TD>iFlow3</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Layer index array for return pipe 3</TD>
    <TD>iReturn3</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>HE-surface area 3</TD>
    <TD>AHeatExchanger3</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>HE-volume 3</TD>
    <TD>VHeatExchanger3</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>HE-specific medium heat capacity 3</TD>
    <TD>cpHeatExchanger3</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>HE-media density 3</TD>
    <TD>rhoHeatExchanger3</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heat transmission coefficients of streaming heat exchanger medium in a 
      tubular heat exchanger 3</TD>
    <TD>alphaMedTubeHeatExchanger3</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>True=pipe 4 is used</TD>
    <TD>use4</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Pipe 4: true=heat supply/abstraction via heat exchanger; false=heat 
      supply/abstraction via heat medium transport</TD>
    <TD>HE4</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Layer index array for flow pipe 4</TD>
    <TD>iFlow4</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Layer index array for return pipe 4</TD>
    <TD>iReturn4</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>HE-surface area 4</TD>
    <TD>AHeatExchanger4</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>HE-volume 4</TD>
    <TD>VHeatExchanger4</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>HE-specific medium heat capacity 4</TD>
    <TD>cpHeatExchanger4</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>HE-media density 4</TD>
    <TD>rhoHeatExchanger4</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heat transmission coefficients of streaming heat exchanger medium in a 
      tubular heat exchanger 4</TD>
    <TD>alphaMedTubeHeatExchanger4</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>True=pipe 5 is used</TD>
    <TD>use5</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Pipe 5: true=heat supply/abstraction via heat exchanger; false=heat 
      supply/abstraction via heat medium transport</TD>
    <TD>HE5</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Layer index array for flow pipe 5</TD>
    <TD>iFlow5</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Layer index array for return pipe 5</TD>
    <TD>iReturn5</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>HE-surface area 5</TD>
    <TD>AHeatExchanger5</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>HE-volume 5</TD>
    <TD>VHeatExchanger5</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>HE-specific medium heat capacity 5</TD>
    <TD>cpHeatExchanger5</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>HE-media density 5</TD>
    <TD>rhoHeatExchanger5</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heat transmission coefficients of streaming heat exchanger medium in a 
      tubular heat exchanger 5</TD>
    <TD>alphaMedTubeHeatExchanger5</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>True=pipe 6 is used</TD>
    <TD>use6</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Pipe 6: true=heat supply/abstraction via heat exchanger; false=heat 
      supply/abstraction via heat medium transport</TD>
    <TD>HE6</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Layer index array for flow pipe 6</TD>
    <TD>iFlow6</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Layer index array for return pipe 6</TD>
    <TD>iReturn6</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>HE-surface area 6</TD>
    <TD>AHeatExchanger6</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>HE-volume 6</TD>
    <TD>VHeatExchanger6</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>HE-specific medium heat capacity 6</TD>
    <TD>cpHeatExchanger6</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>HE-media densitiy 6</TD>
    <TD>rhoHeatExchanger6</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heat transmission coefficients of streaming heat exchanger medium in a 
      tubular heat exchanger 6</TD>
    <TD>alphaMedTubeHeatExchanger6</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>True=pipe 7 is used</TD>
    <TD>use7</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Pipe 7: true=heat supply/abstraction via heat exchanger; false=heat 
      supply/abstraction via heat medium transport</TD>
    <TD>HE7</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Layer index array for flow pipe 7</TD>
    <TD>iFlow7</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Layer index array for return pipe 7</TD>
    <TD>iReturn7</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>HE-surface area 7</TD>
    <TD>AHeatExchanger7</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>HE-volume 7</TD>
    <TD>VHeatExchanger7</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>HE-specific medium heat capacity 7</TD>
    <TD>cpHeatExchanger7</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>HE-media densitiy 7</TD>
    <TD>rhoHeatExchanger7</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heat transmission coefficients of streaming heat exchanger medium in a 
      tubular heat exchanger 7</TD>
    <TD>alphaMedTubeHeatExchanger7</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>True=pipe 8 is used</TD>
    <TD>use8</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Pipe 8: true=heat supply/abstraction via heat exchanger; false=heat 
      supply/abstraction via heat medium transport</TD>
    <TD>HE8</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Layer index array for flow pipe 8</TD>
    <TD>iFlow8</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Layer index array for return pipe 8</TD>
    <TD>iReturn8</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>HE-surface area 8</TD>
    <TD>AHeatExchanger8</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>HE-volume 8</TD>
    <TD>VHeatExchanger8</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>HE-specific medium heat capacity 8</TD>
    <TD>cpHeatExchanger8</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>HE-media densitiy 8</TD>
    <TD>rhoHeatExchanger8</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heat transmission coefficients of streaming heat exchanger medium in a 
      tubular heat exchanger 8</TD>
    <TD>alphaMedTubeHeatExchanger8</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Specifies current and phase angle, extracts voltage of a 1-phase 
      connector</TD>
    <TD>GridConnection1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Specifies current and phase angle, extracts voltage of a 3-phase 
      connector</TD>
    <TD>GridConnection3</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Output signal return pipe 4</TD>
    <TD>ToReturn4</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Input signal flow pipe 4</TD>
    <TD>FromFlow4</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Input signal flow pipe 5</TD>
    <TD>FromFlow5</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Output signal return pipe 5</TD>
    <TD>ToReturn5</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>Results:</TH>
    <TD>Output of heat storage layer temperatures</TD>
    <TD>TStorage</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Supplied/abstracted heat power of each pipe</TD>
    <TD>PStorage</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Power of electric heater</TD>
    <TD>Pel</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Electrical power from grid</TD>
    <TD>PGrid</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>State of charge</TD>
    <TD>SOC</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Stored heat energy</TD>
    <TD>EStorage</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heat input/output</TD>
    <TD>EHeat</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Electrical energy used for heating</TD>
    <TD>Eel</TD>
    <TD>&nbsp;</TD></TR></TBODY></TABLE></DIV>
<H2>Description:</H2>
<P>From 'HeatStorageCombined':</P>
<P><BR></P>
<P>Heat Storages are important  components for renewable building energy 
systems. They can ensure the possible temporal shift of renewable heat 
production  (condensing boiler, heat  pump, solar thermal collectors etc.) to 
times of heat demand. They can additionally aid in buffering peaks of heat 
 demand. Different types of heat storage systems are available. This  model can 
be used to describes the behavior of heat storages with and without  internal 
heat exchangers. Concretely, heat can be directly supplied or  extracted via 
volume flow input or output or indirectly via heat exchangers.  Due to this 
system configuration, it can be seen as a combined heat storage model.</P>
<P></P>
<P>The heat storage model consists  of a free-parameterizable number (n) of 
adjacent heating medium  layers (number 1 is the bottom layer and number n is 
the top layer). Water is most commonly used  as a heating medium (water has one 
of the highest specific heat capacities).  Due to this water is used as a 
standard to pre-define the heating medium matter constants (i.e. specific heat 
capacity,  density characteristic etc.). Other media  can however be defined by 
the user. Ensure that the input and output heating medium uses the same  matter 
constants as the attached system components to ensure correct simulation  (a 
mixture of heating medium cannot be simulated using a simple connection).</P>
<P></P>
<P>In general, the temperature  distribution in the storage tank defines the 
amount of stored heat. To Simulate  the influences of heat supply and extraction 
on the stored heat, the  internal heat exchange between the heat medium layers 
due to temperature spread and the atmosphere, must be modeled.</P>
<P></P>
<P><IMG align=\"baseline\" alt=\"\" src=\"data:image/png;base64,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\" 
border=\"0\" hspace=\"0\"></P>
<P></P>
<P>The heat exchange in the storage tank is  modeled using equations for:</P>
<P></P>
<UL>
  <LI value=\"1\">Heat losses through the  insulation (1)</LI>
  <LI value=\"2\">Heat transmission between  neighboring heating medium layers 
  (2)</LI>
  <LI value=\"3\">Buoyant force of heating medium  due to temperature-dependent 
  density differences (3) - requires the temperature-dependent heating medium 
  density definition (supplied via a table in the input parameters)</LI>
  <LI value=\"4\">Heat extraction via volume  flow input (4) - the correspondent 
  volume flow output does not extract heat  directly (output volume flow has 
  storage temperature level), but colder heat medium simultaneously flows back 
  into the tank (i.e. heat extraction).</LI>
  <LI value=\"5\">
  <DIV>Heat supply or extraction  via heat exchangers (4)</DIV></LI></UL>
<P></P>
<P>In the parameter dialog, a maximum of three extracting pipes (1-3) can be 
 defined. If a pipe is to be used for simulation, the correspondent parameter 
 'use' has to be set to 'true'. Additionally, it must be configured if the 
 desired pipe is to be used as a heat exchanger or not. The  position of the 
pipe/heat exchanger intake and outlet must also be defined via  the number of 
the correspondent heat medium layer (Layer 1 - lowest layer, Layer n - top 
 layer). The intake of the pipes/heat exchanger is the return connector and the 
 outlet is the flow connector. Ensure, that these conventions are adhered to, to 
 avoid numerical difficulties. If using a heat exchanger the dimension and the 
position of attachment  (i.e. highest and lowest layer to be heated) should be 
defined.</P>
<P></P>
<P>The direct supply and  extraction of heat medium volume in and from the tank 
influences the  resulting  forced heat medium convection on the temperature 
distribution.  This can thus not be neglected when simulating the direct heat 
supply  via extracting pipes. To consider this effect the volume shifting 
potential approach is  applied which calculates the amount of heat medium which 
must  be exchanged between neighboring heat medium layers to meet the 
 requirement of the  incompressibility of a liquid medium.  </P>
<P></P>
<P><IMG align=\"baseline\" alt=\"\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAM8AAABrCAIAAABfbkHwAAAJoElEQVR4nO2dr5PrRhLHW6mjDwcmQHKlthyYA1LVHbaXbIip2QiuyWMhqVoWIkH7kFGqjEw8IgnIq7LIg3EZ7IgEHDhyVfcX6MDop21JI2s0Gvn1B82O9aN7+quetjTyGnEcA4Io4auhDUC+IFBtiDpQbYg6Wqot8h3D8aN+bBEhcA3DDRSfdHCvtaVtOGJhKAGwPSa+Q18oNUQbr7WlxQiJqo0S6WNOCcBNO5lnAwAQmjWud2aerUADPXj9mAiGQ0htzLNvhrwrqY3Ms7OopueidqIzSir8oKQXo4rW9XuC0cI873pcRMIhoLbe0siNA2cRFgp1n6lHTfIcI8yzb0emORyNapN+hfMJFAhNL4Z0RqV83izQGO7e0o+0A7PMKdtjpeKh0Oa5PfV/yHyaBAdsj3HLM/t4K/38tpGNo9akthq9Zme+Ekfpk+LuhYKSkszk3MgsoQhnln7SmzSv8+mFUZo4VioabI8VIpwEVobe2kenFIasAYSQixDWmNcQjga1NU7GWaa62V86c1n5eT7uIrZ+0ptEry97bqit3Fm8DGU40iI6ucKyT65Gt2lo6sNRr7bmyo/n25vuXHSWFFTObEl/u6KtaIFcucn0OuuH3LVGtUnL1q2ic6t8KVkmNNa1m9Te3Q32G/vJqtsC2DkEuNwocOcnj61nl1tOJybwe6XzDZCXGQBAdNjB4tnkrZC8zAoNIcznhX16l3jrVabXge9HALN1HFNyeo8AzMkUwjPLj5KSdgb7jc3HQwLi0YFMZsfng5PcsQ3cJSxIuDskoysSmPpw1Mu08SqjBC6r+aqL86oCJTS7ppISml8UbW9tyK3dpHpdqJFSl/Iu2y7fVyxvJ4MW0cntsj1WTIqFWTfZpGF4asJRozaRKeoqVd8/r90tNrl33hR7ne3ex+0W2XYKUh2Ov1XnRHYOm2aUy1Qd+cvVlMaik2Cyj7OE7RbeNhCe/I8WvJ287brNEcB6sk/vEcxkzD+KvFbCQHZWh6NGbQDAC61qovdTYavIX+4W7NjSG3MyDeeWRWhM9wZvrNvLJjwzAEnVjgqvCwSutQoBQsudxNfVVAck29mGinBUq+33f/0K//m7+AkC19ot2LF9xGfrOOa5bJY2WmL+77/w6TOAhJFU5nVO7n+PSLBTmOpw1H4n/fD1t/XHzVN14M6BHl+VeNMzWnod+Y5Ry40VUfpFp34mbSBN1eA7c9CxcOmFQbw2X4/xa7tdNIxOJ7Xxiwf2CgsCDRiL1xra2WWlOL94ws1psa1I0pHvqF9p2zNj8VpHO7u/l0CqCoLId6xVeOuTB2AsXutlZ5eZlJ1DILTyS7v5emTgWOcOZ9CRsXito51d1DZbf4lvPo/Fax3trFbbN//8/nv4RqEpHfjhH/DvH6QcaUxea0tlOPB9UkQdqDZEHag2RB2d7u42kDxunhtA5T5u1pqxeD2EnX2qTcnjZu0Yi9dD2IkzKaIOVBuiDlQbog5UG6IOVBuiDlQbog5UG6IOVBuiDlQbog5UG6IOVBuiDlQbog5UG6IOVBuiDlQbog5UG6IOVBuiDlQbog5UG6KOR1bbPb95hvRJn2/BDM0dv3mG9Moj5zZEN1BtiDoeWW1Yt+kG1m2IOvrObYFrGOV/dC/SgxR5nDF85JkU0Y2+Z9LrX5sQ6UGKPM4YYm5D1FGttr/++PPPP/5SaEoHPn+CT5+lHGlMXmtLZTjwd3fLjMlrbcHf3UU0ANWGqAPVhqgD1YaoA9WGqAPVhqgD1YaoA9WGqAPVhqgD1YaoY0C18SVZN9bPJmtu3SBrDGEeIp8B1TZbM8+2F88mRL6TqS7yHev8UxxTezPnDXJ6xwXdWhH5/n0JYMiV4tFhB4utCQDZku7IX66mNJ5B5EP6f6rXR43/N9kXSOQvz5PjXbuqz218AjXcIPhlNf3p1cxm1MB3DGsVwmZuGLzxNv63VPI3cRw/KhUPhTbP7UGy6ZCFQxIcw/EjbnlmH28FrmFYq3Azv9PIuArm2bbHKj+OY0ouDpVtXvqkeBBKsr8pASA0PVPSzM7ZePIrU5JjdUWy17lhjNLEsWyPpJ3uZ3uM90nxpX10SmHIGkAIuQhho3mV23RQW9H0q4Pz/tIBcm+Sv6SJTaXa0vMJen3Zc0Nt5c7iZdiZdtHJFZZ9Uo5ZLDjSlRt1nUmtJxsAyMtFaRXsN0BofHw1s67osAPvY7Jd4FqrKd8p748Ou3A6MQsNXRH3eraO45hOV1abGdJ+slTbGR124WZuGIaxhG3pEyh8SYv8t83V0VrQVW3sHF6PTuDOTx67+Ie+7JwoKPIdY75JxyA67GDxbPJWSF5mhYa2CHsd+H7EJZd8tTYnUwjPLD9KStoZ7Dc2Hw+VdgJkqe74fHCSKyNwl7Ag4e6QyK17YCrT4W8/fvjw428CSfMiJceUwM3JqFCfMM8GnuB5C2yP5fm3/bz483fw3c+t9qhCsteFGil1Ke+ybZt/kAxCeTsZtIhObpftsTgPUHHWTTZpLDUqw9FRbQWr8o77xquD2FSrTaLX2e6t6tQWx5VppyiV4ej4FsxFqs5ul7Ug8p0lbLfwtoHw5H+04O3kbVu+Gqn4LRgJXithKDsrw9Ht7m70fgKAtKCP/OVuwdreizUn03BuWYTGdG/wxlrjLwggx+sCgWutQoDQcifxdTXVAcl2SkDes4TAtXYLdmwvlPw179kY3vcuc7fXOUpec5dgpwS6fSfNU3XgzoGWvjg/LkN4fc+vg+kXnU65LU3V4Dtz0LFw6YVBvL7j18E0jE4ntfGLB/bDFwQqGYvXGtpZPZOak2l6x7ECfvGEm9NiO2yS5oZIYUReNzCcndXhqK/bRFaWkeELAnYOpT3sgdF4LcQQdlaHo0Zt1pNdf5mzc5iuQRuU6P0E0h6rjsbrJgazsy4cNbeE267EuOLqoUc/97ErH8bcxVi8lkEvptaEo24mba5hGkjXgjPX2L/EzLN7WfMdvZ/kPccejddS6MPUunDU1m2zF7LZd1lJGh12MD0v9y/xepYv9pCL9OVJo/BaEvJNrQ9HY1bs+LT5ehWrXDpPfDfQ32tJyDe1PhwNautUExXP3Newy63ZZBxVhdeSkG9qw8A1qa3DIpULX0BgYdQdp+gtY+rrtSykm9o4ao1qU7Yo6g76SWwcfb3WluZwCKhN15Hve5rS02ttEQmHkNriftPIPaixRzevtUVwoETVJn5EBai0RB+vtUV8iFqoLS5/Yx4GSkD5zfnhvdaWluEw4jjueD8PQQTB329D1IFqQ9SBakPU8X/VMS1bYNCl8AAAAABJRU5ErkJggg==\" 
border=\"0\" hspace=\"0\"></P>
<P></P>
<P>Here, the volume difference  between the supplied and extracted heat medium 
volume is calculated for each heat medium layer.  These volume differences are 
in turn used to calculate the possible heat medium volume, exchanged between 
neighboring layers. </P>
<P></P>
<P><IMG align=\"baseline\" alt=\"\" src=\"data:image/png;base64,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\" 
border=\"0\" hspace=\"0\"></P>
<P></P>
<P>The resulting volumes are  finally used to simulate the temperature change of 
each heat medium layer depending on the forced medium convection.</P>
<P></P>
<P><IMG align=\"baseline\" alt=\"\" src=\"data:image/png;base64,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\" 
border=\"0\" hspace=\"0\"></P></BODY></HTML>
"),
		experiment(
			StopTime=1,
			StartTime=0,
			Tolerance=1e-06,
			Interval=0.002,
			__esi_MinInterval="9.999999999999999e-10",
			__esi_MaxInterval="0.002",
			__esi_AbsTolerance="1e-6"));
end HeatStorageCombined5Inlets;
