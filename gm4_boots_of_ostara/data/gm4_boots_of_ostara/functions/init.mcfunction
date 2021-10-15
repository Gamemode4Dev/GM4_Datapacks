scoreboard objectives add gm4_boo_data dummy

execute unless score boots_of_ostara gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Boots Of Ostara"}
scoreboard players set boots_of_ostara gm4_modules 1

schedule function gm4_boots_of_ostara:main 1t

#$moduleUpdateList
