#include "script_component.hpp"

if (isServer) exitWith {};

["MDL_rearmVehicle", FUNC(rearmVehicle)] call CBA_fnc_addEventHandler;
