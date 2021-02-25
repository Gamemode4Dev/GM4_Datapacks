# run from apply_pose
# @s = armor_stand ..1 from writable_book

# If a predefined pose is selected, add it to storage.
execute if data storage gm4_better_armour_stands:temp {pages:["standing"]} run data modify storage gm4_better_armour_stands:temp Pose set value {LeftLeg:[0f,0f,0f],RightLeg:[0f,0f,0f]}
execute if data storage gm4_better_armour_stands:temp {pages:["sitting"]} run data modify storage gm4_better_armour_stands:temp Pose set value {LeftLeg:[278f,347f,0f],RightLeg:[278f,11f,0f]}
execute if data storage gm4_better_armour_stands:temp {pages:["walking"]} run data modify storage gm4_better_armour_stands:temp Pose set value {LeftLeg:[39f,0f,0f],RightLeg:[317f,0f,0f]}
execute if data storage gm4_better_armour_stands:temp {pages:["flying"]} run data modify storage gm4_better_armour_stands:temp Pose set value {LeftLeg:[108f,0f,0f],RightLeg:[90f,0f,0f]}

# If a predefined pose was added to storage, apply it now.
execute if data storage gm4_better_armour_stands:temp Pose run data modify entity @s Pose merge from storage gm4_better_armour_stands:temp Pose
execute if data storage gm4_better_armour_stands:temp Pose run tag @s add gm4_pose_changed
data remove storage gm4_better_armour_stands:temp Pose

# If page 2 does not exist, set both legs from player rotation.
execute unless data storage gm4_better_armour_stands:temp pages[1] if entity @a[distance=..1,gamemode=!spectator,limit=1] run function gm4_poses_pack:pose/player/leg_left
execute unless data storage gm4_better_armour_stands:temp pages[1] if entity @a[distance=..1,gamemode=!spectator,limit=1] run function gm4_poses_pack:pose/player/leg_right

# If book contains a page with "left" or "right", set this leg from player rotation.
execute if data storage gm4_better_armour_stands:temp {pages:["left"]} if entity @a[distance=..1,gamemode=!spectator,limit=1] run function gm4_poses_pack:pose/player/leg_left
execute if data storage gm4_better_armour_stands:temp {pages:["right"]} if entity @a[distance=..1,gamemode=!spectator,limit=1] run function gm4_poses_pack:pose/player/leg_right

# If book contains a page with "mirror", mirror this pose to the other leg.
execute if data storage gm4_better_armour_stands:temp {pages:["mirror","left"]} run function gm4_poses_pack:pose/player/mirror_leg_left
execute if data storage gm4_better_armour_stands:temp {pages:["mirror","right"]} run function gm4_poses_pack:pose/player/mirror_leg_right

# If book contains a page with "swap" or "flip", swap or flip the legs.
execute if data storage gm4_better_armour_stands:temp {pages:["swap"]} run function gm4_poses_pack:pose/player/swap_legs
execute if data storage gm4_better_armour_stands:temp {pages:["flip"]} run function gm4_poses_pack:pose/player/flip_legs
