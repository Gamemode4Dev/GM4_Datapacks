#run from main
#@s = as drawer at hopper below

summon minecraft:item ^ ^0.4 ^0.2 {PickupDelay:32767, Item:{id: "minecraft:stone", Count:1b}}
data modify entity @e[type=item, limit=1, distance=..1.5, sort=nearest] Item set from entity @s Item
scoreboard players remove @s gm4_sd_amount 1