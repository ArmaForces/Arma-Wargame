[
    QGVAR(enableHints),
    "CHECKBOX",
    ["Enable hints", "Controls whether mod-related hints should be shown even if turned off in game settings"],
    [LSTRING(DisplayName)],
    true,
    false
] call CBA_fnc_addSetting;
