# @s = players that no longer fit SCUBA requirements (removes gear or out of water)
# run from main

effect clear @s minecraft:conduit_power
execute at @s anchored eyes positioned ^ ^ ^ unless predicate gm4_scuba_gear:in_water run tag @s remove gm4_in_water
