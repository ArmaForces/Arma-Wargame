#include "script_component.hpp"
ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

// Can be initialized using FUNC(addDeployableVehicle)
GVAR(spawnableVehicles) = createHashMap;

ADDON = true;
