
execute unless score natural_trees gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"natural trees"}
scoreboard players set natural_trees gm4_modules 1

schedule function gm4_natural_trees:main 10t

#$moduleUpdateList


