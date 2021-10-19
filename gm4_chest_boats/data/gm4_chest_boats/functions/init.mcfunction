execute unless score chest_boats gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Chest Boats"}
scoreboard players set chest_boats gm4_modules 1

schedule function gm4_chest_boats:main 10t

#$moduleUpdateList
