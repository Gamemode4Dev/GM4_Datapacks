# @s = armor_stand to be modified
# at @s
# run from apply_pose

scoreboard players operation @s gm4_bas_id = @p[tag=gm4_bas_active] gm4_bas_id

execute store result score @s gm4_bas_data run data get entity @s Small

# spawn detectors
execute if score @s gm4_bas_data matches 0 positioned ~ ~-1000 ~ run function gm4_better_armour_stands:pose/select/tall
execute if score @s gm4_bas_data matches 1 positioned ~ ~-1000 ~ run function gm4_better_armour_stands:pose/select/small
execute as @e[tag=gm4_bas_detect_part] at @s run tp @s ~ ~1000 ~

# teleport armor_stand so player is not looking at it
tp @s ~ ~1000 ~

# detect what player is looking at
scoreboard players reset @s gm4_bas_mode
execute if entity @p[tag=gm4_bas_active,predicate=gm4_better_armour_stands:select/head] run function gm4_better_armour_stands:pose/select/head
execute unless score @s gm4_bas_mode matches 1.. if entity @p[tag=gm4_bas_active,predicate=gm4_better_armour_stands:select/body] run function gm4_better_armour_stands:pose/select/body
execute unless score @s gm4_bas_mode matches 1.. if entity @p[tag=gm4_bas_active,predicate=gm4_better_armour_stands:select/left_arm] run function gm4_better_armour_stands:pose/select/arm_left
execute unless score @s gm4_bas_mode matches 1.. if entity @p[tag=gm4_bas_active,predicate=gm4_better_armour_stands:select/right_arm] run function gm4_better_armour_stands:pose/select/arm_right
execute unless score @s gm4_bas_mode matches 1.. if entity @p[tag=gm4_bas_active,predicate=gm4_better_armour_stands:select/left_leg] run function gm4_better_armour_stands:pose/select/leg_left
execute unless score @s gm4_bas_mode matches 1.. if entity @p[tag=gm4_bas_active,predicate=gm4_better_armour_stands:select/right_leg] run function gm4_better_armour_stands:pose/select/leg_right

execute if score @s gm4_bas_mode matches 1.. run playsound minecraft:entity.armor_stand.fall block @a[distance=..5] ~ ~ ~ 0.5 1
execute if score @s gm4_bas_mode matches 1.. run scoreboard players operation @e[type=marker,tag=gm4_bas_new] gm4_bas_id = @s gm4_bas_id
tag @e[type=marker,tag=gm4_bas_new] remove gm4_bas_new

execute unless score @s gm4_bas_mode matches 1.. run scoreboard players reset @s gm4_bas_id

# teleport armor_stand back to original position
tp @s ~ ~ ~

# kill spawn detectors
execute positioned ~ ~1 ~ run tp @e[tag=gm4_bas_detect_part,distance=..1] ~ -1000 ~
