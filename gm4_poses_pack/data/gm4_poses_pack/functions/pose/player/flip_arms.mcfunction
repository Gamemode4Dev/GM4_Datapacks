# @s = armor_stand ..1 from writable_book

# Take left arm and make it into a right arm.
data modify storage gm4_better_armour_stands:temp Pose.RightArm set from entity @s Pose.LeftArm
execute store result storage gm4_better_armour_stands:temp Pose.RightArm[1] float -1 run data get storage gm4_better_armour_stands:temp Pose.RightArm[1]
execute store result storage gm4_better_armour_stands:temp Pose.RightArm[2] float -1 run data get storage gm4_better_armour_stands:temp Pose.RightArm[2]

# Take right arm and make it into a left arm.
data modify storage gm4_better_armour_stands:temp Pose.LeftArm set from entity @s Pose.RightArm
execute store result storage gm4_better_armour_stands:temp Pose.LeftArm[1] float -1 run data get storage gm4_better_armour_stands:temp Pose.LeftArm[1]
execute store result storage gm4_better_armour_stands:temp Pose.LeftArm[2] float -1 run data get storage gm4_better_armour_stands:temp Pose.LeftArm[2]

# Apply the new pose to the armor stand.
data modify entity @s Pose merge from storage gm4_better_armour_stands:temp Pose
data remove storage gm4_better_armour_stands:temp Pose
tag @s add gm4_pose_changed
