# force starving gm4_horse to graze while being mounted
# @s = gm4_horse
# at @s
# run from horse_processsing/general

tag @s add gm4_horse.force_graze
data modify entity @s EatingHaystack set value 1b
