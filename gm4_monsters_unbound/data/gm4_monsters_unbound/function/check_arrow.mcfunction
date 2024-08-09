# check items on ground for Survival Refightalized items
# @s = item
# at unspecified
# run from tick

# tag item as checked and try to process
tag @s add gm4_mu_arrow_checked

scoreboard players set $damage_reduction gm4_mu_data 0
execute on origin if entity @s[type=#gm4_survival_refightalized:skeleton_types] run function gm4_monsters_unbound:mob/process/arrow/run
execute if score $damage_reduction gm4_mu_data matches 1 run data modify entity @s damage set value 0.5d
