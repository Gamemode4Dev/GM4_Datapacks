# remove tired horse mark once needs are met again
# @s = gm4_horse
# at @s
# run from horse_processsing/general

attribute @s movement_speed modifier remove gm4_horse:speed.tired
attribute @s jump_strength modifier remove gm4_horse:jump.tired
tag @s remove gm4_horse.tired
