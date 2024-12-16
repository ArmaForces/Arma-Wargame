#include "script_component.hpp"

// TODO: Add KnowsAboutChanged EH to WEST groups as needed as this thing most likely won't work
{
    _x addEventHandler ["KnowsAboutChanged", FUNC(knowsAboutChanged)];
} forEach (groups WEST);

{
    _x addEventHandler ["CuratorObjectDeleted", FUNC(curatorObjectDeleted)];
} forEach allCurators;

if (isServer) exitWith {};

addMissionEventHandler ["Draw3D", FUNC(draw3D)];
