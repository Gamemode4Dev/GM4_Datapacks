#@s = player that has mined sand with a fortune tool while underwater
#run from pulse_check

#random chance based on fortune level
execute at @s anchored eyes positioned ^ ^ ^2 run tag @e[limit=1,distance=..3,type=item,nbt={Item:{id:"minecraft:sand"},Age:0s}] add gm4_st_sand_item

execute store result score spawnTreasure gm4_st_random run data get entity @e[tag=gm4_st_sand_item,limit=1] UUIDMost 0.00000000023283064365386962890625
scoreboard players set 100 gm4_st_random 100
scoreboard players operation spawnTreasure gm4_st_random %= 100 gm4_st_random

execute if entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:fortune",lvl:1s}]}}}] if score spawnTreasure gm4_st_random matches 0..4 as @e[tag=gm4_st_sand_item] at @s run function sunken_treasure:spawn_treasure
execute if entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:fortune",lvl:2s}]}}}] if score spawnTreasure gm4_st_random matches 0..16 as @e[tag=gm4_st_sand_item] at @s run function sunken_treasure:spawn_treasure
execute if entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:fortune",lvl:3s}]}}}] if score spawnTreasure gm4_st_random matches 0..24 as @e[tag=gm4_st_sand_item] at @s run function sunken_treasure:spawn_treasure

#reset values
tag @e[type=item,tag=gm4_st_sand_item] remove gm4_st_sand_item
