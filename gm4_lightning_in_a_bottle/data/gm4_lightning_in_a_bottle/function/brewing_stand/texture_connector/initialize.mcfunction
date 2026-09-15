# @s = newly summoned item display
# run from brewing_stand/texture_connector/ray

tag @s add gm4_lightning_rod_texture_connector
data merge entity @s {item:{id:"minecraft:player_head",count:1,components:{"minecraft:profile":"$texture_connector"}},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.25,0.25,0.25]}}

execute if block ~ ~0.5 ~ #gm4_lightning_in_a_bottle:exposed_lightning_rod run data merge entity @s {item:{id:"minecraft:player_head",count:1,components:{"minecraft:profile":"$texture_connector_exposed"}}}
execute if block ~ ~0.5 ~ #gm4_lightning_in_a_bottle:weathered_lightning_rod run data merge entity @s {item:{id:"minecraft:player_head",count:1,components:{"minecraft:profile":"$texture_connector_weathered"}}}
execute if block ~ ~0.5 ~ #gm4_lightning_in_a_bottle:oxidized_lightning_rod run data merge entity @s {item:{id:"minecraft:player_head",count:1,components:{"minecraft:profile":"$texture_connector_oxidized"}}}
