# @s = armor_stand ..1 from writable_book

# Take left leg and make it into a right leg.
data modify storage gm4_better_armour_stands:temp Pose.RightLeg set from entity @s Pose.LeftLeg
execute store result storage gm4_better_armour_stands:temp Pose.RightLeg[1] float -1 run data get storage gm4_better_armour_stands:temp Pose.RightLeg[1]
execute store result storage gm4_better_armour_stands:temp Pose.RightLeg[2] float -1 run data get storage gm4_better_armour_stands:temp Pose.RightLeg[2]

# Take right leg and make it into a left leg.
data modify storage gm4_better_armour_stands:temp Pose.LeftLeg set from entity @s Pose.RightLeg
execute store result storage gm4_better_armour_stands:temp Pose.LeftLeg[1] float -1 run data get storage gm4_better_armour_stands:temp Pose.LeftLeg[1]
execute store result storage gm4_better_armour_stands:temp Pose.LeftLeg[2] float -1 run data get storage gm4_better_armour_stands:temp Pose.LeftLeg[2]

# Apply the new pose to the armor stand.
data modify entity @s Pose merge from storage gm4_better_armour_stands:temp Pose
data remove storage gm4_better_armour_stands:temp Pose
tag @s add gm4_pose_changed
