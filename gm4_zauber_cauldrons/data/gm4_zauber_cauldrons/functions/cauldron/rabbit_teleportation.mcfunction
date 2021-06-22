# @s = zauber cauldron without water in it
# at align xyz
# run from cauldron/structure/analyze/cauldron

tp @e[type=rabbit,dx=0,dy=0,dz=0,limit=1] @e[type=area_effect_cloud,tag=gm4_zauber_cauldron,limit=1,distance=1..,sort=random,scores={gm4_zc_rabtarget=1}]
advancement grant @a[distance=..2,gamemode=!spectator,predicate=gm4_zauber_cauldrons:player/equipment/armor/full] only gm4:zauber_cauldrons_rabbit
