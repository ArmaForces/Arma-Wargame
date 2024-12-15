#include "script_component.hpp"

// TODO: Move whole init.sqf
// TODO: Move whole initServer.sqf
// TODO: Move onPlayerKilled.sqf
// TODO: Move and split CfgWargay.hpp

if (isServer) exitWith {};

addMissionEventHandler ["Draw3D", FUNC(draw3D)];
