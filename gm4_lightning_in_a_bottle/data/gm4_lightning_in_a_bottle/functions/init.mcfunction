scoreboard objectives add gm4_liab_data dummy
scoreboard players set #3 gm4_liab_data 3

execute unless score lightning_in_a_bottle gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Lightning in a Bottle"}
scoreboard players set lightning_in_a_bottle gm4_modules 1


schedule function gm4_lightning_in_a_bottle:main 2t
schedule function gm4_lightning_in_a_bottle:brewing_stand/texture_connector/process 8t
