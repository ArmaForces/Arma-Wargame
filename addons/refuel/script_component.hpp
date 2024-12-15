#define COMPONENT refuel
#include "\z\afwg\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE

#ifdef DEBUG_ENABLED_REFUEL
    #define DEBUG_MODE_FULL
#endif
    #ifdef DEBUG_SETTINGS_REFUEL
    #define DEBUG_SETTINGS DEBUG_SETTINGS_REFUEL
#endif

#include "\z\afwg\addons\main\script_macros.hpp"

// Component specific macros
#define REFUEL_AMOUNT 0.05
#define REFUEL_SECONDS_FULL 50
