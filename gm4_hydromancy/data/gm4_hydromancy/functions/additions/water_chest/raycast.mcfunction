# raycast to find the chest
# @s = player that opened the chest
# at @s, raycasting forward
# run from additions/water_chest/opened
# run from here

scoreboard players remove $raycast_limit gm4_hy_data 1

execute if block ~ ~ ~ #gm4_hydromancy:chests[waterlogged=true] run function gm4_hydromancy:additions/water_chest/bubble
execute if score $raycast_limit gm4_hy_data matches 1.. positioned ~1 ~ ~ if block ~ ~ ~ #gm4_hydromancy:chests[waterlogged=true] run function gm4_hydromancy:additions/water_chest/bubble
execute if score $raycast_limit gm4_hy_data matches 1.. positioned ~-1 ~ ~ if block ~ ~ ~ #gm4_hydromancy:chests[waterlogged=true] run function gm4_hydromancy:additions/water_chest/bubble
execute if score $raycast_limit gm4_hy_data matches 1.. positioned ~ ~ ~1 if block ~ ~ ~ #gm4_hydromancy:chests[waterlogged=true] run function gm4_hydromancy:additions/water_chest/bubble
execute if score $raycast_limit gm4_hy_data matches 1.. positioned ~ ~ ~-1 if block ~ ~ ~ #gm4_hydromancy:chests[waterlogged=true] run function gm4_hydromancy:additions/water_chest/bubble
execute if score $raycast_limit gm4_hy_data matches 1.. positioned ~ ~1 ~ if block ~ ~ ~ #gm4_hydromancy:chests[waterlogged=true] run function gm4_hydromancy:additions/water_chest/bubble
execute if score $raycast_limit gm4_hy_data matches 1.. positioned ~ ~-1 ~ if block ~ ~ ~ #gm4_hydromancy:chests[waterlogged=true] run function gm4_hydromancy:additions/water_chest/bubble

execute if score $raycast_limit gm4_hy_data matches 1.. positioned ^ ^ ^0.5 run function gm4_hydromancy:additions/water_chest/raycast
