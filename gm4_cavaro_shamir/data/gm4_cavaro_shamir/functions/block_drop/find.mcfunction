# Finds items around a block drop to compensate for blocks that drop multiple items
# @s = closest item with Age:0s within 5 blocks of player using cavaro
# at @s
# run from gm4_cavaro_shamir:player/break_block

# find surrounding items (includes self)
execute as @e[type=item,distance=..1.5,nbt={Age:0s}] at @s run function gm4_cavaro_shamir:block_drop/remove

# chance to spawn lava blade
execute store result score $cavaro_lava gm4_ml_data run data get entity @s UUID[0]
scoreboard players operation $cavaro_lava gm4_ml_data %= #128 gm4_ml_data
execute if score $cavaro_lava gm4_ml_data matches 0 run setblock ~ ~ ~ lava[level=7]
execute if score $cavaro_lava gm4_ml_data matches 1..2 run function gm4_cavaro_shamir:block_drop/lava/spawn_small
execute if score $cavaro_lava gm4_ml_data matches 3..4 run function gm4_cavaro_shamir:block_drop/lava/spawn_medium
execute if score $cavaro_lava gm4_ml_data matches 5..6 run function gm4_cavaro_shamir:block_drop/lava/spawn_large
scoreboard players reset $cavaro_lava gm4_ml_data
