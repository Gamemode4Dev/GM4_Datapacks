
advancement revoke @s only gm4_furniture:interact_with_furniture

scoreboard players set $interaction_processed gm4_furniture_data 0

# check for painting
execute if predicate gm4_furniture:holding_paintbrush run function gm4_furniture:interact/paint/detect

# check for sitting
execute if score $interaction_processed gm4_furniture_data matches 0 unless predicate gm4_furniture:holding_paintbrush run function gm4_furniture:interact/sit/detect

# cleanup if nothing else triggered
execute if score $interaction_processed gm4_furniture_data matches 0 as @e[type=interaction,tag=gm4_furniture,distance=..8] if data entity @s interaction run data remove entity @s interaction
