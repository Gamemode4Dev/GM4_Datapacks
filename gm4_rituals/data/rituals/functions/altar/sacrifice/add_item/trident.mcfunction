#adds item to stock
#@s - entity with trident at altar
#called by rituals:altar/sacrifice/check_entity

#audiovisuals
particle minecraft:item minecraft:trident ~ ~ ~ .1 .1 .1 1 10 normal @a

playsound minecraft:item.trident.thunder player @a[distance=..20] ~ ~ ~ 100 2 1
playsound minecraft:item.trident.thunder player @a[distance=..20] ~ ~ ~ 100 1 1
playsound minecraft:item.trident.thunder player @a[distance=..20] ~ ~ ~ 100 0 1

#functionality
scoreboard players add $item_trident gm4_rit_stock 1
