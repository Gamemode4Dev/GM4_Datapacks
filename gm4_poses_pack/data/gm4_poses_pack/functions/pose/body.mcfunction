# @s = armor_stand to be modified
# at @s
# run from apply_pose

# If requested, reset the body to default state.
execute if data storage gm4_better_armour_stands:temp {pages:["reset"]} run data merge entity @s {Pose:{Body:[-.1f,0f,0f]}}

# If book contains a page with "flip", flip the body's orientation.
execute if data storage gm4_better_armour_stands:temp {pages:["flip"]} run function gm4_poses_pack:pose/player/flip_body

# If page 2 does not exist, set body from player rotation.
execute unless data storage gm4_better_armour_stands:temp pages[1] if entity @a[distance=..1,gamemode=!spectator,limit=1] run function gm4_poses_pack:pose/player/body
