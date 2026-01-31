# check shot arrows
# @s = arrow
# at unspecified
# run from tick

# tag item as checked and try to process
tag @s add gm4_sr_arrow_checked
scoreboard players set $trident_damage_change gm4_sr_data 0

execute store result score $arrow_damage gm4_sr_data run data get entity @s damage 10
tag @s add gm4_sr_current_arrow
execute on origin if entity @s[type=#gm4_survival_refightalized:can_fire_arrows] run function gm4_survival_refightalized:mob/process/arrow/run
tag @s remove gm4_sr_current_arrow

# if it's a trident use enchantments instead
execute if entity @s[type=trident] run return run execute store result entity @s item.components."minecraft:enchantments"."gm4_survival_refightalized:trident_damage_reduction" int -1 run scoreboard players get $trident_damage_change gm4_sr_data

# store result on arrow
scoreboard players operation $arrow_damage gm4_sr_data += $arrow_damage_change gm4_sr_data
execute store result entity @s damage double 0.1 run scoreboard players get $arrow_damage gm4_sr_data
