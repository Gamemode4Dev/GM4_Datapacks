# @s = player using the crossbow

#reset crossbow advancement
advancement revoke @s only gm4:crossbow_cartridges_use

#check offhand item
#fish
execute if entity @s[nbt={Inventory:[{Slot:-106b,id:"minecraft:cod_bucket"}]}] run function crossbow_cartridges:shoot/cod
execute if entity @s[nbt={Inventory:[{Slot:-106b,id:"minecraft:salmon_bucket"}]}] run function crossbow_cartridges:shoot/salmon
execute if entity @s[nbt={Inventory:[{Slot:-106b,id:"minecraft:pufferfish_bucket"}]}] run function crossbow_cartridges:shoot/pufferfish
execute if entity @s[nbt={Inventory:[{Slot:-106b,id:"minecraft:tropical_fish_bucket"}]}] run function crossbow_cartridges:shoot/tropical
#crops
execute if entity @s[nbt={Inventory:[{Slot:-106b,id:"minecraft:carrot"}]}] run function crossbow_cartridges:shoot/carrot
execute if entity @s[nbt={Inventory:[{Slot:-106b,id:"minecraft:potato"}]}] run function crossbow_cartridges:shoot/potato
execute if entity @s[nbt={Inventory:[{Slot:-106b,id:"minecraft:wheat_seeds"}]}] run function crossbow_cartridges:shoot/wheat
execute if entity @s[nbt={Inventory:[{Slot:-106b,id:"minecraft:beetroot_seeds"}]}] run function crossbow_cartridges:shoot/beet
execute if entity @s[nbt={Inventory:[{Slot:-106b,id:"minecraft:pumpkin_seeds"}]}] run function crossbow_cartridges:shoot/pumpkin
execute if entity @s[nbt={Inventory:[{Slot:-106b,id:"minecraft:melon_seeds"}]}] run function crossbow_cartridges:shoot/melon
#potions
execute if entity @s[nbt={Inventory:[{Slot:-106b,id:"minecraft:splash_potion"}]}] run function crossbow_cartridges:shoot/splashpotion
execute if entity @s[nbt={Inventory:[{Slot:-106b,id:"minecraft:lingering_potion"}]}] run function crossbow_cartridges:shoot/lingerpotion
#other
execute if entity @s[nbt={Inventory:[{Slot:-106b,id:"minecraft:torch"}]}] run function crossbow_cartridges:shoot/torch
execute if entity @s[nbt={Inventory:[{Slot:-106b,id:"minecraft:fire_charge"}]}] run function crossbow_cartridges:shoot/firecharge
#execute if entity @s[nbt={Inventory:[{Slot:-106b,id:"minecraft:anvil"}]}] run function crossbow_cartridges:shoot/anvil
