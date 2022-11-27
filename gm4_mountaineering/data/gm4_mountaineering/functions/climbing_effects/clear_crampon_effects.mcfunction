# clear any crampon-related effects when crampons are removed
# @s = player that just removed crampons
# at @s
# run from player_main

attribute @s minecraft:generic.movement_speed modifier remove 4e6464b7-24dd-4750-a428-74898a251ead
tag @s remove gm4_mountaineering_using_crampons
