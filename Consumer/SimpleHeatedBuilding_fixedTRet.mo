// CP: 65001
// SimulationX Version: 4.2.3.69223
within CoSES_Models.Consumer;
model SimpleHeatedBuilding_fixedTRet "3-zone-building with fixed return temperature"
	import GreenCity.Utilities.BuildingData.ParameterSelectionSCB.Roof.RoofType;
	import GreenCity.Utilities.BuildingData.ParameterSelectionSCB.Basement.CellarType;
	import GreenCity.Utilities.BuildingData.ParameterSelectionSCB.Windows.WindowType;
	import GreenCity.Utilities.BuildingData.ParameterSelectionSCB.WallType.Type;
	import GreenCity.Utilities.BuildingData.ParameterSelectionSCB.AgeOfBuilding.BA;
	import GreenCity.Utilities.BuildingData.ParameterSelectionSCB.BuildingType.BuildType;
	import GreenCity.Utilities.BuildingData.ParameterSelectionSCB.AgeOfWindows.BA;
	import GreenCity.BuildingAndConsumers.*;
	import GreenCity.*;
	output Modelica.Blocks.Interfaces.RealOutput qv_Ref(
		quantity="Hydraulics.Flow",
		displayUnit="m³/h") "Demanded volume flow of heating medium" annotation(Placement(
		transformation(extent={{-110,-200},{-90,-180}}),
		iconTransformation(
			origin={-100,-200},
			extent={{15,15},{-15,-15}},
			rotation=90)));
	output Modelica.Blocks.Interfaces.RealOutput TZone[3](
		quantity="Thermics.Temp",
		displayUnit="K")={cellar.TZone,livingZone.TZone,roof.TZone} "Zone temperature of Cellar, living area and roof" annotation(Placement(
		transformation(extent={{-60,85},{-40,105}}),
		iconTransformation(
			origin={-50,-200},
			extent={{-15,-15},{15,15}},
			rotation=-90)));
	protected
		parameter Real p_Floor=1.33 "Correction coefficient for entire floor area";
		parameter Real AN(
			quantity="Geometry.Area",
			displayUnit="m²")=0.32*4*cRH/2.5*ALH "Usable building area";
		parameter Real AZone(
			quantity="Geometry.Area",
			displayUnit="m²")=ALH/nFloors*p_Floor "Floor area as base area";
		parameter Real AE(
			quantity="Geometry.Area",
			displayUnit="m²")=AZone+2*(LivingAreaALongWall+LivingAreaAShortWall)+n_Keller*2*(cellarALongWall+cellarAShortWall)+2*(roofAShortWall+roofALongWall) "Heat transmitting enclosure surface";
		parameter Real Ve(
			quantity="Geometry.Volume",
			displayUnit="m³")=cellarAZone*min(cellarType.iCellar,1)*cellarHZone+LivingAreaAZone*nFloors*cRH+roofAZone*2/3*roofHZone "heated building volume";
		parameter Real cellarAZone(
			quantity="Geometry.Area",
			displayUnit="m²")=if cellarType.iCellar==3 then 0.5 * AZone else AZone "Heated base area of the cellar";
		parameter Real cellarHZone(
			quantity="Geometry.Length",
			displayUnit="m")=cRH "Clear hight of the cellar";
		parameter Real cellarHZoneOutside(
			quantity="Geometry.Length",
			displayUnit="m")=cRH/0.86 "Total hight of the cellar";
		parameter Real cellarAShortWall(
			quantity="Geometry.Area",
			displayUnit="m²")=(if cellarType.iCellar==3 then 0.5 else 1) * lengthShortWall*cellarHZoneOutside "Surface of the short wall of the cellar";
		parameter Real cellarALongWall(
			quantity="Geometry.Area",
			displayUnit="m²")=(if cellarType.iCellar==3 then 0.5 else 1) * lengthLongWall*cellarHZoneOutside "Surface of the long wall of the cellar";
		parameter Boolean cellarHeat=if (cellarType.iCellar==3 or cellarType.iCellar==4) then true else false "cellar heated or not";
		parameter Real cellarTRef(
			quantity="Thermics.Temp",
			displayUnit="K")=if (cellarType.iCellar==1 or cellarType.iCellar==2) then 15+273.15 elseif cellarType.iCellar==3 then 18+273.15 else 21+273.15 "Cellar: required temperature (if heated: 21°C, partly heated: 18°C, unheated 15°C)";
		parameter Real LivingAreaAZone(
			quantity="Geometry.Area",
			displayUnit="m²")=AZone "Base area of the living zone";
		parameter Real LivingAreaHZone=cRH*nFloors "Height of zone";
		parameter Real LivingAreaHZoneOutside=cRH/0.86*nFloors;
		parameter Real LivingAreaAShortWall(
			quantity="Geometry.Area",
			displayUnit="m²")=lengthShortWall*LivingAreaHZoneOutside "Area";
		parameter Real LivingAreaAWindows(
			quantity="Geometry.Area",
			displayUnit="m²")=ALH*pWindows "Total window surface of the living zone";
		parameter Real LivingAreaAWindowsShortWall(
			quantity="Geometry.Area",
			displayUnit="m²")=if buildingType.iBuild==1 then LivingAreaAShortWall/(2*LivingAreaAShortWall+2*LivingAreaALongWall)*LivingAreaAWindows else LivingAreaAShortWall*pWindowsNonRes "Window surface area of boundary 2";
		parameter Real LivingAreaAShortWallNet(
			quantity="Geometry.Area",
			displayUnit="m²")=LivingAreaAShortWall-LivingAreaAWindowsShortWall "Surface area of boundary 2";
		parameter Real LivingAreaALongWall(
			quantity="Geometry.Area",
			displayUnit="m²")=lengthLongWall*LivingAreaHZoneOutside "Area";
		parameter Real LivingAreaAWindowsLongWall(
			quantity="Geometry.Area",
			displayUnit="m²")=if buildingType.iBuild==1 then LivingAreaALongWall/(2*LivingAreaAShortWall+2*LivingAreaALongWall)*LivingAreaAWindows else LivingAreaALongWall*pWindowsNonRes "Window surface area of boundary 1";
		parameter Real LivingAreaALongWallNet(
			quantity="Geometry.Area",
			displayUnit="m²")=LivingAreaALongWall-LivingAreaAWindowsLongWall "Surface area of boundary 1";
		parameter Real pWindowsNonRes=0.3 "Percentage of Window surface on non-residential buildings";
		parameter Real pWindows(
			quantity="Basics.RelMagnitude",
			displayUnit="-")=if buildingType.iBuild==1 then
																												if nAp==1 then
																												if flanking==0 then
																												if buildingAge.iBA==1 then 0.173
															elseif buildingAge.iBA==2 then 0.200
		elseif buildingAge.iBA==3 then 0.215
		elseif buildingAge.iBA==4 then 0.220
		elseif buildingAge.iBA==5 then 0.196
		else 0.195
		elseif flanking==1 then
		if buildingAge.iBA==1 then 0.180
		elseif buildingAge.iBA==2 then 0.179
		elseif buildingAge.iBA==3 then 0.200
		elseif buildingAge.iBA==4 then 0.215
		elseif buildingAge.iBA==5 then 0.205
		else 0.199
		else
		if buildingAge.iBA==1 then 0.202
		elseif buildingAge.iBA==2 then 0.153
		elseif buildingAge.iBA==3 then 0.205
		elseif buildingAge.iBA==4 then 0.200
		elseif buildingAge.iBA==5 then 0.211
		else 0.201
		else
		if flanking==0 then
		if buildingAge.iBA==1 then 0.168
		elseif buildingAge.iBA==2 then 0.184
		elseif buildingAge.iBA==3 or buildingAge.iBA==4 then 0.177
		elseif buildingAge.iBA==5 then 0.174
		else 0.145
		elseif flanking==1 then
		if buildingAge.iBA==1 then 0.166
		elseif buildingAge.iBA==2 then 0.155
		elseif buildingAge.iBA==3 then 0.181
		elseif buildingAge.iBA==4 then 0.216
		elseif buildingAge.iBA==5 then 0.173
		else 0.182
		else
		if buildingAge.iBA==1 then 0.174
		elseif buildingAge.iBA==2 then 0.178
		elseif buildingAge.iBA==3 then 0.188
		elseif buildingAge.iBA==4 then 0.198
		elseif buildingAge.iBA==5 then 0.168
		else 0.186 
		else /*Non-residential building*/ 0.3 "Fensterflächenfaktor (bezogen auf die Zonengrundfläche)";
		parameter Real ceilingThickness(
			quantity="Geometry.Length",
			displayUnit="m")=if (roofType.iRoof==1 or roofType.iRoof==2) then ceilingThicknessg else ceilingThicknessu "upper ceiling: actual thickness";
		parameter Real ceilingRho(
			quantity="Basics.Density",
			displayUnit="kg/m³")=if (roofType.iRoof==1 or roofType.iRoof==2) then ceilingRhog else ceilingRhou "upper ceiling: actual density";
		parameter Real ceilingCp(
			quantity="Thermics.SpecHeatCapacity",
			displayUnit="J/(kg*K)")=if (roofType.iRoof==1 or roofType.iRoof==2) then ceilingCpg else ceilingCpu "upper ceiling: actual heat capacity";
		parameter Real ceilingU(
			quantity="Thermics.HeatTransmCoeff",
			displayUnit="W/(m²K)")=if (roofType.iRoof==1 or roofType.iRoof==2) then ceilingUg else ceilingUu "upper ceiling: actual heat transmission coefficient";
		parameter Integer livingZoneContactBound5(quantity="Basics.Unitless")=if cellarType.iCellar==1 then 0 else 3 "Boundary 5 is connected to: '0'-Ambience, '1,2,3 ...-Zone 1,2,3 ...";
		parameter Boolean livingZoneGroundcontactBound5=if cellarType.iCellar==1 then true else false "Boundary 5 has contact to ground";
		parameter Real roofAZone(
			quantity="Geometry.Area",
			displayUnit="m²")=AZone*n_Dach "Area";
		parameter Real roofHZone(
			quantity="Geometry.Length",
			displayUnit="m")=if roofType.iRoof==1 then 0.5 else cRH "Height of zone";
		parameter Real pRoof=if roofType.iRoof==1 then 1.33 elseif roofType.iRoof==2 then 1.33 elseif roofType.iRoof==3 then 0.75 else 1.5;
		parameter Real pDormers=if dormers then 1.3 else 1;
		parameter Real roofAShortWall(
			quantity="Geometry.Area",
			displayUnit="m²")=roofHZone/0.86*lengthShortWall*0.5 "Area";
		parameter Real roofAShortWallNet(
			quantity="Geometry.Area",
			displayUnit="m²")=roofAShortWall-roofAWindowsShortWall "Surface area of boundary 2";
		parameter Real roofALongWall(
			quantity="Geometry.Area",
			displayUnit="m²")=roofAZone*pRoof*pDormers*0.5 "Area";
		parameter Real roofALongWallNet(
			quantity="Geometry.Area",
			displayUnit="m²")=roofALongWall-roofAWindowsLongWall "Surface area of boundary 1";
		parameter Real roofAWindowsShortWall(
			quantity="Geometry.Area",
			displayUnit="m²")=if buildingType.iBuild==1 then 0 else pWindowsNonRes * roofAShortWall "Area";
		parameter Real roofAWindowsLongWall(
			quantity="Geometry.Area",
			displayUnit="m²")=if buildingType.iBuild==1 then
		if roofType.iRoof==1 then 0 else pWindows*roofAZone/2
		else pWindowsNonRes * roofALongWall "Window surface area of boundary 1";
		parameter Real roofUU(
			quantity="Thermics.HeatTransmCoeff",
			displayUnit="W/(m²K)")=if buildingType.iBuild==1 then
		if roofConstruction.iType==1 then
		if buildingAge.iBA==1 then 1.3
		elseif buildingAge.iBA==2 then 1.3
		elseif buildingAge.iBA>=3 and buildingAge.iBA<=5 then 1.4
		elseif buildingAge.iBA==6 then 0.5
		elseif buildingAge.iBA==7 then 0.4
		elseif buildingAge.iBA==8 then 0.3
		elseif buildingAge.iBA>=9 and buildingAge.iBA<=11 then 0.3
		else 0.2
		elseif roofConstruction.iType==2 then
		if buildingAge.iBA==1 then 2.6
		elseif buildingAge.iBA==2 then 2.6
		elseif buildingAge.iBA==3 or buildingAge.iBA==4 then 1.4
		elseif buildingAge.iBA==5 then 0.8
		elseif buildingAge.iBA==6 then 0.5
		elseif buildingAge.iBA==7 then 0.4
		elseif buildingAge.iBA>=8 and buildingAge.iBA<=11 then 0.3
		else 0.2
		else
		if buildingAge.iBA==1 then (2.1+2.6)/2
		elseif buildingAge.iBA>=2 and buildingAge.iBA<=4 then (2.1+1.4)/2
		elseif buildingAge.iBA==5 then 0.7
		elseif buildingAge.iBA==6 then 0.5
		elseif buildingAge.iBA==7 then 0.4
		elseif buildingAge.iBA>=8 and buildingAge.iBA<=11 then 0.3
		else 0.2 
		else
		if roofConstruction.iType==1 then
		if buildingAge.iBA<=4 then 2.1
		elseif buildingAge.iBA==5 then 0.6
		elseif buildingAge.iBA==6 then 0.5
		elseif buildingAge.iBA==7 then 0.4
		elseif buildingAge.iBA==8 then 0.3
		elseif buildingAge.iBA==9 or buildingAge.iBA==10 then 0.28
		elseif buildingAge.iBA==11 then  0.24
		elseif buildingAge.iBA==12 or buildingAge.iBA==13 then 0.2
		else 0.3
		elseif roofConstruction.iType==2 then
		if buildingAge.iBA==1 then 2.6
		elseif buildingAge.iBA>=2 and buildingAge.iBA<=4 then 1.4
		elseif buildingAge.iBA==5 then 0.8
		elseif buildingAge.iBA==6 then 0.5
		elseif buildingAge.iBA==7 then 0.4
		elseif buildingAge.iBA==8 then 0.3
		elseif buildingAge.iBA==9 or buildingAge.iBA==10 then 0.28
		elseif buildingAge.iBA==11 then  0.24
		elseif buildingAge.iBA==12 or buildingAge.iBA==13 then 0.2
		else 0.2
		else
		if buildingAge.iBA==1 then (2.1+2.6)/2
		elseif buildingAge.iBA>=2 and buildingAge.iBA<=4 then (2.1+1.4)/2
		elseif buildingAge.iBA==5 then (0.6+0.8)/2
		elseif buildingAge.iBA==6 then 0.5
		elseif buildingAge.iBA==7 then 0.4
		elseif buildingAge.iBA==8 then 0.3
		elseif buildingAge.iBA==9 or buildingAge.iBA==10 then 0.28
		elseif buildingAge.iBA==11 then  0.24
		elseif buildingAge.iBA==12 or buildingAge.iBA==13 then 0.2
		else 0.25 "Roof: heat transmission coefficient at original state";
		parameter Real roofU(
			quantity="Thermics.HeatTransmCoeff",
			displayUnit="W/(m²K)")=(1-roofInsA)*roofUU+roofInsA*1/(roofInsul/0.04+1/roofUU) "Roof: actual U-value (regarding additional insulation)";
		parameter Real roofThicknessU(
			quantity="Geometry.Length",
			displayUnit="m")=if roofConstruction.iType==1 then
		if buildingAge.iBA>=1 and buildingAge.iBA<=5  then 0.26
		elseif buildingAge.iBA==6 then 0.14
		elseif buildingAge.iBA==7 then 0.18
		else 0.18
		elseif roofConstruction.iType==2 then
		if buildingAge.iBA==1 or buildingAge.iBA==2 then 0.26
		elseif buildingAge.iBA==3 or buildingAge.iBA==4 then 0.10
		elseif buildingAge.iBA==5 then 0.11
		elseif buildingAge.iBA==6 then 0.14
		elseif buildingAge.iBA==7 then 0.18
		else 0.18
		else 
		if buildingAge.iBA==1 or buildingAge.iBA==2 then 0.26
		elseif buildingAge.iBA==3 or buildingAge.iBA==4 then 0.18
		elseif buildingAge.iBA==5 then 0.185
		elseif buildingAge.iBA==6 then 0.14
		elseif buildingAge.iBA==7 then 0.18
		else 0.18 "Roof: Thickness at original state";
		parameter Real roofThickness(
			quantity="Geometry.Length",
			displayUnit="m")=roofThicknessU+roofInsul "Roof: actual thickness";
		parameter Real roofRhoU(
			quantity="Basics.Density",
			displayUnit="kg/m³")=if roofConstruction.iType==1 then
		if buildingAge.iBA==1 or buildingAge.iBA==2 then 1122
		elseif buildingAge.iBA>=3 and buildingAge.iBA<=5 then 509
		elseif buildingAge.iBA==6 then 450
		elseif buildingAge.iBA==7 then 418
		else 418
		elseif roofConstruction.iType==2 then
		if buildingAge.iBA==1 or buildingAge.iBA==2 then 350
		elseif buildingAge.iBA==3 or buildingAge.iBA==4 then 1136
		elseif buildingAge.iBA==5 then 478
		elseif buildingAge.iBA==6 then 450
		else 418
		else 
		if buildingAge.iBA==1 or buildingAge.iBA==2 then (1122+350)/2
		elseif buildingAge.iBA==3 or buildingAge.iBA==4 then (509+1136)/2
		elseif buildingAge.iBA==5 then (509+478)/2
		elseif buildingAge.iBA==6 then 450
		else 418 "Roof: density at original state";
		parameter Real roofRho(
			quantity="Basics.Density",
			displayUnit="kg/m³")=(roofThicknessU*roofRhoU+roofInsA*roofInsul*100)/roofThickness "Roof: actual density";
		parameter Real roofCpU(
			quantity="Thermics.SpecHeatCapacity",
			displayUnit="J/(kg*K)")=if roofConstruction.iType==1 then
		if buildingAge.iBA==1 or buildingAge.iBA==2 then 1129
		elseif buildingAge.iBA>=3 and buildingAge.iBA<=5 then 1305
		elseif buildingAge.iBA==6 then 1860
		elseif buildingAge.iBA==7 then 1773
		else 1773
		elseif roofConstruction.iType==2 then
		if buildingAge.iBA==1 or buildingAge.iBA==2 then 1665
		elseif buildingAge.iBA==3 or buildingAge.iBA==4 then 1354
		elseif buildingAge.iBA==5 then 1938
		elseif buildingAge.iBA==6 then 1860
		elseif buildingAge.iBA==7 then 1773
		else 1773
		else 
		if buildingAge.iBA==1 or buildingAge.iBA==2 then (1129+1665)/2
		elseif buildingAge.iBA==3 or buildingAge.iBA==4 then (1305+1354)/2
		elseif buildingAge.iBA==5 then (1305+1938)/2
		elseif buildingAge.iBA==6 then 1860
		elseif buildingAge.iBA==7 then 1773
		else 1773 "Roof: heat capacity at original state";
		parameter Real roofCp(
			quantity="Thermics.SpecHeatCapacity",
			displayUnit="J/(kg*K)")=(roofThicknessU*roofCpU+roofInsA*roofInsul*0.9)/roofThickness "Roof: actual heat capacity";
		parameter Real roofAirLeak(
			quantity="Basics.Gradient",
			displayUnit="1/s")=if roofType.iRoof==1 then 4/3600 else 0.6/3600 "Air exchange rate caused by leakage in heated zones";
		parameter Boolean roofHeat=if (roofType.iRoof==3 or roofType.iRoof==4) then true else false "Roof: heated or not";
		parameter Real roofAlphaInclination(
			quantity="Geometry.Angle",
			displayUnit="rad")=if roofType.iRoof==1 then 15*(2*3.14159)/360 else 35*(2*3.14159)/360 "Roof: inclination angle of the slopes";
		parameter Real roofTZoneInit(
			quantity="Thermics.Temp",
			displayUnit="K")=if(roofType.iRoof==1 or roofType.iRoof==2)then 15+273.15 elseif(roofType.iRoof==3)then 18+273.15 else 21+273.15 "Roof: initial temperature";
		parameter Real roofDBound1(
			quantity="Geometry.Length",
			displayUnit="m")=if roofType.iRoof==1 then ceilingThicknessg else roofThickness "Roof: thickness of the slopes";
		parameter Real roofRhoBound1(
			quantity="Basics.Density",
			displayUnit="kg/m³")=if roofType.iRoof==1 then ceilingRhog else roofRho "Roof: density of the slopes";
		parameter Real roofCpBound1(
			quantity="Thermics.SpecHeatCapacity",
			displayUnit="J/(kg*K)")=if roofType.iRoof==1 then ceilingCpg else roofCp "Roof: heat capacity of the slopes";
		parameter Real roofUBound1(
			quantity="Thermics.HeatTransmCoeff",
			displayUnit="W/(m²K)")=if roofType.iRoof==1 then ceilingUg else roofU "Roof: heat transmission coefficient of the slopes";
		parameter Real lengthShortWall(
			quantity="Geometry.Length",
			displayUnit="m")=if outline then 10 else sqrt(AZone) "Lentgh of the short building walls";
		parameter Real lengthLongWall(
			quantity="Geometry.Length",
			displayUnit="m")=AZone/lengthShortWall "Length of the long building walls";
		parameter Real wallUU(
			quantity="Thermics.HeatTransmCoeff",
			displayUnit="W/(m²K)")=if buildingType.iBuild==1 then
		if wallConstruction.iType==1 then
		if buildingAge.iBA==1 or buildingAge.iBA==2 then 1.7
		elseif buildingAge.iBA==3 or buildingAge.iBA==4 then 1.4
		elseif buildingAge.iBA==5 then 1.0
		elseif buildingAge.iBA==6 then 0.8
		elseif buildingAge.iBA==7 then 0.6
		elseif buildingAge.iBA==8 then 0.5
		elseif buildingAge.iBA>=9 and buildingAge.iBA<=11 then 0.45
		else 0.28
		elseif wallConstruction.iType==2 then
		if buildingAge.iBA==1 or buildingAge.iBA==2 then 2.0
		elseif buildingAge.iBA==3 or buildingAge.iBA==4 then 1.4
		elseif buildingAge.iBA==5 then 0.6
		elseif buildingAge.iBA==6 then 0.5
		elseif buildingAge.iBA==7 or buildingAge.iBA==8 then 0.4
		elseif buildingAge.iBA>=9 and buildingAge.iBA<=11 then 0.45
		else 0.28
		else
		if buildingAge.iBA==1 or buildingAge.iBA==2 then (1.7+2.0)/2
		elseif buildingAge.iBA==3 or buildingAge.iBA==4 then 1.4
		elseif buildingAge.iBA==5 then (1.0+0.6)/2
		elseif buildingAge.iBA==6 then (0.8+0.5)/2
		elseif buildingAge.iBA==7 then (0.6+0.4)/2
		elseif buildingAge.iBA==8 then (0.5+0.4)/2
		elseif buildingAge.iBA>=9 and buildingAge.iBA<=11 then 0.45
		else 0.28 
		else
		if wallConstruction.iType==1 then
		if buildingAge.iBA<=2 then 1.7
		elseif buildingAge.iBA==3 or buildingAge.iBA==4 then 1.4
		elseif buildingAge.iBA==5 then 1.0
		elseif buildingAge.iBA==6 then 0.8
		elseif buildingAge.iBA==7 then 0.6
		elseif buildingAge.iBA==8 then 0.5
		elseif buildingAge.iBA==9 or buildingAge.iBA==10 then 0.4
		elseif buildingAge.iBA==11 then  0.35
		elseif buildingAge.iBA==12 or buildingAge.iBA==13 then 0.28
		else 0.4
		elseif wallConstruction.iType==2 then
		if buildingAge.iBA==1 or buildingAge.iBA==2 then 2.0
		elseif buildingAge.iBA==3 or buildingAge.iBA==4 then 1.4
		elseif buildingAge.iBA==5 then 0.6
		elseif buildingAge.iBA==6 then 0.5
		elseif buildingAge.iBA==7 or buildingAge.iBA==8 then 0.4
		elseif buildingAge.iBA==9 or buildingAge.iBA==10 then 0.4
		elseif buildingAge.iBA==11 then  0.35
		elseif buildingAge.iBA==12 or buildingAge.iBA==13 then 0.28
		else 0.3
		else 
		if buildingAge.iBA==1 or buildingAge.iBA==2 then (1.7+2.0)/2
		elseif buildingAge.iBA==3 or buildingAge.iBA==4 then 1.4
		elseif buildingAge.iBA==5 then (1.0+0.6)/2
		elseif buildingAge.iBA==6 then (0.8+0.5)/2
		elseif buildingAge.iBA==7 then 0.5
		elseif buildingAge.iBA==8 then 0.45
		elseif buildingAge.iBA==9 or buildingAge.iBA==10 then 0.4
		elseif buildingAge.iBA==11 then  0.35
		elseif buildingAge.iBA==12 or buildingAge.iBA==13 then 0.28
		else 0.4 "Walls: heat transmission coefficient at original state";
		parameter Real wallU(
			quantity="Thermics.HeatTransmCoeff",
			displayUnit="W/(m²K)")=(1-wallInsA)*wallUU+wallInsA*1/(wallInsul/0.04+1/wallUU) "Walls: actual heat transmission coefficient";
		parameter Real wallThicknessU(
			quantity="Geometry.Length",
			displayUnit="m")=if wallConstruction.iType==1 then
		if buildingAge.iBA==1 or buildingAge.iBA==2 then 0.32
		else 0.24
		elseif wallConstruction.iType==2 then
		if buildingAge.iBA==1 or buildingAge.iBA==2 then 0.24
		elseif buildingAge.iBA>=3 and buildingAge.iBA<=5 then 0.12
		elseif buildingAge.iBA==6 then 0.14
		else 0.16
		else
		if buildingAge.iBA==1 or buildingAge.iBA==2 then (0.24+0.32)/2
		elseif buildingAge.iBA>=3 and buildingAge.iBA<=5 then (0.24+0.12)/2
		elseif buildingAge.iBA==6 then (0.24+0.14)/2
		else (0.24+0.16)/2 "Walls: thickness at original state";
		parameter Real wallThickness(
			quantity="Geometry.Length",
			displayUnit="m")=wallThicknessU+wallInsul "Walls: actual thickness";
		parameter Real wallCpU(
			quantity="Thermics.SpecHeatCapacity",
			displayUnit="J/(kg*K)")=if wallConstruction.iType==1 then 850
		elseif wallConstruction.iType==2 then
		if buildingAge.iBA==1 or buildingAge.iBA==2 then 1085
		elseif buildingAge.iBA==3 or buildingAge.iBA==4 then 850
		elseif buildingAge.iBA==5 then 1911
		elseif buildingAge.iBA==6 then 1860
		else 1814
		else
		if buildingAge.iBA==1 or buildingAge.iBA==2 then (850+1085)/2
		elseif buildingAge.iBA==3 or buildingAge.iBA==4 then 850
		elseif buildingAge.iBA==5 then (850+1911)/2
		elseif buildingAge.iBA==6 then (850+1860)/2
		else (850+1814)/2 "Walls: heat capacity at original state";
		parameter Real wallCp(
			quantity="Thermics.SpecHeatCapacity",
			displayUnit="J/(kg*K)")=(wallThicknessU*wallCpU+wallInsA*wallInsul*0.9)/wallThickness "Walls: actual heat capacity";
		parameter Real wallRhoU(
			quantity="Basics.Density",
			displayUnit="kg/m³")=if wallConstruction.iType==1 then
		if buildingAge.iBA==1 or buildingAge.iBA==2 then 1650
		elseif buildingAge.iBA==3 or buildingAge.iBA==4 then 1450
		elseif buildingAge.iBA==5 then 1200
		else 1180
		elseif wallConstruction.iType==2 then
		if buildingAge.iBA==1 or buildingAge.iBA==2 then 1146
		elseif buildingAge.iBA==3 or buildingAge.iBA==4 then 1450
		elseif buildingAge.iBA==5 then 468
		elseif buildingAge.iBA==6 then 450
		else 433
		else
		if buildingAge.iBA==1 or buildingAge.iBA==2 then (1650+1146)/2
		elseif buildingAge.iBA==3 or buildingAge.iBA==4 then 1450
		elseif buildingAge.iBA==5 then (1200+468)/2
		elseif buildingAge.iBA==6 then (1180+450)/2
		else (1180+433)/2 "Walls: density at original state";
		parameter Real wallRho(
			quantity="Basics.Density",
			displayUnit="kg/m³")=(wallThicknessU*wallRhoU+wallInsA*wallInsul*100)/wallThickness "Walls: actual density";
		parameter Real ceilingUUg(
			quantity="Thermics.HeatTransmCoeff",
			displayUnit="W/(m²K)")=if buildingType.iBuild==1 then
		if ceilingConstruction.iType==1 then
		if buildingAge.iBA>=2 and buildingAge.iBA<=4 then 2.1
		elseif buildingAge.iBA==5 then 0.6
		elseif buildingAge.iBA==6 then 0.5
		elseif buildingAge.iBA==7 then 0.4
		elseif buildingAge.iBA>=8 and buildingAge.iBA<=11 then 0.3
		else 0.2
		elseif ceilingConstruction.iType==2 then
		if buildingAge.iBA==1 then 1.0
		elseif buildingAge.iBA>=2 and buildingAge.iBA<=4 then 0.8
		elseif buildingAge.iBA==5 then 0.6
		elseif buildingAge.iBA==6 then 0.4
		elseif buildingAge.iBA==7 then 0.3
		elseif buildingAge.iBA>=8 and buildingAge.iBA<=11 then 0.4
		else 0.2
		else
		if buildingAge.iBA==1 then (2.1+1)/2
		elseif buildingAge.iBA>=2 and buildingAge.iBA<=4 then (2.1+0.8)/2
		elseif buildingAge.iBA==5 then 0.6
		elseif buildingAge.iBA==6 then 0.45
		elseif buildingAge.iBA==7 then 0.35
		elseif buildingAge.iBA>=8 and buildingAge.iBA<=11 then 0.3
		else 0.2
		else 
		roofUU "Upper Ceiling: heat transmission coefficient at original state well insulated (common with flat or unheated roof)";
		parameter Real ceilingUUu(
			quantity="Thermics.HeatTransmCoeff",
			displayUnit="W/(m²K)")=if buildingType.iBuild==1 then
		if ceilingConstruction.iType==1 then 3.7
		elseif ceilingConstruction.iType==2 then
		if buildingAge.iBA==1 then 1.11
		elseif buildingAge.iBA>=2 and buildingAge.iBA<=4 then 1.21
		elseif buildingAge.iBA>=5 and buildingAge.iBA<=8 then 1.69
		elseif buildingAge.iBA>=9 and buildingAge.iBA<=11 then 0.4
		else 0.2
		else
		if buildingAge.iBA==1 then (3.7+1.11)/2
		elseif buildingAge.iBA>=2 and buildingAge.iBA<=4 then (3.7+1.21)/2
		elseif buildingAge.iBA>=5 and buildingAge.iBA<=8 then (3.7+1.69)/2
		elseif buildingAge.iBA>=9 and buildingAge.iBA<=11 then 0.3
		else 0.2 
		else 
		if ceilingConstruction.iType==1 then
		if buildingAge.iBA>=1 and buildingAge.iBA<=4 then 2.1
		elseif buildingAge.iBA==5 then 0.6
		elseif buildingAge.iBA==6 then 0.5
		elseif buildingAge.iBA==7 then 0.4
		elseif buildingAge.iBA==8 then 0.3
		elseif buildingAge.iBA==9 or buildingAge.iBA==10 then  0.28
		elseif buildingAge.iBA==11 then 0.24
		elseif buildingAge.iBA==12 or buildingAge.iBA==13 then 0.2
		else 0.2
		elseif ceilingConstruction.iType==2 then
		if buildingAge.iBA==1 then 1.0
		elseif buildingAge.iBA>=2 and buildingAge.iBA<=4 then 0.8
		elseif buildingAge.iBA==5 then 0.6
		elseif buildingAge.iBA==6 then 0.4
		elseif buildingAge.iBA==7 or buildingAge.iBA==8 then 0.3
		elseif buildingAge.iBA==9 or buildingAge.iBA==10 then  0.28
		elseif buildingAge.iBA==11 then 0.24
		elseif buildingAge.iBA==12 or buildingAge.iBA==13 then 0.2
		else 0.2
		else 
		if buildingAge.iBA==1 then (2.1+1.0)/2
		elseif buildingAge.iBA>=2 and buildingAge.iBA<=4 then (2.1+0.8)/2
		elseif buildingAge.iBA==5 then 0.6
		elseif buildingAge.iBA==6 then 0.45
		elseif buildingAge.iBA==7 then 0.35
		elseif buildingAge.iBA==8 then 0.3
		elseif buildingAge.iBA==9 or buildingAge.iBA==10 then  0.28
		elseif buildingAge.iBA==11 then 0.24
		elseif buildingAge.iBA==12 or buildingAge.iBA==13 then 0.2
		else 0.2 "upper ceiling: heat transmission coefficient at original state less insulated (common at heated or partly heated roofs)";
		parameter Real ceilingUg(
			quantity="Thermics.HeatTransmCoeff",
			displayUnit="W/(m²K)")=(1-ceilingInsA)*ceilingUUg+ceilingInsA*1/(ceilingInsul/0.04+1/ceilingUUg) "upper ceiling: actual heat transmission coefficient well insulated (common with flat or unheated roof)";
		parameter Real ceilingUu(
			quantity="Thermics.HeatTransmCoeff",
			displayUnit="W/(m²K)")=(1-ceilingInsA)*ceilingUUu+ceilingInsA*1/(ceilingInsul/0.04+1/ceilingUUu) "upper ceiling: actual heat transmission coefficient less insulated (common at heated or partly heated roofs)";
		parameter Real ceilingThicknessUg(
			quantity="Geometry.Length",
			displayUnit="m")=if ceilingConstruction.iType==1 then 
		if buildingAge.iBA>=1 and buildingAge.iBA<=4 then 0.21
		elseif buildingAge.iBA==5 then 0.25
		elseif buildingAge.iBA==6 then 0.26
		else 0.3
		elseif ceilingConstruction.iType==2 then
		if buildingAge.iBA==1 then 0.24
		elseif buildingAge.iBA>=2 and buildingAge.iBA<=4 then 0.26
		elseif buildingAge.iBA==5 then 0.12
		elseif buildingAge.iBA==6 then 0.16
		else 0.22
		else
		if buildingAge.iBA==1 then 0.225
		elseif buildingAge.iBA>=2 and buildingAge.iBA<=4 then 0.235
		elseif buildingAge.iBA==5 then (0.25+0.12)/2
		elseif buildingAge.iBA==6 then 0.21
		else 0.26 "Upper Ceiling: thickness at original state well insulated (common with flat or unheated roof)";
		parameter Real ceilingThicknessUu(
			quantity="Geometry.Length",
			displayUnit="m")=if ceilingConstruction.iType==1 then 0.2
		elseif ceilingConstruction.iType==2 then
		if buildingAge.iBA==1 then 0.24
		elseif buildingAge.iBA>=2 and buildingAge.iBA<=4 then 0.26
		else 0.06
		else
		if buildingAge.iBA==1 then 0.22
		elseif buildingAge.iBA>=2 and buildingAge.iBA<=4 then 0.23
		else 0.13 "upper ceiling: thickness at original state less insulated (common at heated or partly heated roofs)";
		parameter Real ceilingThicknessg(
			quantity="Geometry.Length",
			displayUnit="m")=ceilingThicknessUg+ceilingInsul "Upper Ceiling: actual thickness well insulated (common with flat or unheated roof)";
		parameter Real ceilingThicknessu(
			quantity="Geometry.Length",
			displayUnit="m")=ceilingThicknessUu+ceilingInsul "Upper Ceiling: actual thickness less insulated (common at heated or partly heated roofs)";
		parameter Real ceilingRhoUg(
			quantity="Basics.Density",
			displayUnit="kg/m³")=if ceilingConstruction.iType==1 then 
		if buildingAge.iBA>=1 and buildingAge.iBA<=4 then 2395
		elseif buildingAge.iBA==5 then 2376
		elseif buildingAge.iBA==6 then 2372
		else 2353
		elseif ceilingConstruction.iType==2 then
		if buildingAge.iBA==1 then 1146
		elseif buildingAge.iBA>=2 and buildingAge.iBA<=4 then 1122
		elseif buildingAge.iBA==5 then 468
		elseif buildingAge.iBA==6 then 433
		else 492
		else
		if buildingAge.iBA==1 then (2395+1146)/2
		elseif buildingAge.iBA>=2 and buildingAge.iBA<=4 then (2395+1122)/2
		elseif buildingAge.iBA==5 then (2376+468)/2
		elseif buildingAge.iBA==6 then (2372+433)/2
		else (2353+492)/2 "Upper Ceiling: density at original state well insulated (common with flat or unheated roof)";
		parameter Real ceilingRhoUu(
			quantity="Basics.Density",
			displayUnit="kg/m³")=if ceilingConstruction.iType==1 then 2400 
		elseif ceilingConstruction.iType==2 then
		if buildingAge.iBA==1 then 1146
		elseif buildingAge.iBA>=2 and buildingAge.iBA<=4 then 1122
		else 538
		else
		if buildingAge.iBA==1 then (2400+1146)/2
		elseif buildingAge.iBA>=2 and buildingAge.iBA<=4 then (2400+1122)/2
		else (2400+538)/2 "upper ceiling: density at original state less insulated (common at heated or partly heated roofs)";
		parameter Real ceilingRhog(
			quantity="Basics.Density",
			displayUnit="kg/m³")=(ceilingThicknessUg*ceilingRhoUg+ceilingInsA*ceilingInsul*100)/ceilingThicknessg "upper ceiling: actual density well insulated (common at flat or unheated roofs)";
		parameter Real ceilingRhou(
			quantity="Basics.Density",
			displayUnit="kg/m³")=(ceilingThicknessUu*ceilingRhoUu+ceilingInsA*ceilingInsul*100)/ceilingThicknessu "upper ceiling: actual density less insulated (common at heated or partly heated roofs)";
		parameter Real ceilingCpUg(
			quantity="Thermics.SpecHeatCapacity",
			displayUnit="J/(kg*K)")=if ceilingConstruction.iType==1 then 880 
		elseif ceilingConstruction.iType==2 then
		if buildingAge.iBA==1 then 1085
		elseif buildingAge.iBA>=2 and buildingAge.iBA<=4 then 1129
		elseif buildingAge.iBA==5 then 1911
		elseif buildingAge.iBA==6 then 1814
		else 1700
		else
		if buildingAge.iBA==1 then (880+1085)/2
		elseif buildingAge.iBA>=2 and buildingAge.iBA<=4 then (880+1129)/2
		elseif buildingAge.iBA==5 then (880+1911)/2
		elseif buildingAge.iBA==6 then (880+1814)/2
		else (880+1700)/2 "Upper Ceiling: heat capacity at original state well insulated (common with flat or unheated roof)";
		parameter Real ceilingCpUu(
			quantity="Thermics.SpecHeatCapacity",
			displayUnit="J/(kg*K)")=if ceilingConstruction.iType==1 then 880 
		elseif ceilingConstruction.iType==2 then
		if buildingAge.iBA==1 then 1085
		elseif buildingAge.iBA>=2 and buildingAge.iBA<=4 then 1129
		else 2100
		else
		if buildingAge.iBA==1 then (880+1085)/2
		elseif buildingAge.iBA>=2 and buildingAge.iBA<=4 then (880+1129)/2
		else (880+2100)/2 "upper ceiling: heat capacity at original state less insulated (common at heated or partly heated roofs)";
		parameter Real ceilingCpg(
			quantity="Thermics.SpecHeatCapacity",
			displayUnit="J/(kg*K)")=(ceilingThicknessUg*ceilingCpUg+ceilingInsA*ceilingInsul*0.9)/ceilingThicknessg "Upper Ceiling: actual heat capacity well insulated (common with flat or unheated roof)";
		parameter Real ceilingCpu(
			quantity="Thermics.SpecHeatCapacity",
			displayUnit="J/(kg*K)")=(ceilingThicknessUu*ceilingCpUu+ceilingInsA*ceilingInsul*0.9)/ceilingThicknessu "Upper ceiling: actual heat capacity less insulated (common at heated or partly heated roofs)";
		parameter Real floorUU(
			quantity="Thermics.HeatTransmCoeff",
			displayUnit="W/(m²K)")=if buildingType.iBuild==1 then
		if floorConstruction.iType==1 then 
		if buildingAge.iBA==1 or buildingAge.iBA==2 then 1.2
		elseif buildingAge.iBA==3 then 1.5
		elseif buildingAge.iBA==4 or buildingAge.iBA==5 then 1.0
		elseif buildingAge.iBA==6 then 0.8
		elseif buildingAge.iBA==7 or buildingAge.iBA==8 then 0.6
		elseif buildingAge.iBA>=9 and buildingAge.iBA<=11 then 0.4
		else 0.35
		elseif floorConstruction.iType==2 then
		if buildingAge.iBA==1 then 1.0
		elseif buildingAge.iBA>=2 and buildingAge.iBA<=4 then 0.8
		elseif buildingAge.iBA==5 or buildingAge.iBA==6 then 0.6
		elseif buildingAge.iBA>=7 and buildingAge.iBA<=11 then 0.4
		else 0.35
		else
		if buildingAge.iBA==1 then 1.1
		elseif buildingAge.iBA==2 then 1.0
		elseif buildingAge.iBA==3 then (1.5+0.8)/2
		elseif buildingAge.iBA==4 then 0.9
		elseif buildingAge.iBA==5 then 0.8
		elseif buildingAge.iBA==6 then 0.7
		elseif buildingAge.iBA==7 then 0.5
		elseif buildingAge.iBA==8 then 0.5 
		elseif buildingAge.iBA>=9 and buildingAge.iBA<=11 then 0.4
		else 0.35
		else
		if floorConstruction.iType==1 then 
		if buildingAge.iBA==1 or buildingAge.iBA==2 then 1.2
		elseif buildingAge.iBA==3 then 1.5
		elseif buildingAge.iBA==4 or buildingAge.iBA==5 then 1.0
		elseif buildingAge.iBA==6 then 0.8
		elseif buildingAge.iBA==7 or buildingAge.iBA==8 then 0.6
		elseif buildingAge.iBA==9 or buildingAge.iBA==10 then 0.4
		elseif buildingAge.iBA==11 then 0.38
		elseif buildingAge.iBA==12 or buildingAge.iBA==13 then 0.35
		else 0.5
		elseif floorConstruction==2 then
		if buildingAge.iBA==1 then 1.0
		elseif buildingAge.iBA>=2 and buildingAge.iBA<=4 then 0.8
		elseif buildingAge.iBA==5 or buildingAge.iBA==6 then 0.6
		elseif buildingAge.iBA==7 or buildingAge.iBA==8 then 0.4
		elseif buildingAge.iBA==9 or buildingAge.iBA==10 then 0.4
		elseif buildingAge.iBA==11 then 0.38
		elseif buildingAge.iBA==12 or buildingAge.iBA==13 then 0.35
		else 0.3
		else
		if buildingAge.iBA==1 then 1.1
		elseif buildingAge.iBA==3 then (1.5+0.8)/2
		elseif buildingAge.iBA==4 then (1.0+0.8)/2
		elseif buildingAge.iBA==5 then (1.0+0.6)/2
		elseif buildingAge.iBA==6 then 0.7
		elseif buildingAge.iBA==7 then 0.5
		elseif buildingAge.iBA==7 or buildingAge.iBA==8 then 0.4
		elseif buildingAge.iBA==9 or buildingAge.iBA==10 then 0.4
		elseif buildingAge.iBA==11 then 0.38
		elseif buildingAge.iBA==12 or buildingAge.iBA==13 then 0.35
		else 0.4 "Floor to cellar or ground: heat transmision coefficient at original state";
		parameter Real floorU(
			quantity="Thermics.HeatTransmCoeff",
			displayUnit="W/(m²K)")=(1-floorInsA)*floorUU+floorInsA*1/(floorInsul/0.04+1/floorUU) "Floor to cellar or ground: heat transmission coefficient";
		parameter Real floorThicknessU(
			quantity="Geometry.Length",
			displayUnit="m")=if floorConstruction.iType==1 then
		if buildingAge.iBA==1 or buildingAge.iBA==2 then 0.33
		elseif buildingAge.iBA==3 or buildingAge.iBA==4 then 0.2
		elseif buildingAge.iBA==5 then 0.22
		elseif buildingAge.iBA==6 then 0.24
		else 0.25
		elseif floorConstruction.iType==2 then
		if buildingAge.iBA==1 then 0.39
		elseif buildingAge.iBA>=2 and buildingAge.iBA<=4 then 0.31
		elseif buildingAge.iBA==5 then 0.22
		elseif buildingAge.iBA==6 then 0.24
		else 0.25
		else
		if buildingAge.iBA==1 then (0.33+0.39)/2
		elseif buildingAge.iBA==2 then 0.32
		elseif buildingAge.iBA==3 or buildingAge.iBA==4 then (0.2+0.31)/2
		elseif buildingAge.iBA==5 then 0.22
		elseif buildingAge.iBA==6 then 0.24
		else 0.25 "Floor to cellar or ground: thickness at original state";
		parameter Real floorThickness(
			quantity="Geometry.Length",
			displayUnit="m")=floorThicknessU+floorInsul "Floor to cellar or ground: actual thickness";
		parameter Real floorCpU(
			quantity="Thermics.SpecHeatCapacity",
			displayUnit="J/(kg*K)")=if floorConstruction.iType==1 then
		if buildingAge.iBA==1 or buildingAge.iBA==2 then 852
		elseif buildingAge.iBA==3 or buildingAge.iBA==4 then 880
		else 879
		elseif floorConstruction.iType==2 then 
		if buildingAge.iBA==1 then 1122
		elseif buildingAge.iBA>=2 and buildingAge.iBA<=4 then 1289
		else 879
		else
		if buildingAge.iBA==1 then (852+1122)/2
		elseif buildingAge.iBA==2 then (852+1289)/2
		elseif buildingAge.iBA==3 or buildingAge.iBA==4 then (880+1289)/2
		else 879 "Floor to cellar or ground: heat capacity at original state";
		parameter Real floorCp(
			quantity="Thermics.SpecHeatCapacity",
			displayUnit="J/(kg*K)")=(floorThicknessU*floorCpU+floorInsA*floorInsul*0.9)/floorThickness "Floor to cellar or ground: actual heat capacity";
		parameter Real floorRhoU(
			quantity="Basics.Density",
			displayUnit="kg/m³")=if floorConstruction.iType==1 then
		if buildingAge.iBA==1 or buildingAge.iBA==2 then 1639
		elseif buildingAge.iBA==3 or buildingAge.iBA==4 then 2400
		elseif buildingAge.iBA==5 then 2399
		elseif buildingAge.iBA==6 then 2397
		else 2396
		elseif floorConstruction.iType==2 then
		if buildingAge.iBA==1 then 1120
		elseif buildingAge.iBA>=2 and buildingAge.iBA<=4 then 727
		elseif buildingAge.iBA==5 then 2399
		elseif buildingAge.iBA==6 then 2397
		else 2396
		else
		if buildingAge.iBA==1 then (1639+1120)/2
		elseif buildingAge.iBA>=2 and buildingAge.iBA<=4 then (2400+727)/2
		elseif buildingAge.iBA==5 then 2399
		elseif buildingAge.iBA==6 then 2397
		else 2396 "Floor to cellar or ground: density at original state";
		parameter Real floorRho(
			quantity="Basics.Density",
			displayUnit="kg/m³")=(floorThicknessU*floorRhoU+floorInsA*floorInsul*100)/floorThickness "Floor to cellar or ground: actual density";
		parameter Real windowsU(
			quantity="Thermics.HeatTransmCoeff",
			displayUnit="W/(m²K)")=if buildingType.iBuild==1 then
		if windowType.iWindow==1 then
		if windowAgeIndex>=1 and windowAgeIndex<=5 then 5
		elseif windowAgeIndex==6 or windowAgeIndex==7 then 2.7
		elseif windowAgeIndex==8 then 1.6
		elseif windowAgeIndex>=9 and windowAgeIndex<=11 then 1.7
		else 1.3
		elseif windowType.iWindow==2 then
		if windowAgeIndex>=1 and windowAgeIndex<=7 then 2.7
		elseif windowAgeIndex==8 then 1.6
		elseif windowAgeIndex>=9 and windowAgeIndex<=11 then 1.7
		else 1.3
		elseif windowType.iWindow==3 then
		if windowAgeIndex>=1 and windowAgeIndex<=7 then 3
		elseif windowAgeIndex==8 then 1.9
		elseif windowAgeIndex>=9 and windowAgeIndex<=11 then 1.7
		else 1.3
		else
		if windowAgeIndex>=1 and windowAgeIndex<=6 then 4.3
		elseif windowAgeIndex==7 then 3.2
		elseif windowAgeIndex==8 then 1.9
		elseif windowAgeIndex>=9 and windowAgeIndex<=11 then 1.7
		else 1.3 
		else
		if windowType.iWindow==1 then 
		if buildingAge.iBA<=8 then 5.0
		elseif buildingAge.iBA==9 or buildingAge.iBA==10 then 1.7
		elseif buildingAge.iBA==11 then 1.5
		elseif buildingAge.iBA==12 or buildingAge.iBA==13 then 1.3
		else 1.3
		elseif windowType.iWindow==2 then
		if buildingAge.iBA<=7 then 2.7
		elseif buildingAge.iBA==8 then 1.8
		elseif buildingAge.iBA==9 or buildingAge.iBA==10 then 1.7
		elseif buildingAge.iBA==11 then 1.5
		elseif buildingAge.iBA==12 or buildingAge.iBA==13 then 1.3
		else 1.3
		elseif windowType.iWindow==3 then
		if buildingAge.iBA<=7 then 3.0
		elseif buildingAge.iBA==8 then 1.8
		elseif buildingAge.iBA==9 or buildingAge.iBA==10 then 1.7
		elseif buildingAge.iBA==11 then 1.5
		elseif buildingAge.iBA==12 or buildingAge.iBA==13 then 1.3
		else 1.3
		else
		if buildingAge.iBA<=7 then 4.3
		elseif buildingAge.iBA==8 then 1.8
		elseif buildingAge.iBA==9 or buildingAge.iBA==10 then 1.7
		elseif buildingAge.iBA==11 then 1.5
		elseif buildingAge.iBA==12 or buildingAge.iBA==13 then 1.3
		else 1.3 "Heat transmission coefficient of windows";
		parameter Real windowsG(quantity="Basics.Unitless")=if buildingType.iBuild==1 then
		if windowType.iWindow==1 then 
		if windowAgeIndex>=1 and windowAgeIndex<=5 then 0.87
		elseif windowAgeIndex==6 or windowAgeIndex==7 then 0.75
		else 0.6
		elseif windowType.iWindow==2 then
		if windowAgeIndex>=1 and windowAgeIndex<=7 then 0.75
		else 0.6
		elseif windowType.iWindow==3 then
		if windowAgeIndex>=1 and windowAgeIndex<=7 then 0.75
		else 0.6
		else
		if windowAgeIndex>=1 and windowAgeIndex<=7 then 0.75
		else 0.6 
		else
		if windowType.iWindow==1 then 0.87
		elseif buildingAge.iBA==12 or buildingAge.iBA==13 then 0.6
		else 0.75 "G-value of window-glazings";
		parameter Real roofWindowsG(
			quantity="Thermics.HeatTransmCoeff",
			displayUnit="W/(m²K)")=if windowAgeIndex<=11 then windowsU
																																																																																																																																																																																																																																	else 1.4 "Heat transmission coefficient of roof windows";
		parameter Real QHeatNorm(
			quantity="Basics.Power",
			displayUnit="Nm/s")=if (cY<1978) then 3.5*(AN^0.5)*1000/ALH 
		elseif(cY>=1978 and cY<=1986)then 2.2*(AN^0.55)*1000/ALH
		else 1.2*(AN^0.6)*1000/ALH "Area-specific heating power in heated zones";
		parameter Real vHeatingSystem(
			quantity="Basics.Volume",
			displayUnit="m³")=(0.8/92*QHeatNorm/1000) "Watervolume in heating system";
		parameter Real u_HeatBridge=if buildingType.iBuild==1 then
		if cY<1986 then 0.15
		elseif cY>=1986 and cY<1994 then 0.1
		else 0.05
		else /*Non-residential building*/ 0.1 "Heat bridge correction factor for u-values";
		parameter Real livingZoneAirLeak=0.6*0.6/3600 "Air exchange rate caused by leakage in heated zones";
		parameter Real livingZoneInnerMassV=(2*LivingAreaAShortWallNet+2*LivingAreaALongWallNet)*wallThickness "Volume of inner masses in 'living zone'";
		parameter Real livingZoneInnerMassM=(2*LivingAreaAShortWallNet+2*LivingAreaALongWallNet)*wallThickness*wallRho "Mass of inner masses in 'living zone'";
		parameter Real livingZoneInnerMassCp=wallCp*((2*LivingAreaAShortWallNet+2*LivingAreaALongWallNet)*wallThickness*wallRho)/livingZoneInnerMassM "Heat capacity of inner masses in 'living zone'";
		parameter Real livingZoneInnerMassRho=wallRho "Density of inner masses in 'living zone'";
		parameter Real cellarInnerMassV=(2*cellarAShortWall+2*cellarALongWall)*wallThickness "Volume of inner masses in 'cellar'";
		parameter Real cellarInnerMassM=(2*cellarAShortWall+2*cellarALongWall)*wallThickness*wallRho "Masses of inner masses in 'cellar'";
		parameter Real cellarInnerMassCp=wallCp "Heat capacity of inner masses in 'cellar'";
		parameter Real cellarInnerMassRho=wallRho "Density of inner masses in 'cellar'";
		parameter Real roofInnerMassV=(2*roofAShortWallNet+2*roofALongWallNet) "Volume of inner masses in 'roof'";
		parameter Real roofInnerMassM=(2*roofAShortWallNet+2*roofALongWallNet)*roofThickness*roofRho "Mass of inner masses in 'cellar'";
		parameter Real roofInnerMassCp=roofCp "Heat capacity of inner masses in 'cellar'";
		parameter Real roofInnerMassRho=roofRho "Density of inner masses in 'cellar'";
		parameter Real n_G(quantity="Basics.Unitless")=nFloors+n_Dach+n_Keller "Number of heated floors";
		parameter Real n_Dach(quantity="Basics.Unitless")=0.75*(if roofType.iRoof==3 then 0.5 else 1) "percentage of heated area in 'roof'";
		parameter Real n_Keller(quantity="Basics.Unitless")=if cellarType.iCellar==3 then 0.5 elseif cellarType.iCellar==4 then 1 else 0 "percentage of heated area in 'cellar'";
		parameter Integer NumberZones(quantity="Basics.Unitless")=(if cellarType.iCellar==1 then 2 else 3)+flanking "Number of Thermal Zones";
	public
		GreenCity.GreenBuilding.Building.HeatedZone cellar(
			ZoneIndex=3,
			NumberZones=5,
			Mass=1,
			TZoneInit(displayUnit="K")=cellarTRef,
			TReturnHeatInit=323.14999999999998,
			AZone=cellarAZone,
			hZone=cellarHZone,
			Heat=true,
			n=1.25,
			TFlowHeatNorm=343.14999999999998,
			TReturnHeatNorm=328.14999999999998,
			QHeatNorm(displayUnit="Nm/s")=QHeatNorm,
			VHeatMedium(displayUnit="m³")=vHeatingSystem*self.AZone,
			LAirLeak=livingZoneAirLeak,
			LComfortVentilation=0,
			uHeatBridge=u_HeatBridge,
			VMass1=cellarInnerMassV*0.25,
			cpMass1(displayUnit="J/(kg·K)")=cellarInnerMassCp,
			rhoMass1=cellarInnerMassRho,
			ABound1=cellarALongWall,
			AWindow1=0,
			dBound1=floorThickness,
			rhoBound1=floorRho,
			cpBound1(displayUnit="J/(kg·K)")=floorCp,
			uBound1=floorU,
			groundContact1=true,
			depthBound1=self.depthBound5/2,
			epsDirt1=0.4,
			epsFrame1=0.4,
			alphaBound1=0.3,
			alphaBoundOut1=25,
			alphaBoundIn1=7.7,
			contactBound2=0,
			ABound2=cellarAShortWall,
			AWindow2=0,
			dBound2=self.dBound1,
			rhoBound2=self.rhoBound1,
			cpBound2(displayUnit="J/(kg·K)")=self.cpBound1,
			uBound2=self.uBound1,
			groundContact2=true,
			depthBound2=self.depthBound5/2,
			epsDirt2=0.4,
			epsFrame2=0.4,
			alphaBound2=0.3,
			alphaBoundOut2=25,
			alphaBoundIn2=7.7,
			ABound3=self.ABound1,
			AWindow3=self.AWindow1,
			dBound3=self.dBound1,
			rhoBound3=self.rhoBound1,
			cpBound3(displayUnit="J/(kg·K)")=self.cpBound1,
			uBound3=self.uBound1,
			uWindow3=self.uWindow1,
			groundContact3=true,
			depthBound3=self.depthBound5/2,
			epsDirt3=self.epsDirt1,
			epsShading3=self.epsShading1,
			epsFrame3=self.epsFrame1,
			gWindow3=self.gWindow1,
			alphaBound3=self.alphaBound1,
			alphaBoundOut3=self.alphaBoundOut1,
			alphaBoundIn3=self.alphaBoundIn1,
			ABound4=self.ABound2,
			AWindow4=self.AWindow2,
			dBound4=self.dBound1,
			rhoBound4=self.rhoBound1,
			cpBound4(displayUnit="J/(kg·K)")=self.cpBound1,
			uBound4=self.uBound1,
			uWindow4=self.uWindow1,
			groundContact4=true,
			depthBound4=self.depthBound5/2,
			epsDirt4=self.epsDirt1,
			epsShading4=self.epsShading1,
			epsFrame4=self.epsFrame1,
			gWindow4=self.gWindow1,
			alphaBound4=self.alphaBound1,
			alphaBoundOut4=self.alphaBoundOut1,
			alphaBoundIn4=self.alphaBoundIn1,
			contactBound5=0,
			ABound5=self.AZone,
			dBound5=floorThickness,
			rhoBound5=floorRho,
			cpBound5(displayUnit="J/(kg·K)")=floorCp,
			uBound5=floorU,
			groundContact5=true,
			depthBound5=cellarHZone*2/3,
			alphaBoundOut5=25,
			alphaBoundIn5=5.9,
			contactBound6=if cellarType.iCellar==1 then 0 else 2,
			ABound6=self.AZone,
			dBound6=floorThickness,
			rhoBound6=floorRho,
			cpBound6(displayUnit="J/(kg·K)")=floorCp,
			uBound6=floorU) "Building zone simulating inner heat losses and yields as well as heating system behavior" annotation(Placement(transformation(extent={{290,-60},{360,-20}})));
		GreenCity.GreenBuilding.Building.BuildingZone livingZone(
			ZoneIndex=2,
			NumberZones=5,
			Mass=1,
			AZone=LivingAreaAZone,
			hZone=LivingAreaHZone,
			LAirLeak=livingZoneAirLeak,
			LComfortVentilation=0.0013888888888888889,
			uHeatBridge=u_HeatBridge,
			VMass1=ceilingThickness*LivingAreaAZone*nFloors*1.5,
			cpMass1(displayUnit="J/(kg·K)")=ceilingCp,
			rhoMass1=ceilingRho,
			contactBound1=0,
			ABound1=LivingAreaALongWallNet,
			AWindow1=LivingAreaAWindowsLongWall,
			dBound1=wallThickness,
			rhoBound1=wallRho,
			cpBound1(displayUnit="J/(kg·K)")=wallCp,
			uBound1=wallU,
			uWindow1=windowsU,
			groundContact1=false,
			epsDirt1=0.4,
			epsFrame1=0.4,
			gWindow1=windowsG,
			alphaBound1=0.3,
			alphaBoundOut1=25,
			alphaBoundIn1=7.7,
			contactBound2=if flanking>0 then 4 else 0,
			ABound2=LivingAreaAShortWallNet,
			AWindow2=LivingAreaAWindowsShortWall,
			dBound2=self.dBound1,
			rhoBound2=self.rhoBound1,
			cpBound2(displayUnit="J/(kg·K)")=self.cpBound1,
			uBound2=self.uBound1,
			uWindow2=self.uWindow1,
			groundContact2=false,
			epsDirt2=0.4,
			epsFrame2=0.4,
			gWindow2=self.gWindow1,
			alphaBound2=self.alphaBound1,
			alphaBoundOut2=25,
			alphaBoundIn2=7.7,
			contactBound3=0,
			ABound3=self.ABound1,
			AWindow3=self.AWindow1,
			dBound3=self.dBound1,
			rhoBound3=self.rhoBound1,
			cpBound3(displayUnit="J/(kg·K)")=self.cpBound1,
			uBound3=self.uBound1,
			uWindow3=self.uWindow1,
			epsDirt3=self.epsDirt1,
			epsShading3=self.epsShading1,
			epsFrame3=self.epsFrame1,
			gWindow3=self.gWindow1,
			alphaBound3=self.alphaBound1,
			alphaBoundOut3=25,
			alphaBoundIn3=7.7,
			contactBound4=if flanking==2 then 4 else 0,
			ABound4=self.ABound2,
			AWindow4=self.AWindow2,
			dBound4=self.dBound2,
			rhoBound4=self.rhoBound2,
			cpBound4(displayUnit="J/(kg·K)")=self.cpBound2,
			uBound4=self.uBound2,
			uWindow4=self.uWindow2,
			groundContact4=false,
			epsDirt4=self.epsDirt2,
			epsShading4=self.epsShading2,
			epsFrame4=self.epsFrame2,
			gWindow4=self.gWindow2,
			alphaBound4=self.alphaBound2,
			alphaBoundOut4=25,
			alphaBoundIn4=7.7,
			contactBound5=livingZoneContactBound5,
			ABound5=self.AZone,
			dBound5=floorThickness,
			rhoBound5=floorRho,
			cpBound5(displayUnit="J/(kg·K)")=floorCp,
			uBound5=floorU,
			groundContact5=livingZoneGroundcontactBound5,
			depthBound5=0.2,
			alphaBoundOut5=25,
			alphaBoundIn5=5.9,
			contactBound6=1,
			ABound6=self.AZone,
			dBound6=ceilingThickness,
			rhoBound6=ceilingRho,
			cpBound6(displayUnit="J/(kg·K)")=ceilingCp,
			uBound6=ceilingU,
			epsShading6=1,
			alphaBoundOut6=25,
			alphaBoundIn6=10) "Building zone including inner heat losses and yields" annotation(Placement(transformation(extent={{290,-120},{360,-80}})));
		GreenCity.GreenBuilding.Building.HeatedZone roof(
			ZoneIndex=1,
			NumberZones=5,
			Bound=5,
			Mass=1,
			TZoneInit(displayUnit="K")=roofTZoneInit,
			TReturnHeatInit=323.14999999999998,
			AZone=roofAZone,
			hZone=roofHZone,
			Heat=true,
			n=1.25,
			TFlowHeatNorm=343.14999999999998,
			TReturnHeatNorm=328.14999999999998,
			QHeatNorm(displayUnit="Nm/s")=QHeatNorm,
			VHeatMedium(displayUnit="m³")=vHeatingSystem*self.AZone,
			LAirLeak(displayUnit="1/s")=roofAirLeak,
			LComfortVentilation(displayUnit="m³/h")=0.0013888888888888889,
			uHeatBridge=if roofType.iRoof==1 then 0.5 else u_HeatBridge,
			VMass1=roofInnerMassV,
			cpMass1(displayUnit="J/(kg·K)")=roofInnerMassCp,
			rhoMass1=roofInnerMassRho,
			contactBound1=0,
			ABound1=roofALongWallNet,
			AWindow1=roofAWindowsLongWall,
			dBound1=roofDBound1,
			rhoBound1=roofRhoBound1,
			cpBound1(displayUnit="J/(kg·K)")=roofCpBound1,
			uBound1=roofUBound1,
			uWindow1=windowsU,
			epsDirt1=0.4,
			epsFrame1=0.4,
			alphaInclination1(displayUnit="rad")=roofAlphaInclination,
			gWindow1=windowsG,
			alphaBound1=(0.75+0.88)/2,
			alphaBoundOut1=25,
			alphaBoundIn1=10,
			contactBound2=if flanking>0 then 4 else 0,
			ABound2=roofAShortWallNet,
			AWindow2=0,
			dBound2=wallThickness,
			rhoBound2=wallRho,
			cpBound2(displayUnit="J/(kg·K)")=wallCp,
			uBound2=wallU,
			epsDirt2=0.4,
			epsFrame2=0.4,
			alphaBound2=(0.75+0.88)/2,
			alphaBoundOut2=25,
			alphaBoundIn2=7.7,
			contactBound3=0,
			ABound3=self.ABound1,
			AWindow3=self.AWindow1,
			dBound3=self.dBound1,
			rhoBound3=self.rhoBound1,
			cpBound3(displayUnit="J/(kg·K)")=self.cpBound1,
			uBound3=self.uBound1,
			uWindow3=self.uWindow1,
			epsDirt3=self.epsDirt1,
			epsShading3=self.epsShading1,
			epsFrame3=self.epsFrame1,
			alphaInclination3(displayUnit="rad")=self.alphaInclination1,
			gWindow3=self.gWindow1,
			alphaBound3=self.alphaBound1,
			alphaBoundOut3=self.alphaBoundOut1,
			alphaBoundIn3=self.alphaBoundIn1,
			contactBound4=if flanking==2 then 4 else 0,
			ABound4=self.ABound2,
			AWindow4=self.AWindow2,
			dBound4=self.dBound2,
			rhoBound4=self.rhoBound2,
			cpBound4(displayUnit="J/(kg·K)")=self.cpBound2,
			uBound4=self.uBound2,
			uWindow4=self.uWindow2,
			epsDirt4=self.epsDirt2,
			epsShading4=self.epsShading2,
			epsFrame4=self.epsFrame2,
			gWindow4=self.gWindow2,
			alphaBound4=self.alphaBound2,
			alphaBoundOut4=self.alphaBoundOut2,
			alphaBoundIn4=self.alphaBoundIn2,
			contactBound5=2,
			ABound5=roofAZone,
			dBound5=livingZone.dBound6,
			rhoBound5=livingZone.rhoBound6,
			cpBound5(displayUnit="J/(kg·K)")=livingZone.cpBound6,
			uBound5=livingZone.uBound6,
			groundContact5=false,
			alphaBoundOut5=25,
			alphaBoundIn5=5.9) annotation(Placement(transformation(extent={{290,-180},{360,-140}})));
		GreenCity.GreenBuilding.Building.Components.TemperatureDistribution temperatureDistribution(NumberZones=5) "Zone temperature distribution interface" annotation(Placement(transformation(extent={{445,-130},{465,-90}})));
		Modelica.Blocks.Sources.RealExpression Temp_flankingZones(y(
			quantity="Thermics.Temp",
			displayUnit="°C")=294.14999999999998) annotation(Placement(transformation(extent={{455,-60},{435,-40}})));
		GreenCity.Utilities.Electrical.Grid grid(
			OutputType=Utilities.Electrical.Grid.OutputEnum.MasterGrid,
			useA=true,
			useD=true,
			useE=true,
			useF=true) "Electrical power grid for connection of maximum six 3-phase AC components" annotation(Placement(transformation(extent={{205,-235},{245,-195}})));
		Modelica.Blocks.Sources.RealExpression gridVoltage(y(
			quantity="Electricity.Voltage",
			displayUnit="V")=230) annotation(Placement(transformation(extent={{255,-190},{235,-170}})));
		GreenCity.GreenBuilding.HeatingSystem.Control.VolumeFlowControllerHeatingSystem vFCtrl_Cellar(
			QHeatMax(displayUnit="Nm/s")=cellar.QHeatNorm*cellar.AZone*1.2,
			deltaTup=0.5,
			deltaTlow=-2,
			qvMax(displayUnit="m³/s")=self.QHeatMax/(self.cpMed*self.rhoMed*10)) "Volume flow controller for heating systems" annotation(Placement(transformation(extent={{45,-35},{15,-5}})));
		Modelica.Blocks.Sources.RealExpression TRef_Keller(y=cellarTRef) annotation(Placement(transformation(extent={{95,-20},{75,0}})));
		GreenCity.Utilities.Thermal.DistributionValve distributorCellar "Controllable valve for volume flow distribution" annotation(Placement(transformation(extent={{-60,-80},{-40,-60}})));
		GreenCity.Utilities.Thermal.MergingValve merge_Cellar "Valve for volume flow merging" annotation(Placement(transformation(extent={{-60,-130},{-40,-110}})));
		GreenCity.Utilities.Thermal.MeasureThermal MT_Flow "Measurement of pipe temperature and volume flow" annotation(Placement(transformation(extent={{-100,-80},{-80,-60}})));
		GreenCity.Utilities.Thermal.MeasureThermal MT_Return "Measurement of pipe temperature and volume flow" annotation(Placement(transformation(extent={{-80,-130},{-100,-110}})));
		GreenCity.Utilities.Thermal.DistributionValve distributorLivingZoneRoof "Controllable valve for volume flow distribution" annotation(Placement(transformation(extent={{40,-110},{60,-90}})));
		GreenCity.Utilities.Thermal.MergingValve mergeLivingZoneRoof "Valve for volume flow merging" annotation(Placement(transformation(extent={{50,-150},{70,-130}})));
		GreenCity.GreenBuilding.HeatingSystem.Control.VolumeFlowControllerHeatingSystem vFCtrl_Roof(
			QHeatMax(displayUnit="Nm/s")=roof.QHeatNorm*roof.AZone*1.2,
			deltaTup=0.5,
			deltaTlow=-2,
			qvMax(displayUnit="m³/s")=self.QHeatMax/(self.cpMed*self.rhoMed*10)) "Volume flow controller for heating systems" annotation(Placement(transformation(extent={{55,-195},{25,-165}})));
		GreenCity.Interfaces.Environment.EnvironmentConditions EnvironmentConditions "Ambient conditions connector" annotation(Placement(
			transformation(extent={{390,15},{410,35}}),
			iconTransformation(extent={{40,190},{60,210}})));
		GreenCity.Interfaces.Thermal.VolumeFlowIn PipeIn "Connector for volume flow input" annotation(Placement(
			transformation(extent={{-140,-80},{-120,-60}}),
			iconTransformation(extent={{-210,90},{-190,110}})));
		GreenCity.Interfaces.Thermal.VolumeFlowOut PipeOut "Connector for volume flow output" annotation(Placement(
			transformation(extent={{-140,-130},{-120,-110}}),
			iconTransformation(extent={{-210,-60},{-190,-40}})));
		GreenCity.Interfaces.Electrical.LV3Phase Grid3 "Electrical connector for 3-phase conductors" annotation(Placement(
			transformation(extent={{215,-285},{235,-265}}),
			iconTransformation(extent={{90,-210},{110,-190}})));
	protected
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
		function sumVector1
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
		function sumVector2
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
	public
		Modelica.Blocks.Sources.RealExpression TRef_Dach(y(
			quantity="Thermics.Temp",
			displayUnit="°C")=294.14999999999998) "Set output signal to a time varying Real expression" annotation(Placement(transformation(extent={{85,-180},{65,-160}})));
		Modelica.Blocks.Math.Sum qv_Sum(nin=3) annotation(Placement(transformation(extent={{-45,-200},{-65,-180}})));
	protected
		parameter Integer windowAgeIndex=if newWindows then windowAge.iBA else buildingAge.iBA "period of window modernization";
	public
		Modelica.Blocks.Logical.Switch switch1 annotation(Placement(transformation(extent={{-10,0},{-30,-20}})));
		Modelica.Blocks.Logical.Switch switch3 annotation(Placement(transformation(extent={{0,-160},{-20,-180}})));
		Modelica.Blocks.Sources.BooleanExpression cellarHeating(y=cellarHeat) annotation(Placement(transformation(extent={{40,0},{20,20}})));
		Modelica.Blocks.Sources.RealExpression noVolumeFlow(y(
			quantity="Hydraulics.Flow",
			displayUnit="l/min")) annotation(Placement(transformation(extent={{40,15},{20,35}})));
		Modelica.Blocks.Sources.BooleanExpression roofHeating(y=roofHeat) annotation(Placement(transformation(extent={{40,-165},{20,-145}})));
		Modelica.Blocks.Tables.CombiTable1D PelTable(
			tableOnFile=true,
			tableName="PelPers",
			fileName=if buildingType.iBuild==1 then GreenCity.Utilities.Functions.getSimulationDataDirectory()+"\\building\\SimpleBuilding\\ElPower\\elPowerResidential.txt" else GreenCity.Utilities.Functions.getSimulationDataDirectory()+"\\building\\SimpleBuilding\\ElPower\\elPowerNonResidential.txt",
			columns={2}) annotation(Placement(transformation(extent={{105,40},{125,60}})));
		Modelica.Blocks.Sources.RealExpression simTime(y=time) annotation(Placement(transformation(extent={{60,55},{80,75}})));
		Modelica.Blocks.Math.Add3 add3 annotation(Placement(transformation(extent={{225,-110},{245,-90}})));
		Modelica.Blocks.Tables.CombiTable1D presenceTable(
			tableOnFile=true,
			tableName="presence",
			fileName=if buildingType.iBuild==1 then GreenCity.Utilities.Functions.getSimulationDataDirectory()+"\\building\\SimpleBuilding\\Presence\\presenceResidential.txt" else GreenCity.Utilities.Functions.getSimulationDataDirectory()+"\\building\\SimpleBuilding\\Presence\\presenceNonResidential.txt") annotation(Placement(transformation(extent={{105,70},{125,90}})));
		Modelica.Blocks.Math.Product heatYieldsPerson(y(
			quantity="Basics.Power",
			displayUnit="kW")) annotation(Placement(transformation(extent={{160,65},{180,85}})));
		Modelica.Blocks.Sources.RealExpression elPowerConsumptYear(y=if buildingType.iBuild==1 then nAp*2.5*presenceTable.y[1] else ALH/15) annotation(Placement(transformation(extent={{60,5},{80,25}})));
		Modelica.Blocks.Sources.RealExpression QPers(y(
			quantity="Basics.Power",
			displayUnit="kW")=(if buildingType.iBuild==1 then nAp*2.5 else ALH/15)*(80-30+60)) annotation(Placement(transformation(extent={{60,20},{80,40}})));
		Modelica.Blocks.Math.Product elPowerConsumption(y(
			quantity="Basics.Power",
			displayUnit="kW")) annotation(Placement(transformation(extent={{160,35},{180,55}})));
		Modelica.Blocks.Math.Gain gain1(
			k=1/3,
			y(
				quantity="Basics.Power",
				displayUnit="kW")) annotation(Placement(transformation(
			origin={195,15},
			extent={{-10,-10},{10,10}},
			rotation=-90)));
		GreenCity.Utilities.Electrical.PowerOutput powerOutput1(n=3) annotation(Placement(transformation(
			origin={190,-20},
			extent={{-10,-10},{10,10}},
			rotation=-90)));
		Modelica.Blocks.Sources.RealExpression reactiveLoad(y(
			quantity="Basics.Power",
			displayUnit="kW")=0) annotation(Placement(transformation(extent={{150,-5},{170,15}})));
		GreenCity.GreenBuilding.HeatingSystem.Control.VolumeFlowControllerHeatingSystem vFCtrl_LivingZone(
			QHeatMax(displayUnit="Nm/s")=heatingSystemLivingArea.QHeatNorm*livingZone.AZone*1.2,
			deltaTup=0.1,
			deltaTlow=-0.5,
			qvMax(displayUnit="l/min")=0.00025) "Volume flow controller for heating systems" annotation(Placement(transformation(extent={{115,-85},{85,-55}})));
		Modelica.Blocks.Sources.RealExpression TRefLivingZone(y(
			quantity="Thermics.Temp",
			displayUnit="°C")=294.14999999999998) annotation(Placement(transformation(extent={{150,-70},{130,-50}})));
		Real QHeat(
			quantity="Basics.Power",
			displayUnit="kW") "Heat Power";
		Real Pel(
			quantity="Basics.Power",
			displayUnit="kW") "Common electrical effective power of the zones";
		Real EHeat(
			start=0,
			quantity="Basics.Energy",
			displayUnit="kWh") "Heating energy during simulation time period";
		Real Eel(
			start=0,
			quantity="Basics.Energy",
			displayUnit="kWh") "Electrical energy demand during simulation time period";
	protected
		Real QLossVentilation(
			quantity="Basics.Power",
			displayUnit="kW") "Thermal energy Loss of all Building parts";
		Real QLossTransmission(
			quantity="Basics.Power",
			displayUnit="kW") "Thermal energy losses by heat transmission out of all buildimg zones";
		parameter Real THeatThreshold(
			quantity="Thermics.Temp",
			displayUnit="K")=14+273.15 "Heating threshold temperature";
		Boolean hP "Active heating period";
		Real tHP(
			quantity="Basics.Time",
			start=1) "Length of the heating period";
		Real deltaThP(
			quantity="Thermics.TempDiff",
			displayUnit="K",
			start=1) "Average temperature difference between inside and outside the building";
		Real HT(
			quantity="Thermics.ConvCoeff",
			displayUnit="W/(m²*K)") "Transmission heat loss of the enclosure surface";
		Real QLossTransmissionUpperCeiling(
			quantity="Basics.Power",
			displayUnit="kW") "Thermal energy losses by heat transmission out of all buildimg zones";
		Real QLossTransmissionRoof(
			quantity="Basics.Power",
			displayUnit="kW") "Thermal energy losses by heat transmission out of zone 'Roof'";
		Real QLossTransmissionLivingZone(
			quantity="Basics.Power",
			displayUnit="kW") "Thermal energy losses by heat transmission out of zone 'LivingZone'";
		Real QLossTransmissionOuterWalls(
			quantity="Basics.Power",
			displayUnit="kW") "Thermal energy losses by heat transmission out of outer walls";
		Real QLossTransmissionFloor(
			quantity="Basics.Power",
			displayUnit="kW") "Thermal energy losses by heat transmission through the floor";
		Real QLossTransmissionWindows(
			quantity="Basics.Power",
			displayUnit="kW") "Thermal energy losses by heat transmission out of windows";
		Real QLossTransmissionWindowsHP(
			quantity="Basics.Power",
			displayUnit="kW") "Power";
		Real QLossTransmissionHeatBridges(
			quantity="Basics.Power",
			displayUnit="kW") "Thermal energy losses by heat transmission out of heat bridges of all buildimg zones";
		Real QYieldSolarWindows(
			quantity="Basics.Power",
			displayUnit="kW") "Thermal energy yields from radiation into windows of all building zones";
		Real QYieldSolarWindowsHP(
			quantity="Basics.Power",
			displayUnit="kW") "Thermal energy yields from radiation into windows of all building zones during heating period";
		Real QYieldSolar(
			quantity="Basics.Power",
			displayUnit="kW") "Thermal energy yields from radiation into all building zones";
		Real QYieldInner(
			quantity="Basics.Power",
			displayUnit="kW") "Thermal energy yields from inner heat sources";
		Real PelConsumption(
			quantity="Basics.Power",
			displayUnit="kW") "Electrical power consumption";
		Real ELossVentilation(
			quantity="Basics.Energy",
			displayUnit="kWh",
			start=0) "Accumulated thermal energy loss by ventilation of all building zones";
		Real ELossTransmission(
			quantity="Basics.Energy",
			displayUnit="kWh",
			start=0) "Accumulated thermal energy loss by heat transmission out of all building zones";
		Real ELossTransmissionRoof(
			quantity="Basics.Energy",
			displayUnit="kWh",
			start=0) "Accumulated thermal energy loss by heat transmission out of zone 'Roof'";
		Real ELossTransmissionUpperCeiling(
			quantity="Basics.Energy",
			displayUnit="kWh",
			start=0) "Accumulated thermal energy loss by heat transmission out of the upper Bound of the living zone";
		Real ELossTransmissionOuterWalls(
			quantity="Basics.Energy",
			displayUnit="kWh",
			start=0) "Accumulated thermal energy loss by heat transmission out of side bounds of living zone";
		Real ELossTransmissionFloor(
			quantity="Basics.Energy",
			displayUnit="kWh",
			start=0) "Accumulated thermal energy loss by heat transmission out of lowest floor of living zone";
		Real ELossTransmissionWindows(
			quantity="Basics.Energy",
			displayUnit="kWh",
			start=0) "Accumulated thermal energy loss by heat transmission out of all windows";
		Real ELossTransmissionWindowsHP(
			quantity="Basics.Energy",
			displayUnit="kWh",
			start=0) "Accumulated thermal energy loss by heat transmission out of windows of all building zones during heating period";
		Real ELossTransmissionHeatBridges(
			quantity="Basics.Energy",
			displayUnit="kWh",
			start=0) "Accumulated thermal energy loss by heat transmission out of heat bridges in all building zones";
		Real EYieldSolarWindows(
			quantity="Basics.Energy",
			displayUnit="kWh",
			start=0) "Thermal energy yields from radiation into windows of all building zones";
		Real EYieldSolarWindows_HP(
			quantity="Basics.Energy",
			displayUnit="kWh",
			start=0) "Accumulated thermal energy yield from radiation into windows of all building zones";
		Real EYieldSolar(
			quantity="Basics.Energy",
			displayUnit="kWh",
			start=0) "Accumulated thermal energy yield from radiation into all building zones";
		Real EYieldInner(
			quantity="Basics.Energy",
			displayUnit="kWh",
			start=0) "Accumulated thermal energy yield from inner heat sources";
		Real EelConsumption(
			quantity="Basics.Energy",
			displayUnit="kWh",
			start=0) "Accumulated electrical energy demand of the building caused by inhabitants";
		Real livingZoneBounds "Number of Boundaries Living Quarters";
		Real roofBounds "Number of Boundaries Roof";
		Real cellarBounds "Number of Boundaries Cellar";
	public
		GreenCity.Environment.Components.EnvironmentOutput EnvironmentData "Output block for environment conditions" annotation(Placement(transformation(extent={{435,-20},{490,-5}})));
		parameter Real n=1.1 "Heating system exponent; floor heating: 1 - 1.1; radiator: 1.2 - 1.3" annotation(Dialog(
			group="HeatingSystem",
			tab="General parameters"));
		parameter Real TFlowHeatNorm(quantity="Basics.Temp")=313.15 "Normal flow temperature of heating system; floor heating: 40°C; riator (modern building): 65°C" annotation(Dialog(
			group="HeatingSystem",
			tab="General parameters"));
		parameter Real TReturnHeatNorm(quantity="Basics.Temp")=303.15 "Normal return temperature of heating system; floor heating: 30°C; radiator (modern building): 45°C" annotation(Dialog(
			group="HeatingSystem",
			tab="General parameters"));
		replaceable parameter GreenCity.Utilities.BuildingData.ParameterSelectionSCB.BuildingType.Residential buildingType constrainedby GreenCity.Utilities.BuildingData.ParameterSelectionSCB.BuildingType.BuildType "Type of building usage" annotation(Dialog(
			group="General",
			tab="General parameters"));
		replaceable parameter GreenCity.Utilities.BuildingData.ParameterSelectionSCB.AgeOfBuilding.Until1918 buildingAge constrainedby GreenCity.Utilities.BuildingData.ParameterSelectionSCB.AgeOfBuilding.BA "Period of building construction" annotation(Dialog(
			group="General",
			tab="General parameters"));
		parameter Integer nFloors(quantity="Basics.Unitless")=2 "Number of full floors" annotation(Dialog(
			group="General",
			tab="General parameters"));
		parameter Integer nAp(quantity="Basics.Unitless")=1 if buildingType.iBuild==1 "Number of apartments" annotation(Dialog(
			group="General",
			tab="General parameters"));
		parameter Real ALH(
			quantity="Geometry.Area",
			displayUnit="m²")=250 "Heated (living) area" annotation(Dialog(
			group="General",
			tab="General parameters"));
	protected
		parameter Integer cY(quantity="Basics.Unitless")=buildingAge.endOfBA "Endyear of construction-period" annotation(Dialog(
			group="General",
			tab="General parameters"));
	public
		parameter Real cRH(
			quantity="Geometry.Length",
			displayUnit="m")=2.6 "Clear room hight" annotation(Dialog(
			group="General",
			tab="General parameters"));
		parameter Integer flanking(quantity="Basics.Unitless")=0 "flanking buildings (0; 1; 2)" annotation(Dialog(
			group="General",
			tab="General parameters"));
		parameter Boolean outline=true "Layout of building; true: long-stretched, false: compact" annotation(Dialog(
			group="General",
			tab="General parameters"));
		replaceable parameter GreenCity.Utilities.BuildingData.ParameterSelectionSCB.Roof.Unheated roofType constrainedby GreenCity.Utilities.BuildingData.ParameterSelectionSCB.Roof.RoofType "Type of roof" annotation(Dialog(
			group="Roof",
			tab="General parameters"));
		parameter Boolean dormers=false "Dormers or other roof structures" annotation(Dialog(
			group="Roof",
			tab="General parameters"));
		replaceable parameter GreenCity.Utilities.BuildingData.ParameterSelectionSCB.Basement.Unheated cellarType constrainedby GreenCity.Utilities.BuildingData.ParameterSelectionSCB.Basement.CellarType "Type of cellar" annotation(Dialog(
			group="Cellar",
			tab="General parameters"));
		parameter Boolean newWindows=false "Windows have been replaced after building construction" annotation(Dialog(
			group="Windows",
			tab="General parameters"));
		replaceable parameter GreenCity.Utilities.BuildingData.ParameterSelectionSCB.AgeOfWindows.Until1918 windowAge if newWindows constrainedby GreenCity.Utilities.BuildingData.ParameterSelectionSCB.AgeOfWindows.BA "installation period of windows" annotation(Dialog(
			group="Windows",
			tab="General parameters"));
		replaceable parameter GreenCity.Utilities.BuildingData.ParameterSelectionSCB.Windows.Plastic windowType constrainedby GreenCity.Utilities.BuildingData.ParameterSelectionSCB.Windows.WindowType "Type of windows" annotation(
			Placement(transformation(extent={{-105,30},{-85,50}})),
			Dialog(
				group="Windows",
				tab="General parameters"));
		replaceable parameter GreenCity.Utilities.BuildingData.ParameterSelectionSCB.WallType.Massive roofConstruction constrainedby GreenCity.Utilities.BuildingData.ParameterSelectionSCB.WallType.Type "Type of roof construction" annotation(Dialog(
			group="Buildup",
			tab="buildup + additional insulation"));
		replaceable parameter GreenCity.Utilities.BuildingData.ParameterSelectionSCB.WallType.Massive ceilingConstruction constrainedby GreenCity.Utilities.BuildingData.ParameterSelectionSCB.WallType.Type "Type of construction of upper floor ceiling" annotation(Dialog(
			group="Buildup",
			tab="buildup + additional insulation"));
		replaceable parameter GreenCity.Utilities.BuildingData.ParameterSelectionSCB.WallType.Massive wallConstruction constrainedby GreenCity.Utilities.BuildingData.ParameterSelectionSCB.WallType.Type "Type of construction of the outer walls" annotation(Dialog(
			group="Buildup",
			tab="buildup + additional insulation"));
		replaceable parameter GreenCity.Utilities.BuildingData.ParameterSelectionSCB.WallType.Massive floorConstruction constrainedby GreenCity.Utilities.BuildingData.ParameterSelectionSCB.WallType.Type "Type of construction of walls to cellar or ground" annotation(Dialog(
			group="Buildup",
			tab="buildup + additional insulation"));
		parameter Real roofInsul(
			quantity="Geometry.Length",
			displayUnit="cm")=0.1 "Thickness of additional insulation of the roof" annotation(Dialog(
			group="Thickness of additional insulation",
			tab="buildup + additional insulation"));
		parameter Real ceilingInsul(
			quantity="Geometry.Length",
			displayUnit="cm")=0.1 "Thickness of additional insulation of top floor ceiling" annotation(Dialog(
			group="Thickness of additional insulation",
			tab="buildup + additional insulation"));
		parameter Real wallInsul(
			quantity="Geometry.Length",
			displayUnit="cm")=0.1 "Thickness of additional insulation of the outer walls" annotation(Dialog(
			group="Thickness of additional insulation",
			tab="buildup + additional insulation"));
		parameter Real floorInsul(
			quantity="Geometry.Length",
			displayUnit="cm")=0.1 "Thickness of additional insulation of walls to cellar or ground" annotation(Dialog(
			group="Thickness of additional insulation",
			tab="buildup + additional insulation"));
		parameter Real roofInsA(
			quantity="Basics.RelMagnitude",
			displayUnit="%")=0.4 "percentage of additional insulated area of the roof" annotation(Dialog(
			group="percentage of additional insulated surface area",
			tab="buildup + additional insulation"));
		parameter Real ceilingInsA(
			quantity="Basics.RelMagnitude",
			displayUnit="%")=1 "percentage of additional insulated area of top floor ceiling" annotation(Dialog(
			group="percentage of additional insulated surface area",
			tab="buildup + additional insulation"));
		parameter Real wallInsA(
			quantity="Basics.RelMagnitude",
			displayUnit="%")=0.8 "percentage of additional insulated area of the outer walls" annotation(Dialog(
			group="percentage of additional insulated surface area",
			tab="buildup + additional insulation"));
		parameter Real floorInsA(
			quantity="Basics.RelMagnitude",
			displayUnit="%")=1 "percentage of additional insulated area of the floor" annotation(Dialog(
			group="percentage of additional insulated surface area",
			tab="buildup + additional insulation"));
		Submodels.HeatingSystem_fixedTRet heatingSystemLivingArea(
			QHeatNorm=QHeatNorm*nFloors,
			n=n,
			VHeatMedium=vHeatingSystem*self.AZone,
			TFlowHeatNorm=TFlowHeatNorm,
			TReturnHeatNorm=TReturnHeatNorm,
			TReturnHeatInit=TReturnHeatNorm,
			AZone=LivingAreaAZone) annotation(Placement(transformation(extent={{155,-125},{195,-85}})));
	initial equation
		ELossTransmission=0;
		deltaThP=1;
		tHP=1;
		if EnvironmentConditions.TAmbient<THeatThreshold then
			hP=true;
		else
			hP=false;
		end if;
	equation
		livingZoneBounds=livingZone.Bound;
		roofBounds=roof.Bound;
		cellarBounds=cellar.Bound;
		
		QHeat=cellar.QHeat+heatingSystemLivingArea.QHeat+roof.QHeat;
		Pel=grid.P;
		QLossVentilation=cellar.QLAirLeak+cellar.QAirComfort+livingZone.QAirLeak+livingZone.QAirComfort+roof.QLAirLeak+roof.QAirComfort;
		QLossTransmission=sumVector(cellar.QTransWindow,1,cellar.Bound)+sumVector(cellar.QTransOthers,1,cellar.Bound)+sumVector1(cellar.QBoundIn,cellar.Boundaries.dBound,1,5/*min(max(cellar.Bound,1),5)cellarBounds*/)+sumVector2(cellar.QBound,cellar.Boundaries.dBound,1,cellar.Bound)+sumVector(cellar.QHeatBridge,1,cellar.Bound)
		+sumVector(cellar.QBoundAbsorp,1,cellar.Bound)+sumVector(cellar.QHeatBridgeAbsorp,1,cellar.Bound)
		+QLossTransmissionLivingZone
		+QLossTransmissionRoof;
		QLossTransmissionLivingZone=sumVector(livingZone.QTransWindow,1,livingZone.Bound)+sumVector(livingZone.QTransOthers,1,livingZone.Bound)+sumVector1(livingZone.QBoundIn,livingZone.Boundaries.dBound,1,5/*livingZoneBounds*/)+sumVector2(livingZone.QBound,livingZone.Boundaries.dBound,1,livingZone.Bound)+sumVector(livingZone.QHeatBridge,1,livingZone.Bound)
		+sumVector(livingZone.QBoundAbsorp,1,livingZone.Bound)+sumVector(livingZone.QHeatBridgeAbsorp,1,livingZone.Bound);
		QLossTransmissionUpperCeiling=livingZone.QTransOthers[6]+livingZone.QBoundIn[6]
		+livingZone.QBoundAbsorp[6];
		QLossTransmissionRoof=sumVector(roof.QTransWindow,1,roof.Bound)+sumVector(roof.QTransOthers,1,roof.Bound)+sumVector1(roof.QBoundIn,roof.Boundaries.dBound,1,roof.Bound)+sumVector2(roof.QBound,roof.Boundaries.dBound,1,roof.Bound)+sumVector(roof.QHeatBridge,1,roof.Bound)
		+sumVector(roof.QBoundAbsorp,1,roof.Bound)+sumVector(roof.QHeatBridgeAbsorp,1,roof.Bound);
		QLossTransmissionOuterWalls=sumVector(cellar.QTransOthers,1,4)+sumVector1(cellar.QBoundIn,cellar.Boundaries.dBound,1,4)+sumVector2(cellar.QBound,cellar.Boundaries.dBound,1,4)
		+sumVector(livingZone.QTransOthers,1,4)+sumVector1(livingZone.QBoundIn,livingZone.Boundaries.dBound,1,4)+sumVector2(livingZone.QBound,livingZone.Boundaries.dBound,1,4)
		+sumVector(roof.QTransWindow,1,4)+sumVector(roof.QTransOthers,1,4)+sumVector1(roof.QBoundIn,roof.Boundaries.dBound,1,4)+sumVector2(roof.QBound,roof.Boundaries.dBound,1,4)
		+sumVector(cellar.QBoundAbsorp,1,4)
		+sumVector(livingZone.QBoundAbsorp,1,4)
		+sumVector(roof.QBoundAbsorp,1,4);
		QLossTransmissionFloor=livingZone.QTransOthers[5]+livingZone.QBoundIn[5]+livingZone.QBoundAbsorp[5];
		QLossTransmissionWindows=sumVector(cellar.QTransWindow,1,cellar.Bound)
		+sumVector(livingZone.QTransWindow,1,livingZone.Bound)
		+sumVector(roof.QTransWindow,1,roof.Bound);
		if EnvironmentConditions.DayOfYear < 130 or EnvironmentConditions.DayOfYear > 234 then
		QLossTransmissionWindowsHP=QLossTransmissionWindows;
		else 
		QLossTransmissionWindowsHP=0;
		end if;
		QLossTransmissionHeatBridges=sumVector(cellar.QHeatBridge,1,cellar.Bound)+sumVector(livingZone.QHeatBridge,1,livingZone.Bound)+sumVector(roof.QHeatBridge,1,roof.Bound)
		+sumVector(cellar.QHeatBridgeAbsorp,1,cellar.Bound)+sumVector(livingZone.QHeatBridgeAbsorp,1,livingZone.Bound)+sumVector(roof.QHeatBridgeAbsorp,1,roof.Bound);
		QYieldSolarWindows=sumVector(cellar.QTransWindowAbsorp,1,cellar.Bound)
		+sumVector(livingZone.QTransWindowAbsorp,1,livingZone.Bound)
		+sumVector(roof.QTransWindowAbsorp,1,roof.Bound);
		if EnvironmentConditions.DayOfYear < 130 or EnvironmentConditions.DayOfYear > 234 then
		QYieldSolarWindowsHP=sumVector(cellar.QTransWindowAbsorp,1,cellar.Bound)
		+sumVector(livingZone.QTransWindowAbsorp,1,livingZone.Bound)
		+sumVector(roof.QTransWindowAbsorp,1,5/*!!!roof.Bound!!!*/);
		else 
		QYieldSolarWindowsHP=0;
		end if;
		QYieldSolar=sumVector(cellar.QTransWindowAbsorp,1,cellar.Bound)+sumVector(cellar.QBoundAbsorp,1,cellar.Bound)+sumVector(cellar.QHeatBridgeAbsorp,1,cellar.Bound)
		+sumVector(livingZone.QTransWindowAbsorp,1,livingZone.Bound)+sumVector(livingZone.QBoundAbsorp,1,livingZone.Bound)+sumVector(livingZone.QHeatBridgeAbsorp,1,livingZone.Bound)
		+sumVector(roof.QTransWindowAbsorp,1,roof.Bound)+sumVector(roof.QBoundAbsorp,1,roof.Bound)+sumVector(roof.QHeatBridgeAbsorp,1,roof.Bound);
		QYieldInner=cellar.QPerson+cellar.QLight+cellar.QMachine+cellar.QNorm+cellar.QInner+cellar.QBase+cellar.QelHeat
		+livingZone.QPerson+livingZone.QLight+livingZone.QMachine+livingZone.QNorm+livingZone.QInner+livingZone.QBase+livingZone.QelHeat
		+roof.QPerson+roof.QLight+roof.QMachine+roof.QNorm+roof.QInner+roof.QBase+roof.QelHeat
		+PelConsumption+heatYieldsPerson.y;
		PelConsumption=elPowerConsumption.y;
		
		der(EHeat)=QHeat;
		der(Eel)=Pel;
		der(EelConsumption)=PelConsumption;
		der(ELossVentilation)=QLossVentilation;
		der(ELossTransmission)=QLossTransmission;
		der(ELossTransmissionRoof)=QLossTransmissionRoof;
		der(ELossTransmissionUpperCeiling)=QLossTransmissionUpperCeiling;
		der(ELossTransmissionOuterWalls)=QLossTransmissionOuterWalls;
		der(ELossTransmissionFloor)=QLossTransmissionFloor;
		der(ELossTransmissionWindows)=QLossTransmissionWindows;
		der(ELossTransmissionWindowsHP)=QLossTransmissionWindowsHP;
		der(ELossTransmissionHeatBridges)=QLossTransmissionHeatBridges;
		der(EYieldSolar)=QYieldSolar;
		der(EYieldSolarWindows)=QYieldSolarWindows;
		der(EYieldSolarWindows_HP)=QYieldSolarWindowsHP;
		der(EYieldInner)=QYieldInner;
		when EnvironmentConditions.TAmbient<THeatThreshold then
		hP=true;
		elsewhen EnvironmentConditions.TAmbient>THeatThreshold+1 then
		hP=false;
		end when;
		if  hP then
		der(tHP)=der(time);
		der(deltaThP*tHP)=(livingZone.TZone-EnvironmentConditions.TAmbient);
		else
		der(tHP)=0;
		der(deltaThP)=0;
		end if;
		HT=ELossTransmission/(deltaThP*tHP*AE);
	equation
		connect(livingZone.TZone,temperatureDistribution.TZone2) annotation(
			Line(
				points={{310,-120},{310,-135},{375,-135},{375,-120},{440,-120},{445,
				-120}},
				color={0,0,127}),
			__esi_AutoRoute=false);
		connect(roof.TZone,temperatureDistribution.TZone1) annotation(
			Line(
				points={{310,-180},{310,-190},{400,-190},{400,-125},{440,-125},{445,
				-125}},
				color={0,0,127}),
			__esi_AutoRoute=false);
		connect(temperatureDistribution.ZoneTemperatures[:],roof.ZoneTemperatures[:]) annotation(Line(
			points={{455,-130},{455,-135},{455,-170},{365,-170},{360,-170}},
			color={160,160,255}));
		connect(temperatureDistribution.ZoneTemperatures[:],livingZone.ZoneTemperatures[:]) annotation(
			Line(
				points={{455,-130},{455,-170},{410,-170},{410,-110},{365,-110},{360,
				-110}},
				color={160,160,255}),
			__esi_AutoRoute=false);
		connect(cellar.TZone,temperatureDistribution.TZone3) annotation(
			Line(
				points={{310,-60},{310,-75},{400,-75},{400,-115},{440,-115},{445,
				-115}},
				color={0,0,127}),
			__esi_AutoRoute=false);
		connect(temperatureDistribution.ZoneTemperatures[:],cellar.ZoneTemperatures[:]) annotation(
			Line(
				points={{455,-130},{455,-170},{410,-170},{410,-50},{365,-50},{360,
				-50}},
				color={160,160,255}),
			__esi_AutoRoute=false);
		
		connect(livingZone.EnvironmentConditions,EnvironmentConditions) annotation(Line(
			points={{360,-90},{365,-90},{395,-90},{395,25},{400,25}},
			color={192,192,192}));
		connect(roof.EnvironmentConditions,EnvironmentConditions) annotation(Line(
			points={{360,-150},{365,-150},{395,-150},{395,25},{400,25}},
			color={192,192,192}));
		connect(cellar.EnvironmentConditions,EnvironmentConditions) annotation(Line(
			points={{360,-30},{365,-30},{395,-30},{395,25},{400,25}},
			color={192,192,192}));
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		connect(qv_Sum.y,qv_Ref) annotation(Line(
			points={{-66,-190},{-71,-190},{-95,-190},{-100,-190}},
			color={0,0,127},
			thickness=0.0625));
		
		
		
		
		
		
		connect(switch1.y,qv_Sum.u[1]) annotation(
			Line(
				points={{-31,-10},{-26,-10},{-35,-10},{-35,-190},{-43,-190}},
				color={0,0,127},
				thickness=0.0625),
			__esi_AutoRoute=false);
		connect(cellarHeating.y,switch1.u2) annotation(
			Line(
				points={{19,10},{14,10},{10,10},{10,-10},{-8,-10}},
				color={255,0,255},
				thickness=0.0625),
			__esi_AutoRoute=false);
		
		connect(noVolumeFlow.y,switch1.u3) annotation(
			Line(
				points={{19,25},{14,25},{5,25},{5,-2},{-8,-2}},
				color={0,0,127},
				thickness=0.0625),
			__esi_AutoRoute=false);
		
		connect(noVolumeFlow.y,switch3.u3) annotation(
			Line(
				points={{19,25},{14,25},{5,25},{5,-162},{2,-162}},
				color={0,0,127},
				thickness=0.0625),
			__esi_AutoRoute=false);
		connect(switch3.y,qv_Sum.u[3]) annotation(
			Line(
				points={{-21,-170},{-26,-170},{-35,-170},{-35,-190},{-43,-190}},
				color={0,0,127},
				thickness=0.0625),
			__esi_AutoRoute=false);
		
		
		
		connect(add3.y,livingZone.QHeatCool) annotation(Line(
			points={{246,-100},{251,-100},{285,-100},{290,-100}},
			color={0,0,127},
			thickness=0.0625));
		connect(simTime.y,presenceTable.u[1]) annotation(
			Line(
				points={{81,65},{86,65},{95,65},{95,80},{103,80}},
				color={0,0,127},
				thickness=0.0625),
			__esi_AutoRoute=false);
		connect(presenceTable.y[1],heatYieldsPerson.u1) annotation(Line(
			points={{126,80},{131,80},{153,80},{153,81},{158,81}},
			color={0,0,127},
			thickness=0.0625));
		connect(heatYieldsPerson.y,add3.u1) annotation(
			Line(
				points={{181,75},{196,75},{215,75},{215,-92},{223,-92}},
				color={0,0,127},
				thickness=0.0625),
			__esi_AutoRoute=false);
		connect(PelTable.y[1],elPowerConsumption.u1) annotation(Line(
			points={{126,50},{131,50},{153,50},{153,51},{158,51}},
			color={0,0,127},
			thickness=0.0625));
		connect(elPowerConsumption.y,add3.u2) annotation(
			Line(
				points={{181,45},{186,45},{210,45},{210,-100},{223,-100}},
				color={0,0,127},
				thickness=0.0625),
			__esi_AutoRoute=false);
		connect(elPowerConsumption.y,gain1.u) annotation(Line(
			points={{181,45},{186,45},{195,45},{195,32},{195,27}},
			color={0,0,127},
			thickness=0.0625));
		connect(gain1.y,powerOutput1.Pout[1]) annotation(Line(
			points={{195,4},{195,-1},{195,-5},{195,-10}},
			color={0,0,127},
			thickness=0.0625));
		connect(gain1.y,powerOutput1.Pout[2]) annotation(Line(
			points={{195,4},{195,-1},{195,-5},{195,-10}},
			color={0,0,127},
			thickness=0.0625));
		connect(gain1.y,powerOutput1.Pout[3]) annotation(Line(
			points={{195,4},{195,-1},{195,-5},{195,-10}},
			color={0,0,127},
			thickness=0.0625));
		connect(reactiveLoad.y,powerOutput1.Qout[1]) annotation(Line(
			points={{171,5},{176,5},{185,5},{185,-5},{185,-10}},
			color={0,0,127},
			thickness=0.0625));
		connect(reactiveLoad.y,powerOutput1.Qout[2]) annotation(Line(
			points={{171,5},{176,5},{185,5},{185,-5},{185,-10}},
			color={0,0,127},
			thickness=0.0625));
		connect(reactiveLoad.y,powerOutput1.Qout[3]) annotation(Line(
			points={{171,5},{176,5},{185,5},{185,-5},{185,-10}},
			color={0,0,127},
			thickness=0.0625));
		
		
		
		connect(simTime.y,PelTable.u[1]) annotation(
			Line(
				points={{81,65},{86,65},{95,65},{95,50},{103,50}},
				color={0,0,127},
				thickness=0.0625),
			__esi_AutoRoute=false);
		connect(QPers.y,heatYieldsPerson.u2) annotation(
			Line(
				points={{81,30},{86,30},{140,30},{140,69},{158,69}},
				color={0,0,127},
				thickness=0.0625),
			__esi_AutoRoute=false);
		
		
		
		
		
		
		connect(elPowerConsumptYear.y,elPowerConsumption.u2) annotation(
			Line(
				points={{81,15},{86,15},{150,15},{150,39},{158,39}},
				color={0,0,127},
				thickness=0.0625),
			__esi_AutoRoute=false);
		connect(roofHeating.y,switch3.u2) annotation(
			Line(
				points={{19,-155},{14,-155},{10,-155},{10,-170},{2,-170}},
				color={255,0,255},
				thickness=0.0625),
			__esi_AutoRoute=false);
		
		
		
		
		
		
		connect(distributorLivingZoneRoof.PipeOutRemain,roof.HeatFlow) annotation(
			Line(
				points={{60,-105},{65,-105},{100,-105},{100,-155},{290,-155}},
				color={190,30,45}),
			__esi_AutoRoute=false);
		
		connect(roof.HeatReturn,mergeLivingZoneRoof.PipeIn2) annotation(
			Line(
				points={{290,-165},{180,-165},{90,-165},{90,-145},{70,-145}},
				color={190,30,45}),
			__esi_AutoRoute=false);
		connect(vFCtrl_Cellar.qvRef,switch1.u1) annotation(Line(
			points={{15,-20},{10,-20},{-3,-20},{-3,-18},{-8,-18}},
			color={0,0,127},
			thickness=0.0625));
		
		
		connect(cellar.TZone,vFCtrl_Cellar.TAct) annotation(
			Line(
				points={{310,-60},{310,-65},{165,-65},{165,-30},{50,-30},{45,
				-30}},
				color={0,0,127},
				thickness=0.0625),
			__esi_AutoRoute=false);
		connect(TRef_Keller.y,vFCtrl_Cellar.TRef) annotation(Line(
			points={{74,-10},{69,-10},{50,-10},{45,-10}},
			color={0,0,127},
			thickness=0.0625));
		
		
		
		
		
		
		
		
		
		connect(switch1.y,distributorCellar.qvRef) annotation(Line(
			points={{-31,-10},{-36,-10},{-50,-10},{-50,-55},{-50,-60}},
			color={0,0,127},
			thickness=0.0625));
		connect(distributorCellar.PipeOutRemain,distributorLivingZoneRoof.PipeIn) annotation(
			Line(
				points={{-40,-75},{0,-75},{20,-75},{20,-100},{40,-100}},
				color={190,30,45}),
			__esi_AutoRoute=false);
		connect(distributorCellar.PipeOutRegulated,cellar.HeatFlow) annotation(
			Line(
				points={{-40,-65},{0,-65},{50,-65},{50,-35},{290,-35}},
				color={190,30,45}),
			__esi_AutoRoute=false);
		
		connect(mergeLivingZoneRoof.PipeOut,merge_Cellar.PipeIn2) annotation(
			Line(
				points={{50,-140},{35,-140},{15,-140},{15,-125},{-40,-125}},
				color={190,30,45}),
			__esi_AutoRoute=false);
		connect(cellar.HeatReturn,merge_Cellar.PipeIn1) annotation(
			Line(
				points={{290,-45},{180,-45},{125,-45},{125,-115},{-40,-115}},
				color={190,30,45}),
			__esi_AutoRoute=false);
		
		connect(vFCtrl_Roof.qvRef,switch3.u1) annotation(Line(
			points={{25,-180},{20,-180},{7,-180},{7,-178},{2,-178}},
			color={0,0,127},
			thickness=0.0625));
		connect(roof.TZone,vFCtrl_Roof.TAct) annotation(Line(
			points={{310,-180},{310,-185},{310,-190},{60,-190},{55,-190}},
			color={0,0,127},
			thickness=0.0625));
		connect(TRef_Dach.y,vFCtrl_Roof.TRef) annotation(Line(
			points={{64,-170},{59,-170},{60,-170},{55,-170}},
			color={0,0,127},
			thickness=0.0625));
		
		
		connect(TRefLivingZone.y,vFCtrl_LivingZone.TRef) annotation(Line(
			points={{129,-60},{124,-60},{120,-60},{115,-60}},
			color={0,0,127},
			thickness=0.0625));
		
		
		connect(livingZone.TZone,vFCtrl_LivingZone.TAct) annotation(
			Line(
				points={{310,-120},{310,-135},{145,-135},{145,-80},{120,-80},{115,
				-80}},
				color={0,0,127},
				thickness=0.0625),
			__esi_AutoRoute=false);
		connect(vFCtrl_LivingZone.qvRef,qv_Sum.u[2]) annotation(
			Line(
				points={{85,-70},{80,-70},{-35,-70},{-35,-190},{-43,-190}},
				color={0,0,127},
				thickness=0.0625),
			__esi_AutoRoute=false);
		connect(vFCtrl_LivingZone.qvRef,distributorLivingZoneRoof.qvRef) annotation(Line(
			points={{85,-70},{80,-70},{50,-70},{50,-85},{50,-90}},
			color={0,0,127},
			thickness=0.0625));
		connect(MT_Flow.TMedium,vFCtrl_LivingZone.TFlow) annotation(
			Line(
				points={{-90,-80},{-90,-85},{105,-85}},
				color={0,0,127},
				thickness=0.0625),
			__esi_AutoRoute=false);
		connect(MT_Flow.TMedium,vFCtrl_Roof.TFlow) annotation(
			Line(
				points={{-90,-80},{-90,-85},{-30,-85},{-30,-215},{45,-215},{45,
				-195}},
				color={0,0,127},
				thickness=0.0625),
			__esi_AutoRoute=false);
		connect(MT_Flow.TMedium,vFCtrl_Cellar.TFlow) annotation(Line(
			points={{-90,-80},{-90,-85},{35,-85},{35,-40},{35,-35}},
			color={0,0,127},
			thickness=0.0625));
		connect(PipeIn,MT_Flow.PipeIn) annotation(Line(
			points={{-130,-70},{-125,-70},{-105,-70},{-100,-70}},
			color={190,30,45},
			thickness=0.0625));
		connect(MT_Flow.PipeOut,distributorCellar.PipeIn) annotation(Line(
			points={{-80,-70},{-75,-70},{-65,-70},{-60,-70}},
			color={190,30,45}));
		connect(MT_Return.TMedium,vFCtrl_LivingZone.TReturn) annotation(Line(
			points={{-90,-130},{-90,-135},{95,-135},{95,-90},{95,-85}},
			color={0,0,127},
			thickness=0.0625));
		connect(MT_Return.TMedium,vFCtrl_Roof.TReturn) annotation(
			Line(
				points={{-90,-130},{-90,-135},{-25,-135},{-25,-210},{35,-210},{35,
				-195}},
				color={0,0,127},
				thickness=0.0625),
			__esi_AutoRoute=false);
		connect(MT_Return.TMedium,vFCtrl_Cellar.TReturn) annotation(
			Line(
				points={{-90,-130},{-90,-135},{25,-135},{25,-40},{25,-35}},
				color={0,0,127},
				thickness=0.0625),
			__esi_AutoRoute=false);
		connect(MT_Return.PipeOut,PipeOut) annotation(Line(
			points={{-100,-120},{-105,-120},{-125,-120},{-130,-120}},
			color={190,30,45}));
		connect(merge_Cellar.PipeOut,MT_Return.PipeIn) annotation(Line(
			points={{-60,-120},{-65,-120},{-75,-120},{-80,-120}},
			color={190,30,45}));
		connect(powerOutput1.LVGrid3,grid.LVGridA) annotation(Line(
			points={{185,-30},{185,-35},{185,-200},{200,-200},{205,-200}},
			color={247,148,29},
			thickness=0.0625));
		connect(grid.LVMastGrid,Grid3) annotation(
			Line(
				points={{225,-235},{225,-240},{225,-275}},
				color={247,148,29},
				thickness=0.0625),
			__esi_AutoRoute=false);
		connect(grid.LVGridF,roof.Grid3) annotation(Line(
			points={{245,-230},{250,-230},{340,-230},{340,-185},{340,-180}},
			color={247,148,29},
			thickness=0.0625));
		connect(grid.LVGridE,livingZone.Grid3) annotation(
			Line(
				points={{245,-215},{260,-215},{270,-215},{270,-130},{340,-130},{340,
				-120}},
				color={247,148,29},
				thickness=0.0625),
			__esi_AutoRoute=false);
		connect(grid.LVGridD,cellar.Grid3) annotation(
			Line(
				points={{245,-200},{255,-200},{260,-200},{260,-70},{340,-70},{340,
				-60}},
				color={247,148,29},
				thickness=0.0625),
			__esi_AutoRoute=false);
		
		
		connect(Temp_flankingZones.y,temperatureDistribution.TZone4) annotation(Line(
			points={{434,-50},{429,-50},{429,-110},{440,-110},{445,-110}},
			color={0,0,127},
			thickness=0.0625));
		connect(EnvironmentData.EnvironmentConditions,EnvironmentConditions) annotation(Line(
			points={{460,-5},{460,0},{460,25},{405,25},{400,25}},
			color={192,192,192},
			thickness=0.0625));
		connect(EnvironmentData.TAmbient,temperatureDistribution.TZone5) annotation(
			Line(
				points={{475,-20},{475,-25},{420,-25},{420,-105},{445,-105}},
				color={0,0,127},
				thickness=0.0625),
			__esi_AutoRoute=false);
		connect(add3.u3,heatingSystemLivingArea.QHeat) annotation(Line(
			points={{223,-108},{218,-108},{200,-108},{200,-105},{195,-105}},
			color={0,0,127},
			thickness=0.0625));
		connect(heatingSystemLivingArea.HeatFlow,distributorLivingZoneRoof.PipeOutRegulated) annotation(Line(
			points={{155,-95},{150,-95},{65,-95},{60,-95}},
			color={190,30,45},
			thickness=0.0625));
		connect(mergeLivingZoneRoof.PipeIn1,heatingSystemLivingArea.HeatReturn) annotation(
			Line(
				points={{70,-135},{75,-135},{140,-135},{140,-115},{155,-115}},
				color={190,30,45},
				thickness=0.0625),
			__esi_AutoRoute=false);
		connect(livingZone.TZone,heatingSystemLivingArea.TZone) annotation(
			Line(
				points={{310,-120},{310,-125},{310,-135},{175,-135},{175,-125}},
				color={0,0,127},
				thickness=0.0625),
			__esi_AutoRoute=false);
	annotation(
		Icon(
			coordinateSystem(extent={{-200,-200},{200,200}}),
			graphics={
							Bitmap(
								imageSource="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
vOaGf91lAAAAAElFTkSuQmCC",
								extent={{-200,-200},{200,200}}),
							Text(
								textString="DZ",
								fontSize=14,
								textStyle={
									TextStyle.Bold},
								lineColor={0,128,255},
								extent={{7.2,-65.7},{320.5,-285.7}})}),
		Documentation(info="<HTML><HEAD>
<META http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\"> 
<TITLE>3-zone-building with fixed return temperature</TITLE> 
<STYLE type=\"text/css\">
table>tbody>tr:hover,th{background-color:#edf1f3}html{font-size:90%}body,table{font-size:1rem}body{font-family:'Open Sans',Arial,sans-serif;color:#465e70}h1,h2{margin:1em 0 .6em;font-weight:600}p{margin-top:.3em;margin-bottom:.2em}table{border-collapse:collapse;margin:1em 0;width:100%;}tr{border:1px solid #beccd3}td,th{padding:.3em 1em; border-width: 1px; border-style: solid; border-color: rgb(190, 204, 211);}td{word-break:break-word}tr:nth-child(even){background-color:#fafafa}th{font-family:'Open Sans Semibold',Arial,sans-serif;font-weight:700;text-align:left;word-break:keep-all}.lib-wrap{width:70%}@media screen and (max-width:800px){.lib-wrap{width:100%}}td p{margin:.2em}
</STYLE>
 
<META name=\"GENERATOR\" content=\"MSHTML 11.00.10570.1001\"></HEAD> 
<BODY>
<H1>3-zone-building with fixed return temperature</H1>
<P>Based on GreenCity's 'Heated 3-Zone-Building (Cellar, Living Zone, Roof) with 
Simplified Parametrization'</P>
<P><BR></P>
<P>Changes:</P>
<UL>
  <LI> Return temperature is defined by fixed parameter, not by parameters of 
  the   heating system</LI></UL>
<HR>

<DIV class=\"lib-wrap\">
<TABLE class=\"type\">
  <TBODY>
  <TR>
    <TH>Symbol:</TH>
    <TD colspan=\"3\"><IMG width=\"168\" height=\"265\" src=\"data:image/png;base64,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\"></TD></TR>
  <TR>
    <TH>Identifier:</TH>
    <TD colspan=\"3\">CoSES_Models.Consumer.SimpleHeatedBuilding_fixedTRet</TD></TR>
  <TR>
    <TH>Version:</TH>
    <TD colspan=\"3\">1.0</TD></TR>
  <TR>
    <TH>File:</TH>
    <TD colspan=\"3\">SimpleHeatedBuilding_fixedTRet.mo</TD></TR>
  <TR>
    <TH>Connectors:</TH>
    <TD>Demanded volume flow of heating medium</TD>
    <TD>qv_Ref</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Zone temperature of Cellar, living area and roof</TD>
    <TD>TZone</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Ambient conditions connector</TD>
    <TD>EnvironmentConditions</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Connector for volume flow input</TD>
    <TD>PipeIn</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Connector for volume flow output</TD>
    <TD>PipeOut</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Electrical connector for 3-phase conductors</TD>
    <TD>Grid3</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>Parameters:</TH>
    <TD>Building zone simulating inner heat losses and yields as well as 
      heating system behavior</TD>
    <TD>cellar</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Building zone including inner heat losses and yields</TD>
    <TD>livingZone</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Building zone including inner heat losses and yields as well as 
      heating system behavior</TD>
    <TD>roof</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Zone temperature distribution interface</TD>
    <TD>temperatureDistribution</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Set output signal to a time varying Real expression</TD>
    <TD>Temp_flankingZones</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Electrical power grid for connection of maximum six 3-phase AC 
      components</TD>
    <TD>grid</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Set output signal to a time varying Real expression</TD>
    <TD>gridVoltage</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Volume flow controller for heating systems</TD>
    <TD>vFCtrl_Cellar</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Set output signal to a time varying Real expression</TD>
    <TD>TRef_Keller</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Controllable valve for volume flow distribution</TD>
    <TD>distributorCellar</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Valve for volume flow merging</TD>
    <TD>merge_Cellar</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Measurement of pipe temperature and volume flow</TD>
    <TD>MT_Flow</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Measurement of pipe temperature and volume flow</TD>
    <TD>MT_Return</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Controllable valve for volume flow distribution</TD>
    <TD>distributorLivingZoneRoof</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Valve for volume flow merging</TD>
    <TD>mergeLivingZoneRoof</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Volume flow controller for heating systems</TD>
    <TD>vFCtrl_Roof</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Set output signal to a time varying Real expression</TD>
    <TD>TRef_Dach</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Output the sum of the elements of the input vector</TD>
    <TD>qv_Sum</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Switch between two Real signals</TD>
    <TD>switch1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Switch between two Real signals</TD>
    <TD>switch3</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Set output signal to a time varying Boolean expression</TD>
    <TD>cellarHeating</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Set output signal to a time varying Real expression</TD>
    <TD>noVolumeFlow</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Set output signal to a time varying Boolean expression</TD>
    <TD>roofHeating</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Table look-up in one dimension (matrix/file) with n inputs and n 
      outputs</TD>
    <TD>PelTable</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Set output signal to a time varying Real expression</TD>
    <TD>simTime</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Output the sum of the three inputs</TD>
    <TD>add3</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Table look-up in one dimension (matrix/file) with n inputs and n 
      outputs</TD>
    <TD>presenceTable</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Output product of the two inputs</TD>
    <TD>heatYieldsPerson</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Set output signal to a time varying Real expression</TD>
    <TD>elPowerConsumptYear</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Set output signal to a time varying Real expression</TD>
    <TD>QPers</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Output product of the two inputs</TD>
    <TD>elPowerConsumption</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Output the product of a gain value with the input signal</TD>
    <TD>gain1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Variable effective and reactive power supply and consumption</TD>
    <TD>powerOutput1</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Set output signal to a time varying Real expression</TD>
    <TD>reactiveLoad</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Volume flow controller for heating systems</TD>
    <TD>vFCtrl_LivingZone</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Set output signal to a time varying Real expression</TD>
    <TD>TRefLivingZone</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Output block for environment conditions</TD>
    <TD>EnvironmentData</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heating system exponent; floor heating: 1 - 1.1; radiator: 1.2 - 
1.3</TD>
    <TD>n</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Normal flow temperature of heating system; floor heating: 40°C; riator 
      (modern building): 65°C</TD>
    <TD>TFlowHeatNorm</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Normal return temperature of heating system; floor heating: 30°C; 
      radiator (modern building): 45°C</TD>
    <TD>TReturnHeatNorm</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Type of building usage</TD>
    <TD>buildingType</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Period of building construction</TD>
    <TD>buildingAge</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Number of full floors</TD>
    <TD>nFloors</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Number of apartments</TD>
    <TD>nAp</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heated (living) area</TD>
    <TD>ALH</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Clear room hight</TD>
    <TD>cRH</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>flanking buildings (0; 1; 2)</TD>
    <TD>flanking</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Layout of building; true: long-stretched, false: compact</TD>
    <TD>outline</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Type of roof</TD>
    <TD>roofType</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Dormers or other roof structures</TD>
    <TD>dormers</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Type of cellar</TD>
    <TD>cellarType</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Windows have been replaced after building construction</TD>
    <TD>newWindows</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>installation period of windows</TD>
    <TD>windowAge</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Type of windows</TD>
    <TD>windowType</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Type of roof construction</TD>
    <TD>roofConstruction</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Type of construction of upper floor ceiling</TD>
    <TD>ceilingConstruction</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Type of construction of the outer walls</TD>
    <TD>wallConstruction</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Type of construction of walls to cellar or ground</TD>
    <TD>floorConstruction</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Thickness of additional insulation of the roof</TD>
    <TD>roofInsul</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Thickness of additional insulation of top floor ceiling</TD>
    <TD>ceilingInsul</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Thickness of additional insulation of the outer walls</TD>
    <TD>wallInsul</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Thickness of additional insulation of walls to cellar or ground</TD>
    <TD>floorInsul</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>percentage of additional insulated area of the roof</TD>
    <TD>roofInsA</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>percentage of additional insulated area of top floor ceiling</TD>
    <TD>ceilingInsA</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>percentage of additional insulated area of the outer walls</TD>
    <TD>wallInsA</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>percentage of additional insulated area of the floor</TD>
    <TD>floorInsA</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heating system with fixed return temperature</TD>
    <TD>heatingSystemLivingArea</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>Results:</TH>
    <TD>Demanded volume flow of heating medium</TD>
    <TD>qv_Ref</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Zone temperature of Cellar, living area and roof</TD>
    <TD>TZone</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heat Power</TD>
    <TD>QHeat</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Common electrical effective power of the zones</TD>
    <TD>Pel</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Heating energy during simulation time period</TD>
    <TD>EHeat</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Electrical energy demand during simulation time period</TD>
    <TD>Eel</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Type of building usage</TD>
    <TD>buildingType</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Period of building construction</TD>
    <TD>buildingAge</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Type of roof</TD>
    <TD>roofType</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Type of cellar</TD>
    <TD>cellarType</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>installation period of windows</TD>
    <TD>windowAge</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Type of windows</TD>
    <TD>windowType</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Type of roof construction</TD>
    <TD>roofConstruction</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Type of construction of upper floor ceiling</TD>
    <TD>ceilingConstruction</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Type of construction of the outer walls</TD>
    <TD>wallConstruction</TD>
    <TD>&nbsp;</TD></TR>
  <TR>
    <TH>&nbsp;</TH>
    <TD>Type of construction of walls to cellar or ground</TD>
    <TD>floorConstruction</TD>
    <TD>&nbsp;</TD></TR></TBODY></TABLE></DIV>
<H2>Description:</H2>
<P>From 'Heated 3-Zone-Building (Cellar, Living Zone, Roof) with Simplified 
Parametrization':</P>
<P>This  three-zone-building model utilizes the method \"Kurzverfahren 
Energieprofil\"  from IWU GmbH. General characteristics such as year of 
construction, ground plot and zone-heating  properties are used for the simple 
parametrization of the complete building.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  </P></BODY></HTML>
"),
		experiment(
			StopTime=14400,
			StartTime=0,
			Tolerance=1e-06,
			Interval=28.8,
			__esi_Solver(
				bSplitCodeGen=false,
				typename="CVODE"),
			__esi_MinInterval="9.999999999999999e-10",
			__esi_MaxInterval="28.8",
			__esi_AbsTolerance="1e-6"));
end SimpleHeatedBuilding_fixedTRet;
