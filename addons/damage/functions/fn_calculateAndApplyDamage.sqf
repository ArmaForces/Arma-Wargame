#include "script_component.hpp"
/*
 * Author: 3Mydlo3
 * Handles damage calculation and applying using HitPart EH data.
 *
 * Arguments:
 * 0: Targeted object <OBJECT>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

params ["_unit", "_shooter", "_hitDir", "_hitPositionAGL", "_velocity", "_projectile", "_ammo"];
_ammo params ["_hitValue", "_indirectHitValue", "_indirectHitRange", "_explosiveDamage", "_ammoClassName"];

#ifdef DEV_DEBUG
diag_log format ["WARGAY DEBUG CALCULATE DAMAGE [%1]: %2", diag_tickTime, str _this];
#endif

private _unitType = VehicleTypes getOrDefault [toUpper typeOf _unit, []];
private _unitArmor = if (_unitType isEqualTo []) then { NO_ARMOR } else {
    _unitType getOrDefault ["armor", NO_ARMOR]
};

private _armor = switch (_hitDir) do {
    case "FRONT": { _unitArmor select 0 };
    case "SIDE": { _unitArmor select 1 };
    case "REAR": { _unitArmor select 2 };
    case "TOP": { _unitArmor select 3 };
    default { 0 };
};

private _ammoInfo = AmmoTypes getOrDefault [toUpper _ammoClassName, []];
if (_ammoInfo isEqualTo []) then {
    // Try to recover for small arms as I was lazy and didn't want to copy all the ammo classes
    private _isSmallArms = getNumber (configFile >> "CfgAmmo" >> _ammoClassName >> "caliber") < 1;
    if (_isSmallArms) then {
        private _hashMap = AmmoTypes get "SMALL_ARMS";
        AmmoTypes set [toUpper _ammoClassName, _hashMap];
    };
};
if (_ammoInfo isEqualTo []) exitWith {
    #ifdef DEV_DEBUG
    private _infoMsg = format ["Unknown ammunition '%1' used, ignoring calculations",_ammoClassName];
    systemChat _infoMsg;
    diag_log _infoMsg;
    #endif
};

private _ammoDamage = _ammoInfo getOrDefault ["damage", 0];
if (_ammoDamage isEqualTo 0) exitWith {};

private _isUnknownAmmoType = false;
private _ammoType = _ammoInfo getOrDefault ["type", "NONE"];
private _damage = switch (_ammoType) do {
    case "AP": {
        private _initialVelocity = _projectile getVariable ["MDL_initialVelocity", [0, 0, 0]];
        [_armor, _ammoDamage, _velocity, _initialVelocity] call FUNC(keDamage)
    };
    case "HEAT": {
        // Ignore no velocity HEAT as this is most likely some splash and we don't want that
        if (_velocity isEqualTo [0, 0, 0]) exitWith {};
        [_armor, _ammoDamage] call FUNC(heatDamage)
    };
    case "HE" : {
        private _distanceToTarget = if (_hitPositionAGL isEqualTo []) then { 0 } else { getPosATL _unit distance _hitPositionAGL };
        [_armor, _ammoDamage, _distanceToTarget] call FUNC(heDamage)
    };
    default { _isUnknownAmmoType = true; 0 };
};

if (_isUnknownAmmoType) exitWith {
    #ifdef DEV_DEBUG
    private _infoMsg = format ["Unknown ammunition type '%1' used, ignoring calculations",_ammoType];
    systemChat _infoMsg;
    diag_log _infoMsg;
    #endif
};

if (GVAR(showDamageFeedback)) then {
    private _infoMsg = format ["Potential damage: %1 %2, Hit armor: %3 %4, Actual damage: %5", _ammoDamage, _ammoType, _hitDir, _armor, _damage];
    systemChat _infoMsg;
    #ifdef DEV_DEBUG
    diag_log _infoMsg;
    #endif
};

#ifdef DEV_DEBUG
private _infoMsg = format ["Potential damage: %1 %2, Hit armor: %3 %4, Actual damage: %5", _ammoDamage, _ammoType, _hitDir, _armor, _damage];
systemChat _infoMsg;
diag_log _infoMsg;
#endif

if (_damage isEqualTo 0) exitWith {};

["MDL_applyDamage", [_unit, _damage, _shooter]] call CBA_fnc_serverEvent;