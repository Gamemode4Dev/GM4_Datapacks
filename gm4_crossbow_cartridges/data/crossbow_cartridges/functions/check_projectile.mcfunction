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
