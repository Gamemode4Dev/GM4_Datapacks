function pig_tractors:check_hoe
execute if entity @s[tag=gm4_has_hoe] if block ~ ~-0.2 ~ #pig_tractors:crops run function pig_tractors:check_crop
execute if entity @s[tag=gm4_has_hoe] positioned ~ ~-0.5 ~ if block ~ ~ ~ #pig_tractors:tillable run function pig_tractors:till
execute if entity @s[tag=gm4_has_hoe] if block ~ ~-0.5 ~ farmland if block ~ ~ ~ air run function pig_tractors:choose_crop
tag @s remove gm4_has_hoe