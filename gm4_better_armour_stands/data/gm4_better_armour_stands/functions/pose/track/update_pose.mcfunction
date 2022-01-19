# @s = armor_stand to be modified
# at @p[tag=gm4_bas_track] positioned ~ ~1.6 ~
# run from pose/track/update

# update rotation calculations
execute store result score $as_rot_y gm4_bas_data run data get entity @s Rotation[0] 100
scoreboard players operation $joint_rot_y gm4_bas_data -= $as_rot_y gm4_bas_data 

# snap pose
execute as @p[tag=gm4_bas_track] if predicate gm4_better_armour_stands:sneaking run function gm4_better_armour_stands:pose/snap/pose

# apply optional modifiers
execute if entity @s[tag=gm4_bas_invert] run scoreboard players add $joint_rot_x gm4_bas_data 18000
execute if entity @s[tag=gm4_bas_alt] run scoreboard players add $joint_rot_x gm4_bas_data 9000

# check for armor_stand part
execute if score @s gm4_bas_mode matches 1 run function gm4_better_armour_stands:pose/track/head
execute if score @s gm4_bas_mode matches 2 run function gm4_better_armour_stands:pose/track/body
execute if score @s gm4_bas_mode matches 3 run function gm4_better_armour_stands:pose/track/arm_left
execute if score @s gm4_bas_mode matches 4 run function gm4_better_armour_stands:pose/track/arm_right
execute if score @s gm4_bas_mode matches 5 run function gm4_better_armour_stands:pose/track/leg_left
execute if score @s gm4_bas_mode matches 6 run function gm4_better_armour_stands:pose/track/leg_right

# copy pose data from storage to entity.
data modify entity @s Pose merge from storage gm4_better_armour_stands:temp Pose
data remove storage gm4_better_armour_stands:temp Pose
