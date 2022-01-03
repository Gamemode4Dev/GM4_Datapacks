# @s = armor_stand to be modified
# at @s
# run from pose/apply

scoreboard players set $valid_code gm4_bas_data 1
execute store result score @s gm4_bas_data run data get entity @s Small

# spawn detectors
execute if score @s gm4_bas_data matches 0 positioned ~ ~-10000 ~ run function gm4_better_armour_stands:pose/select/tall
execute if score @s gm4_bas_data matches 1 positioned ~ ~-10000 ~ run function gm4_better_armour_stands:pose/select/small
execute as @e[tag=gm4_bas_detect_part] at @s run tp @s ~ ~10000 ~

# teleport armor_stand so player is not looking at it
tp @s ~ ~1000 ~

# detect what player is looking at
execute if entity @a[tag=gm4_bas_active,limit=1,predicate=gm4_better_armour_stands:select/head] run function gm4_better_armour_stands:default/head
execute if entity @a[tag=gm4_bas_active,limit=1,predicate=gm4_better_armour_stands:select/body] run function gm4_better_armour_stands:default/body
execute if entity @a[tag=gm4_bas_active,limit=1,predicate=gm4_better_armour_stands:select/left_arm] run function gm4_better_armour_stands:default/left_arm
execute if entity @a[tag=gm4_bas_active,limit=1,predicate=gm4_better_armour_stands:select/right_arm] run function gm4_better_armour_stands:default/right_arm
execute if entity @a[tag=gm4_bas_active,limit=1,predicate=gm4_better_armour_stands:select/left_leg] run function gm4_better_armour_stands:default/left_leg
execute if entity @a[tag=gm4_bas_active,limit=1,predicate=gm4_better_armour_stands:select/right_leg] run function gm4_better_armour_stands:default/right_leg
execute if entity @a[tag=gm4_bas_active,limit=1,predicate=gm4_better_armour_stands:sneaking] run function gm4_better_armour_stands:default/all

# teleport armor_stand back to original position
tp @s ~ ~ ~

# kill spawn detectors
tp @e[tag=gm4_bas_detect_part,distance=..2] ~ -10000 ~
