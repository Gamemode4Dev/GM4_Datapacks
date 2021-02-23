#@s = player with enderpuff in inventory
#run from main

#check equipment
tag @s remove gm4_enderpuff_equipped
tag @s[nbt={SelectedItem:{tag:{gm4_end_fishing:{enderpuff:1b}}}}] add gm4_enderpuff_equipped
tag @s[tag=!gm4_enderpuff_equipped,nbt={Inventory:[{Slot:-106b,tag:{gm4_end_fishing:{enderpuff:1b}}}]}] add gm4_enderpuff_equipped

#apply levitation
execute as @a[tag=gm4_enderpuff_used] at @s unless block ~ ~-1 ~ #gm4:no_collision run tag @s remove gm4_enderpuff_used
execute at @s[tag=gm4_enderpuff_equipped,tag=!gm4_enderpuff_used] run function gm4_end_fishing:enderpuff/apply_levitation
execute at @s[tag=gm4_enderpuff_levitation,tag=!gm4_enderpuff_equipped] run function gm4_end_fishing:enderpuff/clear_levitation

#apply slow falling
execute unless score @s gm4_ef_sneak matches 1.. at @s if block ~ ~-1 ~ #gm4:no_collision if block ~ ~-2 ~ #gm4:no_collision if block ~ ~-3 ~ #gm4:no_collision run effect give @s slow_falling 2 0
