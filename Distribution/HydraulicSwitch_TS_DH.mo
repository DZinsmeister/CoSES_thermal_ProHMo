// CP: 65001
// SimulationX Version: 4.2.3.69223
within CoSES_Models.Distribution;
model HydraulicSwitch_TS_DH "HydraulicSwitch between thermal storage and district heating"
	GreenCity.Interfaces.Thermal.VolumeFlowOut HeatExchangerIn "HeatExchangerIn" annotation(Placement(
		transformation(extent={{140,40},{160,60}}),
		iconTransformation(extent={{-60,65},{-40,85}})));
	GreenCity.Interfaces.Thermal.VolumeFlowIn HeatExchangerOut "HeatExchangerOut" annotation(Placement(
		transformation(extent={{200,40},{220,60}}),
		iconTransformation(extent={{40,65},{60,85}})));
	GreenCity.Interfaces.Thermal.VolumeFlowIn StorageChargeReturn "StorageFlowOut" annotation(Placement(
		transformation(extent={{145,-130},{165,-110}}),
		iconTransformation(extent={{-310,-81.7},{-290,-61.7}})));
	GreenCity.Interfaces.Thermal.VolumeFlowOut StorageChargeFlow "StorageReturnIn" annotation(Placement(
		transformation(extent={{225,-150},{245,-130}}),
		iconTransformation(extent={{-260,-81.7},{-240,-61.7}})));
	GreenCity.Interfaces.Thermal.VolumeFlowIn StorageDischargeFlow "StorageReturnOut" annotation(Placement(
		transformation(extent={{105,-130},{125,-110}}),
		iconTransformation(extent={{240,-81.7},{260,-61.7}})));
	GreenCity.Interfaces.Thermal.VolumeFlowOut StorageDischargeReturn "StorageFlowIn" annotation(Placement(
		transformation(extent={{180,-150},{200,-130}}),
		iconTransformation(extent={{290,-81.7},{310,-61.7}})));
	GreenCity.Interfaces.Electrical.LV1Phase FeedInPumpOut if usePowerCalcPump "Electrical Low-Voltage AC Single-Phase Connector" annotation(Placement(
		transformation(extent={{285,-10},{305,10}}),
		iconTransformation(extent={{240,65},{260,85}})));
	GreenCity.Interfaces.Electrical.LV1Phase ExtractionPumpOut if usePowerCalcPump "Electrical Low-Voltage AC Single-Phase Connector" annotation(Placement(
		transformation(extent={{285,-40},{305,-20}}),
		iconTransformation(extent={{190,65},{210,85}})));
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
	Modelica.Blocks.Sources.RealExpression FeedIn(y(
		quantity="Thermics.VolumeFlow",
		displayUnit="m³/s")=qvFeedIn) annotation(Placement(transformation(extent={{95,-50},{115,-30}})));
	GreenCity.Utilities.Thermal.MergingValve mergingValve2(
		VValve(displayUnit="m³")=VValve,
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
		origin={210,-50},
		extent={{-10,10},{10,-10}},
		rotation=-90)));
	Modelica.Blocks.Sources.RealExpression Extract(y(
		quantity="Thermics.VolumeFlow",
		displayUnit="m³/s")=qvExtract) annotation(Placement(transformation(extent={{95,-85},{115,-65}})));
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
		qvStorage = -(qvFeedIn + qvExtract);
		if qvStorage < 0 then
			TSupplyTS = StorageChargeFlow.T;
			TReturnTS = StorageChargeReturn.T;
		else
			TSupplyTS = StorageDischargeFlow.T;
			TReturnTS = StorageDischargeReturn.T;
		end if;
		QThermalStorage = rho * cp * qvStorage * (TSupplyTS - TReturnTS);
	equation
		connect(measureThermal3.PipeOut,HeatExchangerIn) annotation(
			Line(
				points={{150,30},{150,35},{150,50}},
				color={190,30,45}),
			__esi_AutoRoute=false);
		connect(DHFeedIn_Extract.PipeIn,HeatExchangerOut) annotation(
			Line(
				points={{210,-40},{210,30},{210,50}},
				color={190,30,45},
				thickness=0.0625),
			__esi_AutoRoute=false);
		connect(measureThermal3.PipeIn,mergingValve2.PipeOut) annotation(Line(
			points={{150,20},{150,15},{150,10},{150,5}},
			color={190,30,45},
			thickness=0.0625));
		connect(mergingValve2.PipeIn1,FeedInPump.PumpOut) annotation(Line(
			points={{145,-15},{145,-20},{145,-30},{140,-30},{140,-35}},
			color={190,30,45},
			thickness=0.0625));
		connect(FeedIn.y,FeedInPump.qvRef) annotation(Line(
			points={{116,-40},{121,-40},{130,-40},{135,-40}},
			color={0,0,127},
			thickness=0.0625));
		connect(ExtractionPump1.qvRef,Extract.y) annotation(Line(
			points={{150,-75},{145,-75},{121,-75},{116,-75}},
			color={0,0,127},
			thickness=0.0625));
		connect(mergingValve2.PipeIn2,ExtractionPump1.PumpOut) annotation(Line(
			points={{155,-15},{155,-20},{155,-65},{155,-70}},
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
		connect(ExtractionPump1.PumpIn,StorageChargeReturn) annotation(
			Line(
				points={{155,-80},{155,-85},{155,-120}},
				color={190,30,45},
				thickness=0.0625),
			__esi_AutoRoute=false);
		connect(StorageDischargeFlow,FeedInPump.PumpIn) annotation(Line(
			points={{115,-120},{120,-120},{140,-120},{140,-50},{140,-45}},
			color={190,30,45},
			thickness=0.0625));
		connect(StorageDischargeReturn,DHFeedIn_Extract.PipeOutRegulated) annotation(Line(
			points={{190,-140},{195,-140},{205,-140},{205,-65},{205,-60}},
			color={190,30,45}));
		connect(DHFeedIn_Extract.PipeOutRemain,StorageChargeFlow) annotation(Line(
			points={{215,-60},{215,-65},{215,-140},{230,-140},{235,-140}},
			color={190,30,45}));
		connect(DHFeedIn_Extract.qvRef,FeedIn.y) annotation(Line(
			points={{200,-50},{195,-50},{121,-50},{121,-40},{116,-40}},
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
					points={{-252,23.3},{251.3,23.3}},
					color={139,0,0},
					thickness=8),
				Line(
					points={{-249.4,-70.7},{-249.4,26}},
					color={139,0,0},
					thickness=8),
				Line(
					points={{249.5,-70.09999999999999},{249.5,26.6}},
					color={139,0,0},
					thickness=8),
				Line(
					points={{-296.7,-26.7},{303.3,-26.7}},
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
					extent={{224.9,3.3},{450.8,-136.5}})}),
		Documentation(info="<HTML><HEAD>
<META http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\"> 
<TITLE>HydraulicSwitch between thermal storage and district heating</TITLE> 
<STYLE type=\"text/css\">
table>tbody>tr:hover,th{background-color:#edf1f3}html{font-size:90%}body,table{font-size:1rem}body{font-family:'Open Sans',Arial,sans-serif;color:#465e70}h1,h2{margin:1em 0 .6em;font-weight:600}p{margin-top:.3em;margin-bottom:.2em}table{border-collapse:collapse;margin:1em 0;width:100%;}tr{border:1px solid #beccd3}td,th{padding:.3em 1em; border-width: 1px; border-style: solid; border-color: rgb(190, 204, 211);}td{word-break:break-word}tr:nth-child(even){background-color:#fafafa}th{font-family:'Open Sans Semibold',Arial,sans-serif;font-weight:700;text-align:left;word-break:keep-all}.lib-wrap{width:70%}@media screen and (max-width:800px){.lib-wrap{width:100%}}td p{margin:.2em}
</STYLE>
 
<META name=\"GENERATOR\" content=\"MSHTML 11.00.10570.1001\"></HEAD> 
<BODY>
<H1>HydraulicSwitch between thermal storage and district heating</H1>
<HR>

<P>Distributes heat between Bidirectional District Heating Station 
(HeatExchanger) and Thermal Storage.</P>
<P>Connection P5 in <A 
href=\"https://doi.org/10.1016/j.egyr.2021.08.085\">https://doi.org/10.1016/j.egyr.2021.08.085</A></P>
<DIV class=\"lib-wrap\">
<TABLE class=\"type\">
  <TBODY>
  <TR>
    <TH>Symbol:</TH>
    <TD colspan=\"3\"><IMG width=\"218\" height=\"247\" src=\"data:image/png;base64,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\"></TD></TR>
  <TR>
    <TH>Identifier:</TH>
    <TD colspan=\"3\">CoSES_Models.Distribution.HydraulicSwitch_TS_DH</TD></TR>
  <TR>
    <TH>Version:</TH>
    <TD colspan=\"3\">1.0</TD></TR>
  <TR>
    <TH>File:</TH>
    <TD colspan=\"3\">HydraulicSwitch_TS_DH.mo</TD></TR>
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
    <TD>Volume flow generation and electrical power calculation</TD>
    <TD>FeedInPump</TD>
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
    <TD>Set output signal to a time varying Real expression</TD>
    <TD>Extract</TD>
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
			__esi_Solver(
				bSplitCodeGen=false,
				typename="CVODE"),
			__esi_MinInterval="9.999999999999999e-10",
			__esi_AbsTolerance="1e-6"));
end HydraulicSwitch_TS_DH;
