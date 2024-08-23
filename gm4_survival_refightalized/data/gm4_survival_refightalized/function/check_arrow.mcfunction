# check items on ground for Survival Refightalized items
# @s = item
# at unspecified
# run from tick

# tag item as checked and try to process
tag @s add gm4_sr_arrow_checked

execute store result score $arrow_damage gm4_sr_data run data get entity @s damage 10
execute on origin if entity @s[type=#gm4_survival_refightalized:can_fire_arrows] run function gm4_survival_refightalized:mob/process/arrow/run
execute unless score $arrow_damage gm4_sr_data matches 20 store result entity @s damage double 0.1 run scoreboard players get $arrow_damage gm4_sr_data
