class CfgSounds
{
    class MDL_Wargay_Alarm
    {
        name = "Wargay alarm";
        // BUG: Possible bug with path not existing on clients (use getMissionPath)
        sound[] = { "assets\wargay-alarm.ogg", 4, 1 };
        titles[] = { 0, CSTRING(DamageReceived) };
    };
};
