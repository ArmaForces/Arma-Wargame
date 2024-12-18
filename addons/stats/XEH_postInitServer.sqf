#include "script_component.hpp"

GVAR(loadedPlayers) = [];
GVAR(allPlayersStats) = call FUNC(loadAllStats);

addMissionEventHandler ["Ended", FUNC(saveAllStats)];
addMissionEventHandler ["MPEnded", FUNC(saveAllStats)];

["MDL_loadPlayerStats", FUNC(loadPlayerStats)] call CBA_fnc_addEventHandler;

["MDL_playerKilled", FUNC(playerKilled)] call CBA_fnc_addEventHandler;
