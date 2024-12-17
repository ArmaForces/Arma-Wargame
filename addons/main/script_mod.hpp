#define MAINPREFIX z
#define PREFIX afwg

#include "script_version.hpp"

#define VERSION     MAJOR.MINOR
#define VERSION_STR MAJOR.MINOR.PATCH
#define VERSION_AR  MAJOR,MINOR,PATCH

#define REQUIRED_VERSION 2.14

#ifdef COMPONENT_BEAUTIFIED
    #define COMPONENT_NAME QUOTE(AFWG - COMPONENT_BEAUTIFIED)
#else
    #define COMPONENT_NAME QUOTE(AFWG - COMPONENT)
#endif

// Global DEBUG
#define DEV_DEBUG
#define DEBUG_MODE_FULL
