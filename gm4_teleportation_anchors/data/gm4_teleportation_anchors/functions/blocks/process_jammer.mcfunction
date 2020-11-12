# @s = teleportation jammer with antenna and at least one layer of pyramid
# run from main

execute unless block ~ ~ ~ dropper run function gm4_teleportation_anchors:blocks/destroy_jammer

tag @s remove gm4_ta_wired
execute if predicate gm4_teleportation_anchors:has_pyramid_1 run function gm4_teleportation_anchors:blocks/check_jammer_fuel
