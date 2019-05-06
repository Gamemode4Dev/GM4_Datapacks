#runs sacrifice
#@s - cow at altar
#called by rituals:altar/sacrifice/check_entity

#audiovisuals
particle minecraft:item minecraft:beef ~ ~ ~ .1 .1 .1 1 100 normal @a

playsound minecraft:entity.cow.death player @a[distance=..20] ~ ~ ~ 100 2 1
playsound minecraft:entity.cow.death player @a[distance=..20] ~ ~ ~ 100 1 1
playsound minecraft:entity.cow.death player @a[distance=..20] ~ ~ ~ 100 0 1

#functionality
scoreboard players add $cow gm4_rit_stock 1

#global functions
function rituals:altar/sacrifice/global
