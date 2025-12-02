execute unless score towering_trees gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Towering Trees"}
execute unless score towering_trees gm4_earliest_version < towering_trees gm4_modules run scoreboard players operation towering_trees gm4_earliest_version = towering_trees gm4_modules
scoreboard players set towering_trees gm4_modules 1

# to tree or not to tree

# scoreboards and constants
scoreboard objectives add gm4_towering_trees_data dummy

#$moduleUpdateList
