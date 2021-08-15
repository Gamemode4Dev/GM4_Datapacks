# @s = armor_stand to be modified
# at @s
# run from apply_pose

# If book contains a page with "left" or "right", set this arm from player rotation.
execute if data storage gm4_better_armour_stands:temp {pages:["left"]} run function gm4_better_armour_stands:pose/select/arm_left
execute unless score @s gm4_bas_mode matches 1.. if data storage gm4_better_armour_stands:temp {pages:["right"]} run function gm4_better_armour_stands:pose/select/arm_right
