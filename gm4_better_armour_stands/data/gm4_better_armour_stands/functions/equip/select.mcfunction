# @s = armor_stand to be modified
# at @s
# run from apply_pose

tag @s add gm4_bas_valid_code
execute store result score @s gm4_bas_data run data get entity @s Small

# spawn detectors
execute if score @s gm4_bas_data matches 0 positioned ~ ~-1000 ~ run function gm4_better_armour_stands:equip/select/tall
execute if score @s gm4_bas_data matches 1 positioned ~ ~-1000 ~ run function gm4_better_armour_stands:equip/select/small
execute as @e[tag=gm4_bas_detect_part] at @s run tp @s ~ ~1000 ~

# teleport armor_stand so player is not looking at it
tp @s ~ ~1000 ~

# detect what player is looking at
execute if entity @p[tag=gm4_bas_active,predicate=gm4_better_armour_stands:select/head] run function gm4_better_armour_stands:equip/head
execute if entity @p[tag=gm4_bas_active,predicate=gm4_better_armour_stands:select/right_arm] run function gm4_better_armour_stands:equip/hand
execute if entity @p[tag=gm4_bas_active,predicate=gm4_better_armour_stands:select/left_arm] run function gm4_better_armour_stands:equip/offhand

# teleport armor_stand back to original position
tp @s ~ ~ ~

# kill spawn detectors
tp @e[tag=gm4_bas_detect_part,distance=..2] ~ -1000 ~
