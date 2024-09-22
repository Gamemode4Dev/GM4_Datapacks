execute unless score boots_of_ostara gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Boots Of Ostara"}
execute unless score boots_of_ostara gm4_earliest_version < boots_of_ostara gm4_modules run scoreboard players operation boots_of_ostara gm4_earliest_version = boots_of_ostara gm4_modules
scoreboard players set boots_of_ostara gm4_modules 1

schedule function gm4_boots_of_ostara:main 1t



#$moduleUpdateList
