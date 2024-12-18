class CfgHints
{
    class GVAR(concepts)
    {
        category = "AFWG_help";
        displayName = "Concepts";

        class Spotting
        {
            displayName = "Spotting enemy units";
            displayNameShort = "Spotting";
            description = "Press %11 to spot enemy unit when aiming at it.";
            tip = "";
            arguments[] = {
                {{ "revealTarget" }}
            };
        };

        class UnitInfo
        {
            displayName = "Showing unit information";
            displayNameShort = "Unit info";
            description = "Press %11 when aiming at a unit to show its unit card in a hint.";
            tip = "Use unit card to judge danger that enemy unit poses.";
            arguments[] = {
                { "TAB" }
            };
        };

        // class Vehicles
        // {
        //     displayName = "Vehicles";
        // };
    };

    class GVAR(damage)
    {
        category = "AFWG_help";
        displayName = "Damage";

        class Armor
        {
            displayName = "Armor (AV) System";
            description = "Armor (AV) is resistance of a vehicle to the damage. It might be different for different sides of the vehicle.%1
            Small arms can shred through 0 AV.%1
            1 AV is enough to be safe from small arms fire (although crew can still be killed if there are windows!).%1
            As a rule of thumb, 2 AV from all sides makes vehicle relatively safe from several HE hits nearby. Strong top armor makes vehicle more resistant to artillery (especially cluster).%1
            Due to technical limitations, hit armor direction is determined using relative hull orientation. This means that if a tank has the turret aiming backwards and gets hit in rear turret armor, the front armor is getting hit (rather than rear).";
            tip = "Armor values are always shown as [FRONT/SIDE/REAR/TOP]";
        };

        class Damage
        {
            displayName = "Damage System";
            description = "Default arma damage system is turned off (except for collisions!) and replaced with Wargame-like system, where vehicles are either destroyed or not (no track or turret damage). This means even vehicle with 1 HP is as deadly as with 10 HP.";
            tip = "There are 3 different damage types: KE (Kinetic Energy), HE (High Explosive) and HEAT (High Explosive Anti Tank)";
        };

        class DamageHE
        {
            displayName = "Damage (HE)";
            description = "All explosions are treated as HE damage, dealing decreased damage the further it is from the target. For every 1 HE damage of a weapon, target receives damage respectively to AV being hit.
            %1%2Below 2 AV - full damage.
            %1%2For 2 AV - 0.4 damage
            %1%2For 3 AV - 0.3 damage
            %1%2For 4 AV - 0.2 damage
            %1%2For 5 AV - 0.15 damage
            %1%2Up to 7 AV - 0.1 damage
            %1%2Up to 13 AV - 0.05 damage
            %1%2Above 14 AV - 0.01 damage";
            tip = "While damage values might be much smaller, it almost always deals some damage. This makes rapid firing vehicles really dangerous flankers.";
        };

        class DamageHEAT
        {
            displayName = "Damage (HEAT)";
            description = "Weapons with tandem warheads are treated as HEAT damage, always having the same damage potential. Damage dealt increases by 0.5 for every 1 potential damage above target AV. Over 10 difference and it increases by 1 for every difference from armor value.";
            tip = "HEAT weapons deal consistent damage no matter the distance to the target. Moreover HEAT always deals at least 1 damage, even if armor cannot be penetrated.";
        };

        class DamageKE
        {
            displayName = "Damage (KE)";
            description = "APFSDS and similar are treated as KE (or AP) damage, which damage potential depends on distance to the target. Damage dealt increases by 0.5 for every 1 potential damage above target AV.";
            tip = "The closer you are to the target, the more power your shell has. It can sometimes penetrate and damage multiple targets.";
        };

        class Hitpoints
        {
            displayName = "Hitpoints";
            description = "";
            tip = "Some vehicles might have less than 10 hitpoints, which makes them extra vulnerable.";
        };
    };

    class GVAR(logisics)
    {
        category = "AFWG_help";
        displayName = "Logistics";

        class Rearm
        {

        };

        class Refuel
        {

        };

        class Repair
        {

        };
    };

    class GVAR(vehicleTypes)
    {
        category = "AFWG_help";
        displayName = "Unit Classes";

        class Logistics
        {
            displayName = "Logistics";
            displayNameShort = "LOG";
            description = "Various command vehicles (CV) and logistic vehicles are available.";
        };

        class Infantry
        {
            displayName = "Infantry";
            displayNameShort = "INF";
            description = "Just some meat, in this mod there's nothing special about it. Shouldn't be ignored though, their AT weapons can surprise you.";
        };

        class Tanks
        {
            displayName = "Tanks";
            displayNameShort = "TNK";
            description = "Main force of the battlefield, but can easily end up in tough situations.";
        };
    };
};
