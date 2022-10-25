
tag @s remove gm4_has_water_infinitas
tag @s remove gm4_infinitas_mainhand_water
tag @s remove gm4_infinitas_offhand_water
scoreboard players reset @s gm4_infinitas_water_held

execute store result score @s gm4_infinitas_water_held run clear @s water_bucket{gm4_metallurgy:{active_shamir:"infinitas"}} 0
execute if score @s gm4_infinitas_water_held matches 1.. run function gm4_infinitas_shamir:water/check_holding
execute unless score @s gm4_infinitas_water_held matches 1.. run function gm4_infinitas_shamir:water/remove_tag
