[
    QGVAR(unitIconMode),
    "LIST",
    ["Unit icon mode", ""],
    [LSTRING(DisplayName), LSTRING(UnitIcons)],
    [[0, 1], ["All", "Enemy only"]],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(unitIconSizeDependsOnDistance),
    "CHECKBOX",
    [LSTRING(UnitIconSizeDependsOnDistance), LSTRING(UnitIconSizeDependsOnDistance_Description)],
    [LSTRING(DisplayName), LSTRING(UnitIconsSize)],
    true,
    false
] call CBA_fnc_addSetting;

[
    QGVAR(unitIconSizeMultiplier),
    "SLIDER",
    [LSTRING(UnitIconSizeMultiplier), LSTRING(UnitIconSizeMultiplier_Description)],
    [LSTRING(DisplayName), LSTRING(UnitIconsSize)],
    [0, 10, 1, 0],
    false
] call CBA_fnc_addSetting;

[
    QGVAR(unitIconTextSizeMultiplier),
    "SLIDER",
    [LSTRING(UnitIconTextSizeMultiplier), LSTRING(UnitIconTextSizeMultiplier_Description)],
    [LSTRING(DisplayName), LSTRING(UnitIconsSize)],
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
    ["Friendly players color", "Color used for icons of friendly player's vehicles"],
    [LSTRING(DisplayName), LSTRING(UnitIcons)],
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
    ["Friendly AI color", "Color used for icons of friendly AI's vehicles"],
    [LSTRING(DisplayName), LSTRING(UnitIcons)],
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
    ["Enemy color", "Color used for icons of enemy vehicles"],
    [LSTRING(DisplayName), LSTRING(UnitIcons)],
    [
        192/255,
        29/255,
        46/255,
        0.85
    ]
] call CBA_fnc_addSetting;
