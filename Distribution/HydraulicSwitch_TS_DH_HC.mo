// CP: 65001
// SimulationX Version: 4.2.3.69223
within CoSES_Models.Distribution;
model HydraulicSwitch_TS_DH_HC "HydraulicSwitch between thermal storage, district heating and heat consumption"
	GreenCity.Interfaces.Thermal.VolumeFlowOut HeatExchangerIn "HeatExchangerIn" annotation(Placement(
		transformation(extent={{140,40},{160,60}}),
		iconTransformation(extent={{-60,65},{-40,85}})));
	GreenCity.Interfaces.Thermal.VolumeFlowIn HeatExchangerOut "HeatExchangerOut" annotation(Placement(
		transformation(extent={{200,40},{220,60}}),
		iconTransformation(extent={{40,65},{60,85}})));
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
		VValve(displayUnit="m³")=VValve/4,
		QlossRate=QlossRate,
		TAmbient(displayUnit="K")=TAmbient,
		cpMed(displayUnit="J/(kg·K)")=cp,
		rhoMed=rho) annotation(Placement(transformation(extent={{50,-175},{30,-155}})));
	Modelica.Blocks.Sources.RealExpression FeedIn(y(
		quantity="Thermics.VolumeFlow",
		displayUnit="m³/s")=qvFeedIn) annotation(Placement(transformation(extent={{95,-50},{115,-30}})));
	GreenCity.Utilities.Thermal.MergingValve mergingValve2(
		VValve(displayUnit="m³")=VValve/4,
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
		VValve(displayUnit="m³")=VValve/4,
		QlossRate=QlossRate,
		TAmbient(displayUnit="K")=TAmbient,
		cpMed(displayUnit="J/(kg·K)")=cp,
		rhoMed=rho) annotation(Placement(transformation(extent={{180,-225},{200,-205}})));
	GreenCity.Utilities.Thermal.MergingValve mergingValve4(
		VValve(displayUnit="m³")=VValve/4,
		QlossRate=QlossRate,
		TAmbient(displayUnit="K")=TAmbient,
		cpMed(displayUnit="J/(kg·K)")=cp,
		rhoMed=rho) annotation(Placement(transformation(extent={{140,-230},{160,-210}})));
	GreenCity.Utilities.Thermal.MeasureThermal measureMixed annotation(Placement(transformation(extent={{55,-160},{65,-170}})));
	GreenCity.Utilities.Thermal.MeasureThermal measureDHSupply annotation(Placement(transformation(extent={{-45,-155},{-35,-165}})));
	GreenCity.Utilities.Thermal.DistributionValve DistrictHeatingValve annotation(Placement(transformation(extent={{-30,-230},{-50,-210}})));
	Modelica.Blocks.Sources.RealExpression Extract(y(
		quantity="Thermics.VolumeFlow",
		displayUnit="m³/s")=qvExtract) annotation(Placement(transformation(extent={{95,-85},{115,-65}})));
	GreenCity.Interfaces.Thermal.ExtractVolumeFlow StorageChargeIn annotation(Placement(transformation(extent={{180,-185},{200,-165}})));
	GreenCity.Interfaces.Thermal.ExtractVolumeFlow StorageDischargeIn annotation(Placement(transformation(
		origin={-80,-255},
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
		Real qvHeatConsumption(quantity="Thermics.VolumeFlow") "Volume Flow to Heat Consumption" annotation(Dialog(
			group="Volume Flow",
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
		qvStorage = -(qvDistrictHeating - measureDemandReturn.qvMedium);
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
		connect(StorageChargeIn.Pipe,FeedInValve.PipeOutRemain) annotation(Line(
			points={{180,-175},{175,-175},{140,-175},{135,-175}},
			color={190,30,45},
			thickness=0.0625));
		connect(StorageDischargeOut.Pipe,mergingValve1.PipeIn2) annotation(Line(
			points={{10,-240},{15,-240},{25,-240},{25,-170},{30,-170}},
			color={190,30,45}));
		connect(measureDHSupply.qvMedium,DistrictHeatingValve.qvRef) annotation(Line(
			points={{-40,-165},{-40,-170},{-40,-205},{-40,-210}},
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
			points={{-45,-160},{-50,-160},{-50,-120},{205,-120},{205,-80},{205,
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
			points={{-85,-265},{-85,-270},{-85,-275},{-15,-275},{-10,-275}},
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
		connect(mergingValve1.PipeIn1,measureDHSupply.PipeOut) annotation(Line(
			points={{30,-160},{25,-160},{-30,-160},{-35,-160}},
			color={190,30,45},
			thickness=0.0625));
		connect(DistrictHeatingValve.PipeOutRemain,StorageDischargeIn.Pipe) annotation(Line(
			points={{-50,-225},{-55,-225},{-80,-225},{-80,-240},{-80,-245}},
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
					points={{-250,23.3},{346.7,24.4}},
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
					points={{-296.7,-26.7},{346.7,-25.7}},
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
					points={{316.4,33.4},{339.7,33.4}},
					arrow={
						Arrow.None,Arrow.Filled},
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
<TITLE>HydraulicSwitch between thermal storage, district heating and heat 
consumption</TITLE> 
<STYLE type=\"text/css\">
table>tbody>tr:hover,th{background-color:#edf1f3}html{font-size:90%}body,table{font-size:1rem}body{font-family:'Open Sans',Arial,sans-serif;color:#465e70}h1,h2{margin:1em 0 .6em;font-weight:600}p{margin-top:.3em;margin-bottom:.2em}table{border-collapse:collapse;margin:1em 0;width:100%;}tr{border:1px solid #beccd3}td,th{padding:.3em 1em; border-width: 1px; border-style: solid; border-color: rgb(190, 204, 211);}td{word-break:break-word}tr:nth-child(even){background-color:#fafafa}th{font-family:'Open Sans Semibold',Arial,sans-serif;font-weight:700;text-align:left;word-break:keep-all}.lib-wrap{width:70%}@media screen and (max-width:800px){.lib-wrap{width:100%}}td p{margin:.2em}
</STYLE>
 
<META name=\"GENERATOR\" content=\"MSHTML 11.00.10570.1001\"></HEAD> 
<BODY>
<H1>HydraulicSwitch between thermal storage, district heating and heat 
consumption</H1>
<HR>

<P>Distributes heat between&nbsp;Heating System (Demand), Bidirectional District 
Heating Station (HeatExchanger) and Thermal Storage.</P>
<P>Connection P2 in <A 
href=\"https://doi.org/10.1016/j.egyr.2021.08.085\">https://doi.org/10.1016/j.egyr.2021.08.085</A></P>
<DIV class=\"lib-wrap\">
<TABLE class=\"type\">
  <TBODY>
  <TR>
    <TH>Symbol:</TH>
    <TD colspan=\"3\"><IMG width=\"287\" height=\"247\" src=\"data:image/png;base64,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\"></TD></TR>
  <TR>
    <TH>Identifier:</TH>
    <TD colspan=\"3\">CoSES_Models.Distribution.HydraulicSwitch_TS_DH_HC</TD></TR>
  <TR>
    <TH>Version:</TH>
    <TD colspan=\"3\">1.0</TD></TR>
  <TR>
    <TH>File:</TH>
    <TD colspan=\"3\">HydraulicSwitch_TS_DH_HC.mo</TD></TR>
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
    <TD>Volume Flow to Heat Consumption</TD>
    <TD>qvHeatConsumption</TD>
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
end HydraulicSwitch_TS_DH_HC;
