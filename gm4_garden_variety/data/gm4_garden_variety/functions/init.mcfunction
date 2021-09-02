# add scoreboards and set initial values
function gm4_garden_variety:data/initialize

# clocks
schedule function gm4_garden_variety:clock/tick 10t
schedule function gm4_garden_variety:clock/process_leaves 11t
schedule function gm4_garden_variety:clock/process_analyzer 12t
schedule function gm4_garden_variety:clock/process_arborist 13t

execute unless score garden_variety gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"garden_variety"}
scoreboard players set garden_variety gm4_modules 1

#$moduleUpdateList
