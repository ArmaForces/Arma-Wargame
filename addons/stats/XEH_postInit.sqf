#include "script_component.hpp"

if (isServer) then { call COMPILE_SCRIPT(XEH_postInitServer) };
if (!hasInterface) exitWith {};

["MDL_xpReceived", {
    params ["_receivedXp", "_newLifeXp", "_newTotalXp"];

    systemChat format [LLSTRING(XpReceived), _receivedXp, _newLifeXp, _newTotalXp];
}] call CBA_fnc_addEventHandler;

["MDL_showXp", {
    params ["_currentXp", "_totalXp"];

    systemChat format [LLSTRING(CurrentAndTotalXp), _currentXp, _totalXp];
}] call CBA_fnc_addEventHandler;

call FUNC(loadPlayerStats);
