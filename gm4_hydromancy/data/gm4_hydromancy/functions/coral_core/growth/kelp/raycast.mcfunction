# raycast down to find the bottom of this kelp
# @s = growth marker
# at @s
# run from coral_core/growth/kelp/base
# run from here

scoreboard players remove $raycast_limit gm4_hy_data 1

execute unless block ~ ~-1 ~ kelp_plant run function gm4_hydromancy:coral_core/growth/kelp/spread

execute if score $raycast_limit gm4_hy_data matches 1.. positioned ~ ~-1 ~ run function gm4_hydromancy:coral_core/growth/kelp/raycast
