#runs sacrifice
#@s - wither_skeleton at altar
#called by rituals:altar/sacrifice/check_entity

#audiovisuals
particle minecraft:item minecraft:wither_skeleton_skull ~ ~ ~ .1 .1 .1 1 10 normal @a

playsound minecraft:entity.wither_skeleton.death player @a[distance=..20] ~ ~ ~ 100 2 1
playsound minecraft:entity.wither_skeleton.death player @a[distance=..20] ~ ~ ~ 100 1 1
playsound minecraft:entity.wither_skeleton.death player @a[distance=..20] ~ ~ ~ 100 0 1

#functionality
scoreboard players add $wither_skeleton gm4_rit_stock 1

#global functions
function rituals:altar/sacrifice/global
