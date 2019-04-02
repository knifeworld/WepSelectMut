// WepSelectMut.Selector
//    Version: 0.3
//    Nax/Knifeworld: 14 Feb 18 - 2 April 19
//    See README.MD for the instructions
//
class Selector extends Mutator
    Config(Mutators);
    
Var() config bool bNukeAll;
Var() config bool bNukeSpecific;
Var() config bool bNukeBySkillType;
Var() config bool bZeroAugServer;
Var() config bool bNukeHeavies;
Var() config bool bNukeLowTech;
Var() config bool bNukePistols;
Var() config bool bNukeRifles;
Var() config bool bNukeNades;
Var() config bool bKeepGEPGun;
Var() config bool bKeepFlamethrower;
Var() config bool bKeepPlasma;
Var() config bool bKeepLAW;
Var() config bool bKeepBaton;
Var() config bool bKeepCombatKnife;
Var() config bool bKeepCrowbar;
Var() config bool bKeepDragonsTooth;
Var() config bool bKeepPepperSpray;
Var() config bool bKeepProd;
Var() config bool bKeepShuriken;
Var() config bool bKeepSword;
Var() config bool bKeepPS20;
Var() config bool bKeepCrossbow;
Var() config bool bKeepPistol;
Var() config bool bKeepStealth;
Var() config bool bKeepRifle;
Var() config bool bKeepShotgun;
Var() config bool bKeepSniper;
Var() config bool bKeepSawedOff; 
Var() config bool bKeepLAM;
Var() config bool bKeepEMP;
Var() config bool bKeepGAS;
Var() config bool bKeepScrambler;

// just here for debug, comment out later
function BeginPlay()
{
    Super.BeginPlay();
    
    if ( bNukeAll )
        BroadcastMessage("Will nuke all weapons");
    else if ( bZeroAugServer )
    {
        BroadcastMessage("Server is zero augs...");
        BroadcastMessage("GEP, Plasma, LAW, and LAMS will be deleted");
    }
    else if ( bNukeBySkillType )
        BroadcastMessage("Will nuke weapons by skill type");
    else if ( bNukeSpecific )
        BroadcastMessage("Will nuke specific weapons");
    else
        BroadcastMessage("Nothing to be done...");        
}

function PostBeginPlay()
{
    local DeusExWeapon W;
    
    Super.PostBeginPlay();
    
	foreach AllActors( Class'DeusExWeapon', W )
	{
        if ( W != None )
        {
            if ( bNukeAll )
                Nuke(W);
            else if ( bZeroAugServer )
                NukeIfZeroAugServer(W);
            else if ( bNukeSpecific )
                NukeSpecific(W);
            else if ( bNukeBySkillType )
                NukeBySkillType(W);
            else
                BroadcastMessage("Nothing was deleted..."); // debug
        }
	}
}

function Nuke(Actor A)
{
    if ( (A != None) && (A.bNoDelete == False) )
        A.Destroy();
}

function NukeIfZeroAugServer(DeusExWeapon Wep)
{
    if ( Wep.GoverningSkill == Class'SkillWeaponHeavy' )
    {
        if ( bKeepGEPGun && (Wep.Class != Class'WeaponGEPGun') )
            Nuke(Wep);
            
        if ( bKeepFlamethrower && (Wep.Class != Class'WeaponFlamethrower') )
            Nuke(Wep);
            
        if ( bKeepPlasma && (Wep.Class != Class'WeaponPlasmaRifle') )
            Nuke(Wep);

        if ( bKeepLAW && (Wep.Class != Class'WeaponLAW') )
            Nuke(Wep);
    }
    
    if ( Wep.GoverningSkill == Class'SkillDemolition' )
    {        
        if ( bKeepLAM && (Wep.Class != Class'WeaponLAM') )
            Nuke(Wep);
    }
}

function NukeBySkillType(DeusExWeapon Wep)
{
    if ( (Wep.GoverningSkill == Class'SkillWeaponLowTech') && bNukeLowTech )
        Nuke(Wep);
        
    if ( (Wep.GoverningSkill == Class'SkillWeaponHeavy') && bNukeHeavies )
        Nuke(Wep);
        
    if ( (Wep.GoverningSkill == Class'SkillWeaponPistol') && bNukePistols )
        Nuke(Wep);
        
    if ( (Wep.GoverningSkill == Class'SkillWeaponRifle') && bNukeRifles )
        Nuke(Wep);
        
    if ( (Wep.GoverningSkill == Class'SkillDemolition') && bNukeNades )
        Nuke(Wep);
}

