execute unless score fruiting_trees gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Fruiting Trees"}
scoreboard players set fruiting_trees gm4_modules 1

scoreboard objectives add gm4_tree_layer dummy
scoreboard objectives add gm4_fruit_age dummy
scoreboard objectives add gm4_fruit_stage dummy

schedule function gm4_fruiting_trees:main 10t

#$moduleUpdateList
