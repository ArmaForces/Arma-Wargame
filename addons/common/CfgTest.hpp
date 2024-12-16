#define HAS_PENETRATOR(penetratorClass) NO_DAMAGE \
        { \
            child = penetratorClass;\
        }

class CfgTest
{
    westMarkerColor[] = {
        __EVAL(96/255),
        __EVAL(159/255),
        __EVAL(197/255),
        0.85
    };

    class NO_DAMAGE
    {
        damage = 0;
        type = "NONE";
    };

    class Test : HAS_PENETRATOR(TestPenetrator);

    class TestPenetrator
    {
        damage = 2;
        type = "HEAT";
    };
};
