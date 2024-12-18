#include "script_component.hpp"

if (!hasInterface) exitWith {};

[FUNC(enemyMarkersLoop)] call afm_common_fnc_runAfterSettingsInit;

// TODO: Consider moving this to the same component that triggers the event
["MDL_unitSpotted", {
    params ["_unit"];
    if (_unit isKindOf "Man") exitWith {};
    [_unit] call FUNC(createVehicleMarker);
}] call CBA_fnc_addEventHandler;
