[
    QGVAR(damageAlarmEnabled),
    "CHECKBOX",
    [LSTRING(DamageAlarmEnabled), LSTRING(DamageAlarmEnabled_Description)],
    [LSTRING(Settings_DisplayNameClient)],
    true,
    false
] call CBA_fnc_addSetting;
