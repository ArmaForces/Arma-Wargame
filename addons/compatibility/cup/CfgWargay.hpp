#define ARMOR(FRONT,SIDES,BACK,TOP) armor[] = { FRONT, SIDES, BACK, TOP }
#define VEHICLE_LIKE(otherVehicleClass,vehicleClass) class vehicleClass : otherVehicleClass {}
#define HAS_PENETRATOR(penetratorClass) NO_DAMAGE \
        { \
            child = QUOTE(penetratorClass);\
        }

#define ARMA_NATO_MARKERS_DIR \A3\ui_f\data\map\markers\nato
#define WARGAY_NATO_MARKERS_DIR PATHTOEF(markers,assets)
#define ANTIAIR_SPAAG_RADAR_ICON QUOTE(WARGAY_NATO_MARKERS_DIR\b_antiair_spaag_radar.paa)
#define ANTITANK_ICON QUOTE(WARGAY_NATO_MARKERS_DIR\b_antitank.paa)
#define ARMOR_ICON QUOTE(ARMA_NATO_MARKERS_DIR\b_armor.paa)
#define CV_ARMOR_ICON QUOTE(WARGAY_NATO_MARKERS_DIR\b_cv_armor.paa)
#define HELI_ICON QUOTE(ARMA_NATO_MARKERS_DIR\b_air.paa)

class CfgWargay
{
    class Ammo
    {
        class NO_DAMAGE;
        class AA_HE;
        class SMALL_ARMS;
        class ace_frag_small;

        class CUP_R_70mm_Hydra_HE
        {
            damage = 2;
            type = "HE";
        };
        class CUP_B_20mm_AP_Tracer_Red
        {
            damage = 2;
            type = "AP";
        };
        class CUP_R_TOW_AT
        {
            damage = 20;
            type = "HEAT";
        };

        class CUP_Sh_105mm_M900
        {
            damage = 13;
            type = "AP";
        };
        class CUP_Sh_105mm_M456A2 : HAS_PENETRATOR(CUP_P_105mm_M393A3);
        class CUP_P_105mm_M393A3
        {
            damage = 13;
            type = "HEAT";
        };
        class CUP_P_120mm_HESH
        {
            damage = 3;
            type = "HE";
        };

        class CUP_B_20mm_API_Tracer_Red : AA_HE {};

        class CUP_B_127x99_Ball_Red_Tracer : SMALL_ARMS {};

        class G_40mm_HE : ace_frag_small {};

        class CUP_M_9M119M_Refleks_AT11_Sniper_AT
        {
            damage = 20;
            type = "HEAT";
        };
        class CUP_B_30mm_CAS_Red_Tracer : AA_HE {};
        class CUP_B_23mm_APHE_Tracer_Green : AA_HE {};
    };

    class Vehicles
    {
        // LOG
        class CUP_M113New_HQ_Base
        {
            pointCost = 120;
            hitpoints = 10;
            ARMOR(2,2,1,1);
            iconPath = CV_ARMOR_ICON;
            markerType = "b_cv_armor";
            isCommandVehicle = 1;
        };

        // SUP
        class CUP_M163New_Base
        {
            pointCost = 40;
            hitpoints = 10;
            ARMOR(1,1,1,1);
            iconPath = ANTIAIR_SPAAG_RADAR_ICON;
            markerType = "b_antiair_spaag_radar";
        };

        // TNK
        class CUP_M60A3_Base
        {
            pointCost = 50;
            hitpoints = 10;
            ARMOR(10,5,2,2);
            iconPath = ARMOR_ICON;
            markerType = "b_armor";
        };

        // VEH
        class CUP_nM1036_TOW_Base
        {
            pointCost = 40;
            hitpoints = 10;
            ARMOR(0,0,0,0);
            iconPath = ANTITANK_ICON;
            markerType = "b_antitank";
        };

        // HEL
        class CUP_Mi24_D_Dynamic_Base
        {
            pointCost = 55;
            hitpoints = 10;
            ARMOR(1,1,0,0);
            iconPath = HELI_ICON;
            markerType = "b_air";
        };
    };
};
