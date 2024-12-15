#include "script_component.hpp"

// TODO: Add KnowsAboutChanged EH to WEST groups as needed as this thing most likely won't work
{
    _x addEventHandler ["KnowsAboutChanged", FUNC(knowsAboutChanged)];
} forEach (groups WEST);

{
    _x addEventHandler ["CuratorObjectDeleted", FUNC(curatorObjectDeleted)];
} forEach allCurators;

// TODO: Move to music component and change function name (or better, remove it as a function)
call FUNC(musicStop);
