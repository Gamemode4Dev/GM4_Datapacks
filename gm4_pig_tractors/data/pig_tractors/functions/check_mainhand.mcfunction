# Called from choose_crop
execute if entity @s[nbt={SelectedItem:{id:"minecraft:carrot"}}] run function pig_tractors:place_crops/carrots
execute if entity @s[nbt={SelectedItem:{id:"minecraft:potato"}}] run function pig_tractors:place_crops/potatoes
execute if entity @s[nbt={SelectedItem:{id:"minecraft:beetroot_seeds"}}] run function pig_tractors:place_crops/beetroots
execute if entity @s[nbt={SelectedItem:{id:"minecraft:wheat_seeds"}}] run function pig_tractors:place_crops/wheat