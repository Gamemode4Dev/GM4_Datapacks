execute if entity @s[nbt={Inventory:[{id:"minecraft:carrot"}]}] run function pig_tractors:place_crops/carrots
execute if block ~ ~ ~ air if entity @s[nbt={Inventory:[{id:"minecraft:potato"}]}] run function pig_tractors:place_crops/potatoes
execute if block ~ ~ ~ air if entity @s[nbt={Inventory:[{id:"minecraft:beetroot_seeds"}]}] run function pig_tractors:place_crops/beetroots
execute if block ~ ~ ~ air if entity @s[nbt={Inventory:[{id:"minecraft:wheat_seeds"}]}] run function pig_tractors:place_crops/wheat