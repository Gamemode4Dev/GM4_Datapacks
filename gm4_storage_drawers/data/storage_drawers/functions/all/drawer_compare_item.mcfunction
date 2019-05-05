#run from drawer_add_item in same folder
#@s = as and at drawer with item in distance=..1

summon minecraft:item ^ ^ ^0.1 {Item:{id:"minecraft:stone", Count:1b}, Tags:["gm4_sd_compare_item"]}
data modify entity @e[type=item, tag=gm4_sd_compare_item, distance=..1, limit=1, sort=nearest] Item.id set from entity @s Item.id
execute store success score @s gm4_sd_same run data modify entity @e[type=item, tag=gm4_sd_compare_item, distance=..1, limit=1, sort=nearest] Item.id set from entity @e[type=item, tag=!gm4_sd_compare_item, distance=..1, limit=1, sort=nearest] Item.id
execute if score @s gm4_sd_same matches 0 run tag @s add gm4_sd_compatible
kill @e[type=item, tag=gm4_sd_compare_item, distance=..1, limit=1, sort=nearest]
