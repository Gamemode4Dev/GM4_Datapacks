# add scoreboards and set initial values
function gm4_garden_variety:initialize

# clocks
schedule function gm4_garden_variety:clock/tick 10t
schedule function gm4_garden_variety:clock/16t 11t
schedule function gm4_garden_variety:clock/1s 12t
schedule function gm4_garden_variety:clock/10s 13t

# check if modules are installed
scoreboard players set $fruiting_trees_installed gm4_gv_data 0
execute if score gm4_fruiting_trees load.status matches 1 run scoreboard players set $fruiting_trees_installed gm4_gv_data 1

execute unless score garden_variety gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Garden Variety"}
scoreboard players set garden_variety gm4_modules 1

#$moduleUpdateList
