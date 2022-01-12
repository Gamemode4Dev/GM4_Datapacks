# @s = armor_stand to be modified
# at @s
# run from gm4_better_armour_stands:book/process

# Check presets
execute if data storage gm4_better_armour_stands:temp {pages:["legs down"]} run data merge entity @s {Pose:{LeftLeg:[0.01f,0f,0f],RightLeg:[0.01f,0f,0f]},Tags:[gm4_pose_changed]}
execute if data storage gm4_better_armour_stands:temp {pages:["legs sitting"]} run data merge entity @s {Pose:{LeftLeg:[278f,347f,0f],RightLeg:[278f,11f,0f]},Tags:[gm4_pose_changed]}
execute if data storage gm4_better_armour_stands:temp {pages:["legs walking"]} run data merge entity @s {Pose:{LeftLeg:[39f,0f,0f],RightLeg:[317f,0f,0f]},Tags:[gm4_pose_changed]}
execute if data storage gm4_better_armour_stands:temp {pages:["legs flying"]} run data merge entity @s {Pose:{LeftLeg:[108f,0f,0f],RightLeg:[90f,0f,0f]},Tags:[gm4_pose_changed]}

execute if data storage gm4_better_armour_stands:temp {pages:["arms reaching"]} run data merge entity @s {ShowArms:1b,Pose:{LeftArm:[254f,0f,0f],RightArm:[254f,0f,0f]},Tags:[gm4_pose_changed]}
execute if data storage gm4_better_armour_stands:temp {pages:["arms swinging"]} run data merge entity @s {ShowArms:1b,Pose:{LeftArm:[304f,0f,0f],RightArm:[40f,0f,0f]},Tags:[gm4_pose_changed]}
execute if data storage gm4_better_armour_stands:temp {pages:["arms resting"]} run data merge entity @s {ShowArms:1b,Pose:{LeftArm:[263f,340f,188f],RightArm:[263f,25f,188f]},Tags:[gm4_pose_changed]}
execute if data storage gm4_better_armour_stands:temp {pages:["arms raised"]} run data merge entity @s {ShowArms:1b,Pose:{LeftArm:[179f,0f,24f],RightArm:[179f,0f,344f]},Tags:[gm4_pose_changed]}
execute if data storage gm4_better_armour_stands:temp {pages:["arms down"]} run data merge entity @s {ShowArms:1b,Pose:{LeftArm:[0.01f,0f,0f],RightArm:[0.01f,0f,0f]},Tags:[gm4_pose_changed]}

execute if data storage gm4_better_armour_stands:temp {pages:["head up"]} run data merge entity @s {Pose:{Head:[325f,0f,0f]},Tags:[gm4_pose_changed]}
execute if data storage gm4_better_armour_stands:temp {pages:["head down"]} run data merge entity @s {Pose:{Head:[35f,0f,0f]},Tags:[gm4_pose_changed]}
execute if data storage gm4_better_armour_stands:temp {pages:["head left"]} run data merge entity @s {Pose:{Head:[0f,325f,0f]},Tags:[gm4_pose_changed]}
execute if data storage gm4_better_armour_stands:temp {pages:["head right"]} run data merge entity @s {Pose:{Head:[0f,35f,0f]},Tags:[gm4_pose_changed]}

# Grant advancement if any poses were changed.
execute if entity @s[tag=gm4_pose_changed] run function gm4_poses_pack:pose_changed
