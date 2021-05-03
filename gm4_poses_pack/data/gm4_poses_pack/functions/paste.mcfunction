# run from apply_pose
# @s = armor_stand whose pose is being pasted

# Select item entity to paste armor stand pose from.
execute as @e[type=item,sort=nearest,tag=!gm4_pose_copied,nbt={Item:{id:"minecraft:armor_stand",tag:{EntityTag:{}}}},distance=..1,limit=1] run function gm4_better_armour_stands:paste_item

# Copy tags from item entity to armor stand.
data modify entity @s Pose set from storage gm4_better_armour_stands:temp EntityTag.Pose
data modify entity @s ShowArms set from storage gm4_better_armour_stands:temp EntityTag.ShowArms
data modify entity @s NoBasePlate set from storage gm4_better_armour_stands:temp EntityTag.NoBasePlate
data modify entity @s Small set from storage gm4_better_armour_stands:temp EntityTag.Small
data remove storage gm4_better_armour_stands:temp EntityTag
