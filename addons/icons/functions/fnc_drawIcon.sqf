#include "script_component.hpp"
/*
 * Author: 3Mydlo3, veteran29
 * Draws 3D icon above given unit.
 *
 * Arguments:
 * 0: Alive unit to draw an icon for <OBJECT>
 * 1: Include unit name and HP text <BOOL> (Optional, default false)
 *
 * Return Value:
 * None
 *
 * Public: No
 */

#define ABOVE_UNIT [0, 0, 1.5]

params ["_target", ["_includeText", false]];

if (!alive _target || {_target getVariable ["MDL_currentHp", 0] isEqualTo 0}) exitWith {};

private _worldPos = _target modelToWorldVisual ABOVE_UNIT;

private _screenPosition = worldToScreen _worldPos;
if (_screenPosition isEqualTo []) exitWith {};

private _iconDescription = if (_includeText) then {
    format ["%1 - %2", [_target] call EFUNC(common,getVehicleDisplayName), _target call EFUNC(hud,currentHpString)]
} else { "" };

private _iconPath = [_target] call FUNC(getIconPath);
private _iconSize = (GVAR(unitIconSizeMultiplier) * 0.01 * safeZoneW) / GVAR(iconWidth);
private _effectiveCommander = effectiveCommander _target;
private _sideColor = if (side _effectiveCommander isEqualTo WEST) then {
    [GVAR(westAiIconColor), GVAR(westIconColor)] select isPlayer _effectiveCommander
} else { GVAR(eastIconColor) };

if (GVAR(unitIconSizeDependsOnDistance)) then {
    // BUG: Distance should be from camera?
    private _distance = (player distance _worldPos) + 0.001; // Adding fraction to ensure it's positive in case someone ends up perfectly aligned (not gonna happen)
    private _factor = (3 - (log _distance)/1.5) min 2 max 0.55;
    // private _factor = 2 min (1 max ((_distance - 300) * 0.0014));
    _iconSize = _iconSize * _factor;
};

TRACE_6("drawIcon3D",_iconPath,_sideColor,_worldPos,_iconSize,_iconDescription,_includeText);

drawIcon3D [
    _iconPath,
    [_sideColor, [1,1,1,1]],
    _worldPos,
    _iconSize,
    _iconSize,
    0,
    _iconDescription,
    _includeText, // True = outline, False = nothing
    GVAR(unitIconTextSizeMultiplier) * 0.02,
    "EtelkaMonospacePro"
];
