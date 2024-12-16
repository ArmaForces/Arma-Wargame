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
// GVAR(westIconColor) = getArray (missionConfigFile >> "CfgWargay" >> "westMarkerColor");
// GVAR(westAiIconColor) = getArray (missionConfigFile >> "CfgWargay" >> "westAiMarkerColor");
// GVAR(eastIconColor) = getArray (missionConfigFile >> "CfgWargay" >> "eastMarkerColor");

[
    QGVAR(westIconColor),
    "COLOR",
    ["-test color-",    "-tooltip-"],
    "My Category",
    [
        96/255,
        159/255,
        197/255,
        0.85
    ]
] call CBA_fnc_addSetting;

[
    QGVAR(westAiIconColor),
    "COLOR",
    ["-test color-",    "-tooltip-"],
    "My Category",
    [
        29/255,
        197/255,
        46/255,
        0.85
    ]
] call CBA_fnc_addSetting;

[
    QGVAR(eastIconColor),
    "COLOR",
    ["-test color-",    "-tooltip-"],
    "My Category",
    [
        192/255,
        29/255,
        46/255,
        0.85
    ]
] call CBA_fnc_addSetting;
