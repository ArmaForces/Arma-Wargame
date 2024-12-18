// TODO: This is duplicated in /z/afwg/addons/compatibility, remove from here when feasible
#define ARMOR(FRONT,SIDES,BACK,TOP) armor[] = { FRONT, SIDES, BACK, TOP }
#define VEHICLE_LIKE(otherVehicleClass,vehicleClass) class vehicleClass : otherVehicleClass {}
#define HAS_PENETRATOR(penetratorClass) NO_DAMAGE \
        { \
            child = QUOTE(penetratorClass);\
        }

// Icon macros
#define ARMA_NATO_MARKERS_DIR \A3\ui_f\data\map\markers\nato
#define WARGAY_NATO_MARKERS_DIR PATHTOEF(markers,assets)
#define ANTIAIR_ICON QUOTE(ARMA_NATO_MARKERS_DIR\b_antiair.paa)
#define ANTIAIR_SPAAG_ICON QUOTE(WARGAY_NATO_MARKERS_DIR\b_antiair_spaag.paa)
#define ANTIAIR_SPAAG_RADAR_ICON QUOTE(WARGAY_NATO_MARKERS_DIR\b_antiair_spaag_radar.paa)
#define ANTITANK_ICON QUOTE(WARGAY_NATO_MARKERS_DIR\b_antitank.paa)
#define ANTITANK_ARMOR_ICON QUOTE(WARGAY_NATO_MARKERS_DIR\b_antitank_armor.paa)
#define ART_ICON QUOTE(ARMA_NATO_MARKERS_DIR\b_art.paa)
#define ART_ROCKET_ICON QUOTE(WARGAY_NATO_MARKERS_DIR\b_art_rocket.paa)
#define ARMOR_ICON QUOTE(ARMA_NATO_MARKERS_DIR\b_armor.paa)
#define CV_ARMOR_ICON QUOTE(WARGAY_NATO_MARKERS_DIR\b_cv_armor.paa)
#define CV_ICON QUOTE(WARGAY_NATO_MARKERS_DIR\b_cv.paa)
#define HELI_ICON QUOTE(ARMA_NATO_MARKERS_DIR\b_air.paa)
#define LOG_ARMOR_ICON QUOTE(ARMA_NATO_MARKERS_DIR\b_support.paa)
#define LOG_ICON QUOTE(ARMA_NATO_MARKERS_DIR\b_support.paa)
#define MECH_INF_ICON QUOTE(ARMA_NATO_MARKERS_DIR\b_mech_inf.paa)
#define MECH_INF_ARMED_ICON QUOTE(WARGAY_NATO_MARKERS_DIR\b_mech_inf_armed.paa)
#define MOTOR_INF_ICON QUOTE(ARMA_NATO_MARKERS_DIR\b_motor_inf.paa)
#define PLANE_ICON QUOTE(ARMA_NATO_MARKERS_DIR\b_air.paa)
#define RECON_AIR_ICON QUOTE(WARGAY_NATO_MARKERS_DIR\b_recon_air.paa)
#define RECON_ANTITANK_ICON QUOTE(WARGAY_NATO_MARKERS_DIR\b_recon_antitank.paa)
#define RECON_ARMOR_ICON QUOTE(WARGAY_NATO_MARKERS_DIR\b_recon_armor.paa)
#define RECON_ICON QUOTE(WARGAY_NATO_MARKERS_DIR\b_recon.paa)

// TODO: Consider moving all these to compatibility addons for other mods
class CfgWargay
{
    // westMarkerColor[] = {
    //     __EVAL(96/255),
    //     __EVAL(159/255),
    //     __EVAL(197/255),
    //     0.85
    // };
    // westAiMarkerColor[] = {
    //     __EVAL(29/255),
    //     __EVAL(197/255),
    //     __EVAL(46/255),
    //     0.85
    // };
    // eastMarkerColor[] = {
    //     __EVAL(192/255),
    //     __EVAL(29/255),
    //     __EVAL(46/255),
    //     0.85
    // };
    // filledHpColor[] = {
    //     __EVAL(117/255),
    //     1,
    //     1,
    //     1
    // };
    // missingHpColor[] = {
    //     __EVAL(117/255),
    //     __EVAL(117/255),
    //     __EVAL(117/255),
    //     1
    // };

    class Ammo
    {
        class NO_DAMAGE
        {
            damage = 0;
            type = "NONE";
        };

        /* Base */
        class AA_HE
        {
            damage = 1;
            type = "HE";
        };
        class SMALL_ARMS
        {
            damage = 0.1;
            type = "AP";
        };
        class HMG_HE : AA_HE {};
        class HMG_AP
        {
            damage = 1;
            type = "AP";
        };
        class Small_HE
        {
            damage = 2;
            type = "HE";
        };
        class Tank_HE
        {
            damage = 3;
            type = "HE";
        };

