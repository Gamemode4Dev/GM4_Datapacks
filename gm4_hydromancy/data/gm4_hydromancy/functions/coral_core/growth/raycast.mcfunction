# raycast down to find the first growable plant
# @s = growth marker
# at @s, raycasting down
# run from coral_core/growth/pick_location
# run from here

scoreboard players remove $raycast_limit gm4_hy_data 1

execute if block ~ ~ ~ lily_pad run function gm4_hydromancy:coral_core/growth/lily_pad
execute if block ~ ~ ~ kelp run function gm4_hydromancy:coral_core/growth/kelp/base
execute if block ~ ~ ~ #gm4_hydromancy:seagrass run function gm4_hydromancy:coral_core/growth/seagrass/chance
execute if block ~ ~ ~ sea_pickle[waterlogged=true] run function gm4_hydromancy:coral_core/growth/sea_pickle/base

execute if score $raycast_limit gm4_hy_data matches 1.. positioned ~ ~-1 ~ run function gm4_hydromancy:coral_core/growth/raycast
