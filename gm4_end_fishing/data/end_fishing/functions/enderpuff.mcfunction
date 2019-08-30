#@s = player with enderpuff in inventory
#run from main

tag @s[nbt={SelectedItem:{tag:{gm4_enderpuff:1b}}}] add gm4_hold_enderpuff
tag @s[tag=!gm4_hold_enderpuff,nbt={Inventory:[{Slot:-106b,tag:{gm4_enderpuff:1b}}]}] add gm4_hold_enderpuff

effect give @s[tag=gm4_hold_enderpuff,tag=!gm4_enderpuff_fall] levitation 180 1
tag @s[tag=gm4_hold_enderpuff,tag=!gm4_enderpuff_fall] add gm4_enderpuff_fall

execute at @s[tag=gm4_enderpuff_fall] unless block ~ ~-1 ~ #end_fishing:traversable run tag @s remove gm4_enderpuff_fall
execute at @s if block ~ ~-1 ~ #end_fishing:traversable if block ~ ~-2 ~ #end_fishing:traversable if block ~ ~-3 ~ #end_fishing:traversable run effect give @s slow_falling 2 0
effect clear @s[tag=!gm4_hold_enderpuff] levitation
