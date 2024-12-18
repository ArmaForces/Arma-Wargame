#include "script_component.hpp"

GVAR(gameStarted) = false;

["MDL_startGame", {
    if (GVAR(gameStarted)) exitWith {};

    // TODO: Check if SoundSystems mod is loaded
    private _allWargayTracks = [
        "WARGAME_EE_Preparation",
        "WARGAME_EE_Campaign_Brief",
        "WARGAME_EE_Tension",
        "WARGAME_EE_The_Lost_Rites",
        "WARGAME_RD_Keep_it_Cool",
        "WARGAME_RD_Sweeping_Bass",
        "WARGAME_RD_Cryptoplanets",
        "WARGAME_RD_Mission_Omega",
        "WARGAME_RD_The_Infiltrator",
        "WARNO_Dark_City_Beats",
        "WARNO_Lap_Time",
        "WARNO_Mysteries",
        "WARNO_Raging_Burn"
    ];

    [(_allWargayTracks call BIS_fnc_arrayShuffle)] call EFUNC(music,addToMusicQueue);

    GVAR(gameStarted) = true;
}] call CBA_fnc_addEventHandler;
