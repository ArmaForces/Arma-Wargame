[
    QGVAR(unitIconSizeDependsOnDistance),
    "CHECKBOX",
    [LSTRING(UnitIconSizeDependsOnDistance), LSTRING(UnitIconSizeDependsOnDistance_Description)],
    [LSTRING(Settings_DisplayNameClient), LSTRING(UnitIconsSize)],
    true,
    false
] call CBA_fnc_addSetting;

[
    QGVAR(unitIconSizeMultiplier),
    "SLIDER",
    [LSTRING(UnitIconSizeMultiplier), LSTRING(UnitIconSizeMultiplier_Description)],
    [LSTRING(Settings_DisplayNameClient), LSTRING(UnitIconsSize)],
    [0, 10, 1, 0],
    false
] call CBA_fnc_addSetting;

[
    QGVAR(unitIconTextSizeMultiplier),
    "SLIDER",
    [LSTRING(UnitIconTextSizeMultiplier), LSTRING(UnitIconTextSizeMultiplier_Description)],
    [LSTRING(Settings_DisplayNameClient), LSTRING(UnitIconsSize)],
    [0, 10, 1, 0],
    false
] call CBA_fnc_addSetting;

GVAR(iconWidth) = getNumber (configFile >> "CfgInGameUI" >> "Cursor" >> "activeWidth");
GVAR(westIconColor) = getArray (missionConfigFile >> "CfgWargay" >> "westMarkerColor");
GVAR(westAiIconColor) = getArray (missionConfigFile >> "CfgWargay" >> "westAiMarkerColor");
GVAR(eastIconColor) = getArray (missionConfigFile >> "CfgWargay" >> "eastMarkerColor");
