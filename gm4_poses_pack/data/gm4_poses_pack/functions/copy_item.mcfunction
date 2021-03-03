# run from copy
# @s = armor_stand item ..1 from armor_stand

# Copy the EntityTag and add an enchantment glow to the item entity.
data modify entity @s Item.tag.EntityTag set from storage gm4_better_armour_stands:temp EntityTag
data modify entity @s Item.tag merge value {HideFlags:1,Enchantments:[{id:"minecraft:protection",lvl:0s}]}

# Display particles and play a sound to confirm that the pose was copied.
particle item armor_stand ~ ~ ~ .2 1 .2 0 20
playsound minecraft:block.wood.break player @a[distance=..5] ~ ~ ~ 1 .2

# Do not attempt to copy or paste from this item again.
tag @s add gm4_pose_copied
