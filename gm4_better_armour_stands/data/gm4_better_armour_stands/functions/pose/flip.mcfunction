# @s = armor_stand to be modified
# at @s
# run from book/apply

scoreboard players set $valid_code gm4_bas_data 1

# store current pose
data modify storage gm4_better_armour_stands:temp CurrentPose set from entity @s Pose
data modify storage gm4_better_armour_stands:temp Pose set from storage gm4_better_armour_stands:default Pose

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

# apply pose to armor_stand
data modify entity @s Pose set from storage gm4_better_armour_stands:temp Pose

# reset storage
data remove storage gm4_better_armour_stands:temp CurrentPose
data remove storage gm4_better_armour_stands:temp Pose

# advancement for customizing armor_stand
advancement grant @a[tag=gm4_bas_active,limit=1] only gm4:better_armour_stands
