# @s = temporary marker that can be aligned to the metachunk
# run from pregen/start and pregen/progress

scoreboard players operation #pregen_x_temp gm4_orbis_config = #pregen_x gm4_orbis_config
scoreboard players operation #pregen_z_temp gm4_orbis_config = #pregen_z gm4_orbis_config
scoreboard players operation #pregen_x_temp gm4_orbis_config *= #2 gm4_count
scoreboard players operation #pregen_z_temp gm4_orbis_config *= #2 gm4_count

execute store result entity @s Pos[0] double 24 run scoreboard players add #pregen_x_temp gm4_orbis_config 1
execute store result entity @s Pos[2] double 24 run scoreboard players add #pregen_z_temp gm4_orbis_config 1

execute at @s run tp @a[tag=gm4_orbis_pregen_active] ~ 150 ~

# type check to prevent players accidentally killing themselves
# @e to kill leftover markers, if any
kill @e[type=marker,tag=gm4_orbis_pregen_position]