        /* ACE Fragmentation */
        class ace_frag_tiny
        {
            damage = 0.1;
            type = "HE";
        };
        class ace_frag_tiny_HD : ace_frag_tiny {};
        class ace_frag_small
        {
            damage = 0.2;
            type = "HE";
        };
        class ace_frag_small_HD : ace_frag_small {};
        class ace_frag_medium
        {
            damage = 0.5;
            type = "HE";
        };
        class ace_frag_medium_HD : ace_frag_medium {};
        class ace_frag_large
        {
            damage = 1;
            type = "HE";
        };
        class ace_frag_large_HD : ace_frag_large {};
        class ace_frag_huge
        {
            damage = 2;
            type = "HE";
        };
        class ace_frag_huge_HD : ace_frag_huge {};

        class ACE_ammoExplosionLarge
        {
            damage = 4;
            type = "HE";
        };

        /*
            Vanilla
        */
        class SatchelCharge_Remote_Ammo : ACE_ammoExplosionLarge {};

        /*
            USA
        */
        class B_127x107_Ball : SMALL_ARMS {};
        class B_762x51_Tracer_Red : SMALL_ARMS {};

        /*
            Soviet Union
        */
        class ammo_Missile_AA_R77
        {
            damage = 5;
            type = "HE";
        };
        class Rocket_03_HE_F
        {
            damage = 2;
            type = "HE";
        };
        class Rocket_03_AP_F
        {
            damage = 2;
            type = "HEAT";
        };

        class Sh_125mm_APFSDS_T_Green
        {
            damage = 16;
            type = "AP";
        };
        class Sh_125mm_HE_T_Green
        {
            damage = 4;
            type = "HE";
        };

        /*
            Military Aviation
        */
        class B_20mm_Tracer_Red : AA_HE {};
        class sab_milavi_27mm_he_ammo : AA_HE {};
        class sab_milavi_rkt_hydra_ammo
        {
            damage = 3;
            type = "HE";
        };
        class sab_milavi_rkt_zuni_ammo
        {
            damage = 4;
            type = "HE";
        };
        class sab_milavi_bmb_mk82_ammo
        {
            damage = 10;
            type = "HE";
        };
        class sab_milavi_bomblets_he_subammo
        {
            damage = 1;
            type = "HE";
        };
        class sab_milavi_msl_maverick_ammo
        {
            damage = 26;
            type = "HEAT";
        };
    };

    class Vehicles
    {
        /*
            USA
        */

        // LOG
        class Truck_01_base_F // HEMTT
        {
            pointCost = 40;
            hitpoints = 10;
            ARMOR(1,1,1,0);
            iconPath = LOG_ICON;
            markerType = "b_support";
            isLogistics = 1;
        };

        // PLA
        class sab_f104_base
        {
            pointCost = 70;
            hitpoints = 10;
            ARMOR(0,0,0,0);
            iconPath = PLANE_ICON;
            markerType = "b_air";
        };

        /*
            West Germany
        */

        // PLA
        class sab_alphajet_base
        {
            pointCost = 50;
            hitpoints = 10;
            ARMOR(0,0,0,0);
            iconPath = PLANE_ICON;
            markerType = "b_air";
        };
    };
};

// For future CSLA usage:
// ["CSLA_T72", [11, 6, 3, 2]];
// ["CSLA_T72M", [12, 7, 3, 2]];
// ["CSLA_T72M1", [14, 7, 3, 2]];
// ["CSLA_BVP1", [3, 1, 1, 1]];
// ["CSLA_BPzV", [3, 1, 1, 1]];
// ["CSLA_DTP90", [3, 1, 1, 1]];
// ["CSLA_MU90", [3, 1, 1, 1]];
// ["CSLA_OZV90", [3, 1, 1, 1]];
// ["CSLA_OT62", [2, 1, 1, 1]];
// ["CSLA_OT64C", [1, 1, 1, 1]];
// ["CSLA_OT64C_VB", [1, 1, 1, 1]];
// ["CSLA_OT65A", [1, 1, 1, 1]];
// ["AFMC_M1IP", [17, 7, 3, 3]];
// ["AFMC_M1A1", [17, 7, 4, 3]];
// ["AFMC_LAV25", [1, 1, 1, 1]];
// ["AFMC_M113_AMB", [1, 1, 1, 1]];
// ["AFMC_M113_DTP", [1, 1, 1, 1]];
// ["AFMC_M113", [1, 1, 1, 1]];
// ["AFMC_M163", [1, 1, 1, 1]];
// ["AFMC_M270", [1, 0, 0, 0]];
