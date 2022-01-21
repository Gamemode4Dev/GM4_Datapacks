# @s = armor_stand to be modified
# at @s
# run from pose/apply

scoreboard players set $valid_code gm4_bas_data 1

# check size, spawn part detectors
execute store result score $size gm4_bas_data run data get entity @s Small
execute if score $size gm4_bas_data matches 0 positioned ~ ~1 ~ run function gm4_better_armour_stands:equip/select/tall
execute if score $size gm4_bas_data matches 1 positioned ~ ~.3 ~ run function gm4_better_armour_stands:equip/select/small

# detect part player is looking at
tp @s ~ ~100 ~
execute if entity @a[tag=gm4_bas_active,limit=1,predicate=gm4_better_armour_stands:select/head] run function gm4_better_armour_stands:equip/head
execute if entity @a[tag=gm4_bas_active,limit=1,predicate=gm4_better_armour_stands:select/right_arm] run function gm4_better_armour_stands:equip/hand
execute if entity @a[tag=gm4_bas_active,limit=1,predicate=gm4_better_armour_stands:select/left_arm] run function gm4_better_armour_stands:equip/offhand
tp @s ~ ~ ~
