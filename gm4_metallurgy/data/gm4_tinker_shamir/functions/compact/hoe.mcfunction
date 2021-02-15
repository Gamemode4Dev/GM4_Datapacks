data modify storage gm4_tinker_shamir:temp/compact Inventory set from entity @s Inventory

execute if data storage gm4_tinker_shamir:temp/compact Inventory[{id:"minecraft:melon_slice",Count:64b}] run function gm4_tinker_shamir:compact/melon_slice
execute if data storage gm4_tinker_shamir:temp/compact Inventory[{id:"minecraft:wheat",Count:64b}] run function gm4_tinker_shamir:compact/wheat
