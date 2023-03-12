# raycast down to find the bottom of this kelp
# @s = growth marker
# at @s
# run from coral_flower/growth/kelp/base
# run from here

scoreboard players remove $raycast_limit gm4_hy_data 1

# TODO: remove dev particles
particle happy_villager ~ ~ ~ 0 0.4 0 0 22

execute unless block ~ ~-1 ~ kelp_plant run function gm4_hydromancy:coral_flower/growth/kelp/spread

tp @s ~ ~-1 ~
execute if score $raycast_limit gm4_hy_data matches 1.. at @s run function gm4_hydromancy:coral_flower/growth/kelp/raycast
