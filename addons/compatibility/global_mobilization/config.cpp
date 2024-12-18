#include "script_component.hpp"

class CfgPatches {
    class SUBADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "gm_core",
            "afwg_compatibility"
        };
        skipWhenMissingDependencies = 1;
        author = "ArmaForces";
        authors[] = {"veteran29", "3Mydlo3"};
        VERSION_CONFIG;
    };
};

#include "CfgAmmo.hpp"
#include "CfgVehicles.hpp"
