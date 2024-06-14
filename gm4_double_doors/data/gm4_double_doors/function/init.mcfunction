execute unless score double_doors gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Double Doors"}
execute unless score double_doors gm4_earliest_version < double_doors gm4_modules run scoreboard players operation double_doors gm4_earliest_version = double_doors gm4_modules
scoreboard players set double_doors gm4_modules 1

scoreboard objectives add gm4_double_doors_data dummy
scoreboard objectives add gm4_double_doors_auto_toggle_target_state dummy
scoreboard objectives add gm4_double_doors_auto_toggle_liftime dummy
scoreboard objectives add gm4_double_doors_auto_toggle_state dummy
execute unless score $trap_door_limit gm4_double_doors_data matches 0.. run scoreboard players set $trap_door_limit gm4_double_doors_data 2

#$moduleUpdateList
