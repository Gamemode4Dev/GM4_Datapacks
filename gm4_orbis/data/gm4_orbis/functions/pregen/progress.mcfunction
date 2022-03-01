# run from main

# move in a spiral shape
# LMNOPQ
# K789A
# J612B
# I543C
# HGFED

title @a[tag=gm4_orbis_pregen_active] actionbar ["Pregen ",{"score":{"objective": "gm4_orbis_config", "name": "#pregen_x"}}," ",{"score":{"objective": "gm4_orbis_config", "name": "#pregen_z"}}]

# step forwards
execute if score #pregen_direction gm4_orbis_config matches 1 run scoreboard players add #pregen_x gm4_orbis_config 1
execute if score #pregen_direction gm4_orbis_config matches 2 run scoreboard players add #pregen_z gm4_orbis_config 1
execute if score #pregen_direction gm4_orbis_config matches 3 run scoreboard players remove #pregen_x gm4_orbis_config 1
execute if score #pregen_direction gm4_orbis_config matches 4 run scoreboard players remove #pregen_z gm4_orbis_config 1

# switch direction if we're at a corner
scoreboard players operation #pregen_x_temp gm4_orbis_config = #pregen_x gm4_orbis_config
scoreboard players operation #pregen_z_temp gm4_orbis_config = #pregen_z gm4_orbis_config
# if in NE quadrant, shift in -X
execute if score #pregen_x_temp gm4_orbis_config matches 1.. if score #pregen_z_temp gm4_orbis_config matches ..0 run scoreboard players remove #pregen_x_temp gm4_orbis_config 1
# take absolute value
execute if score #pregen_x_temp gm4_orbis_config matches ..-1 run scoreboard players operation #pregen_x_temp gm4_orbis_config *= #-1 gm4_count
execute if score #pregen_z_temp gm4_orbis_config matches ..-1 run scoreboard players operation #pregen_z_temp gm4_orbis_config *= #-1 gm4_count
# check if X and Z are the same
execute if score #pregen_x_temp gm4_orbis_config = #pregen_z_temp gm4_orbis_config run scoreboard players add #pregen_direction gm4_orbis_config 1
execute if score #pregen_direction gm4_orbis_config matches 5 run scoreboard players set #pregen_direction gm4_orbis_config 1

# teleport all active pregen players to this new location
summon marker ~ ~ ~ {CustomName:'"gm4_orbis_pregen_position"',Tags:["gm4_orbis_pregen_position"]}
execute as @e[type=marker,tag=gm4_orbis_pregen_position,distance=..1,limit=1] run function gm4_orbis:pregen/teleport
