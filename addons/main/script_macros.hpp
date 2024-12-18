#include "\x\cba\addons\main\script_macros_common.hpp"
#define DFUNC(module) TRIPLES(ADDON,fnc,module)
#ifdef DISABLE_COMPILE_CACHE
    #undef PREP
    #define PREP(fncName) DFUNC(fncName) = compile preprocessFileLineNumbers QPATHTOF(functions\DOUBLES(fnc,fncName).sqf)
#else
    #undef PREP
    #define PREP(fncName) [QPATHTOF(functions\DOUBLES(fnc,fncName).sqf), QFUNC(fncName)] call CBA_fnc_compileFunction
#endif

// ACE3 reference macros
#define ACE_PREFIX ace

#define ACEGVAR(module,var)         TRIPLES(ACE_PREFIX,module,var)
#define QACEGVAR(module,var)        QUOTE(ACEGVAR(module,var))

#define ACEFUNC(module,function)    TRIPLES(DOUBLES(ACE_PREFIX,module),fnc,function)
#define QACEFUNC(module,function)   QUOTE(ACEFUNC(module,function))

#define ACELSTRING(module,string)   QUOTE(TRIPLES(STR,DOUBLES(ACE_PREFIX,module),string))
#define ACECSTRING(module,string)   QUOTE(TRIPLES($STR,DOUBLES(ACE_PREFIX,module),string))

// AFWG macros
#define IS_MOD_LOADED(modclass)     (isClass (configFile >> "CfgPatches" >> #modclass))
#define AMMO_PROPERTY "ammo"
#define CLASS_NAME_PROPERTY "className"
#define DAMAGE_PROPERTY "damage"
#define DISPLAY_NAME_PROPERTY "displayName"
#define TYPE_PROPERTY "type"
#define MAX_HP 10
#define NO_ARMOR [0, 0, 0, 0]

// Extension macros
#define EXT "armaforces_wargame"
#define EXT_LOG "armaforces_wargame_log"

// AFWG Debug macros
#include "\z\afwg\addons\main\script_debug.hpp"
