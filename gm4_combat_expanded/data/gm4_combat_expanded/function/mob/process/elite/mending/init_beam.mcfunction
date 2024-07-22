
data merge entity @s {Tags:["gm4_ce_elite.mending_beam","gm4_ce_elite.mending_beam.needs_growing"],brightness:{sky:15,block:15},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0f,0f,0f]},block_state:{Name:"minecraft:lime_glazed_terracotta"}}
execute store result entity @s transformation.scale[2] float 0.025 run scoreboard players get $raycast_travel_distance gm4_ce_data
execute store result entity @s transformation.translation[2] float 0.1 run scoreboard players get $raycast_travel_distance gm4_ce_data
tp @s ~ ~ ~ facing entity @e[type=zombie,tag=gm4_ce_self,distance=..31,limit=1] eyes
