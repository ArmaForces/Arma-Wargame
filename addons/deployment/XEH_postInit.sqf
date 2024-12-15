#include "script_component.hpp"

if (isServer) exitWith {};

["MDL_createVehicleFailed", {
    systemChat LLSTRING(DeploymentFailure);
}] call CBA_fnc_addEventHandler;

["MDL_vehicleDeployment", {
    params ["_vehicleClassName", "_caller", "_vehicle"];

    if (_caller isEqualTo player) then {
        player moveInDriver _vehicle;
    };

    private _vehicleInfo = VehicleTypes getOrDefault [toUpper _vehicleClassName, ""];
    private _vehicleName = if (_vehicleInfo isNotEqualTo "") then {
        [_vehicleInfo] call FUNC(getVehicleDisplayName)
    } else {
        _vehicleClassName
    };

    [WEST, "HQ"] sideChat format [LLSTRING(DeploymentOfVehicle), _vehicleName, name _caller];
}] call CBA_fnc_addEventHandler;

["MDL_vehicleDeploymentNoLongerPossible", {
    params ["_vehicleClassName"];
    private _vehicleInfo = VehicleTypes getOrDefault [toUpper _vehicleClassName, ""];
    private _vehicleName = if (_vehicleInfo isNotEqualTo "") then {
        [_vehicleInfo] call FUNC(getVehicleDisplayName)
    } else {
        _vehicleClassName
    };

    [WEST, "HQ"] sideChat format [LLSTRING(DeploymentOfVehicleNoLongerPossible), _vehicleName];
}] call CBA_fnc_addEventHandler;

// TODO: Consider where to put this event
["MDL_unitLost", {
    params ["_unit"];
    private _vehicleDisplayName = [_unit] call FUNC(getVehicleDisplayName);
    private _crew = crew _unit;
    private _crewNames = if (_crew isEqualTo []) then {
        ""
    } else {
        format ["%1: %2", groupId group leader effectiveCommander _unit, _crew]
    };

    [WEST, "HQ"] sideChat format [LLSTRING(UnitLost), _vehicleDisplayName, _crewNames]
}] call CBA_fnc_addEventHandler;