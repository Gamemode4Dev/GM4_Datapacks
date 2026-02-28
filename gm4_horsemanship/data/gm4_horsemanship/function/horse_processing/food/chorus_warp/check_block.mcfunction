# check if the horse would fit in this location
# @s = warp marker
# at @s offset to the corners of the horse hitbox
# run from horse_processing/food/chorus_warp/check_warp_location

# at least one of the bottom 4 checks needs to have a full collision block below
execute if score $ground_found gm4_horse_data matches 0 if block ~ ~-0.1 ~ #gm4:full_collision run scoreboard players set $ground_found gm4_horse_data 1

# look for no collision that is not water or lava
execute if block ~ ~ ~ #gm4:no_collision unless block ~ ~ ~ #gm4:water unless block ~ ~ ~ lava run return 1
return 0
