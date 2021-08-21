execute unless score apple_trees gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Apple Trees"}
scoreboard players set apple_trees gm4_modules 1

# scoreboards and constants
scoreboard objectives add gm4_count dummy
scoreboard objectives add gm4_apple_data dummy

scoreboard players set #8 gm4_apple_data 8
scoreboard players set #100 gm4_apple_data 100
scoreboard players set #10 gm4_apple_data 10

scoreboard players set #max_height gm4_apple_data 5
scoreboard players set #min_height gm4_apple_data 4

scoreboard players set #stage_1_start gm4_apple_data 20
scoreboard players set #stage_2_start gm4_apple_data 40
scoreboard players set #stage_0_start gm4_apple_data 60

scoreboard players set #max_failed_apple_attempts gm4_apple_data 6
scoreboard players set #max_apple_attempts gm4_apple_data 12

schedule function gm4_apple_trees:main 10t

# guidebook
summon marker ~ 332.547322425669 ~ {CustomName:'"gm4_apple_trees_guide"',Tags:["gm4_guide"],data:{type:"module",id:"apple_trees",page_count:1,line_count:1,module_name:"Apple Trees"}}

#$moduleUpdateList
