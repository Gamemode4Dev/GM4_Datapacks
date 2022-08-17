# @s = new armor_stand
# run from place/check

tag @s add gm4_bas_placed

# give arms
data modify entity @s ShowArms set value 1b

# set pose values and remove randomness
data modify entity @s Pose set from storage gm4_better_armour_stands:default Pose
