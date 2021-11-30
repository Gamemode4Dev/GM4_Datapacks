# @s = armor_stand to be modified
# at @p[tag=gm4_bas_track] positioned ~ ~1.6 ~
# run from tick

# get current id
scoreboard players operation $current gm4_bas_id = @s gm4_bas_id

# move markers
execute as @e[type=marker,tag=gm4_bas_player_offset] if score @s gm4_bas_id = $current gm4_bas_id positioned ^ ^ ^2 run function gm4_better_armour_stands:pose/track/update_markers

# move wandering_trader detection
execute as @e[type=wandering_trader,tag=gm4_bas_detect] if score @s gm4_bas_id = $current gm4_bas_id positioned ~ ~-1 ~ run tp @s ^ ^ ^.5

# get new scores for rotations
execute at @e[type=marker,tag=gm4_bas_joint] if score @s gm4_bas_id = @e[type=marker,tag=gm4_bas_joint,distance=..1,sort=nearest,limit=1] gm4_bas_id run function gm4_better_armour_stands:pose/track/update_scores

# snap pose
execute if score @s gm4_bas_mode matches 1..6 as @p[tag=gm4_bas_track] if predicate gm4_better_armour_stands:sneaking run function gm4_better_armour_stands:pose/snap/pose

# apply optional modifiers
execute if score @p[tag=gm4_bas_track] gm4_bas_invert matches 1 run scoreboard players add $joint_rot_x gm4_bas_data 18000
execute if entity @s[tag=gm4_bas_alt] run scoreboard players add $joint_rot_x gm4_bas_data 9000

# check for armor_stand part
execute if score @s gm4_bas_mode matches 1 run function gm4_better_armour_stands:pose/track/head
execute if score @s gm4_bas_mode matches 2 run function gm4_better_armour_stands:pose/track/body
execute if score @s gm4_bas_mode matches 3 run function gm4_better_armour_stands:pose/track/arm_left
execute if score @s gm4_bas_mode matches 4 run function gm4_better_armour_stands:pose/track/arm_right
execute if score @s gm4_bas_mode matches 5 run function gm4_better_armour_stands:pose/track/leg_left
execute if score @s gm4_bas_mode matches 6 run function gm4_better_armour_stands:pose/track/leg_right
execute if score @s gm4_bas_mode matches 7 run function gm4_better_armour_stands:pose/track/move
execute if score @s gm4_bas_mode matches 8 run function gm4_better_armour_stands:pose/track/rotate

# copy pose data from storage to entity.
data modify entity @s Pose merge from storage gm4_better_armour_stands:temp Pose
data remove storage gm4_better_armour_stands:temp Pose

# out of range
execute unless entity @s[distance=..5] as @p[tag=gm4_bas_track] run function gm4_better_armour_stands:pose/set
