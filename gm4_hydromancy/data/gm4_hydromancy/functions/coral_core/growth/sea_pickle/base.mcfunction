# grow this sea pickle
# @s = growth marker
# at @s
# run from coral_core/growth/raycast

# if sea pickle is growing on a leaf continue the growth below it
execute unless block ~ ~-1 ~ #gm4_hydromancy:expected_aquarium_blocks run scoreboard players set $raycast_limit gm4_hy_data 0

# if block is full do X
execute if block ~ ~ ~ sea_pickle[pickles=4] run function gm4_hydromancy:coral_core/growth/sea_pickle/
# otherwise 50% chance to add 1 pickle
execute unless block ~ ~ ~ sea_pickle[pickles=4] if predicate gm4_hydromancy:chance/sea_pickle_growth run function gm4_hydromancy:coral_core/growth/sea_pickle/multiply
