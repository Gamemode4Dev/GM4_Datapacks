# @s = player in water
# run from main

execute unless entity @s[predicate=gm4_scuba_gear:tank_equipped] run function gm4_scuba_gear:remove_effect
execute at @s anchored eyes positioned ^ ^ ^ unless predicate gm4_scuba_gear:in_water run function gm4_scuba_gear:remove_effect
