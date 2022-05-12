# CoSES thermal Prosumer House Model (ProHMo)

ProHMo is a library with detailed models of the heating system of 5 houses created with Modelica in SimulationX. The models are representing the thermal system of the [Center for Combined Smart Energy Systems (CoSES) laboratory](https://www.mep.tum.de/en/mep/coses/) and are validated by measurements from the laboratory.

The library includes FMI models that can be integrated in other software environments.

# Model Overview

The buildings are equipped with different heat generators, storages and heating systems:
||Building 1|Building 2|Building 3|Building 4|Building 5|
|---|---|---|---|---|---|
|CHP|2 kW nominal electric power|-|-|-|5 kW nominal electric power|
|Condensing Boiler|14 kW nominal heat power|20 kW nominal heat power|-|20 kW nominal heat power|50 kW nominal heat power|
|Heat Pump|-|Air Source Heat Pump, 10 kW nominal heat power|Ground Source Heat Pump, 10 kW nominal heat power|-|-|-|
|Solar Thermal Heat Generator|9 kW peak power|9 kW peak power|9 kW peak power|-|-|
|Thermal Storage|800 l|800 l|1000 l|1000 l|2000 l|
|Number of Inhabitants|6|6|8|6|16|
|Living Area|300 m²|300 m²|400 m²|300 m²|750 m²|
|Heating System|Radiators|Floor Heating|Floor Heating|Radiators|Radiators|


Each househas a standard rule based control, that can be activated or overwritten. When activated, all input signals to the components will be ignored.

# Library structure
* *CodeExport* package: contains SimulationX models for CodeExport via FMI or to VeriStand and the exported .FMI and .dll models
* *Consumer* package: contains models for heating and domestic hot water consumption
* *Data*: contains weather and consumption data
* *Distribution* package: contains models for different heat distribution systems as described in https://doi.org/10.1016/j.egyr.2021.08.085
* *Environment* package: contains environment models and weather data
* *Examples*: contains example models of the different Heat Generators and buildings
* *HeatGenerator* package: contains validated SimulationX and Modelica models of the heat generators of the CoSES laboratory
* *Houses* package: contains models of the 5 houses including basic control strategies
* *Storage* package: contains models for thermal storages

# Requirements
The library is developed and tested with the modeling and simulation environment "SimulationX" by ESI. The used version is 4.2.3
It inherits from the Modelica Standard Library (version 3.2.2) and the GreenCity library.

The FMI models were created for Dymola, other systems might require some adaptions.