# run from apply_pose
# @s = armor_stand ..1 from writable_book

# If a predefined pose is selected, add it to storage.
execute if data storage gm4_better_armour_stands:temp {pages:["hanging"]} run data modify storage gm4_better_armour_stands:temp Pose set value {LeftArm:[0f,0f,0f],RightArm:[0f,0f,0f]}
execute if data storage gm4_better_armour_stands:temp {pages:["reaching"]} run data modify storage gm4_better_armour_stands:temp Pose set value {LeftArm:[254f,0f,0f],RightArm:[254f,0f,0f]}
execute if data storage gm4_better_armour_stands:temp {pages:["swinging"]} run data modify storage gm4_better_armour_stands:temp Pose set value {LeftArm:[304f,0f,0f],RightArm:[40f,0f,0f]}
execute if data storage gm4_better_armour_stands:temp {pages:["resting"]} run data modify storage gm4_better_armour_stands:temp Pose set value {LeftArm:[263f,340f,188f],RightArm:[263f,25f,188f]}
execute if data storage gm4_better_armour_stands:temp {pages:["raised"]} run data modify storage gm4_better_armour_stands:temp Pose set value {LeftArm:[179f,0f,24f],RightArm:[179f,0f,344f]}

# If a predefined pose was added to storage, apply it now.
execute if data storage gm4_better_armour_stands:temp Pose run data modify entity @s Pose merge from storage gm4_better_armour_stands:temp Pose
execute if data storage gm4_better_armour_stands:temp Pose run tag @s add gm4_pose_changed
data remove storage gm4_better_armour_stands:temp Pose

# If page 2 does not exist, set both arms from player rotation.
execute unless data storage gm4_better_armour_stands:temp pages[1] if entity @a[distance=..1,gamemode=!spectator,limit=1] run function gm4_poses_pack:pose/player/arm_left
execute unless data storage gm4_better_armour_stands:temp pages[1] if entity @a[distance=..1,gamemode=!spectator,limit=1] run function gm4_poses_pack:pose/player/arm_right

# If book contains a page with "left" or "right", set this arm from player rotation.
execute if data storage gm4_better_armour_stands:temp {pages:["left"]} if entity @a[distance=..1,gamemode=!spectator,limit=1] run function gm4_poses_pack:pose/player/arm_left
execute if data storage gm4_better_armour_stands:temp {pages:["right"]} if entity @a[distance=..1,gamemode=!spectator,limit=1] run function gm4_poses_pack:pose/player/arm_right

# If book contains a page with "mirror", mirror this pose to the other arm.
execute if data storage gm4_better_armour_stands:temp {pages:["mirror","left"]} run function gm4_poses_pack:pose/player/mirror_arm_left
execute if data storage gm4_better_armour_stands:temp {pages:["mirror","right"]} run function gm4_poses_pack:pose/player/mirror_arm_right

# If book contains a page with "swap" or "flip", swap or flip the arms.
execute if data storage gm4_better_armour_stands:temp {pages:["swap"]} run function gm4_poses_pack:pose/player/swap_arms
execute if data storage gm4_better_armour_stands:temp {pages:["flip"]} run function gm4_poses_pack:pose/player/flip_arms
