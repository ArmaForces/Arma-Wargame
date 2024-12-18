// Macros used for CfgWargay.hpp to avoid duplication and improve consistency

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
