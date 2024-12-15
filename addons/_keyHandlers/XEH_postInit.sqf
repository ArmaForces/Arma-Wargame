#include "script_component.hpp"

if (isServer) exitWith {};

// Register a simple keypress to an action
#include "\a3\ui_f\hpp\defineDIKCodes.inc"

// Handle "Info" button
[
    "MDL Wargay",
    "MDL_WG_UnitInfo",
    ["Unit Info", "Opens info popup of targeted unit"],
    FUNC(keyUnitInfo),
    {},
    [DIK_TAB, [false, false, false]]
] call CBA_fnc_addKeybind;
