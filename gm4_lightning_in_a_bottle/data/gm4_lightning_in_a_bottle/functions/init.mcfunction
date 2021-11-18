scoreboard objectives add gm4_liab_data dummy

execute unless score lightning_in_a_bottle gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Lightning in a Bottle"}
scoreboard players set lightning_in_a_bottle gm4_modules 1


schedule function gm4_lightning_in_a_bottle:main 2t
