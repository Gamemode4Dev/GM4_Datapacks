# @s = player that just placed a soul glass
# at @s
# run from advancement place_soul_glass

advancement revoke @s only gm4_soul_glass:place_soul_glass

execute store result score gm4_ray_counter gm4_count run attribute @s minecraft:block_interaction_range get 100
execute anchored eyes positioned ^ ^ ^ run function gm4_soul_glass:ray
