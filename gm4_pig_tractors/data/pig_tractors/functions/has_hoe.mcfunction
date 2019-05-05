# @s = player on saddled pig with hoe in inventory
# at @s
# ran from on_pig

execute if block ~ ~-0.1 ~ #pig_tractors:crops run function pig_tractors:check_crop
execute positioned ~ ~-0.5 ~ if block ~ ~ ~ #pig_tractors:tillable run function pig_tractors:till
execute if block ~ ~-0.5 ~ farmland if block ~ ~ ~ #pig_tractors:air run function pig_tractors:choose_crop
execute if block ~ ~-0.5 ~ soul_sand if block ~ ~ ~ #pig_tractors:air run function pig_tractors:choose_netherwart
