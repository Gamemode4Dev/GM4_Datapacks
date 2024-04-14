# @s = armor_stand to be copied
# at @s
# run from book/apply

scoreboard players set $valid_code gm4_bas_data 1

# prepare to copy armor_stand tags to item entity
data modify storage gm4_better_armour_stands:temp entity_data.id set value "minecraft:armor_stand"
data modify storage gm4_better_armour_stands:temp entity_data.Pose set from entity @s Pose
data modify storage gm4_better_armour_stands:temp entity_data.ShowArms set from entity @s ShowArms
data modify storage gm4_better_armour_stands:temp entity_data.NoBasePlate set from entity @s NoBasePlate
data modify storage gm4_better_armour_stands:temp entity_data.Small set from entity @s Small
data modify storage gm4_better_armour_stands:temp entity_data.NoGravity set from entity @s NoGravity
data modify storage gm4_better_armour_stands:temp entity_data.Invisible set from entity @s Invisible
data modify storage gm4_better_armour_stands:temp entity_data.Tags set value ["gm4_bas_placed","gm4_bas_copy"]

# copy tags from armor_stand to item entity
item modify entity @a[tag=gm4_bas_active,limit=1] weapon.offhand gm4_better_armour_stands:copy
execute as @a[tag=gm4_bas_active,limit=1] run function gm4_better_armour_stands:pose/copy_entity_data with storage gm4_better_armour_stands:temp

# display particles and play a sound to confirm
particle minecraft:item{item:"minecraft:armor_stand"} ~ ~ ~ .2 1 .2 0 20
playsound minecraft:block.wood.break player @a[distance=..6] ~ ~ ~ 0.5 1

# reset storage
data remove storage gm4_better_armour_stands:temp entity_data
