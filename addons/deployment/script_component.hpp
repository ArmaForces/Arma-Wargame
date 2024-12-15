#define COMPONENT deployment
#include "\z\afwg\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE

#ifdef DEBUG_ENABLED_DEPLOYMENT
    #define DEBUG_MODE_FULL
#endif
    #ifdef DEBUG_SETTINGS_DEPLOYMENT
    #define DEBUG_SETTINGS DEBUG_SETTINGS_DEPLOYMENT
#endif

#include "\z\afwg\addons\main\script_macros.hpp"
