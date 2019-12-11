# @s = player on saddled pig with hoe in inventory
# at @s
# ran from on_pig

execute if block ~ ~-0.1 ~ #gm4_pig_tractors:crops run function gm4_pig_tractors:check_crop
execute positioned ~ ~-0.5 ~ if block ~ ~ ~ #gm4_pig_tractors:tillable run function gm4_pig_tractors:till
execute if block ~ ~-0.5 ~ farmland if block ~ ~ ~ air run function gm4_pig_tractors:choose_crop
execute if block ~ ~-0.5 ~ soul_sand if block ~ ~ ~ air run function gm4_pig_tractors:choose_netherwart
