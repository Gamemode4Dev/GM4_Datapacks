# @s = armor_stand ..1 from writable_book

# Swap the arms in temporary storage.
data modify storage gm4_better_armour_stands:temp Pose.LeftArm set from entity @s Pose.RightArm
data modify storage gm4_better_armour_stands:temp Pose.RightArm set from entity @s Pose.LeftArm

# Apply the new pose to the armor stand.
data modify entity @s Pose merge from storage gm4_better_armour_stands:temp Pose
data remove storage gm4_better_armour_stands:temp Pose
tag @s add gm4_pose_changed
