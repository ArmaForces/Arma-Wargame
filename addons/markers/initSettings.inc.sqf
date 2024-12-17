[
    QGVAR(enemyMarkersEnabled),
    "CHECKBOX",
    ["Enable map markers enemies", "If enabled, map markers will be show for spotted enemy units (icons might look different on map vs in-game)."],
    [LSTRING(DisplayName), ELSTRING(icons,UnitIcons)],
    true,
    true
] call CBA_fnc_addSetting;

[
    QGVAR(enemyMarkersRefreshRate),
    "TIME",
    ["Refresh rate for enemy markers", "Controls how often map markers for enemies should refresh."],
    [LSTRING(DisplayName), ELSTRING(icons,UnitIcons)],
    [0, 60, 5],
    true
] call CBA_fnc_addSetting;
