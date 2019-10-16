scoreboard players set better_armour_stands gm4_modules 1

execute unless score better_armour_stands gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Better Armour Stands"}

schedule function better_armour_stands:main 1t
schedule function better_armour_stands:tick 1t

#$moduleUpdateList
