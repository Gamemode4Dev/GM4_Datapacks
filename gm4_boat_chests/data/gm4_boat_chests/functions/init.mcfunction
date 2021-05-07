execute unless score boat_chests gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Boat Chests"}
scoreboard players set boat_chests gm4_modules 1

schedule function gm4_boat_chests:main 10t

#$moduleUpdateList
