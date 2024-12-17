#include "script_component.hpp"

GVAR(isTest) = true;

AmmoTypes = createHashMapFromArray
    ("true" configClasses (configFile >> "CfgWargay" >> "Ammo")
    apply {
        private _hashMap = createHashMap;
        _hashMap set [CLASS_NAME_PROPERTY, toUpper configName _x];
        _hashMap set [DAMAGE_PROPERTY, getNumber (_x >> DAMAGE_PROPERTY)];
        _hashMap set [TYPE_PROPERTY, getText (_x >> TYPE_PROPERTY)];

        private _child = getText (_x >> "child");
        if (_child isNotEqualTo "") then {
            _hashMap set ["child", _child];
        };

        LOG_1("Configuration for ammo type %1 read from config",toUpper configName _x);
        [toUpper configName _x, _hashMap]
    });

VehicleTypes = createHashMapFromArray
    ("true" configClasses (configFile >> "CfgWargay" >> "Vehicles")
    apply {
        private _hashMap = createHashMap;
        _hashMap set [CLASS_NAME_PROPERTY, toUpper configName _x];
        _hashMap set ["pointCost", getNumber (_x >> "pointCost")];
        _hashMap set ["hitpoints", getNumber (_x >> "hitpoints")];
        _hashMap set ["armor", getArray (_x >> "armor")];
        _hashMap set ["iconPath", getText (_x >> "iconPath")];
        _hashMap set ["markerType", getText (_x >> "markerType")];
        _hashMap set ["isCommandVehicle", (_x >> "isCommandVehicle") call BIS_fnc_getCfgDataBool];
        _hashMap set ["isLogistics", (_x >> "isLogistics") call BIS_fnc_getCfgDataBool];
        _hashMap set ["isRecon", (_x >> "isRecon") call BIS_fnc_getCfgDataBool];
        LOG_1("Configuration for vehicle type %1 read from config",toUpper configName _x);
        [toUpper configName _x, _hashMap]
    });

private _magazinesForVehicles = VehicleTypes apply {
    private _vehicleClassName = VehicleTypes get _x get CLASS_NAME_PROPERTY;
    private _magazines = getArray (configFile >> "CfgVehicles" >> _vehicleClassName >> "Turrets" >> "MainTurret" >> "magazines");
    _magazines = _magazines arrayIntersect _magazines;

    private _magazinesAndAmmo = _magazines apply {
        [_x, getText (configFile >> "CfgMagazines" >> _x >> "ammo")]
    } apply {
        [_x select 0, AmmoTypes getOrDefault [toUpper (_x select 1), objNull]]
    } select {
        _x select 1 isNotEqualTo objNull
    };

    _magazinesAndAmmo apply {
        private _hashMap = createHashMap;

        _hashMap set [CLASS_NAME_PROPERTY, _x select 0];

        private _ammoInfo = _x select 1;
        private _child = _ammoInfo getOrDefault ["child", ""];
        if (_child isNotEqualTo "") then {
            _ammoInfo = AmmoTypes get toUpper _child;
            // diag_log format ["WARGAY MAGS DEBUG: %1 Has child: %2 Ammo Info: %3", _x select 0, _child, str _ammoInfo];
        };

        _hashMap set [AMMO_PROPERTY, _ammoInfo];
        [toUpper (_x select 0), _hashMap];
    }
};

private _magazineTypes = [];
{
    _magazineTypes append _x;
} forEach _magazinesForVehicles;
MagazineTypes = createHashMapFromArray _magazineTypes;

[
    "AllVehicles",
    "Init",
    FUNC(vehicleInit),
    true, // Allow inheritance
    ["Man"], // Excluded classes
    true // Apply retroactive
] call CBA_fnc_addClassEventHandler;

[
    "Man",
    "Init",
    FUNC(manInit),
    true, // Allow inheritance
    [], // Excluded classes
    true // Apply retroactive
] call CBA_fnc_addClassEventHandler;

// TODO: Find an easy way to ininitalize spawnable vehicles from mission init
GVAR(spawnableVehicles) = createHashMapFromArray [
    // LOG
    ["gm_ge_army_iltis_cargo", 2],
    ["gm_ge_army_m113a1g_command", 1],
    ["cwr3_b_m577_hq", 1],
    ["gm_ge_army_fuchsa0_command", 1],
    ["gm_ge_army_bpz2a0", 2],
    ["gm_ge_army_kat1_451_reammo", 4],
    ["B_Truck_01_fuel_F", 2],

    // SUP
    ["gm_ge_army_gepard1a1", 2], // 3
    ["gm_ge_army_m109g", 2],
    ["cwr3_b_m163", 4],
    ["gm_ge_army_kat1_463_mlrs", 1],

    // TNK
    ["gm_ge_army_Leopard1a1", 1], // 6
    ["gm_ge_army_Leopard1a3", 6],
    ["gm_ge_army_marder1a1a", 4],
    ["cwr3_b_m60a3", 4],

    // REC
    ["gm_ge_army_iltis_milan", 4],
    ["gm_ge_army_bo105m_vbh", 1],
    ["gm_ge_army_fuchsa0_reconnaissance", 1], // 3
    ["gm_ge_army_luchsa1", 2],

    // VEH
    ["cwr3_b_m901_itv", 2],
    ["cwr3_b_hmmwv_tow", 4],

    // HEL
    ["cwr3_b_ah1f", 2]
];

if (GVAR(isTest)) then {
    [{
        ["MDL_startGame"] call CBA_fnc_globalEvent;
    }] call CBA_fnc_execNextFrame;
};

if (isServer) then { call COMPILE_SCRIPT(XEH_postInitServer) };
if (!hasInterface) exitWith {};

player addMPEventHandler ["MPKilled", {
    params ["_unit", "_killer", "_instigator", "_useEffects"];

    private _vehicle = if (vehicle player isEqualTo player) then { objNull } else { vehicle player };

    ["MDL_playerKilled", [getPlayerUID player, player, _vehicle]] call CBA_fnc_serverEvent;
}];
