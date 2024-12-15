#include "script_component.hpp"

if (isServer) exitWith {};

["MDL_showCurrentHp", {
    if (vehicle player isEqualTo player) exitWith {};
    call FUNC(updateHitpointsDisplay);
}] call CBA_fnc_addEventHandler;
