# clear any crampon-related effects when crampons are removed
# @s = player not wearing crampons
# at @s
# run from main

attribute @s minecraft:generic.movement_speed modifier remove 4e6464b7-24dd-4750-a428-74898a251ead
tag @s remove gm4_mountaineering_facing_climbable_block
tag @s remove gm4_mountaineering_using_crampons
execute if entity @s[tag=gm4_mountaineering_facing_climbable_block] run tag @s remove gm4_mountaineering_facing_climbable_block
