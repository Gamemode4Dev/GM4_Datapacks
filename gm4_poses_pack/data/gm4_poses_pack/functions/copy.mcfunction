# run from apply_pose
# @s = armor_stand whose pose is being copied

# Prepare to copy armor stand tags to item entity.
data modify storage gm4_better_armour_stands:temp EntityTag.Pose set from entity @s Pose
data modify storage gm4_better_armour_stands:temp EntityTag.ShowArms set from entity @s ShowArms
data modify storage gm4_better_armour_stands:temp EntityTag.NoBasePlate set from entity @s NoBasePlate
data modify storage gm4_better_armour_stands:temp EntityTag.Small set from entity @s Small

# Copy tags from armor stand to item entity.
execute as @e[type=item,sort=nearest,tag=!gm4_pose_copied,nbt={Item:{id:"minecraft:armor_stand"}},distance=..1,limit=1] run function gm4_poses_pack:copy_item
data remove storage gm4_better_armour_stands:temp EntityTag
