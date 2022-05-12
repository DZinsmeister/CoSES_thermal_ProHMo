// CP: 65001
// SimulationX Version: 4.2.3.69223
within CoSES_Models.Distribution;
model HydraulicSwitch_TS_DH_HG "HydraulicSwitch between thermal storage, district heating and heat generatrion"
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
	GreenCity.Utilities.Thermal.DistributionValve FeedInValve annotation(Placement(transformation(extent={{115,-175},{135,-155}})));
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
	GreenCity.Interfaces.Thermal.ExtractVolumeFlow StorageChargeIn annotation(Placement(transformation(extent={{180,-180},{200,-160}})));
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
		Real QHeatGenerator(quantity="Basics.Power") "Supplied Heat Power Heat Generator" annotation(Dialog(
			group="Heat Power",
			tab="Results",
			visible=false));
		Real QDistrictHeating(quantity="Basics.Power") "Supplied/Abstracted Heat Power District Heating" annotation(Dialog(
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
		qvStorage = -(measureHGSupply.qvMedium + qvDistrictHeating);
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
		connect(measureThermal3.PipeIn,mergingValve2.PipeOut) annotation(Line(
			points={{150,20},{150,15},{150,10},{150,5}},
			color={190,30,45},
			thickness=0.0625));
		connect(FeedInValve.PipeOutRegulated,FeedInPump.PumpIn) annotation(Line(
			points={{135,-160},{140,-160},{140,-50},{140,-45}},
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
			points={{180,-170},{175,-170},{140,-170},{135,-170}},
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
		connect(mergingValve1.PipeOut,measureMixed.PipeIn) annotation(Line(
			points={{50,-165},{55,-165},{50,-165},{55,-165}},
			color={190,30,45}));
		connect(measureDHSupply.PipeIn,DHFeedIn_Extract.PipeOutRegulated) annotation(Line(
			points={{-45,-155},{-50,-155},{-50,-117.7},{205,-117.7},{205,-80},{205,
			-75}},
			color={190,30,45},
			thickness=0.0625));
		connect(FeedIn.y,FeedInValve.qvRef) annotation(Line(
			points={{116,-40},{121,-40},{125,-40},{125,-150},{125,-155}},
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
				points={{200,-280},{240,-280},{240,-175},{200,-175}},
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
		connect(DHFeedIn_Extract.PipeOutRemain,mergingValve4.PipeIn1) annotation(Line(
			points={{215,-75},{215,-80},{215,-215},{165,-215},{160,-215}},
			color={190,30,45}));
		connect(FeedInValve.PipeIn,measureMixed.PipeOut) annotation(Line(
			points={{115,-165},{110,-165},{70,-165},{65,-165}},
			color={190,30,45},
			thickness=0.0625));
	annotation(
		__esi_measureDemandReturn(
			PipeOut(viewinfo[0](
				tabGroupAlignment=589834,
				typename="ModelInfo")),
			PipeIn(viewinfo[0](
				tabGroupAlignment=589834,
				typename="ModelInfo")),
			FromPipe(Pipe(viewinfo[0](
				tabGroupAlignment=589834,
				typename="ModelInfo"))),
			ToPipe(Pipe(viewinfo[0](
				tabGroupAlignment=589834,
				typename="ModelInfo")))),
		__esi_measureDemandSupply(
			PipeOut(viewinfo[0](
				tabGroupAlignment=589834,
				typename="ModelInfo")),
			PipeIn(viewinfo[0](
				tabGroupAlignment=589834,
				typename="ModelInfo")),
			FromPipe(Pipe(viewinfo[0](
				tabGroupAlignment=589834,
				typename="ModelInfo"))),
			ToPipe(Pipe(viewinfo[0](
				tabGroupAlignment=589834,
				typename="ModelInfo")))),
		statAnaRefVar(flags=2),
		__esi_protocols(transient={
														Protocol(var=time),
														Protocol(var=statAnaRefVar)}),
		__esi_solverOptions(
			solver="CVODE",
			typename="ExternalCVODEOptionData"),
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
					points={{-349,24.3},{250,23.3}},
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
					points={{-346.7,-25.7},{303.3,-26.7}},
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
					points={{-332,-16.1},{-308.7,-16.1}},
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
					extent={{215.2,6.5},{441.1,-133.3}})}),
		Documentation(info="<HTML><HEAD>
<META http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\"> 
<TITLE>HydraulicSwitch between thermal storage, district heating and heat 
generatrion</TITLE> 
<STYLE type=\"text/css\">
table>tbody>tr:hover,th{background-color:#edf1f3}html{font-size:90%}body,table{font-size:1rem}body{font-family:'Open Sans',Arial,sans-serif;color:#465e70}h1,h2{margin:1em 0 .6em;font-weight:600}p{margin-top:.3em;margin-bottom:.2em}table{border-collapse:collapse;margin:1em 0;width:100%;}tr{border:1px solid #beccd3}td,th{padding:.3em 1em; border-width: 1px; border-style: solid; border-color: rgb(190, 204, 211);}td{word-break:break-word}tr:nth-child(even){background-color:#fafafa}th{font-family:'Open Sans Semibold',Arial,sans-serif;font-weight:700;text-align:left;word-break:keep-all}.lib-wrap{width:70%}@media screen and (max-width:800px){.lib-wrap{width:100%}}td p{margin:.2em}
</STYLE>
 
<META name=\"GENERATOR\" content=\"MSHTML 11.00.10570.1001\"></HEAD> 
<BODY>
<H1>HydraulicSwitch between thermal storage, district heating and heat 
generatrion</H1>
<HR>

<P>Distributes heat between Heat Generator, Bidirectional District Heating 
Station (HeatExchanger) and Thermal Storage.</P>
<P>Connection P3 in <A 
href=\"https://doi.org/10.1016/j.egyr.2021.08.085\">https://doi.org/10.1016/j.egyr.2021.08.085</A></P>
<DIV class=\"lib-wrap\">
<TABLE class=\"type\">
  <TBODY>
  <TR>
    <TH>Symbol:</TH>
    <TD colspan=\"3\"><IMG width=\"315\" height=\"247\" src=\"data:image/png;base64,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\"></TD></TR>
  <TR>
    <TH>Identifier:</TH>
    <TD colspan=\"3\">CoSES_Models.Distribution.HydraulicSwitch_TS_DH_HG</TD></TR>
  <TR>
    <TH>Version:</TH>
    <TD colspan=\"3\">1.0</TD></TR>
  <TR>
    <TH>File:</TH>
    <TD colspan=\"3\">HydraulicSwitch_TS_DH_HG.mo</TD></TR>
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
			__esi_MinInterval="9.999999999999999e-10",
			__esi_AbsTolerance="1e-6"));
end HydraulicSwitch_TS_DH_HG;
