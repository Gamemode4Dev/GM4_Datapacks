# mark horse as tired if its needs are not met
# @s = gm4_horse
# at @s
# run from horse_processsing/general

attribute @s movement_speed modifier add gm4_horse.speed.tired -0.5 add_multiplied_total
attribute @s jump_strength modifier add gm4_horse.jump.tired -0.5 add_multiplied_total
tag @s add gm4_horse.tired
