// CP: 65001
// SimulationX Version: 4.2.3.69223
within CoSES_Models.Distribution;
model HydraulicSwitch "HydraulicSwitch"
	GreenCity.Interfaces.Thermal.VolumeFlowOut HeatExchangerIn "HeatExchangerIn" annotation(Placement(
		transformation(extent={{140,40},{160,60}}),
		iconTransformation(extent={{-60,65},{-40,85}})));
	GreenCity.Interfaces.Thermal.VolumeFlowIn HeatExchangerOut "HeatExchangerOut" annotation(Placement(
		transformation(extent={{200,40},{220,60}}),
		iconTransformation(extent={{40,65},{60,85}})));
	GreenCity.Interfaces.Thermal.VolumeFlowIn HeatGeneratorSupply "HeatGeneratorSupply" annotation(Placement(
		transformation(extent={{-135,-175},{-115,-155}}),
		iconTransformation(extent={{-360,15},{-340,35}})));
	GreenCity.Interfaces.Thermal.VolumeFlowOut HeatGeneratorReturn "HeatGeneratorReturn" annotation(Placement(
		transformation(extent={{-135,-230},{-115,-210}}),
		iconTransformation(extent={{-360,-35},{-340,-15}})));
	GreenCity.Interfaces.Thermal.VolumeFlowIn StorageChargeReturn "StorageFlowOut" annotation(Placement(
		transformation(extent={{250,-340},{270,-320}}),
		iconTransformation(extent={{-310,-81.7},{-290,-61.7}})));
	GreenCity.Interfaces.Thermal.VolumeFlowOut StorageChargeFlow "StorageReturnIn" annotation(Placement(
		transformation(extent={{150,-340},{170,-320}}),
		iconTransformation(extent={{-260,-81.7},{-240,-61.7}})));
	GreenCity.Interfaces.Thermal.VolumeFlowIn StorageDischargeFlow "StorageReturnOut" annotation(Placement(
		transformation(extent={{-65,-340},{-45,-320}}),
		iconTransformation(extent={{240,-81.7},{260,-61.7}})));
	GreenCity.Interfaces.Thermal.VolumeFlowOut StorageDischargeReturn "StorageFlowIn" annotation(Placement(
		transformation(extent={{20,-340},{40,-320}}),
		iconTransformation(extent={{290,-81.7},{310,-61.7}})));
	GreenCity.Interfaces.Thermal.VolumeFlowOut DemandFlow "DemandFlow" annotation(Placement(
		transformation(extent={{265,-170},{285,-150}}),
		iconTransformation(extent={{336.7,15},{356.7,35}})));
	GreenCity.Interfaces.Thermal.VolumeFlowIn DemandReturn "DemandReturn" annotation(Placement(
		transformation(extent={{265,-230},{285,-210}}),
		iconTransformation(extent={{336.7,-35},{356.7,-15}})));
	GreenCity.Interfaces.Electrical.LV1Phase FeedInPumpOut if usePowerCalcPump "Electrical Low-Voltage AC Single-Phase Connector" annotation(Placement(
		transformation(extent={{285,-10},{305,10}}),
		iconTransformation(extent={{240,65},{260,85}})));
	GreenCity.Interfaces.Electrical.LV1Phase ExtractionPumpOut if usePowerCalcPump "Electrical Low-Voltage AC Single-Phase Connector" annotation(Placement(
		transformation(extent={{285,-40},{305,-20}}),
		iconTransformation(extent={{190,65},{210,85}})));
	GreenCity.Interfaces.Thermal.DefineVolumeFlow StorageChargeOut "Specifies a Thermal Volume Flow Connector" annotation(Placement(transformation(
		origin={190,-245},
		extent={{10,-10},{-10,10}})));
	Real qvStorageCharge(quantity="Thermics.VolumeFlow") "qvStorageCharge" annotation(HideResult=true);
	Real qvStorageDischarge(quantity="Thermics.VolumeFlow") "qvStorageDischarge" annotation(HideResult=true);
	Real qvFeedIn(quantity="Thermics.VolumeFlow") "qvFeedIn" annotation(HideResult=true);
	Real qvExtract(quantity="Thermics.VolumeFlow") "qvExtract" annotation(HideResult=true);
	Real DeltaTGeneration "DeltaTGeneration" annotation(HideResult=true);
	GreenCity.Utilities.Thermal.Pump FeedInPump(
		PelFile=filePowerPump,
		PelTable=TablePowerPump,
		usePowerCalc=usePowerCalcPump,
		CPPhase=CPPhasePump,
		CosPhi=CosPhiPump,
		qvMax(displayUnit="m³/s")=qvMaxPump,
		PPump(tableID "External table object")) annotation(Placement(transformation(
		origin={145,-45},
		extent={{-10,-10},{0,0}},
		rotation=270)));
	GreenCity.Utilities.Thermal.DistributionValve FeedInValve annotation(Placement(transformation(extent={{115,-180},{135,-160}})));
	GreenCity.Utilities.Thermal.DistributionValve DemandValve annotation(Placement(transformation(extent={{80,-175},{100,-155}})));
	GreenCity.Utilities.Thermal.MergingValve mergingValve1(
		VValve(displayUnit="m³")=VValve/5,
		QlossRate=QlossRate,
		TAmbient(displayUnit="K")=TAmbient,
		cpMed(displayUnit="J/(kg·K)")=cp,
		rhoMed=rho) annotation(Placement(transformation(extent={{50,-175},{30,-155}})));
	Modelica.Blocks.Sources.RealExpression FeedIn(y(
		quantity="Thermics.VolumeFlow",
		displayUnit="m³/s")=qvFeedIn) annotation(Placement(transformation(extent={{95,-50},{115,-30}})));
	GreenCity.Utilities.Thermal.MergingValve mergingValve2(
		VValve(displayUnit="m³")=VValve/5,
		QlossRate=QlossRate,
		TAmbient(displayUnit="K")=TAmbient,
		cpMed(displayUnit="J/(kg·K)")=cp,
		rhoMed=rho) annotation(Placement(transformation(
		origin={150,-5},
		extent={{10,-10},{-10,10}},
		rotation=90)));
	GreenCity.Utilities.Thermal.MeasureThermal measureThermal3 annotation(Placement(transformation(
		origin={150,25},
		extent={{5,-5},{-5,5}},
		rotation=-90)));
	GreenCity.Utilities.Thermal.DistributionValve DHFeedIn_Extract annotation(Placement(transformation(
		origin={210,-65},
		extent={{-10,10},{10,-10}},
		rotation=-90)));
	GreenCity.Utilities.Thermal.MergingValve mergingValve3(
		VValve(displayUnit="m³")=VValve/5,
		QlossRate=QlossRate,
		TAmbient(displayUnit="K")=TAmbient,
		cpMed(displayUnit="J/(kg·K)")=cp,
		rhoMed=rho) annotation(Placement(transformation(extent={{180,-225},{200,-205}})));
	GreenCity.Utilities.Thermal.MergingValve mergingValve4(
		VValve(displayUnit="m³")=VValve/5,
		QlossRate=QlossRate,
		TAmbient(displayUnit="K")=TAmbient,
		cpMed(displayUnit="J/(kg·K)")=cp,
		rhoMed=rho) annotation(Placement(transformation(extent={{140,-230},{160,-210}})));
	GreenCity.Utilities.Thermal.MeasureThermal measureMixed annotation(Placement(transformation(extent={{55,-160},{65,-170}})));
	GreenCity.Utilities.Thermal.DistributionValve HeatGeneratorValve annotation(Placement(transformation(extent={{-65,-235},{-85,-215}})));
	GreenCity.Utilities.Thermal.MergingValve mergingValve5(
		VValve(displayUnit="m³")=VValve/5,
		QlossRate=QlossRate,
		TAmbient(displayUnit="K")=TAmbient,
		cpMed(displayUnit="J/(kg·K)")=cp,
		rhoMed=rho) annotation(Placement(transformation(extent={{10,-170},{-10,-150}})));
	GreenCity.Utilities.Thermal.MeasureThermal measureHGSupply annotation(Placement(transformation(extent={{-80,-160},{-70,-170}})));
	GreenCity.Utilities.Thermal.MeasureThermal measureDHSupply annotation(Placement(transformation(extent={{-45,-150},{-35,-160}})));
	GreenCity.Utilities.Thermal.DistributionValve DistrictHeatingValve annotation(Placement(transformation(extent={{-30,-230},{-50,-210}})));
	Modelica.Blocks.Sources.RealExpression Extract(y(
		quantity="Thermics.VolumeFlow",
		displayUnit="m³/s")=qvExtract) annotation(Placement(transformation(extent={{95,-85},{115,-65}})));
	GreenCity.Interfaces.Thermal.ExtractVolumeFlow StorageChargeIn annotation(Placement(transformation(extent={{180,-185},{200,-165}})));
	GreenCity.Interfaces.Thermal.ExtractVolumeFlow StorageDischargeIn annotation(Placement(transformation(
		origin={-100,-255},
		extent={{-10,-10},{10,10}},
		rotation=-90)));
	GreenCity.Interfaces.Thermal.DefineVolumeFlow StorageDischargeOut annotation(Placement(transformation(
		origin={0,-240},
		extent={{-10,-10},{10,10}})));
	GreenCity.Interfaces.Thermal.DefineVolumeFlow StorageChargeIn1 annotation(Placement(transformation(
		origin={190,-275},
		extent={{10,10},{-10,-10}})));
	GreenCity.Interfaces.Thermal.ExtractVolumeFlow StorageChargeOut1 annotation(Placement(transformation(
		origin={260,-300},
		extent={{-10,-10},{10,10}},
		rotation=90)));
	Modelica.Blocks.Sources.RealExpression StorageCharge(y(
		quantity="Thermics.VolumeFlow",
		displayUnit="m³/s")=qvStorageCharge) annotation(Placement(transformation(extent={{235,-270},{215,-250}})));
	GreenCity.Interfaces.Thermal.DefineVolumeFlow StorageDischargeOut1 annotation(Placement(transformation(
		origin={0,-270},
		extent={{-10,10},{10,-10}})));
	GreenCity.Interfaces.Thermal.ExtractVolumeFlow StorageDischargeIn1 annotation(Placement(transformation(
		origin={-55,-300},
		extent={{-10,10},{10,-10}},
		rotation=90)));
	Modelica.Blocks.Sources.RealExpression StorageDischarge(y(
		quantity="Thermics.VolumeFlow",
		displayUnit="m³/s")=qvStorageDischarge) annotation(Placement(transformation(extent={{-55,-265},{-35,-245}})));
	GreenCity.Utilities.Thermal.MeasureThermal measureDemandSupply annotation(Placement(transformation(extent={{155,-155},{165,-165}})));
	GreenCity.Utilities.Thermal.MeasureThermal measureDemandReturn "Measurement of pipe temperature and volume flow" annotation(Placement(transformation(extent={{225,-225},{215,-215}})));
	GreenCity.Utilities.Thermal.Pump ExtractionPump1(
		PelFile=filePowerPump,
		PelTable=TablePowerPump,
		usePowerCalc=usePowerCalcPump,
		CPPhase=CPPhasePump,
		CosPhi=CosPhiPump,
		qvMax(displayUnit="m³/s")=qvMaxPump,
		PPump(tableID "External table object")) "Volume flow generation and electrical power calculation" annotation(Placement(transformation(
		origin={160,-80},
		extent={{-10,-10},{0,0}},
		rotation=270)));
	parameter Boolean usePowerCalcPump=true "If enabled, electrical power calculation for circulation pump is used" annotation(Dialog(
		group="Pump",
		tab="Parameters"));
	parameter String filePowerPump=GreenCity.Utilities.Functions.getModelDataDirectory()+"\\circulation_pump\\CP_25_60.txt" if usePowerCalcPump "File name where electrical power data of circulation pump is located" annotation(Dialog(
		group="Pump",
		tab="Parameters"));
	parameter String TablePowerPump="P_CP" if usePowerCalcPump "Table name where electrical power data of circulation pump is located" annotation(Dialog(
		group="Pump",
		tab="Parameters"));
	protected
		parameter Integer CPPhasePump=1 if usePowerCalcPump "Number of phases circulation pump is connected to" annotation(Dialog(
			group="Pump",
			tab="Parameters"));
	public
		parameter Real CosPhiPump=0.98 if usePowerCalcPump "Power factor of pump" annotation(Dialog(
			group="Pump",
			tab="Parameters"));
		parameter Real qvMaxPump(quantity="Thermics.VolumeFlow")=0.00025 "Maximum volume flow of pump" annotation(Dialog(
			group="Pump",
			tab="Parameters"));
		parameter Real VValve(
			quantity="Basics.Volume",
			displayUnit="l")=0.0001 "Valve volume" annotation(Dialog(
			group="General Parameters",
			tab="Parameters"));
		parameter Real QlossRate(quantity="Thermics.HeatCond")=0.2 "Heat loss through the insulation" annotation(Dialog(
			group="General Parameters",
			tab="Parameters"));
		parameter Real TAmbient(quantity="Basics.Temp")=291.15 "Ambient temperature" annotation(Dialog(
			group="General Parameters",
			tab="Parameters"));
		parameter Real rho(quantity="Thermodynamics.Density")=1000 "Density of Heating Medium" annotation(Dialog(
			group="General Parameters",
			tab="Parameters"));
		parameter Real cp(quantity="Thermics.SpecHeatCapacity")=4177 "Specific Heat Capacity of Heating Medium" annotation(Dialog(
			group="General Parameters",
			tab="Parameters"));
		Real TSupplyHG(quantity="Basics.Temp") "Supply Temperature Heat Generator" annotation(Dialog(
			group="Temperature",
			tab="Results",
			visible=false));
		Real TReturnHG(quantity="Basics.Temp") "Return Temperature Heat Generator" annotation(Dialog(
			group="Temperature",
			tab="Results",
			visible=false));
		Real TSupplyDH(
			quantity="Basics.Temp",
			displayUnit="K") "Supply Temperature District Heating" annotation(Dialog(
			group="Temperature",
			tab="Results",
			visible=false));
		Real TReturnDH(quantity="Basics.Temp") "Return Temperature District Heating" annotation(Dialog(
			group="Temperature",
			tab="Results",
			visible=false));
		Real TSupplyHC(quantity="Basics.Temp") "Supply Temperature Heat Consumption" annotation(Dialog(
			group="Temperature",
			tab="Results",
			visible=false));
		Real TReturnHC(quantity="Basics.Temp") "Return Temperature Heat Consumption" annotation(Dialog(
			group="Temperature",
			tab="Results",
			visible=false));
		Real TSupplyTS(quantity="Basics.Temp") "Supply Temperature Thermal Storage" annotation(Dialog(
			group="Temperature",
			tab="Results",
			visible=false));
		Real TReturnTS(quantity="Basics.Temp") "Return Temperature Thermal Storage" annotation(Dialog(
			group="Temperature",
			tab="Results",
			visible=false));
		Real qvStorage(quantity="Thermics.VolumeFlow") "Volume Flow from/to Storage <0: Charge; >0: Discharge" annotation(Dialog(
			group="Volume Flow",
			tab="Results",
			visible=false));
		Modelica.Blocks.Interfaces.RealInput qvDistrictHeating(quantity="Thermics.VolumeFlow") "Volume Flow from/to District Heating <0: Feed In; >0: Extraction" annotation(
			Placement(
				transformation(
					origin={105,50},
					extent={{-20,-20},{20,20}}),
				iconTransformation(
					origin={-150,75},
					extent={{-20,-20},{20,20}},
					rotation=-90)),
			Dialog(
				group="Volume Flow",
				tab="Results",
				visible=false));
		Real qvHeatGenerator(quantity="Thermics.VolumeFlow") "Volume Flow from Heat Generator" annotation(Dialog(
			group="Volume Flow",
			tab="Results",
			visible=false));
		Real qvHeatConsumption(quantity="Thermics.VolumeFlow") "Volume Flow to Heat Consumption" annotation(Dialog(
			group="Volume Flow",
			tab="Results",
			visible=false));
		Real QHeatGenerator(quantity="Basics.Power") "Supplied Heat Power Heat Generator" annotation(Dialog(
			group="Heat Power",
			tab="Results",
			visible=false));
		Real QDistrictHeating(quantity="Basics.Power") "Supplied/Abstracted Heat Power District Heating" annotation(Dialog(
			group="Heat Power",
			tab="Results",
			visible=false));
		Real QHeatConsumption(quantity="Basics.Power") "Abstracted Heat Power Heat Consumption" annotation(Dialog(
			group="Heat Power",
			tab="Results",
			visible=false));
		Real QThermalStorage(quantity="Basics.Power") "Supplied/Abstracted Heat Power Thermal Storage" annotation(Dialog(
			group="Heat Power",
			tab="Results",
			visible=false));
		Real PCP(quantity="Basics.Power") if usePowerCalcPump "Electrical power of feed in and extraction pump" annotation(Dialog(
			group="Pump",
			tab="Results",
			visible=false));
		Real ECP(quantity="Basics.Energy") if usePowerCalcPump "Electrical energy of feed in and extraction pump" annotation(Dialog(
			group="Pump",
			tab="Results",
			visible=false));
	initial equation
		// enter your equations here
		if usePowerCalcPump then
			assert(CPPhasePump==1 or CPPhasePump==3, "Circulation pump phase must equal 1 or 3");
		end if;
	equation
		// enter your equations here
		
		//DeltaTGeneration = max(10, (measureThermal4.TMedium - TReturnDemand));
		//qvDemandBeforeMixing = min(qv_Demand, qv_Demand * (TFlowDemand - TReturnDemand) / DeltaTGeneration);
		//qvDemandBeforeMixing = 0;
		
		// District Heating
		qvFeedIn = max(-qvDistrictHeating, 0);
		qvExtract = max(qvDistrictHeating, 0);
		TSupplyDH = max(HeatExchangerOut.T, HeatExchangerIn.T);
		TReturnDH = min(HeatExchangerOut.T, HeatExchangerIn.T);
		QDistrictHeating = rho * cp * qvDistrictHeating * (TSupplyDH - TReturnDH);
		
		// Storage
		qvStorage = -(measureHGSupply.qvMedium + qvDistrictHeating - measureDemandReturn.qvMedium);
		qvStorageCharge = max(-qvStorage, 0);
		qvStorageDischarge = max(qvStorage, 0);
		if qvStorage < 0 then
			TSupplyTS = StorageChargeFlow.T;
			TReturnTS = StorageChargeReturn.T;
		else
			TSupplyTS = StorageDischargeFlow.T;
			TReturnTS = StorageDischargeReturn.T;
		end if;
		QThermalStorage = rho * cp * qvStorage * (TSupplyTS - TReturnTS);
		
		// Heat Generator
		qvHeatGenerator = measureHGSupply.qvMedium;
		TSupplyHG = HeatGeneratorSupply.T;
		TReturnHG = HeatGeneratorReturn.T;
		QHeatGenerator = rho * cp * qvHeatGenerator * (TSupplyHG - TReturnHG);
		
		// Heat Consumption
		qvHeatConsumption = -measureDemandReturn.qvMedium;
		TSupplyHC = DemandFlow.T;
		TReturnHC = DemandReturn.T;
		QHeatConsumption = rho * cp * qvHeatConsumption * (TSupplyHC - TReturnHC);
	equation
		connect(measureThermal3.PipeOut,HeatExchangerIn) annotation(
			Line(
				points={{150,30},{150,35},{150,50}},
				color={190,30,45}),
			__esi_AutoRoute=false);
		connect(DHFeedIn_Extract.PipeIn,HeatExchangerOut) annotation(
			Line(
				points={{210,-55},{210,30},{210,50}},
				color={190,30,45},
				thickness=0.0625),
			__esi_AutoRoute=false);
		connect(HeatGeneratorReturn,HeatGeneratorValve.PipeOutRegulated) annotation(Line(
			points={{-125,-220},{-120,-220},{-90,-220},{-85,-220}},
			color={190,30,45}));
		connect(mergingValve1.PipeIn1,mergingValve5.PipeOut) annotation(Line(
			points={{30,-160},{25,-160},{15,-160},{10,-160}},
			color={190,30,45},
			thickness=0.0625));
		connect(mergingValve4.PipeIn1,mergingValve3.PipeOut) annotation(Line(
			points={{160,-215},{165,-215},{175,-215},{180,-215}},
			color={190,30,45},
			thickness=0.0625));
		connect(measureThermal3.PipeIn,mergingValve2.PipeOut) annotation(Line(
			points={{150,20},{150,15},{150,10},{150,5}},
			color={190,30,45},
			thickness=0.0625));
		connect(DemandValve.PipeOutRemain,FeedInValve.PipeIn) annotation(Line(
			points={{100,-170},{105,-170},{110,-170},{115,-170}},
			color={190,30,45}));
		connect(FeedInValve.PipeOutRegulated,FeedInPump.PumpIn) annotation(Line(
			points={{135,-165},{140,-165},{140,-50},{140,-45}},
			color={190,30,45}));
		connect(mergingValve2.PipeIn1,FeedInPump.PumpOut) annotation(Line(
			points={{145,-15},{145,-20},{145,-30},{140,-30},{140,-35}},
			color={190,30,45},
			thickness=0.0625));
		connect(StorageDischargeIn.Pipe,HeatGeneratorValve.PipeOutRemain) annotation(Line(
			points={{-100,-245},{-100,-240},{-100,-230},{-90,-230},{-85,-230}},
			color={190,30,45},
			thickness=0.0625));
		connect(StorageChargeIn.Pipe,FeedInValve.PipeOutRemain) annotation(Line(
			points={{180,-175},{175,-175},{140,-175},{135,-175}},
			color={190,30,45},
			thickness=0.0625));
		connect(StorageDischargeOut.Pipe,mergingValve1.PipeIn2) annotation(Line(
			points={{10,-240},{15,-240},{25,-240},{25,-170},{30,-170}},
			color={190,30,45}));
		connect(measureHGSupply.qvMedium,HeatGeneratorValve.qvRef) annotation(Line(
			points={{-75,-170},{-75,-175},{-75,-210},{-75,-215}},
			color={0,0,127},
			thickness=0.0625));
		connect(measureHGSupply.PipeOut,mergingValve5.PipeIn2) annotation(Line(
			points={{-70,-165},{-65,-165},{-15,-165},{-10,-165}},
			color={190,30,45}));
		connect(measureHGSupply.PipeIn,HeatGeneratorSupply) annotation(Line(
			points={{-80,-165},{-85,-165},{-120,-165},{-125,-165}},
			color={190,30,45},
			thickness=0.0625));
		connect(measureDHSupply.PipeOut,mergingValve5.PipeIn1) annotation(Line(
			points={{-35,-155},{-30,-155},{-15,-155},{-10,-155}},
			color={190,30,45}));
		connect(HeatGeneratorValve.PipeIn,DistrictHeatingValve.PipeOutRemain) annotation(Line(
			points={{-65,-225},{-60,-225},{-55,-225},{-50,-225}},
			color={190,30,45},
			thickness=0.0625));
		connect(measureDHSupply.qvMedium,DistrictHeatingValve.qvRef) annotation(Line(
			points={{-40,-160},{-40,-165},{-40,-205},{-40,-210}},
			color={0,0,127},
			thickness=0.0625));
		connect(mergingValve4.PipeOut,DistrictHeatingValve.PipeIn) annotation(Line(
			points={{140,-220},{135,-220},{-25,-220},{-30,-220}},
			color={190,30,45}));
		connect(measureMixed.PipeOut,DemandValve.PipeIn) annotation(Line(
			points={{65,-165},{70,-165},{75,-165},{80,-165}},
			color={190,30,45}));
		connect(mergingValve1.PipeOut,measureMixed.PipeIn) annotation(Line(
			points={{50,-165},{55,-165},{50,-165},{55,-165}},
			color={190,30,45}));
		connect(DHFeedIn_Extract.PipeOutRemain,mergingValve3.PipeIn1) annotation(Line(
			points={{215,-75},{215,-80},{215,-210},{205,-210},{200,-210}},
			color={190,30,45}));
		connect(measureDHSupply.PipeIn,DHFeedIn_Extract.PipeOutRegulated) annotation(Line(
			points={{-45,-155},{-50,-155},{-50,-117.7},{205,-117.7},{205,-80},{205,
			-75}},
			color={190,30,45},
			thickness=0.0625));
		connect(FeedIn.y,FeedInValve.qvRef) annotation(Line(
			points={{116,-40},{121,-40},{125,-40},{125,-155},{125,-160}},
			color={0,0,127},
			thickness=0.0625));
		connect(FeedIn.y,FeedInPump.qvRef) annotation(Line(
			points={{116,-40},{121,-40},{130,-40},{135,-40}},
			color={0,0,127},
			thickness=0.0625));
		connect(DHFeedIn_Extract.qvRef,Extract.y) annotation(Line(
			points={{200,-65},{195,-65},{121,-65},{121,-75},{116,-75}},
			color={0,0,127},
			thickness=0.0625));
		connect(StorageChargeOut.Pipe,mergingValve4.PipeIn2) annotation(Line(
			points={{180,-245},{175,-245},{165,-245},{165,-225},{160,-225}},
			color={190,30,45},
			thickness=0.0625));
		connect(StorageChargeIn1.Pipe,StorageChargeFlow) annotation(
			Line(
				points={{180,-275},{175,-275},{160,-275},{160,-330}},
				color={190,30,45}),
			__esi_AutoRoute=false);
		connect(StorageChargeOut1.TMedium,StorageChargeOut.TMedium) annotation(Line(
			points={{265,-290},{265,-285},{265,-240},{205,-240},{200,-240}},
			color={0,0,127},
			thickness=0.0625));
		connect(StorageChargeIn1.TMedium,StorageChargeIn.TMedium) annotation(
			Line(
				points={{200,-280},{240,-280},{240,-180},{200,-180}},
				color={0,0,127},
				thickness=0.0625),
			__esi_AutoRoute=false);
		connect(StorageCharge.y,StorageChargeOut.qvMedium) annotation(Line(
			points={{214,-260},{209,-260},{205,-260},{205,-250},{200,-250}},
			color={0,0,127},
			thickness=0.0625));
		connect(StorageCharge.y,StorageChargeIn1.qvMedium) annotation(Line(
			points={{214,-260},{209,-260},{205,-260},{205,-270},{200,-270}},
			color={0,0,127},
			thickness=0.0625));
		connect(StorageDischargeIn.TMedium,StorageDischargeOut1.TMedium) annotation(Line(
			points={{-105,-265},{-105,-270},{-105,-275},{-15,-275},{-10,-275}},
			color={0,0,127},
			thickness=0.0625));
		connect(StorageDischargeIn1.TMedium,StorageDischargeOut.TMedium) annotation(Line(
			points={{-60,-290},{-60,-285},{-60,-235},{-15,-235},{-10,-235}},
			color={0,0,127},
			thickness=0.0625));
		connect(StorageDischarge.y,StorageDischargeOut.qvMedium) annotation(Line(
			points={{-34,-255},{-29,-255},{-15,-255},{-15,-245},{-10,-245}},
			color={0,0,127},
			thickness=0.0625));
		connect(StorageDischarge.y,StorageDischargeOut1.qvMedium) annotation(Line(
			points={{-34,-255},{-29,-255},{-15,-255},{-15,-265},{-10,-265}},
			color={0,0,127},
			thickness=0.0625));
		connect(measureDemandSupply.PipeIn,DemandValve.PipeOutRegulated) annotation(Line(
			points={{155,-160},{150,-160},{105,-160},{100,-160}},
			color={190,30,45},
			thickness=0.015625));
		connect(measureDemandSupply.PipeOut,DemandFlow) annotation(Line(
			points={{165,-160},{170,-160},{270,-160},{275,-160}},
			color={190,30,45},
			thickness=0.0625));
		connect(measureDemandReturn.qvMedium,DemandValve.qvRef) annotation(Line(
			points={{220,-215},{220,-210},{220,-150},{90,-150},{90,-155}},
			color={0,0,127},
			thickness=0.0625));
		connect(measureDemandReturn.PipeIn,DemandReturn) annotation(Line(
			points={{225,-220},{230,-220},{270,-220},{275,-220}},
			color={190,30,45},
			thickness=0.0625));
		connect(measureDemandReturn.PipeOut,mergingValve3.PipeIn2) annotation(Line(
			points={{215,-220},{210,-220},{205,-220},{200,-220}},
			color={190,30,45}));
		connect(StorageDischargeOut1.Pipe,StorageDischargeReturn) annotation(
			Line(
				points={{10,-270},{15,-270},{30,-270},{30,-330}},
				color={190,30,45}),
			__esi_AutoRoute=false);
		connect(StorageChargeOut1.Pipe,StorageChargeReturn) annotation(
			Line(
				points={{260,-310},{260,-315},{260,-330}},
				color={190,30,45},
				thickness=0.0625),
			__esi_AutoRoute=false);
		connect(StorageDischargeIn1.Pipe,StorageDischargeFlow) annotation(
			Line(
				points={{-55,-310},{-55,-315},{-55,-330}},
				color={190,30,45},
				thickness=0.0625),
			__esi_AutoRoute=false);
		connect(ExtractionPump1.qvRef,Extract.y) annotation(Line(
			points={{150,-75},{145,-75},{121,-75},{116,-75}},
			color={0,0,127},
			thickness=0.0625));
		connect(mergingValve2.PipeIn2,ExtractionPump1.PumpOut) annotation(Line(
			points={{155,-15},{155,-20},{155,-65},{155,-70}},
			color={190,30,45},
			thickness=0.0625));
		connect(DistrictHeatingValve.PipeOutRegulated,ExtractionPump1.PumpIn) annotation(
			Line(
				points={{-50,-215},{-55,-215},{-55,-110},{155,-110},{155,-85},{155,
				-80}},
				color={190,30,45}),
			__esi_AutoRoute=false);
		
		if (usePowerCalcPump and CPPhasePump==1) then
		connect(FeedInPump.Grid1,FeedInPumpOut) annotation(Line(points=0));
		connect(ExtractionPump1.Grid1,ExtractionPumpOut) annotation(Line(points=0));
		end if;
		if usePowerCalcPump then
			PCP=FeedInPump.PCP + ExtractionPump1.PCP;
			ECP=FeedInPump.ECP + ExtractionPump1.ECP;
		end if;
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
			bSplitCodeGen=false,
			typename="CVODE"),
		__esi_viewinfo[0](
			fMin=1,
			fMax=100,
			nf=100,
			kindSweep=1,
			expDataFormat=0,
			expNumberFormat="%.7lg",
			expMatrixNames={
							"A","B","C","D","E"},
			typename="AnaLinSysInfo"),
		Icon(
			coordinateSystem(extent={{-350,-75},{350,75}}),
			graphics={
				Line(
					points={{-349,24.3},{346.7,24.4}},
					color={139,0,0},
					thickness=8),
				Line(
					points={{-249.4,-70.7},{-249.4,26}},
					color={139,0,0},
					thickness=8),
				Line(
					points={{249.5,-69.09999999999999},{249.5,27.6}},
					color={139,0,0},
					thickness=8),
				Line(
					points={{-346.7,-25.7},{346.7,-25.7}},
					color={0,0,255},
					thickness=8),
				Line(
					points={{-298.4,-23.1},{-298.4,-73.09999999999999}},
					color={0,0,255},
					thickness=8),
				Line(
					points={{301.1,-25.9},{301.1,-75.90000000000001}},
					color={0,0,255},
					thickness=8),
				Line(
					points={{-53.9,74.8},{-54.3,-25.7}},
					color={0,0,255},
					thickness=8),
				Line(
					points={{-46.4,74.90000000000001},{-46.4,24.9}},
					color={139,0,0},
					thickness=8),
				Line(
					points={{53.4,72.3},{53,-28.2}},
					color={0,0,255},
					thickness=8),
				Line(
					points={{46,72.09999999999999},{46,22.1}},
					color={139,0,0},
					thickness=8),
				Line(
					points={{-329.9,36.9},{-306.6,36.9}},
					arrow={
						Arrow.None,Arrow.Filled},
					thickness=1.5),
				Line(
					points={{316.4,33.4},{339.7,33.4}},
					arrow={
						Arrow.None,Arrow.Filled},
					thickness=1.5),
				Line(
					points={{-332,-16.1},{-308.7,-16.1}},
					arrow={
						Arrow.Filled,Arrow.None},
					thickness=1.5),
				Line(
					points={{312.8,-16.3},{336.1,-16.3}},
					arrow={
						Arrow.Filled,Arrow.None},
					thickness=1.5),
				Line(
					points={{-11.7,0},{11.6,0}},
					arrow={
						Arrow.Filled,Arrow.None},
					thickness=1.5,
					origin={-238.9,-45.5},
					rotation=90),
				Line(
					points={{-11.7,0},{11.6,0}},
					arrow={
						Arrow.None,Arrow.Filled},
					thickness=1.5,
					origin={-307.1,-45.7},
					rotation=90),
				Line(
					points={{-11.7,0},{11.6,0}},
					arrow={
						Arrow.Filled,Arrow.None},
					thickness=1.5,
					origin={309.8,-46.2},
					rotation=90),
				Line(
					points={{-11.7,0},{11.6,0}},
					arrow={
						Arrow.None,Arrow.Filled},
					thickness=1.5,
					origin={241.6,-46.4},
					rotation=90),
				Line(
					points={{-19.4,-0.7},{11.6,0}},
					arrow={
						Arrow.Filled,Arrow.Filled},
					thickness=1.5,
					origin={-37.4,49.4},
					rotation=90),
				Line(
					points={{-19.4,-0.7},{11.6,0}},
					arrow={
						Arrow.Filled,Arrow.Filled},
					thickness=1.5,
					origin={35.4,49.2},
					rotation=90),
				Text(
					textString="DZ",
					fontSize=10,
					textStyle={
						TextStyle.Bold},
					lineColor={0,128,255},
					extent={{223,1.9},{448.9,-137.9}})}),
		Documentation(info="<HTML><HEAD>
<META http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\"> 
<TITLE>HydraulicSwitch</TITLE> 
<STYLE type=\"text/css\">
table>tbody>tr:hover,th{background-color:#edf1f3}html{font-size:90%}body,table{font-size:1rem}body{font-family:'Open Sans',Arial,sans-serif;color:#465e70}h1,h2{margin:1em 0 .6em;font-weight:600}p{margin-top:.3em;margin-bottom:.2em}table{border-collapse:collapse;margin:1em 0;width:100%;}tr{border:1px solid #beccd3}td,th{padding:.3em 1em; border-width: 1px; border-style: solid; border-color: rgb(190, 204, 211);}td{word-break:break-word}tr:nth-child(even){background-color:#fafafa}th{font-family:'Open Sans Semibold',Arial,sans-serif;font-weight:700;text-align:left;word-break:keep-all}.lib-wrap{width:70%}@media screen and (max-width:800px){.lib-wrap{width:100%}}td p{margin:.2em}
</STYLE>
 
<META name=\"GENERATOR\" content=\"MSHTML 11.00.10570.1001\"></HEAD> 
<BODY>
<H1>HydraulicSwitch</H1>
<HR>

<P>Distributes heat between Heat Generator, Heating System (Demand), 
Bidirectional District Heating Station (HeatExchanger) and Thermal Storage.</P>
<P>Connection P1 in <A 
href=\"https://doi.org/10.1016/j.egyr.2021.08.085\">https://doi.org/10.1016/j.egyr.2021.08.085</A></P>
<DIV class=\"lib-wrap\">
<TABLE class=\"type\">
  <TBODY>
  <TR>
    <TH>Symbol:</TH>
    <TD colspan=\"3\"><IMG width=\"384\" height=\"247\" src=\"data:image/png;base64,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\"></TD></TR>
  <TR>
    <TH>Identifier:</TH>
    <TD colspan=\"3\">CoSES_Models.Distribution.HydraulicSwitch</TD></TR>
  <TR>
    <TH>Version:</TH>
    <TD colspan=\"3\">1.0</TD></TR>
  <TR>
    <TH>File:</TH>
    <TD colspan=\"3\">HydraulicSwitch.mo</TD></TR>
  <TR>
    <TH>Connectors:</TH>
    <TD>HeatExchangerIn</TD>
    <TD>HeatExchangerIn</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>HeatExchangerOut</TD>
    <TD>HeatExchangerOut</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>HeatGeneratorSupply</TD>
    <TD>HeatGeneratorSupply</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>HeatGeneratorReturn</TD>
    <TD>HeatGeneratorReturn</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>StorageFlowOut</TD>
    <TD>StorageChargeReturn</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>StorageReturnIn</TD>
    <TD>StorageChargeFlow</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>StorageReturnOut</TD>
    <TD>StorageDischargeFlow</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>StorageFlowIn</TD>
    <TD>StorageDischargeReturn</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>DemandFlow</TD>
    <TD>DemandFlow</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>DemandReturn</TD>
    <TD>DemandReturn</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Electrical Low-Voltage AC Single-Phase Connector</TD>
    <TD>FeedInPumpOut</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Electrical Low-Voltage AC Single-Phase Connector</TD>
    <TD>ExtractionPumpOut</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Volume Flow from/to District Heating &lt;0: Feed In; &gt;0: 
    Extraction</TD>
    <TD>qvDistrictHeating</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>Parameters:</TH>
    <TD>Specifies a Thermal Volume Flow Connector</TD>
    <TD>StorageChargeOut</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Volume flow generation and electrical power calculation</TD>
    <TD>FeedInPump</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Controllable valve for volume flow distribution</TD>
    <TD>FeedInValve</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Controllable valve for volume flow distribution</TD>
    <TD>DemandValve</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Valve for volume flow merging</TD>
    <TD>mergingValve1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Set output signal to a time varying Real expression</TD>
    <TD>FeedIn</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Valve for volume flow merging</TD>
    <TD>mergingValve2</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Measurement of pipe temperature and volume flow</TD>
    <TD>measureThermal3</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Controllable valve for volume flow distribution</TD>
    <TD>DHFeedIn_Extract</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Valve for volume flow merging</TD>
    <TD>mergingValve3</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Valve for volume flow merging</TD>
    <TD>mergingValve4</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Measurement of pipe temperature and volume flow</TD>
    <TD>measureMixed</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Controllable valve for volume flow distribution</TD>
    <TD>HeatGeneratorValve</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Valve for volume flow merging</TD>
    <TD>mergingValve5</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Measurement of pipe temperature and volume flow</TD>
    <TD>measureHGSupply</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Measurement of pipe temperature and volume flow</TD>
    <TD>measureDHSupply</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Controllable valve for volume flow distribution</TD>
    <TD>DistrictHeatingValve</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Set output signal to a time varying Real expression</TD>
    <TD>Extract</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Extracts the characteristics of a Thermal Volume Flow Connector</TD>
    <TD>StorageChargeIn</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Extracts the characteristics of a Thermal Volume Flow Connector</TD>
    <TD>StorageDischargeIn</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Specifies a Thermal Volume Flow Connector</TD>
    <TD>StorageDischargeOut</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Specifies a Thermal Volume Flow Connector</TD>
    <TD>StorageChargeIn1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Extracts the characteristics of a Thermal Volume Flow Connector</TD>
    <TD>StorageChargeOut1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Set output signal to a time varying Real expression</TD>
    <TD>StorageCharge</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Specifies a Thermal Volume Flow Connector</TD>
    <TD>StorageDischargeOut1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Extracts the characteristics of a Thermal Volume Flow Connector</TD>
    <TD>StorageDischargeIn1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Set output signal to a time varying Real expression</TD>
    <TD>StorageDischarge</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Measurement of pipe temperature and volume flow</TD>
    <TD>measureDemandSupply</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Measurement of pipe temperature and volume flow</TD>
    <TD>measureDemandReturn</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Volume flow generation and electrical power calculation</TD>
    <TD>ExtractionPump1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>If enabled, electrical power calculation for circulation pump is 
    used</TD>
    <TD>usePowerCalcPump</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>File name where electrical power data of circulation pump is 
located</TD>
    <TD>filePowerPump</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Table name where electrical power data of circulation pump is 
    located</TD>
    <TD>TablePowerPump</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Power factor of pump</TD>
    <TD>CosPhiPump</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Maximum volume flow of pump</TD>
    <TD>qvMaxPump</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Valve volume</TD>
    <TD>VValve</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heat loss through the insulation</TD>
    <TD>QlossRate</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Ambient temperature</TD>
    <TD>TAmbient</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Density of Heating Medium</TD>
    <TD>rho</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Specific Heat Capacity of Heating Medium</TD>
    <TD>cp</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>Results:</TH>
    <TD>Supply Temperature Heat Generator</TD>
    <TD>TSupplyHG</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Return Temperature Heat Generator</TD>
    <TD>TReturnHG</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Supply Temperature District Heating</TD>
    <TD>TSupplyDH</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Return Temperature District Heating</TD>
    <TD>TReturnDH</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Supply Temperature Heat Consumption</TD>
    <TD>TSupplyHC</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Return Temperature Heat Consumption</TD>
    <TD>TReturnHC</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Supply Temperature Thermal Storage</TD>
    <TD>TSupplyTS</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Return Temperature Thermal Storage</TD>
    <TD>TReturnTS</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Volume Flow from/to Storage &lt;0: Charge; &gt;0: Discharge</TD>
    <TD>qvStorage</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Volume Flow from/to District Heating &lt;0: Feed In; &gt;0: 
    Extraction</TD>
    <TD>qvDistrictHeating</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Volume Flow from Heat Generator</TD>
    <TD>qvHeatGenerator</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Volume Flow to Heat Consumption</TD>
    <TD>qvHeatConsumption</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Supplied Heat Power Heat Generator</TD>
    <TD>QHeatGenerator</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Supplied/Abstracted Heat Power District Heating</TD>
    <TD>QDistrictHeating</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Abstracted Heat Power Heat Consumption</TD>
    <TD>QHeatConsumption</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Supplied/Abstracted Heat Power Thermal Storage</TD>
    <TD>QThermalStorage</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Electrical power of feed in and extraction pump</TD>
    <TD>PCP</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Electrical energy of feed in and extraction pump</TD>
    <TD>ECP</TD>
    <TD>&nbsp;</TD></TR></TBODY></TABLE></DIV>
<H2>Description:</H2>
<P>&nbsp;</P></BODY></HTML>
"),
		experiment(
			StopTime=1,
			StartTime=0,
			Tolerance=1e-06,
			Interval=0.001,
			__esi_Solver(
				bSplitCodeGen=false,
				typename="CVODE"),
			__esi_MinInterval="9.999999999999999e-10",
			__esi_AbsTolerance="1e-6"));
end HydraulicSwitch;
