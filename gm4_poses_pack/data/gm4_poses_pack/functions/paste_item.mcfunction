# Prepare to copy item tags to armor stand.
data modify storage gm4_better_armour_stands:temp EntityTag set from entity @s Item.tag.EntityTag

# Play a sound to confirm that the pose was pasted.
playsound minecraft:block.stone.place player @a[distance=..5] ~ ~ ~ 1 .2

# Do not attempt to copy or paste from this item again.
tag @s add gm4_pose_copied
