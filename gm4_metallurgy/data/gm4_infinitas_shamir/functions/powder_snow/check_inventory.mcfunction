# Checks player's inventory for an Infinitas Powder snow Bucket
# @s = player with tag, gm4_has_powder_snow_infinitas
# run from gm4_infinitas_shamir:clock/inventory_check

tag @s remove gm4_has_powder_snow_infinitas
tag @s remove gm4_infinitas_mainhand_powder_snow
tag @s remove gm4_infinitas_offhand_powder_snow
scoreboard players reset @s gm4_infinitas_powder_snow_held

execute store result score @s gm4_infinitas_powder_snow_held run clear @s powder_snow_bucket{gm4_metallurgy:{active_shamir:"infinitas"}} 0
execute if score @s gm4_infinitas_powder_snow_held matches 1.. run function gm4_infinitas_shamir:powder_snow/check_holding
execute unless score @s gm4_infinitas_powder_snow_held matches 1.. run function gm4_infinitas_shamir:powder_snow/remove_tag
