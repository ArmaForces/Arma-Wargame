[
    QGVAR(repairMinNoCombatTime),
    "TIME",
    ["Minimum no combat time", "Vehicle must be out of combat for long enough to be able to be repaired"],
    [LSTRING(Settings_DisplayName), localize "str_state_repair"],
    [0, 900, 60],
    true
] call CBA_fnc_addSetting;
