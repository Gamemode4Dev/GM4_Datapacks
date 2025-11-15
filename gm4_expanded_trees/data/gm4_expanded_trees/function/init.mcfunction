execute unless score expanded_trees gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Expanded Trees"}
execute unless score expanded_trees gm4_earliest_version < expanded_trees gm4_modules run scoreboard players operation expanded_trees gm4_earliest_version = expanded_trees gm4_modules
scoreboard players set expanded_trees gm4_modules 1

# scoreboards and constants
scoreboard objectives add gm4_expanded_trees_data dummy

#$moduleUpdateList
