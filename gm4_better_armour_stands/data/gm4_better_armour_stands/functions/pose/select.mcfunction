# @s = armor_stand to be modified
# at @s
# run from book/apply

scoreboard players set $valid_code gm4_bas_data 1
scoreboard players operation @s gm4_bas_id = @a[tag=gm4_bas_active,limit=1] gm4_bas_id

# check size, spawn part detectors
execute store result score $size gm4_bas_data run data get entity @s Small
execute if score $size gm4_bas_data matches 0 run function gm4_better_armour_stands:pose/select/tall
execute if score $size gm4_bas_data matches 1 run function gm4_better_armour_stands:pose/select/small

# detect part player is looking at
tp @s ~ ~100 ~
execute if entity @a[tag=gm4_bas_active,limit=1,predicate=gm4_better_armour_stands:select/head] run function gm4_better_armour_stands:pose/select/head
execute unless score @s gm4_bas_mode matches 1.. if entity @a[tag=gm4_bas_active,limit=1,predicate=gm4_better_armour_stands:select/body] run function gm4_better_armour_stands:pose/select/body
execute unless score @s gm4_bas_mode matches 1.. if entity @a[tag=gm4_bas_active,limit=1,predicate=gm4_better_armour_stands:select/left_arm] run function gm4_better_armour_stands:pose/select/arm_left
execute unless score @s gm4_bas_mode matches 1.. if entity @a[tag=gm4_bas_active,limit=1,predicate=gm4_better_armour_stands:select/right_arm] run function gm4_better_armour_stands:pose/select/arm_right
execute unless score @s gm4_bas_mode matches 1.. if entity @a[tag=gm4_bas_active,limit=1,predicate=gm4_better_armour_stands:select/left_leg] run function gm4_better_armour_stands:pose/select/leg_left
execute unless score @s gm4_bas_mode matches 1.. if entity @a[tag=gm4_bas_active,limit=1,predicate=gm4_better_armour_stands:select/right_leg] run function gm4_better_armour_stands:pose/select/leg_right
execute unless score @s gm4_bas_mode matches 1.. if entity @a[tag=gm4_bas_active,limit=1,predicate=gm4_better_armour_stands:select/base,predicate=!gm4_better_armour_stands:sneaking] run function gm4_better_armour_stands:pose/select/move/move
execute unless score @s gm4_bas_mode matches 1.. if entity @a[tag=gm4_bas_active,limit=1,predicate=gm4_better_armour_stands:select/base,predicate=gm4_better_armour_stands:sneaking] run function gm4_better_armour_stands:pose/select/rotate
tp @s ~ ~ ~

# start editing if success, otherwise feedback
execute if score @s gm4_bas_mode matches 1.. run function gm4_better_armour_stands:pose/select/success
execute unless score @s gm4_bas_mode matches 1.. positioned ^ ^ ^.1 run function gm4_better_armour_stands:pose/select/failure
