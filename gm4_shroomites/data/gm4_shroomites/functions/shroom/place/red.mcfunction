# physically places a new red_mushroom and places the corrosponding entity
# @s = either a spore at the end of its life or a red mooshroom
# at @s
# run from gm4_shroomites:shroom/create

# place mushroom block unless there is already a mushroom block in this location
execute unless block ~ ~ ~ #gm4_shroomites:mushrooms run setblock ~ ~ ~ red_mushroom destroy

# place marker entity unless there is already a shroomite_shroom in this location. Do not place a marker if the global shroom cap was reached.
execute align xyz positioned ~.5 ~.5 ~.5 unless entity @e[type=marker,tag=gm4_shroomite_shroom,distance=..0.1] run summon marker ~ ~ ~ {Tags:["gm4_shroomite_shroom","gm4_red_shroomite","smithed.entity","smithed.strict","smithed.block"],CustomName:'"gm4_shroomite_shroom"'}
execute align xyz positioned ~.5 ~.5 ~.5 run scoreboard players set @e[type=marker,tag=gm4_shroomite_shroom,distance=..0.1] gm4_entity_version 1

# particles
particle minecraft:block red_mushroom ~ ~ ~ 0.1 0.1 0.1 1 10

# set fake player flag
scoreboard players set $success gm4_shroom_data 1
