# Spawns one of two large lava blades
# @s = closest item with Age:0s within 5 blocks of player using cavaro
# at @s
# run from gm4_cavaro_shamir:block_drop/find

execute if score $cavaro_lava gm4_ml_data matches 5 run setblock ~ ~ ~ lava[level=2]
execute if score $cavaro_lava gm4_ml_data matches 6 run setblock ~ ~ ~ lava[level=1]
particle lava ~ ~ ~ 0.2 0.2 0.2 0.01 3
