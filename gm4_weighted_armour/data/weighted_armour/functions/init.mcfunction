scoreboard objectives add gm4_armor armor
scoreboard objectives add gm4_armor_weight dummy

scoreboard players set weighted_armour gm4_modules 1

execute unless score weighted_armour gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Weighted Armour"}

schedule function weighted_armour:main 1t

#$moduleUpdateList
