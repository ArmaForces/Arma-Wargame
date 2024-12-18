#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Initializes vehicles to work with custom damage model.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Public: No
 */

params ["_entity"];

#ifdef DEV_DEBUG
LOG_3("Init [%1]: Entity: %2, Type: %3",diag_tickTime,_entity,typeOf _entity);
#endif

private _vehicleHitpoints = [_entity, "hitpoints"] call EFUNC(common,getVehicleInfo);
if (_vehicleHitpoints isEqualTo objNull) then {
    private _defaultHitpoints = 10;
    _vehicleHitpoints = _defaultHitpoints;
    WARNING_2("Hitpoints not defined for %1. Setting default hitpoints %2",typeOf _entity,_defaultHitpoints);
} else {
    LOG_2("Hitpoints for entity %1: %2",typeOf _entity,str _vehicleHitpoints);
};

_entity setVariable ["MDL_currentHp", _vehicleHitpoints];
_entity setVariable ["MDL_maxHp", _vehicleHitpoints];

_entity addEventHandler ["HandleDamage", {
    _this call EFUNC(event_handlers,handleDamage);
}];
_entity addEventHandler ["HitPart", EFUNC(event_handlers,hitPart)];
_entity addEventHandler ["Fired", EFUNC(event_handlers,fired)];

LOG_1("Event handlers registered for %1",_entity);

// Increase fuel consumption for players
if (_entity getVariable ["MDL_deployedVehicle", false]) then {
    private _fuelCoef = if (_entity isKindOf "Air") then {
        EGVAR(refuel,fuelConsumptionMultiplier)/2
    } else {
        EGVAR(refuel,fuelConsumptionMultiplier)
    };

    _entity setFuelConsumptionCoef _fuelCoef;
};

_entity allowCrewInImmobile true;

if (hasInterface) then {
    // TODO: Consider allowing repair only near supply vehicles
    // TODO: Consider repair/rearm/refuel for all eligible vehicles in some radius (e.g., via some deployable)
    [_entity] call EFUNC(repair,addRepairAction);
    [_entity] call EFUNC(rearm,addRearmAction);
    [_entity] call EFUNC(refuel,addRefuelAction);

    if (_entity getVariable ["MDL_isSpawner", false]) then {
        [_entity] call FUNC(vehicleSpawnerInit);
        LOG_1("Initialized spawner using %1",_entity);
    };
};
