# Checks player's inventory for an Infinitas Lava Bucket
# @s = player with tag, gm4_has_lava_infinitas
# run from gm4_infinitas_shamir:clock/inventory_check

tag @s remove gm4_has_lava_infinitas
tag @s remove gm4_infinitas_mainhand_lava
tag @s remove gm4_infinitas_offhand_lava
scoreboard players reset @s gm4_infinitas_lava_held

execute store result score @s gm4_infinitas_lava_held run clear @s lava_bucket{gm4_metallurgy:{active_shamir:"infinitas"}} 0
execute if score @s gm4_infinitas_lava_held matches 1.. run function gm4_infinitas_shamir:lava/check_holding
execute unless score @s gm4_infinitas_lava_held matches 1.. run function gm4_infinitas_shamir:lava/remove_tag
