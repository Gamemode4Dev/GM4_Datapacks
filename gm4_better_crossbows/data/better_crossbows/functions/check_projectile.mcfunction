# @s = player using the crossbow

#reset crossbow advancement
advancement revoke @s only gm4:better_crossbows_use

#check offhand item
#fish
execute if entity @s[nbt={Inventory:[{Slot:-106b,id:"minecraft:cod_bucket"}]}] run function better_crossbows:shoot/cod
execute if entity @s[nbt={Inventory:[{Slot:-106b,id:"minecraft:salmon_bucket"}]}] run function better_crossbows:shoot/salmon
execute if entity @s[nbt={Inventory:[{Slot:-106b,id:"minecraft:pufferfish_bucket"}]}] run function better_crossbows:shoot/pufferfish
execute if entity @s[nbt={Inventory:[{Slot:-106b,id:"minecraft:tropical_fish_bucket"}]}] run function better_crossbows:shoot/tropical
#crops
execute if entity @s[nbt={Inventory:[{Slot:-106b,id:"minecraft:carrot"}]}] run function better_crossbows:shoot/carrot
execute if entity @s[nbt={Inventory:[{Slot:-106b,id:"minecraft:potato"}]}] run function better_crossbows:shoot/potato
execute if entity @s[nbt={Inventory:[{Slot:-106b,id:"minecraft:wheat_seeds"}]}] run function better_crossbows:shoot/wheat
execute if entity @s[nbt={Inventory:[{Slot:-106b,id:"minecraft:beetroot_seeds"}]}] run function better_crossbows:shoot/beet
execute if entity @s[nbt={Inventory:[{Slot:-106b,id:"minecraft:pumpkin_seeds"}]}] run function better_crossbows:shoot/pumpkin
execute if entity @s[nbt={Inventory:[{Slot:-106b,id:"minecraft:melon_seeds"}]}] run function better_crossbows:shoot/melon
#potions
execute if entity @s[nbt={Inventory:[{Slot:-106b,id:"minecraft:splash_potion"}]}] run function better_crossbows:shoot/splashpotion
execute if entity @s[nbt={Inventory:[{Slot:-106b,id:"minecraft:lingering_potion"}]}] run function better_crossbows:shoot/lingerpotion
#other
execute if entity @s[nbt={Inventory:[{Slot:-106b,id:"minecraft:torch"}]}] run function better_crossbows:shoot/torch
execute if entity @s[nbt={Inventory:[{Slot:-106b,id:"minecraft:fire_charge"}]}] run function better_crossbows:shoot/firecharge
#execute if entity @s[nbt={Inventory:[{Slot:-106b,id:"minecraft:anvil"}]}] run function better_crossbows:shoot/anvil
