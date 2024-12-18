#include "script_component.hpp"

class CfgPatches {
    class SUBADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "afwg_compatibility",
            "amx10rc",
            "amx30",
            "mephisto"
        };
        skipWhenMissingDependencies = 1;
        author = "ArmaForces";
        authors[] = {"3Mydlo3"};
        VERSION_CONFIG;
    };
};

#include "CfgWargay.hpp"
