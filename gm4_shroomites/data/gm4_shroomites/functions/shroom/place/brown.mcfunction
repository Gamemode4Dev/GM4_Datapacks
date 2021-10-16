# physically places a new brown_mushroom and places the corrosponding entity
# @s = either a spore at the end of its life or a brown mooshroom
# at @s
# run from gm4_shroomites:shroom/create

# place mushroom block unless there is already a mushroom block in this location
execute unless block ~ ~ ~ #gm4_shroomites:mushrooms run setblock ~ ~ ~ brown_mushroom destroy

# place marker entity unless there is already a shroomite_shroom in this location. Do not place a marker if the global shroom cap was reached.
execute if score $global_shroom_count gm4_shroom_data < #global_shroom_cap gm4_shroom_data align xyz positioned ~.5 ~.5 ~.5 unless entity @e[type=marker,tag=gm4_shroomite_shroom,distance=..0.1] run summon marker ~ ~ ~ {Tags:["gm4_shroomite_shroom","gm4_brown_shroomite"],CustomName:'"gm4_shroomite_shroom"'}

# particles
particle minecraft:block brown_mushroom ~ ~ ~ 0.1 0.1 0.1 1 10
