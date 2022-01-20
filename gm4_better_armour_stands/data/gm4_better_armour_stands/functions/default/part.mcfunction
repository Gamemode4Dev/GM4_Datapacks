# @s = armor_stand to be modified
# at @s
# run from default/check

# check size, spawn part detectors
execute store result score $size gm4_bas_data run data get entity @s Small
execute if score $size gm4_bas_data matches 0 run function gm4_better_armour_stands:pose/select/tall
execute if score $size gm4_bas_data matches 1 run function gm4_better_armour_stands:pose/select/small

# detect part player is looking at
tp @s ~ ~100 ~
execute if entity @a[tag=gm4_bas_active,limit=1,predicate=gm4_better_armour_stands:select/head] run data modify entity @s Pose.Head set from storage gm4_better_armour_stands:default Pose.Head
execute if entity @a[tag=gm4_bas_active,limit=1,predicate=gm4_better_armour_stands:select/body] run data modify entity @s Pose.Body set from storage gm4_better_armour_stands:default Pose.Body
execute if entity @a[tag=gm4_bas_active,limit=1,predicate=gm4_better_armour_stands:select/left_arm] run data modify entity @s Pose.LeftArm set from storage gm4_better_armour_stands:default Pose.LeftArm
execute if entity @a[tag=gm4_bas_active,limit=1,predicate=gm4_better_armour_stands:select/right_arm] run data modify entity @s Pose.RightArm set from storage gm4_better_armour_stands:default Pose.RightArm
execute if entity @a[tag=gm4_bas_active,limit=1,predicate=gm4_better_armour_stands:select/left_leg] run data modify entity @s Pose.LeftLeg set from storage gm4_better_armour_stands:default Pose.LeftLeg
execute if entity @a[tag=gm4_bas_active,limit=1,predicate=gm4_better_armour_stands:select/right_leg] run data modify entity @s Pose.RightLeg set from storage gm4_better_armour_stands:default Pose.RightLeg
execute if entity @a[tag=gm4_bas_active,limit=1,predicate=gm4_better_armour_stands:select/part] run playsound minecraft:entity.armor_stand.fall block @a[distance=..6] ~ ~ ~ 0.5 1
tp @s ~ ~ ~
