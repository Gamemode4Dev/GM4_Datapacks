# @s = armor_stand to be modified
# at @s
# run from apply_pose

tag @s add gm4_bas_valid_code

# Prepare to copy item tags to armor stand.
data modify storage gm4_better_armour_stands:temp EntityTag set from entity @p[tag=gm4_bas_active] Inventory[-1].tag.EntityTag
data modify entity @s {} merge from entity @p[tag=gm4_bas_active] Inventory[-1].tag.EntityTag

# Play a sound to confirm that the pose was pasted.
playsound minecraft:entity.armor_stand.fall block @a[distance=..5] ~ ~ ~ 0.5 1
