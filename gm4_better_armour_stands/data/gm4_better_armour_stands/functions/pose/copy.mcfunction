# @s = armor_stand to be copied
# at @s
# run from book/apply

scoreboard players set $valid_code gm4_bas_data 1

# prepare to copy armor_stand tags to item entity
data modify storage gm4_better_armour_stands:temp EntityTag.Pose set from entity @s Pose
data modify storage gm4_better_armour_stands:temp EntityTag.ShowArms set from entity @s ShowArms
data modify storage gm4_better_armour_stands:temp EntityTag.NoBasePlate set from entity @s NoBasePlate
data modify storage gm4_better_armour_stands:temp EntityTag.Small set from entity @s Small
data modify storage gm4_better_armour_stands:temp EntityTag.NoGravity set from entity @s NoGravity
data modify storage gm4_better_armour_stands:temp EntityTag.Invisible set from entity @s Invisible
data modify storage gm4_better_armour_stands:temp EntityTag.Tags set value ["gm4_bas_placed","gm4_bas_copy"]

# copy tags from armor_stand to item entity
item modify entity @a[tag=gm4_bas_active,limit=1] weapon.offhand gm4_better_armour_stands:copy

# display particles and play a sound to confirm
particle item armor_stand ~ ~ ~ .2 1 .2 0 20
playsound minecraft:block.wood.break player @a[distance=..6] ~ ~ ~ 0.5 1

# reset storage
data remove storage gm4_better_armour_stands:temp EntityTag
