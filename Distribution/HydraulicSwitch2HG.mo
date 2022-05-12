// CP: 65001
// SimulationX Version: 4.2.3.69223
within CoSES_Models.Distribution;
model HydraulicSwitch2HG "Hydraulic Switch with two heat generators"
	GreenCity.Interfaces.Thermal.VolumeFlowOut HeatExchangerIn "HeatExchangerIn" annotation(Placement(
		transformation(extent={{240,40},{260,60}}),
		iconTransformation(extent={{-60,65},{-40,85}})));
	GreenCity.Interfaces.Thermal.VolumeFlowIn HeatGeneratorSupply2 "HeatGeneratorSupply2" annotation(Placement(
		transformation(
			origin={-110,-120},
			extent={{-10,-10},{10,10}},
			rotation=270),
		iconTransformation(
			origin={-250,75},
			extent={{-10,-10},{10,10}},
			rotation=270)));
	GreenCity.Interfaces.Thermal.VolumeFlowOut HeatGeneratorReturn2 "HeatGeneratorReturn2" annotation(Placement(
		transformation(
			origin={-110,-195},
			extent={{-10,-10},{10,10}},
			rotation=270),
		iconTransformation(
			origin={-300,75},
			extent={{-10,-10},{10,10}},
			rotation=270)));
	GreenCity.Interfaces.Thermal.VolumeFlowIn HeatExchangerOut "HeatExchangerOut" annotation(Placement(
		transformation(extent={{300,40},{320,60}}),
		iconTransformation(extent={{40,65},{60,85}})));
	GreenCity.Interfaces.Thermal.VolumeFlowIn HeatGeneratorSupply1 "HeatGeneratorSupply1" annotation(Placement(
		transformation(extent={{-120,-180},{-100,-160}}),
		iconTransformation(extent={{-360,15},{-340,35}})));
	GreenCity.Interfaces.Thermal.VolumeFlowOut HeatGeneratorReturn1 "HeatGeneratorReturn1" annotation(Placement(
		transformation(extent={{-120,-235},{-100,-215}}),
		iconTransformation(extent={{-360,-35},{-340,-15}})));
	GreenCity.Interfaces.Thermal.VolumeFlowIn StorageChargeReturn "StorageFlowOut" annotation(Placement(
		transformation(extent={{350,-340},{370,-320}}),
		iconTransformation(extent={{-310,-81.7},{-290,-61.7}})));
	GreenCity.Interfaces.Thermal.VolumeFlowOut StorageChargeFlow "StorageReturnIn" annotation(Placement(
		transformation(extent={{250,-340},{270,-320}}),
		iconTransformation(extent={{-260,-81.7},{-240,-61.7}})));
	GreenCity.Interfaces.Thermal.VolumeFlowIn StorageDischargeFlow "StorageReturnOut" annotation(Placement(
		transformation(extent={{35,-340},{55,-320}}),
		iconTransformation(extent={{240,-81.7},{260,-61.7}})));
	GreenCity.Interfaces.Thermal.VolumeFlowOut StorageDischargeReturn "StorageFlowIn" annotation(Placement(
		transformation(extent={{120,-340},{140,-320}}),
		iconTransformation(extent={{290,-81.7},{310,-61.7}})));
	GreenCity.Interfaces.Thermal.VolumeFlowOut DemandFlow "DemandFlow" annotation(Placement(
		transformation(extent={{365,-170},{385,-150}}),
		iconTransformation(extent={{336.7,15},{356.7,35}})));
	GreenCity.Interfaces.Thermal.VolumeFlowIn DemandReturn "DemandReturn" annotation(Placement(
		transformation(extent={{365,-230},{385,-210}}),
		iconTransformation(extent={{336.7,-35},{356.7,-15}})));
	GreenCity.Interfaces.Electrical.LV1Phase FeedInPumpOut if usePowerCalcPump "Electrical Low-Voltage AC Single-Phase Connector" annotation(Placement(
		transformation(extent={{385,-10},{405,10}}),
		iconTransformation(extent={{240,65},{260,85}})));
	GreenCity.Interfaces.Electrical.LV1Phase ExtractionPumpOut if usePowerCalcPump "Electrical Low-Voltage AC Single-Phase Connector" annotation(Placement(
		transformation(extent={{385,-40},{405,-20}}),
		iconTransformation(extent={{190,65},{210,85}})));
	Modelica.Blocks.Interfaces.RealInput qvDistrictHeating(quantity="Thermics.VolumeFlow") "Volume Flow from/to District Heating <0: Feed In; >0: Extraction" annotation(
		Placement(
			transformation(
				origin={205,50},
				extent={{-20,-20},{20,20}}),
			iconTransformation(
				origin={-150,75},
				extent={{-20,-20},{20,20}},
				rotation=-90)),
		Dialog(
			group="Volume Flow",
			tab="Results",
			visible=false));
	GreenCity.Interfaces.Thermal.DefineVolumeFlow StorageChargeOut "Specifies a Thermal Volume Flow Connector" annotation(Placement(transformation(
		origin={290,-245},
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
		origin={245,-45},
		extent={{-10,-10},{0,0}},
		rotation=270)));
	GreenCity.Utilities.Thermal.DistributionValve FeedInValve annotation(Placement(transformation(extent={{215,-180},{235,-160}})));
	GreenCity.Utilities.Thermal.DistributionValve DemandValve annotation(Placement(transformation(extent={{180,-175},{200,-155}})));
	GreenCity.Utilities.Thermal.MergingValve mergingValve1(
		VValve(displayUnit="m³")=VValve/6,
		QlossRate=QlossRate,
		TAmbient(displayUnit="K")=TAmbient,
		cpMed(displayUnit="J/(kg·K)")=cp,
		rhoMed=rho) annotation(Placement(transformation(extent={{150,-175},{130,-155}})));
	Modelica.Blocks.Sources.RealExpression FeedIn(y(
		quantity="Thermics.VolumeFlow",
		displayUnit="m³/s")=qvFeedIn) annotation(Placement(transformation(extent={{195,-50},{215,-30}})));
	GreenCity.Utilities.Thermal.MergingValve mergingValve2(
		VValve(displayUnit="m³")=VValve/6,
		QlossRate=QlossRate,
		TAmbient(displayUnit="K")=TAmbient,
		cpMed(displayUnit="J/(kg·K)")=cp,
		rhoMed=rho) annotation(Placement(transformation(
		origin={250,-5},
		extent={{10,-10},{-10,10}},
		rotation=90)));
	GreenCity.Utilities.Thermal.MeasureThermal measureThermal3 annotation(Placement(transformation(
		origin={250,25},
		extent={{5,-5},{-5,5}},
		rotation=-90)));
	GreenCity.Utilities.Thermal.DistributionValve DHFeedIn_Extract annotation(Placement(transformation(
		origin={310,-65},
		extent={{-10,10},{10,-10}},
		rotation=-90)));
	GreenCity.Utilities.Thermal.MergingValve mergingValve3(
		VValve(displayUnit="m³")=VValve/6,
		QlossRate=QlossRate,
		TAmbient(displayUnit="K")=TAmbient,
		cpMed(displayUnit="J/(kg·K)")=cp,
		rhoMed=rho) annotation(Placement(transformation(extent={{280,-225},{300,-205}})));
	GreenCity.Utilities.Thermal.MergingValve mergingValve4(
		VValve(displayUnit="m³")=VValve/6,
		QlossRate=QlossRate,
		TAmbient(displayUnit="K")=TAmbient,
		cpMed(displayUnit="J/(kg·K)")=cp,
		rhoMed=rho) annotation(Placement(transformation(extent={{240,-230},{260,-210}})));
	GreenCity.Utilities.Thermal.MeasureThermal measureMixed annotation(Placement(transformation(extent={{155,-160},{165,-170}})));
	GreenCity.Utilities.Thermal.DistributionValve HeatGeneratorValve1 annotation(Placement(transformation(extent={{-35,-240},{-55,-220}})));
	GreenCity.Utilities.Thermal.MergingValve mergingValve5(
		VValve(displayUnit="m³")=VValve/6,
		QlossRate=QlossRate,
		TAmbient(displayUnit="K")=TAmbient,
		cpMed(displayUnit="J/(kg·K)")=cp,
		rhoMed=rho) annotation(Placement(transformation(extent={{110,-170},{90,-150}})));
	GreenCity.Utilities.Thermal.MeasureThermal measureHGSupply1 annotation(Placement(transformation(extent={{-50,-165},{-40,-175}})));
	GreenCity.Utilities.Thermal.MeasureThermal measureDHSupply annotation(Placement(transformation(extent={{55,-150},{65,-160}})));
	GreenCity.Utilities.Thermal.DistributionValve DistrictHeatingValve1 annotation(Placement(transformation(extent={{70,-230},{50,-210}})));
	Modelica.Blocks.Sources.RealExpression Extract(y(
		quantity="Thermics.VolumeFlow",
		displayUnit="m³/s")=qvExtract) annotation(Placement(transformation(extent={{195,-85},{215,-65}})));
	GreenCity.Interfaces.Thermal.ExtractVolumeFlow StorageChargeIn annotation(Placement(transformation(extent={{280,-185},{300,-165}})));
	GreenCity.Interfaces.Thermal.ExtractVolumeFlow StorageDischargeIn annotation(Placement(transformation(
		origin={-70,-260},
		extent={{-10,-10},{10,10}},
		rotation=-90)));
	GreenCity.Interfaces.Thermal.DefineVolumeFlow StorageDischargeOut annotation(Placement(transformation(
		origin={100,-240},
		extent={{-10,-10},{10,10}})));
	GreenCity.Interfaces.Thermal.DefineVolumeFlow StorageChargeIn1 annotation(Placement(transformation(
		origin={290,-275},
		extent={{10,10},{-10,-10}})));
	GreenCity.Interfaces.Thermal.ExtractVolumeFlow StorageChargeOut1 annotation(Placement(transformation(
		origin={360,-300},
		extent={{-10,-10},{10,10}},
		rotation=90)));
	Modelica.Blocks.Sources.RealExpression StorageCharge(y(
		quantity="Thermics.VolumeFlow",
		displayUnit="m³/s")=qvStorageCharge) annotation(Placement(transformation(extent={{335,-270},{315,-250}})));
	GreenCity.Interfaces.Thermal.DefineVolumeFlow StorageDischargeOut1 annotation(Placement(transformation(
		origin={100,-270},
		extent={{-10,10},{10,-10}})));
	GreenCity.Interfaces.Thermal.ExtractVolumeFlow StorageDischargeIn1 annotation(Placement(transformation(
		origin={45,-300},
		extent={{-10,10},{10,-10}},
		rotation=90)));
	Modelica.Blocks.Sources.RealExpression StorageDischarge(y(
		quantity="Thermics.VolumeFlow",
		displayUnit="m³/s")=qvStorageDischarge) annotation(Placement(transformation(extent={{45,-265},{65,-245}})));
	GreenCity.Utilities.Thermal.MeasureThermal measureDemandSupply annotation(Placement(transformation(extent={{255,-155},{265,-165}})));
	GreenCity.Utilities.Thermal.MeasureThermal measureDemandReturn "Measurement of pipe temperature and volume flow" annotation(Placement(transformation(extent={{325,-225},{315,-215}})));
	GreenCity.Utilities.Thermal.Pump ExtractionPump1(
		PelFile=filePowerPump,
		PelTable=TablePowerPump,
		usePowerCalc=usePowerCalcPump,
		CPPhase=CPPhasePump,
		CosPhi=CosPhiPump,
		qvMax(displayUnit="m³/s")=qvMaxPump,
		PPump(tableID "External table object")) "Volume flow generation and electrical power calculation" annotation(Placement(transformation(
		origin={260,-80},
		extent={{-10,-10},{0,0}},
		rotation=270)));
	Real qvStorage(quantity="Thermics.VolumeFlow") "Volume Flow from/to Storage <0: Charge; >0: Discharge" annotation(Dialog(
		group="Volume Flow",
		tab="Results",
		visible=false));
	Real qvHeatGenerator1(quantity="Thermics.VolumeFlow") "Volume Flow from Heat Generator 1" annotation(Dialog(
		group="Volume Flow",
		tab="Results",
		visible=false));
	Real qvHeatGenerator2(quantity="Thermics.VolumeFlow") "Volume Flow from Heat Generator 2" annotation(Dialog(
		group="Volume Flow",
		tab="Results",
		visible=false));
	Real qvHeatConsumption(quantity="Thermics.VolumeFlow") "Volume Flow to Heat Consumption" annotation(Dialog(
		group="Volume Flow",
		tab="Results",
		visible=false));
	Real TSupplyHG1(quantity="Basics.Temp") "Supply Temperature Heat Generator 1" annotation(Dialog(
		group="Temperature",
		tab="Results",
		visible=false));
	Real TReturnHG1(quantity="Basics.Temp") "Return Temperature Heat Generator 1" annotation(Dialog(
		group="Temperature",
		tab="Results",
		visible=false));
	Real TSupplyHG2(quantity="Basics.Temp") "Supply Temperature Heat Generator 2" annotation(Dialog(
		group="Temperature",
		tab="Results",
		visible=false));
	Real TReturnHG2(quantity="Basics.Temp") "Return Temperature Heat Generator 2" annotation(Dialog(
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
	Real QHeatGenerator1(quantity="Basics.Power") "Supplied Heat Power Heat Generator 1" annotation(Dialog(
		group="Heat Power",
		tab="Results",
		visible=false));
	Real QHeatGenerator2(quantity="Basics.Power") "Supplied Heat Power Heat Generator 2" annotation(Dialog(
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
		GreenCity.Utilities.Thermal.MeasureThermal measureHGSupply2 annotation(Placement(transformation(extent={{-5,-115},{5,-125}})));
		GreenCity.Utilities.Thermal.MergingValve mergingValve6(
			VValve(displayUnit="m³")=VValve/6,
			QlossRate=QlossRate,
			TAmbient(displayUnit="K")=TAmbient,
			cpMed(displayUnit="J/(kg·K)")=cp,
			rhoMed=rho) annotation(Placement(transformation(extent={{35,-175},{15,-155}})));
		GreenCity.Utilities.Thermal.DistributionValve HeatGeneratorValve2 annotation(Placement(transformation(extent={{10,-235},{-10,-215}})));
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
		qvFeedIn = min(qvMaxPump, max(-qvDistrictHeating, 0));
		qvExtract = min(qvMaxPump, max(qvDistrictHeating, 0));
		TSupplyDH = max(HeatExchangerOut.T, HeatExchangerIn.T);
		TReturnDH = min(HeatExchangerOut.T, HeatExchangerIn.T);
		QDistrictHeating = rho * cp * qvDistrictHeating * (TSupplyDH - TReturnDH);
		
		// Storage
		qvStorage = -(measureHGSupply1.qvMedium + measureHGSupply2.qvMedium + qvDistrictHeating - measureDemandReturn.qvMedium);
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
		
		// Heat Generator 1
		qvHeatGenerator1 = measureHGSupply1.qvMedium;
		TSupplyHG1 = HeatGeneratorSupply1.T;
		TReturnHG1 = HeatGeneratorReturn1.T;
		QHeatGenerator1 = rho * cp * qvHeatGenerator1 * (TSupplyHG1 - TReturnHG1);
		
		// Heat Generator 2
		qvHeatGenerator2 = measureHGSupply2.qvMedium;
		TSupplyHG2 = HeatGeneratorSupply2.T;
		TReturnHG2 = HeatGeneratorReturn2.T;
		QHeatGenerator2 = rho * cp * qvHeatGenerator2 * (TSupplyHG2 - TReturnHG2);
		
		// Heat Consumption
		qvHeatConsumption = -measureDemandReturn.qvMedium;
		TSupplyHC = DemandFlow.T;
		TReturnHC = DemandReturn.T;
		QHeatConsumption = rho * cp * qvHeatConsumption * (TSupplyHC - TReturnHC);
	equation
		connect(measureThermal3.PipeOut,HeatExchangerIn) annotation(
			Line(
				points={{250,30},{250,35},{250,50}},
				color={190,30,45}),
			__esi_AutoRoute=false);
		connect(DHFeedIn_Extract.PipeIn,HeatExchangerOut) annotation(
			Line(
				points={{310,-55},{310,30},{310,50}},
				color={190,30,45},
				thickness=0.0625),
			__esi_AutoRoute=false);
		connect(mergingValve1.PipeIn1,mergingValve5.PipeOut) annotation(Line(
			points={{130,-160},{125,-160},{115,-160},{110,-160}},
			color={190,30,45},
			thickness=0.0625));
		connect(mergingValve4.PipeIn1,mergingValve3.PipeOut) annotation(Line(
			points={{260,-215},{265,-215},{275,-215},{280,-215}},
			color={190,30,45},
			thickness=0.0625));
		connect(measureThermal3.PipeIn,mergingValve2.PipeOut) annotation(Line(
			points={{250,20},{250,15},{250,10},{250,5}},
			color={190,30,45},
			thickness=0.0625));
		connect(DemandValve.PipeOutRemain,FeedInValve.PipeIn) annotation(Line(
			points={{200,-170},{205,-170},{210,-170},{215,-170}},
			color={190,30,45}));
		connect(FeedInValve.PipeOutRegulated,FeedInPump.PumpIn) annotation(Line(
			points={{235,-165},{240,-165},{240,-50},{240,-45}},
			color={190,30,45}));
		connect(mergingValve2.PipeIn1,FeedInPump.PumpOut) annotation(Line(
			points={{245,-15},{245,-20},{245,-30},{240,-30},{240,-35}},
			color={190,30,45},
			thickness=0.0625));
		connect(StorageChargeIn.Pipe,FeedInValve.PipeOutRemain) annotation(Line(
			points={{280,-175},{275,-175},{240,-175},{235,-175}},
			color={190,30,45},
			thickness=0.0625));
		connect(StorageDischargeOut.Pipe,mergingValve1.PipeIn2) annotation(Line(
			points={{110,-240},{115,-240},{125,-240},{125,-170},{130,-170}},
			color={190,30,45}));
		connect(measureDHSupply.PipeOut,mergingValve5.PipeIn1) annotation(Line(
			points={{65,-155},{70,-155},{85,-155},{90,-155}},
			color={190,30,45}));
		connect(measureMixed.PipeOut,DemandValve.PipeIn) annotation(Line(
			points={{165,-165},{170,-165},{175,-165},{180,-165}},
			color={190,30,45}));
		connect(mergingValve1.PipeOut,measureMixed.PipeIn) annotation(Line(
			points={{150,-165},{155,-165},{150,-165},{155,-165}},
			color={190,30,45}));
		connect(DHFeedIn_Extract.PipeOutRemain,mergingValve3.PipeIn1) annotation(Line(
			points={{315,-75},{315,-80},{315,-210},{305,-210},{300,-210}},
			color={190,30,45}));
		connect(measureDHSupply.PipeIn,DHFeedIn_Extract.PipeOutRegulated) annotation(Line(
			points={{55,-155},{50,-155},{50,-117.7},{305,-117.7},{305,-80},{305,
			-75}},
			color={190,30,45},
			thickness=0.0625));
		connect(FeedIn.y,FeedInValve.qvRef) annotation(Line(
			points={{216,-40},{221,-40},{225,-40},{225,-155},{225,-160}},
			color={0,0,127},
			thickness=0.0625));
		connect(FeedIn.y,FeedInPump.qvRef) annotation(Line(
			points={{216,-40},{221,-40},{230,-40},{235,-40}},
			color={0,0,127},
			thickness=0.0625));
		connect(DHFeedIn_Extract.qvRef,Extract.y) annotation(Line(
			points={{300,-65},{295,-65},{221,-65},{221,-75},{216,-75}},
			color={0,0,127},
			thickness=0.0625));
		connect(StorageChargeOut.Pipe,mergingValve4.PipeIn2) annotation(Line(
			points={{280,-245},{275,-245},{265,-245},{265,-225},{260,-225}},
			color={190,30,45},
			thickness=0.0625));
		connect(StorageChargeIn1.Pipe,StorageChargeFlow) annotation(
			Line(
				points={{280,-275},{275,-275},{260,-275},{260,-330}},
				color={190,30,45}),
			__esi_AutoRoute=false);
		connect(StorageChargeOut1.TMedium,StorageChargeOut.TMedium) annotation(Line(
			points={{365,-290},{365,-285},{365,-240},{305,-240},{300,-240}},
			color={0,0,127},
			thickness=0.0625));
		connect(StorageChargeIn1.TMedium,StorageChargeIn.TMedium) annotation(
			Line(
				points={{300,-280},{340,-280},{340,-180},{300,-180}},
				color={0,0,127},
				thickness=0.0625),
			__esi_AutoRoute=false);
		connect(StorageCharge.y,StorageChargeOut.qvMedium) annotation(Line(
			points={{314,-260},{309,-260},{305,-260},{305,-250},{300,-250}},
			color={0,0,127},
			thickness=0.0625));
		connect(StorageCharge.y,StorageChargeIn1.qvMedium) annotation(Line(
			points={{314,-260},{309,-260},{305,-260},{305,-270},{300,-270}},
			color={0,0,127},
			thickness=0.0625));
		connect(StorageDischargeIn.TMedium,StorageDischargeOut1.TMedium) annotation(Line(
			points={{-75,-270},{-75,-275},{85,-275},{90,-275}},
			color={0,0,127},
			thickness=0.0625));
		connect(StorageDischargeIn1.TMedium,StorageDischargeOut.TMedium) annotation(Line(
			points={{40,-290},{40,-285},{40,-235},{85,-235},{90,-235}},
			color={0,0,127},
			thickness=0.0625));
		connect(StorageDischarge.y,StorageDischargeOut.qvMedium) annotation(Line(
			points={{66,-255},{71,-255},{85,-255},{85,-245},{90,-245}},
			color={0,0,127},
			thickness=0.0625));
		connect(StorageDischarge.y,StorageDischargeOut1.qvMedium) annotation(Line(
			points={{66,-255},{71,-255},{85,-255},{85,-265},{90,-265}},
			color={0,0,127},
			thickness=0.0625));
		connect(measureDemandSupply.PipeIn,DemandValve.PipeOutRegulated) annotation(Line(
			points={{255,-160},{250,-160},{205,-160},{200,-160}},
			color={190,30,45},
			thickness=0.015625));
		connect(measureDemandSupply.PipeOut,DemandFlow) annotation(Line(
			points={{265,-160},{270,-160},{370,-160},{375,-160}},
			color={190,30,45},
			thickness=0.0625));
		connect(measureDemandReturn.qvMedium,DemandValve.qvRef) annotation(Line(
			points={{320,-215},{320,-210},{320,-150},{190,-150},{190,-155}},
			color={0,0,127},
			thickness=0.0625));
		connect(measureDemandReturn.PipeIn,DemandReturn) annotation(Line(
			points={{325,-220},{330,-220},{370,-220},{375,-220}},
			color={190,30,45},
			thickness=0.0625));
		connect(measureDemandReturn.PipeOut,mergingValve3.PipeIn2) annotation(Line(
			points={{315,-220},{310,-220},{305,-220},{300,-220}},
			color={190,30,45}));
		connect(StorageDischargeOut1.Pipe,StorageDischargeReturn) annotation(
			Line(
				points={{110,-270},{115,-270},{130,-270},{130,-330}},
				color={190,30,45}),
			__esi_AutoRoute=false);
		connect(StorageChargeOut1.Pipe,StorageChargeReturn) annotation(
			Line(
				points={{360,-310},{360,-315},{360,-330}},
				color={190,30,45},
				thickness=0.0625),
			__esi_AutoRoute=false);
		connect(StorageDischargeIn1.Pipe,StorageDischargeFlow) annotation(
			Line(
				points={{45,-310},{45,-315},{45,-330}},
				color={190,30,45},
				thickness=0.0625),
			__esi_AutoRoute=false);
		connect(ExtractionPump1.qvRef,Extract.y) annotation(Line(
			points={{250,-75},{245,-75},{221,-75},{216,-75}},
			color={0,0,127},
			thickness=0.0625));
		connect(mergingValve2.PipeIn2,ExtractionPump1.PumpOut) annotation(Line(
			points={{255,-15},{255,-20},{255,-65},{255,-70}},
			color={190,30,45},
			thickness=0.0625));
		
		if (usePowerCalcPump and CPPhasePump==1) then
		connect(FeedInPump.Grid1,FeedInPumpOut) annotation(Line(points=0));
		connect(ExtractionPump1.Grid1,ExtractionPumpOut) annotation(Line(points=0));
		end if;
		if usePowerCalcPump then
			PCP=FeedInPump.PCP + ExtractionPump1.PCP;
			ECP=FeedInPump.ECP + ExtractionPump1.ECP;
		end if;
		connect(measureHGSupply1.PipeIn,HeatGeneratorSupply1) annotation(Line(
			points={{-50,-170},{-55,-170},{-105,-170},{-110,-170}},
			color={190,30,45},
			thickness=0.0625));
		connect(HeatGeneratorReturn1,HeatGeneratorValve1.PipeOutRegulated) annotation(Line(
			points={{-110,-225},{-105,-225},{-60,-225},{-55,-225}},
			color={190,30,45}));
		connect(measureHGSupply1.qvMedium,HeatGeneratorValve1.qvRef) annotation(Line(
			points={{-45,-175},{-45,-180},{-45,-215},{-45,-220}},
			color={0,0,127},
			thickness=0.0625));
		connect(StorageDischargeIn.Pipe,HeatGeneratorValve1.PipeOutRemain) annotation(Line(
			points={{-70,-250},{-70,-245},{-70,-235},{-60,-235},{-55,-235}},
			color={190,30,45},
			thickness=0.0625));
		connect(DistrictHeatingValve1.PipeOutRegulated,ExtractionPump1.PumpIn) annotation(
			Line(
				points={{50,-215},{45,-215},{45,-110},{255,-110},{255,-85},{255,
				-80}},
				color={190,30,45}),
			__esi_AutoRoute=false);
		connect(mergingValve4.PipeOut,DistrictHeatingValve1.PipeIn) annotation(Line(
			points={{240,-220},{235,-220},{75,-220},{70,-220}},
			color={190,30,45}));
		connect(measureDHSupply.qvMedium,DistrictHeatingValve1.qvRef) annotation(Line(
			points={{60,-160},{60,-165},{60,-205},{60,-210}},
			color={0,0,127},
			thickness=0.0625));
		connect(HeatGeneratorSupply2,measureHGSupply2.PipeIn) annotation(Line(
			points={{-110,-120},{-105,-120},{-10,-120},{-5,-120}},
			color={190,30,45},
			thickness=0.0625));
		connect(mergingValve6.PipeIn1,measureHGSupply2.PipeOut) annotation(Line(
			points={{15,-160},{10,-160},{10,-120},{5,-120}},
			color={190,30,45},
			thickness=0.0625));
		connect(measureHGSupply1.PipeOut,mergingValve6.PipeIn2) annotation(Line(
			points={{-40,-170},{-35,-170},{10,-170},{15,-170}},
			color={190,30,45}));
		connect(mergingValve6.PipeOut,mergingValve5.PipeIn2) annotation(Line(
			points={{35,-165},{40,-165},{85,-165},{90,-165}},
			color={190,30,45}));
		connect(HeatGeneratorValve2.PipeIn,DistrictHeatingValve1.PipeOutRemain) annotation(Line(
			points={{10,-225},{15,-225},{45,-225},{50,-225}},
			color={190,30,45},
			thickness=0.0625));
		connect(HeatGeneratorValve2.PipeOutRemain,HeatGeneratorValve1.PipeIn) annotation(Line(
			points={{-10,-230},{-15,-230},{-30,-230},{-35,-230}},
			color={190,30,45}));
		connect(measureHGSupply2.qvMedium,HeatGeneratorValve2.qvRef) annotation(Line(
			points={{0,-125},{0,-130},{0,-210},{0,-215}},
			color={0,0,127},
			thickness=0.0625));
		connect(HeatGeneratorReturn2,HeatGeneratorValve2.PipeOutRegulated) annotation(Line(
			points={{-110,-195},{-105,-195},{-15,-195},{-15,-220},{-10,-220}},
			color={190,30,45}));
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
					points={{-249.4,-70.7},{-250,70}},
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
					points={{-300,73.3},{-298.4,-73.09999999999999}},
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
					extent={{223,1.9},{448.9,-137.9}}),
				Line(
					points={{-11.7,0},{11.6,0}},
					arrow={
						Arrow.Filled,Arrow.None},
					thickness=1.5,
					origin={-238.7,47.4},
					rotation=90),
				Line(
					points={{-11.7,0},{11.6,0}},
					arrow={
						Arrow.None,Arrow.Filled},
					thickness=1.5,
					origin={-289.7,46.6},
					rotation=90)}),
		Documentation(info="<HTML><HEAD>
<META http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\"> 
<TITLE>Hydraulic Switch</TITLE> 
<STYLE type=\"text/css\">
table>tbody>tr:hover,th{background-color:#edf1f3}html{font-size:90%}body,table{font-size:1rem}body{font-family:'Open Sans',Arial,sans-serif;color:#465e70}h1,h2{margin:1em 0 .6em;font-weight:600}p{margin-top:.3em;margin-bottom:.2em}table{border-collapse:collapse;margin:1em 0;width:100%;}tr{border:1px solid #beccd3}td,th{padding:.3em 1em; border-width: 1px; border-style: solid; border-color: rgb(190, 204, 211);}td{word-break:break-word}tr:nth-child(even){background-color:#fafafa}th{font-family:'Open Sans Semibold',Arial,sans-serif;font-weight:700;text-align:left;word-break:keep-all}.lib-wrap{width:70%}@media screen and (max-width:800px){.lib-wrap{width:100%}}td p{margin:.2em}
</STYLE>
  
<META name=\"GENERATOR\" content=\"MSHTML 11.00.10570.1001\"></HEAD> 
<BODY>
<H1>Hydraulic Switch with&nbsp;two heat generators</H1>
<HR>

<P>Distributes heat between Heat Generators, Heating System (Demand), 
 Bidirectional District Heating Station (HeatExchanger) and Thermal Storage.</P>
<P>Connection P2 with 2 heat generators&nbsp;in <A href=\"https://doi.org/10.1016/j.egyr.2021.08.085\">https://doi.org/10.1016/j.egyr.2021.08.085</A></P>
<DIV class=\"lib-wrap\">
<TABLE class=\"type\">
  <TBODY>
  <TR>
    <TH>Symbol:</TH>
    <TD colspan=\"3\"><IMG width=\"389\" height=\"261\" src=\"data:image/png;base64,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\"></TD></TR>
  <TR>
    <TH>Identifier:</TH>
    <TD colspan=\"3\">CoSES_Models.Distribution.HydraulicSwitch2HG</TD></TR>
  <TR>
    <TH>Version:</TH>
    <TD colspan=\"3\">1.0</TD></TR>
  <TR>
    <TH>File:</TH>
    <TD colspan=\"3\">HydraulicSwitch2HG.mo</TD></TR>
  <TR>
    <TH>Connectors:</TH>
    <TD>HeatExchangerIn</TD>
    <TD>HeatExchangerIn</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>HeatGeneratorSupply2</TD>
    <TD>HeatGeneratorSupply2</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>HeatGeneratorReturn2</TD>
    <TD>HeatGeneratorReturn2</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>HeatExchangerOut</TD>
    <TD>HeatExchangerOut</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>HeatGeneratorSupply1</TD>
    <TD>HeatGeneratorSupply1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>HeatGeneratorReturn1</TD>
    <TD>HeatGeneratorReturn1</TD>
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
    <TD>HeatGeneratorValve1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Valve for volume flow merging</TD>
    <TD>mergingValve5</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Measurement of pipe temperature and volume flow</TD>
    <TD>measureHGSupply1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Measurement of pipe temperature and volume flow</TD>
    <TD>measureDHSupply</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Controllable valve for volume flow distribution</TD>
    <TD>DistrictHeatingValve1</TD>
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
    <TH>&nbsp;</TH>
    <TD>Measurement of pipe temperature and volume flow</TD>
    <TD>measureHGSupply2</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Valve for volume flow merging</TD>
    <TD>mergingValve6</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Controllable valve for volume flow distribution</TD>
    <TD>HeatGeneratorValve2</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>Results:</TH>
    <TD>Volume Flow from/to District Heating &lt;0: Feed In; &gt;0:     
      Extraction</TD>
    <TD>qvDistrictHeating</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Volume Flow from/to Storage &lt;0: Charge; &gt;0: Discharge</TD>
    <TD>qvStorage</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Volume Flow from Heat Generator 1</TD>
    <TD>qvHeatGenerator1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Volume Flow from Heat Generator 2</TD>
    <TD>qvHeatGenerator2</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Volume Flow to Heat Consumption</TD>
    <TD>qvHeatConsumption</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Supply Temperature Heat Generator 1</TD>
    <TD>TSupplyHG1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Return Temperature Heat Generator 1</TD>
    <TD>TReturnHG1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Supply Temperature Heat Generator 2</TD>
    <TD>TSupplyHG2</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Return Temperature Heat Generator 2</TD>
    <TD>TReturnHG2</TD>
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
    <TD>Supplied Heat Power Heat Generator 1</TD>
    <TD>QHeatGenerator1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Supplied Heat Power Heat Generator 2</TD>
    <TD>QHeatGenerator2</TD>
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
end HydraulicSwitch2HG;
