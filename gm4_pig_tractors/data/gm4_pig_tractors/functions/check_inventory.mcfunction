# @s = pig tractor above farmland with air above after check_offhand
# at @s
# Called from choose_crop
execute if entity @s[nbt={Inventory:[{id:"minecraft:carrot"}]}] run function gm4_pig_tractors:place_crops/carrots
execute if block ~ ~ ~ air if entity @s[nbt={Inventory:[{id:"minecraft:potato"}]}] run function gm4_pig_tractors:place_crops/potatoes
execute if block ~ ~ ~ air if entity @s[nbt={Inventory:[{id:"minecraft:beetroot_seeds"}]}] run function gm4_pig_tractors:place_crops/beetroots
execute if block ~ ~ ~ air if entity @s[nbt={Inventory:[{id:"minecraft:wheat_seeds"}]}] run function gm4_pig_tractors:place_crops/wheat
