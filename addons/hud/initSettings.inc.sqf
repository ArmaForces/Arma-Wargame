// GVAR(filledHpColor) = getArray (missionConfigFile >> "CfgWargay" >> "filledHpColor");
// GVAR(missingHpColor) = getArray (missionConfigFile >> "CfgWargay" >> "missingHpColor");

[
    QGVAR(filledHpColor),
    "COLOR",
    ["-test color-",    "-tooltip-"],
    "My Category",
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
    ["-test color-",    "-tooltip-"],
    "My Category",
    [
        117/255,
        117/255,
        117/255,
        1
    ]
] call CBA_fnc_addSetting;
