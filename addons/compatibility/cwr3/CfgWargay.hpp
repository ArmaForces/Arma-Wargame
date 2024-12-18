#define ARMOR(FRONT,SIDES,BACK,TOP) armor[] = { FRONT, SIDES, BACK, TOP }
#define VEHICLE_LIKE(otherVehicleClass,vehicleClass) class vehicleClass : otherVehicleClass {}
#define HAS_PENETRATOR(penetratorClass) NO_DAMAGE \
        { \
            child = QUOTE(penetratorClass);\
        }

#define ARMA_NATO_MARKERS_DIR \A3\ui_f\data\map\markers\nato
#define WARGAY_NATO_MARKERS_DIR PATHTOEF(markers,assets)
#define ANTIAIR_ICON QUOTE(ARMA_NATO_MARKERS_DIR\b_antiair.paa)
#define ANTITANK_ICON QUOTE(WARGAY_NATO_MARKERS_DIR\b_antitank.paa)
#define ARMOR_ICON QUOTE(ARMA_NATO_MARKERS_DIR\b_armor.paa)
#define HELI_ICON QUOTE(ARMA_NATO_MARKERS_DIR\b_air.paa)
#define PLANE_ICON QUOTE(ARMA_NATO_MARKERS_DIR\b_air.paa)

class CfgWargay
{
    class Ammo
    {
        class AA_HE;

        class cwr3_b_30mm_nr30_hedp_tracer_red : AA_HE {};
    };

    class Vehicles
    {
        /*
            USA
        */
        // VEH
        class cwr3_m901_itv_base
        {
            pointCost = 40;
            hitpoints = 10;
            ARMOR(2,2,1,1);
            iconPath = ANTITANK_ICON;
            markerType = "b_antitank";
        };

        // HEL
        class cwr3_ah1f_base
        {
            pointCost = 80;
            hitpoints = 10; // Should be 6 according to Wargay
            ARMOR(0,0,0,0);
            iconPath = HELI_ICON;
            markerType = "b_air";
        };

        /*
            Soviet Union
        */

        // SUP
        class cwr3_mtlb_sa13_base
        {
            pointCost = 45;
            hitpoints = 10;
            ARMOR(1,1,1,1);
            iconPath = ANTIAIR_ICON;
        };

        // TNK
        class cwr3_t64b_base
        {
            pointCost = 65;
            hitpoints = 10;
            ARMOR(13,6,3,2);
            iconPath = ARMOR_ICON;
            markerType = "b_armor";
        };
        class cwr3_t72_base
        {
            pointCost = 40;
            hitpoints = 10;
            ARMOR(11,6,3,2);
            iconPath = ARMOR_ICON;
            markerType = "b_armor";
        };
        class cwr3_o_t72a : cwr3_t72_base
        {
            pointCost = 50;
            ARMOR(13,7,3,2);
        };
        class cwr3_o_t72b1 : cwr3_t72_base
        {
            pointCost = 85;
            ARMOR(15,8,4,4);
            // TODO: Ammo config
        };

        // PLA
        class cwr3_mig23_base
        {
            pointCost = 90;
            hitpoints = 10;
            ARMOR(0,0,0,0);
            iconPath = PLANE_ICON;
            markerType = "b_air";
        };
        class cwr3_mig27_base : cwr3_mig23_base
        {
            pointCost = 115;
        };
        class cwr3_su17_base : cwr3_mig23_base
        {
            pointCost = 70;
        };
        class cwr3_su25_base : cwr3_mig23_base
        {
            pointCost = 130;
        };
    };
};
