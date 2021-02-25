# run from apply_book
# @s = armor_stand item ..1 from writable_book

# Move or rotate armor stand according to player position.
execute if data storage gm4_better_armour_stands:temp {pages:["move"],} positioned as @p[distance=..1,gamemode=!spectator] run tp @s ~ ~ ~
execute if data storage gm4_better_armour_stands:temp {pages:["rotate"]} rotated as @p[distance=..1,gamemode=!spectator] run tp @s ~ ~ ~ ~ ~

# Rotate armor stand part according to player rotation.
execute if data storage gm4_better_armour_stands:temp {pages:["head"]} run function gm4_poses_pack:pose/head
execute if data storage gm4_better_armour_stands:temp {pages:["body"]} run function gm4_poses_pack:pose/body
execute if data storage gm4_better_armour_stands:temp {pages:["arms"]} run function gm4_poses_pack:pose/arms
execute if data storage gm4_better_armour_stands:temp {pages:["legs"]} run function gm4_poses_pack:pose/legs

# Grant advancement if any poses were changed.
execute if data storage gm4_better_armour_stands:temp {pages:["rotate"]} run tag @s add gm4_pose_changed
execute if data storage gm4_better_armour_stands:temp {pages:["move"]} run tag @s add gm4_pose_changed
execute if entity @s[tag=gm4_pose_changed] run function gm4_poses_pack:pose_changed

# Ensure that this function will not run again unless the book is picked up by the player.
tag @e[type=item,tag=gm4_bas_book,distance=..1,limit=1] add gm4_pose_changed
