#define ARMOR(FRONT,SIDES,BACK,TOP) armor[] = { FRONT, SIDES, BACK, TOP }
#define VEHICLE_LIKE(otherVehicleClass,vehicleClass) class vehicleClass : otherVehicleClass {}
#define HAS_PENETRATOR(penetratorClass) NO_DAMAGE \
        { \
            child = QUOTE(penetratorClass);\
        }

#define ARMA_NATO_MARKERS_DIR \A3\ui_f\data\map\markers\nato
#define WARGAY_NATO_MARKERS_DIR PATHTOEF(markers,assets)
#define ANTITANK_ICON QUOTE(WARGAY_NATO_MARKERS_DIR\b_antitank.paa)
#define ARMOR_ICON QUOTE(ARMA_NATO_MARKERS_DIR\b_armor.paa)
#define RECON_ARMOR_ICON QUOTE(WARGAY_NATO_MARKERS_DIR\b_recon_armor.paa)

class CfgWargay
{
    // Mod uses vanilla ammo, so it might be incompatible in some scenarios
    // TODO: Configure B_30mm_APFSDS_Tracer_Green and B_30mm_MP_Tracer_Green if needed
    class Ammo
    {
        class NO_DAMAGE;

        class Sh_105mm_APFSDS_T_Red
        {
            damage = 12;
            type = "AP";
        };

        class Sh_105mm_HEAT_MP_T_Red : HAS_PENETRATOR(ammo_Penetrator_105mm);
        class ammo_Penetrator_105mm
        {
            damage = 12;
            type = "HEAT";
        };

        class Sh_120mm_HE_Tracer_Red
        {
            damage = 3;
            type = "HE";
        };

        class 4Rnd_hot2_ammo : HAS_PENETRATOR(ammo_Penetrator_Titan_AT_long);
        class ammo_Penetrator_Titan_AT_long
        {
            damage = 22;
            type = "HEAT";
        };
    };

    class Vehicles
    {
        class amx10rc_base
        {
            pointCost = 40;
            hitpoints = 10;
            ARMOR(3,2,1,1);
            iconPath = RECON_ARMOR_ICON;
            markerType = "b_recon_armor";
        };

        // Based on AMX-30B2 https://wargame.fandom.com/wiki/AMX-30B2
        class amx30_base
        {
            pointCost = 40;
            hitpoints = 10;
            ARMOR(7,4,2,2);
            iconPath = ARMOR_ICON;
            markerType = "b_armor";
        };

        class mephisto_base
        {
            pointCost = 40;
            hitpoints = 10;
            ARMOR(1,1,1,1);
            iconPath = ANTITANK_ICON;
            markerType = "b_antitank";
        };
    };
};
