# @s = armor_stand to be copied
# at @s
# run from apply_pose

tag @s add gm4_bas_valid_code

# Prepare to copy armor stand tags to item entity.
data modify storage gm4_better_armour_stands:temp EntityTag.Pose set from entity @s Pose
data modify storage gm4_better_armour_stands:temp EntityTag.ShowArms set from entity @s ShowArms
data modify storage gm4_better_armour_stands:temp EntityTag.NoBasePlate set from entity @s NoBasePlate
data modify storage gm4_better_armour_stands:temp EntityTag.Small set from entity @s Small
data modify storage gm4_better_armour_stands:temp EntityTag.NoGravity set from entity @s NoGravity
data modify storage gm4_better_armour_stands:temp EntityTag.Invisible set from entity @s Invisible
data modify storage gm4_better_armour_stands:temp EntityTag.Tags set value ["gm4_bas_placed"]

# Copy tags from armor stand to item entity.
item modify entity @p[tag=gm4_bas_active] weapon.offhand gm4_better_armour_stands:copy

# Display particles and play a sound to confirm that the pose was copied.
particle item armor_stand ~ ~ ~ .2 1 .2 0 20
playsound minecraft:block.wood.break player @a[distance=..5] ~ ~ ~ 0.5 1

# Reset storage
data remove storage gm4_better_armour_stands:temp EntityTag
