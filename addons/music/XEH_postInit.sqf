#include "script_component.hpp"

if (isServer) exitWith {};

// TODO: Automatic queue of Wargame tracks if proper mod is loaded

GVAR(isSoundPlaying) = false;

addMusicEventHandler ["MusicStop", {
    [EFUNC(music,playNextMusic), [], random 15] call CBA_fnc_waitAndExecute;
}];

["MDL_applyDamage", {
    params ["_unit"];

    if (GVAR(damageAlarmEnabled) && {_unit isEqualTo vehicle player} && {!GVAR(isSoundPlaying)}) then {
        GVAR(isSoundPlaying) = true;
        playSound ["MDL_Wargay_Alarm", 2];
        [{
            GVAR(isSoundPlaying) = false;
        }, [], 4] call CBA_fnc_waitAndExecute;
    };
}] call CBA_fnc_addEventHandler;
