#include "script_component.hpp"

class CfgPatches {
    class SUBADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "afwg_compatibility",
            "CUP_Vehicles_LoadOrder"
        };
        skipWhenMissingDependencies = 1;
        author = "ArmaForces";
        authors[] = {"3Mydlo3"};
        VERSION_CONFIG;
    };
};

#include "CfgWargay.hpp"
