# @s = armor_stand to be modified
# at @p[tag=gm4_bas_track,distance=..4] positioned ~ ~1.6 ~
# run from tick

# move markers
tp @e[type=marker,tag=gm4_bas_tracker,sort=nearest,limit=1] ^ ^ ^2
execute at @s positioned ~ ~1 ~ as @e[type=marker,tag=gm4_bas_joint,sort=nearest,limit=1] at @s run tp @s ~ ~ ~ facing entity @e[type=marker,tag=gm4_bas_tracker,sort=nearest,limit=1]

# get new scores for rotations
execute at @s run function gm4_better_armour_stands:pose/track/update_scores

# snap rotations
execute as @p[tag=gm4_bas_track] if predicate gm4_better_armour_stands:sneaking run function gm4_better_armour_stands:pose/snap

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
