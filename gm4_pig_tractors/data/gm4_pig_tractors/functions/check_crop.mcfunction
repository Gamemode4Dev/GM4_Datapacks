# @s = player on pig with hoe in #pig_tractors:crops block
# at @s
# Called from has_hoe
execute if block ~ ~ ~ minecraft:wheat[age=7] run function pig_tractors:replace_crops/wheat
execute if block ~ ~ ~ minecraft:potatoes[age=7] run function pig_tractors:replace_crops/potatoes
execute if block ~ ~ ~ minecraft:carrots[age=7] run function pig_tractors:replace_crops/carrots
execute if block ~ ~ ~ minecraft:beetroots[age=3] run function pig_tractors:replace_crops/beetroots
execute if block ~ ~ ~ minecraft:nether_wart[age=3] run function pig_tractors:replace_crops/nether_wart
