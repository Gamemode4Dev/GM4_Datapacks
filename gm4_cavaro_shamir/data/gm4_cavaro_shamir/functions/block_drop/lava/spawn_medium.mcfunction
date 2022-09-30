# Spawns one of two medium lava blades
# @s = closest item with Age:0s within 5 blocks of player using cavaro
# at @s
# run from gm4_cavaro_shamir:block_drop/find

execute if score $cavaro_lava gm4_ml_data matches 3 run setblock ~ ~ ~ lava[level=4]
execute if score $cavaro_lava gm4_ml_data matches 4 run setblock ~ ~ ~ lava[level=3]
particle lava ~ ~ ~ 0.2 0.1 0.2 0.01 3
