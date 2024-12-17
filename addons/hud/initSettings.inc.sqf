// GVAR(filledHpColor) = getArray (missionConfigFile >> "CfgWargay" >> "filledHpColor");
// GVAR(missingHpColor) = getArray (missionConfigFile >> "CfgWargay" >> "missingHpColor");

[
    QGVAR(filledHpColor),
    "COLOR",
    ["HP color", "Color used for full HP boxes in HUD"],
    [LSTRING(DisplayName)],
    [
        117/255,
        1,
        1,
        1
    ]
] call CBA_fnc_addSetting;

[
    QGVAR(missingHpColor),
    "COLOR",
    ["Missing HP color", "Color used for missing HP boxes in HUD"],
    [LSTRING(DisplayName)],
    [
        117/255,
        117/255,
        117/255,
        1
    ]
] call CBA_fnc_addSetting;
