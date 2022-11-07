# Checks player's inventory for an Infinitas Empty Bucket
# @s = player with tag, gm4_has_empty_infinitas
# run from gm4_infinitas_shamir:clock/inventory_check

tag @s remove gm4_has_empty_infinitas
tag @s remove gm4_infinitas_mainhand_empty
tag @s remove gm4_infinitas_offhand_empty
scoreboard players reset @s gm4_infinitas_empty_held

execute store result score @s gm4_infinitas_empty_held run clear @s bucket{gm4_metallurgy:{active_shamir:"infinitas"}} 0
execute if score @s gm4_infinitas_empty_held matches 1.. run function gm4_infinitas_shamir:empty/check_holding
execute unless score @s gm4_infinitas_empty_held matches 1.. run function gm4_infinitas_shamir:empty/remove_tag
