#run from main
#@s = as drawer at hopper not point down on sides

summon minecraft:item ~ ~ ~ {Item:{id:"minecraft:stone", Count:1b}, Tags:["gm4_sd_compare_item"]}
data modify entity @e[type=item, tag=gm4_sd_compare_item, distance=..1, limit=1, sort=nearest] Item.id set from entity @s Item.id
execute store success score @s gm4_sd_same run data modify entity @e[type=item, tag=gm4_sd_compare_item, distance=..1, limit=1, sort=nearest] Item.id set from block ~ ~ ~ Items[0].id
execute if score @s gm4_sd_same matches 0 run tag @s add gm4_sd_compatible_hopper
kill @e[type=item, tag=gm4_sd_compare_item, distance=..1, limit=1, sort=nearest]

execute if entity @s[tag=gm4_sd_compatible_hopper] run function storage_drawers:all/drawer_add_item_hopper