# run from apply_pose
# @s = armor_stand ..1 from writable_book

# If a predefined pose is selected, add it to storage.
execute if data storage gm4_better_armour_stands:temp {pages:["forward"]} run data modify storage gm4_better_armour_stands:temp Pose set value {Head:[.1f,0f,0f]}
execute if data storage gm4_better_armour_stands:temp {pages:["up"]} run data modify storage gm4_better_armour_stands:temp Pose set value {Head:[325f,0f,0f]}
execute if data storage gm4_better_armour_stands:temp {pages:["down"]} run data modify storage gm4_better_armour_stands:temp Pose set value {Head:[32f,0f,0f]}
execute if data storage gm4_better_armour_stands:temp {pages:["left"]} run data modify storage gm4_better_armour_stands:temp Pose set value {Head:[0f,327f,0f]}
execute if data storage gm4_better_armour_stands:temp {pages:["right"]} run data modify storage gm4_better_armour_stands:temp Pose set value {Head:[0f,32f,0f]}

# If a predefined pose was added to storage, apply it now.
execute if data storage gm4_better_armour_stands:temp Pose run data modify entity @s Pose merge from storage gm4_better_armour_stands:temp Pose
execute if data storage gm4_better_armour_stands:temp Pose run tag @s add gm4_pose_changed
data remove storage gm4_better_armour_stands:temp Pose

# If page 2 does not exist, set head from player rotation.
execute unless data storage gm4_better_armour_stands:temp pages[1] if entity @a[distance=..1,gamemode=!spectator,limit=1] run function gm4_poses_pack:pose/player/head
