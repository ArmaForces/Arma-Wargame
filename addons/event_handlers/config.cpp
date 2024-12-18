#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "afwg_common",
            "afwg_damage",
            "afwg_icons",
            "afwg_markers"
        };
        author = "ArmaForces";
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
