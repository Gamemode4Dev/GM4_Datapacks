# check if a newly spawned mob should be initiated (mobs without any tags)
# @s = mobs that can be buffed
# at @s
# run from main

# initate mob unless it was spawned from a spawner (in the air)
execute unless block ~ ~-0.01 ~ #gm4:no_collision run function gm4_combat_expanded:mobs/initiate

# mark mob as checked
tag @s add gm4_ce_initiated
