# @s = armor_stand to be modified
# at @s
# run from apply_pose

# Prepare to copy item tags to armor stand.
data modify storage gm4_better_armour_stands:temp EntityTag set from entity @p[tag=gm4_bas_user] Inventory[-1].tag.EntityTag
data modify entity @s {} merge from entity @p[tag=gm4_bas_user] Inventory[-1].tag.EntityTag

# Play a sound to confirm that the pose was pasted.
playsound minecraft:block.stone.place player @a[distance=..5] ~ ~ ~ 1 .2
