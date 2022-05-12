execute unless score fruiting_trees gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Fruiting Trees"}
scoreboard players set fruiting_trees gm4_modules 1

scoreboard objectives add gm4_entity_version dummy
scoreboard objectives add gm4_tree_layer dummy
scoreboard objectives add gm4_tree_seed dummy
scoreboard objectives add gm4_fruit_age dummy
scoreboard objectives add gm4_fruit_stage dummy
scoreboard objectives add gm4_sap_stage dummy
scoreboard objectives add gm4_sap_growth dummy
scoreboard objectives add gm4_count dummy

scoreboard players set #2 gm4_tree_seed 2
scoreboard players set #65536 gm4_tree_seed 65536

execute store result score #world_seed gm4_tree_seed run seed

schedule function gm4_fruiting_trees:main 10t
schedule function gm4_fruiting_trees:tick 10t

#$moduleUpdateList
