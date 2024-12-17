#include "script_component.hpp"

// Can be initialized using FUNC(addDeployableVehicle)
GVAR(spawnableVehicles) = createHashMap;

if (isServer) then { call COMPILE_SCRIPT(XEH_postInitServer) };
if (!hasInterface) exitWith {};

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
        [_vehicleInfo] call EFUNC(common,getVehicleDisplayName)
    } else {
        _vehicleClassName
    };

    [WEST, "HQ"] sideChat format [LLSTRING(DeploymentOfVehicle), _vehicleName, name _caller];
}] call CBA_fnc_addEventHandler;

["MDL_vehicleDeploymentNoLongerPossible", {
    params ["_vehicleClassName"];
    private _vehicleInfo = VehicleTypes getOrDefault [toUpper _vehicleClassName, ""];
    private _vehicleName = if (_vehicleInfo isNotEqualTo "") then {
        [_vehicleInfo] call EFUNC(common,getVehicleDisplayName)
    } else {
        _vehicleClassName
    };

    [WEST, "HQ"] sideChat format [LLSTRING(DeploymentOfVehicleNoLongerPossible), _vehicleName];
}] call CBA_fnc_addEventHandler;

["MDL_unitLost", {
    params ["_unit"];
    private _vehicleDisplayName = [_unit] call EFUNC(common,getVehicleDisplayName);
    private _crew = crew _unit;
    private _crewNames = if (_crew isEqualTo []) then {
        ""
    } else {
        format ["%1: %2", groupId group leader effectiveCommander _unit, _crew]
    };

    [WEST, "HQ"] sideChat format [LLSTRING(UnitLost), _vehicleDisplayName, _crewNames]
}] call CBA_fnc_addEventHandler;
