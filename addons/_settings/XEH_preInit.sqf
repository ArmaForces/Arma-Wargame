#include "script_component.hpp"
ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

// TODO: Consider spliting settings per component and dropping `settings` component entirely
call FUNC(initClientSettings);
call FUNC(initGlobalSettings);

ADDON = true;
