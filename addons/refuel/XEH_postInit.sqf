#include "script_component.hpp"

if (isServer) exitWith {};

["MDL_refuelVehicle", FUNC(refuelVehicle)] call CBA_fnc_addEventHandler;
