# @s = player with enderpuff in inventory
# run from main

# check equipment
tag @s remove gm4_enderpuff_equipped
tag @s[predicate=gm4_end_fishing:holding_enderpuff] add gm4_enderpuff_equipped

# apply levitation
execute if predicate gm4_end_fishing:on_ground run tag @s remove gm4_enderpuff_used
execute if entity @s[tag=gm4_enderpuff_equipped,tag=!gm4_enderpuff_used] run function gm4_end_fishing:enderpuff/apply_levitation
execute if entity @s[tag=gm4_enderpuff_levitation,tag=!gm4_enderpuff_equipped] run function gm4_end_fishing:enderpuff/clear_levitation