function NukeSpecific(DeusExWeapon Wep)
{
    if (!bKeepFlamethrower && (Wep.Class == Class'WeaponFlamethrower') )
        Nuke(Wep);
        
    if (!bKeepGEPGun && (Wep.Class == Class'WeaponGEPGun') )
        Nuke(Wep);
        
    if (!bKeepLAW && (Wep.Class == Class'WeaponLAW') )
        Nuke(Wep);
        
    if (!bKeepPlasma && (Wep.Class == Class'WeaponPlasmaRifle') )
        Nuke(Wep);
        
    if (!bKeepBaton && (Wep.Class == Class'WeaponBaton') )
        Nuke(Wep);
        
    if (!bKeepCombatKnife && (Wep.Class == Class'WeaponCombatKnife') )
        Nuke(Wep);
        
    if (!bKeepCrowbar && (Wep.Class == Class'WeaponCrowbar') )
        Nuke(Wep);
        
    if (!bKeepDragonsTooth && (Wep.Class == Class'WeaponNanoSword') )
        Nuke(Wep);
        
    if (!bKeepPepperSpray && (Wep.Class == Class'WeaponPepperGun') )
        Nuke(Wep);
        
    if (!bKeepProd && (Wep.Class == Class'WeaponProd') )
        Nuke(Wep);
        
    if (!bKeepShuriken && (Wep.Class == Class'WeaponShuriken') )
        Nuke(Wep);
        
    if (!bKeepSword && (Wep.Class == Class'WeaponSword') )
        Nuke(Wep);
        
    if (!bKeepPS20 && (Wep.Class == Class'WeaponHideAGun') )
        Nuke(Wep);
        
    if (!bKeepCrossbow && (Wep.Class == Class'WeaponMiniCrossBow') )
        Nuke(Wep);
        
    if (!bKeepPistol && (Wep.Class == Class'WeaponPistol') )
        Nuke(Wep);
        
    if (!bKeepStealth && (Wep.Class == Class'WeaponStealthPistol') )
        Nuke(Wep);
        
    if (!bKeepRifle && (Wep.Class == Class'WeaponAssaultGun') )
        Nuke(Wep);
        
    if (!bKeepShotgun && (Wep.Class == Class'WeaponAssaultShotgun') )
        Nuke(Wep);
        
    if (!bKeepSniper && (Wep.Class == Class'WeaponRifle') )
        Nuke(Wep);
        
    if (!bKeepSawedOff && (Wep.Class == Class'WeaponSawedOffShotgun') )
        Nuke(Wep);
        
    if (!bKeepEMP && (Wep.Class == Class'WeaponEMPGrenade') )
        Nuke(Wep);
        
    if (!bKeepGAS && (Wep.Class == Class'WeaponGasGrenade') )
        Nuke(Wep);
        
    if (!bKeepLAM && (Wep.Class == Class'WeaponLAM') )
        Nuke(Wep);
        
    if (!bKeepScrambler && (Wep.Class == Class'WeaponNanoVirusGrenade') )
        Nuke(Wep);
}

defaultproperties
{
    bNukeAll=False
    bNukeSpecific=False
    bNukeBySkillType=False
    bZeroAugServer=True
    bNukeHeavies=True
    bNukeLowTech=False
    bNukePistols=False
    bNukeRifles=False
    bNukeNades=True
    bKeepGEPGun=False
    bKeepFlamethrower=True
    bKeepPlasma=False
    bKeepLAW=False
    bKeepBaton=True
    bKeepCombatKnife=True
    bKeepCrowbar=True
    bKeepDragonsTooth=True
    bKeepPepperSpray=True
    bKeepProd=True
    bKeepShuriken=True
    bKeepSword=True
    bKeepPS20=True
    bKeepCrossbow=True
    bKeepPistol=True
    bKeepStealth=True
    bKeepRifle=True
    bKeepShotgun=True
    bKeepSniper=True
    bKeepSawedOff=True 
    bKeepLAM=False
    bKeepEMP=True
    bKeepGAS=True
    bKeepScrambler=True
}
