execute unless score apple_trees gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Apple Trees"}
execute unless score apple_trees gm4_earliest_version < apple_trees gm4_modules run scoreboard players operation apple_trees gm4_earliest_version = apple_trees gm4_modules
scoreboard players set apple_trees gm4_modules 1

# scoreboards and constants
scoreboard objectives add gm4_entity_version dummy
scoreboard objectives add gm4_fruit_age dummy
scoreboard objectives add gm4_fruit_stage dummy
scoreboard objectives add gm4_apple_data dummy
scoreboard objectives add gm4_ga_root dummy
scoreboard objectives add gm4_ga_root_count dummy

scoreboard players set #8 gm4_apple_data 8
scoreboard players set #4 gm4_apple_data 4
scoreboard players set #stage_1_start gm4_apple_data 20
scoreboard players set #stage_2_start gm4_apple_data 40
scoreboard players set #stage_0_start gm4_apple_data 60

scoreboard players set #golden_root_time gm4_ga_root 4500
scoreboard players set #3600 gm4_ga_root 3600
scoreboard players set #10 gm4_ga_root 10
scoreboard players set #4 gm4_ga_root 4
scoreboard players set #gapple_stage_1_start gm4_apple_data 80
scoreboard players set #gapple_stage_2_start gm4_apple_data 220
scoreboard players set #gapple_stage_0_start gm4_apple_data 240

schedule function gm4_apple_trees:main 10t
schedule function gm4_apple_trees:slow_clock 12t



#$moduleUpdateList
