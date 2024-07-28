# check items on ground for Combat Expanded items
# @s = item
# at unspecified
# run from tick

# tag item as checked and try to process
tag @s add gm4_ce_arrow_checked

scoreboard players set $damage_reduction gm4_ce_data 0
execute on origin if entity @s[type=#gm4_combat_expanded:skeleton_types] run function gm4_combat_expanded:mob/process/arrow/run
execute if score $damage_reduction gm4_ce_data matches 1 run data modify entity @s damage set value 0.5d
