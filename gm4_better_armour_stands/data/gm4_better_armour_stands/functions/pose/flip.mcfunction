# @s = armor_stand to be modified
# at @s
# run from apply_book

# store current pose
data modify storage gm4_better_armour_stands:temp CurrentPose set value {LeftArm:[0f,0f,0f],RightArm:[0f,0f,0f],LeftLeg:[0f,0f,0f],RightLeg:[0f,0f,0f],Head:[0f,0f,0f],Body:[0f,0f,0f]}
data modify storage gm4_better_armour_stands:temp Pose set value {LeftArm:[0f,0f,0f],RightArm:[0f,0f,0f],LeftLeg:[0f,0f,0f],RightLeg:[0f,0f,0f],Head:[0f,0f,0f],Body:[0f,0f,0f]}
data modify storage gm4_better_armour_stands:temp CurrentPose merge from entity @s Pose

# copy/mirror poses
data modify storage gm4_better_armour_stands:temp Pose.LeftArm[0] set from storage gm4_better_armour_stands:temp CurrentPose.RightArm[0]
data modify storage gm4_better_armour_stands:temp Pose.RightArm[0] set from storage gm4_better_armour_stands:temp CurrentPose.LeftArm[0]

data modify storage gm4_better_armour_stands:temp Pose.LeftLeg[0] set from storage gm4_better_armour_stands:temp CurrentPose.RightLeg[0]
data modify storage gm4_better_armour_stands:temp Pose.RightLeg[0] set from storage gm4_better_armour_stands:temp CurrentPose.LeftLeg[0]

data modify storage gm4_better_armour_stands:temp Pose.Head[0] set from storage gm4_better_armour_stands:temp CurrentPose.Head[0]
data modify storage gm4_better_armour_stands:temp Pose.Body[0] set from storage gm4_better_armour_stands:temp CurrentPose.Body[0]

execute store result storage gm4_better_armour_stands:temp Pose.LeftArm[1] float -1 run data get storage gm4_better_armour_stands:temp CurrentPose.RightArm[1]
execute store result storage gm4_better_armour_stands:temp Pose.RightArm[1] float -1 run data get storage gm4_better_armour_stands:temp CurrentPose.LeftArm[1]

execute store result storage gm4_better_armour_stands:temp Pose.LeftLeg[1] float -1 run data get storage gm4_better_armour_stands:temp CurrentPose.RightLeg[1]
execute store result storage gm4_better_armour_stands:temp Pose.RightLeg[1] float -1 run data get storage gm4_better_armour_stands:temp CurrentPose.LeftLeg[1]

execute store result storage gm4_better_armour_stands:temp Pose.Head[1] float -1 run data get storage gm4_better_armour_stands:temp CurrentPose.Head[1]
execute store result storage gm4_better_armour_stands:temp Pose.Body[1] float -1 run data get storage gm4_better_armour_stands:temp CurrentPose.Body[1]

data modify entity @s Pose merge from storage gm4_better_armour_stands:temp Pose

data remove storage gm4_better_armour_stands:temp CurrentPose

advancement grant @p[tag=gm4_bas_active] only gm4:better_armour_stands
