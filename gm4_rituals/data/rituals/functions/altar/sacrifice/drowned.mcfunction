#runs sacrifice
#@s - drowned at altar
#called by rituals:altar/sacrifice/check_entity

#audiovisuals
particle minecraft:block minecraft:water ~ ~ ~ .1 .1 .1 1 10 normal @a

playsound minecraft:entity.drowned.death player @a[distance=..20] ~ ~ ~ 100 2 1
playsound minecraft:entity.drowned.death player @a[distance=..20] ~ ~ ~ 100 1 1
playsound minecraft:entity.drowned.death player @a[distance=..20] ~ ~ ~ 100 0 1

#functionality
scoreboard players add $drowned gm4_rit_stock 1

#global functions
function rituals:altar/sacrifice/global
