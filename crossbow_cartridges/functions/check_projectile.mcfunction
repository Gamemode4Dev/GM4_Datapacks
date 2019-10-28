#run from crossbow_cartridges_use [advancement]
# @s = player using the crossbow

#reset crossbow advancement
advancement revoke @s only gm4:crossbow_cartridges_use

#check offhand item
#fish
execute if entity @s[nbt={Inventory:[{Slot:-106b,id:"minecraft:cod_bucket"}]}] run function crossbow_cartridges:projectile/fish/cod
execute if entity @s[nbt={Inventory:[{Slot:-106b,id:"minecraft:salmon_bucket"}]}] run function crossbow_cartridges:projectile/fish/salmon
execute if entity @s[nbt={Inventory:[{Slot:-106b,id:"minecraft:pufferfish_bucket"}]}] run function crossbow_cartridges:projectile/fish/pufferfish
execute if entity @s[nbt={Inventory:[{Slot:-106b,id:"minecraft:tropical_fish_bucket"}]}] run function crossbow_cartridges:projectile/fish/tropical

#potions
execute if entity @s[nbt={Inventory:[{Slot:-106b,id:"minecraft:splash_potion"}]}] run function crossbow_cartridges:projectile/splashpotion
execute if entity @s[nbt={Inventory:[{Slot:-106b,id:"minecraft:lingering_potion"}]}] run function crossbow_cartridges:projectile/lingerpotion

#torch
execute if entity @s[nbt={Inventory:[{Slot:-106b,id:"minecraft:torch"}]}] run function crossbow_cartridges:projectile/torch

#fireball
execute if entity @s[nbt={Inventory:[{Slot:-106b,id:"minecraft:fire_charge"}]}] run function crossbow_cartridges:projectile/fireball

#optional: remove # in front of `execute` to enable
#crops
#execute if entity @s[nbt={Inventory:[{Slot:-106b,id:"minecraft:carrot"}]}] run function crossbow_cartridges:projectile/crops/carrot
#execute if entity @s[nbt={Inventory:[{Slot:-106b,id:"minecraft:potato"}]}] run function crossbow_cartridges:projectile/crops/potato
#execute if entity @s[nbt={Inventory:[{Slot:-106b,id:"minecraft:wheat_seeds"}]}] run function crossbow_cartridges:projectile/crops/wheat
#execute if entity @s[nbt={Inventory:[{Slot:-106b,id:"minecraft:beetroot_seeds"}]}] run function crossbow_cartridges:projectile/crops/beet
#execute if entity @s[nbt={Inventory:[{Slot:-106b,id:"minecraft:pumpkin_seeds"}]}] run function crossbow_cartridges:projectile/crops/pumpkin
#execute if entity @s[nbt={Inventory:[{Slot:-106b,id:"minecraft:melon_seeds"}]}] run function crossbow_cartridges:projectile/crops/melon

#anvil
#execute if entity @s[nbt={Inventory:[{Slot:-106b,id:"minecraft:anvil"}]}] run function crossbow_cartridges:projectile/anvil
