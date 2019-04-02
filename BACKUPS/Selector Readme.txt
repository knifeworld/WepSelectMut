Version: 0.3
Nax/Knifeworld: 14 Feb 18 - 2 April 19

-------- INSTALLING --------

(1) Place the WepSelect.u file into the System folder of your Deus Ex folder.

(2) Inside your DeusEx.ini file, find this section: [DeusEx.DeusExGameEngine]

ADD THESE LINES TO IT:
ServerActors=WepSelectMut.Selector
ServerPackages=WepSelectMut

-------- SETTINGS --------

Use bZeroAugServer=True to automatically delete all heavy weapons.

Stop a weapon from being deleted by setting bKeep<weapon name>=True
EXAMPLE USAGE:
    Use bKeepFlamethrower=True to always keep the Flamethrower.
    Use bKeepLAM=True to always keep LAMS.
    
Use bNukeSpecific=False to delete weapons with bKeep<weapon name>=False.

Specify the skill groups to be affected when bNukeBySkillType is True.
bNukeHeavies=True
bNukeLowTech=False
bNukePistols=False
bNukeRifles=False
bNukeNades=True

IF YOU DO NOT HAVE the Mutators.ini file:
Create a blank file named Mutators, rename the extension to .ini
add all of the following text into it.

[WepSelectMut.Selector]
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
