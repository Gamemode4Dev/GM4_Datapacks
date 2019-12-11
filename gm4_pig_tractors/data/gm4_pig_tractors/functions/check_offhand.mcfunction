# @s = pig tractor above farmland with air above after check_mainhand
# at @s
# Called from choose_crop
execute if entity @s[nbt={Inventory:[{id:"minecraft:carrot",Slot:-106b}]}] run function pig_tractors:place_crops/carrots
execute if entity @s[nbt={Inventory:[{id:"minecraft:potato",Slot:-106b}]}] run function pig_tractors:place_crops/potatoes
execute if entity @s[nbt={Inventory:[{id:"minecraft:beetroot_seeds",Slot:-106b}]}] run function pig_tractors:place_crops/beetroots
execute if entity @s[nbt={Inventory:[{id:"minecraft:wheat_seeds",Slot:-106b}]}] run function pig_tractors:place_crops/wheat
