# teleports a rabbit inside a cauldron to another empty cauldron
# @s = zauber cauldron without water in it
# at align xyz
# run from cauldron/structure/validate/liquid

# look for a target cauldron
tag @e[type=marker,tag=gm4_zauber_cauldron,limit=1,distance=1..,sort=random,scores={gm4_zc_rabtarget=1}] add gm4_zc_selected_target
execute unless entity @e[type=marker,tag=gm4_zc_selected_target] run return fail

# advancement for player
advancement grant @a[distance=..2,gamemode=!spectator,predicate=gm4_zauber_cauldrons:player/equipment/armor/full] only gm4:zauber_cauldrons_rabbit

# departure sounds & particles
particle minecraft:entity_effect{color:[0.2,0.3,0.2,0.5]} ~.5 ~.5 ~.5 0 0 0 0.5 32
playsound minecraft:entity.item.pickup neutral @a[distance=..8] ~ ~ ~ 0.5 0.5

# teleport rabbit
tag @e[type=rabbit,dx=0,dy=0,dz=0,limit=1] add gm4_zc_magic_rabbit
tp @e[type=rabbit,dx=0,tag=gm4_zc_magic_rabbit,limit=1] @e[type=marker,tag=gm4_zc_selected_target,limit=1]

# arrival  particles
execute at @e[type=rabbit,tag=gm4_zc_magic_rabbit,limit=1] align xyz run particle minecraft:entity_effect{color:[0.2,0.3,0.2,0.5]} ~.5 ~.5 ~.5 0 0 0 0.5 32

# remove tags
tag @e[type=rabbit] remove gm4_zc_magic_rabbit
tag @e[type=marker,tag=gm4_zauber_cauldron] remove gm4_zc_selected_target
