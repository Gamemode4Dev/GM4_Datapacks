# init healing beam block_display
# @s = block display
# at @s
# run from mob/process/elite/mending/trigger

data merge entity @s {Tags:["gm4_mu_elite.mending_beam","gm4_mu_elite.mending_beam.needs_growing"],brightness:{sky:15,block:15},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0f,0f,0f]},block_state:{Name:"minecraft:lime_glazed_terracotta"}}
execute store result entity @s transformation.scale[2] float 0.025 run scoreboard players get $raycast_travel_distance gm4_mu_data
execute store result entity @s transformation.translation[2] float 0.1 run scoreboard players get $raycast_travel_distance gm4_mu_data
tp @s ~ ~ ~ facing entity @e[type=#gm4_monsters_unbound:elite_types,tag=gm4_mu_self,distance=..31,limit=1] eyes
