#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Changes availability of given vehicle class according to the number specified.
 * Cannot change availability below 0.
 *
 * Arguments:
 * 0: Vehicle class that will be deployable <STRING>
 * 1: Requested change in availability (can be negative) <NUMBER>
 *
 * Example:
 * ["GM_GC_ARMY_T55AM2", 4] call afwg_deployment_fnc_addDeployableVehicle
 *
 * Return Value:
 * New availability of given vehicle <NUMBER>
 *
 * Public: Yes
 */

params [["_vehicleClassName", "", [""]], ["_count", 0, [0]]];

if (_vehicleClassName isEqualTo "") exitWith { 0 };

private _currentCount = GVAR(spawnableVehicles) getOrDefault [_vehicleClassName, 0];

private _newCount = (_currentCount + _count) max 0;
GVAR(spawnableVehicles) set [_vehicleClassName, _newCount];

_newCount
