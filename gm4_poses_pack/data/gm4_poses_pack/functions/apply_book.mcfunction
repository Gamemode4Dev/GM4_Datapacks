# @s = armor_stand ..1 from writable_book

# Pose pack operations are only applied once as they rely on player position or rotation.
execute unless entity @e[type=item,tag=gm4_bas_book,tag=gm4_pose_changed,distance=..1,limit=1] run function gm4_poses_pack:apply_pose

# Copy and paste from armor stand item.
execute if data storage gm4_better_armour_stands:temp {pages:["copy"]} run function gm4_poses_pack:copy
execute if data storage gm4_better_armour_stands:temp {pages:["paste"]} run function gm4_poses_pack:paste
