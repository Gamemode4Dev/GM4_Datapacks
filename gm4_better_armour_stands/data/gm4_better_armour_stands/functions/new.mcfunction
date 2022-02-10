# @s = armor_stand to be modified
# run from place

data modify entity @s ShowArms set value 1b
data modify entity @s Pose set from storage gm4_better_armour_stands:default Pose
tag @s add gm4_bas_placed
