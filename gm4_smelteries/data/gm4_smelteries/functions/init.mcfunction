scoreboard objectives add gm4_bf_data dummy

execute unless score smelteries gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Smelteries"}
scoreboard players set smelteries gm4_modules 1

schedule function gm4_smelteries:main 1t
schedule function gm4_smelteries:tick 1t

#$moduleUpdateList
