# @s = player holding tinker shovel
# at @s
# run from gm4_tinker_shamir:active

# pull inventory into storage
data modify storage gm4_tinker_shamir:temp/player/inventory Inventory set from entity @s Inventory

# check for compacting operations
execute if data storage gm4_tinker_shamir:temp/player/inventory Inventory[{id:"minecraft:melon_slice",Count:64b}] run function gm4_tinker_shamir:compact/melon_slice
execute unless score $success gm4_ml_data matches 1.. if data storage gm4_tinker_shamir:temp/player/inventory Inventory[{id:"minecraft:wheat",Count:64b}] run function gm4_tinker_shamir:compact/wheat

# clear storage
data remove storage gm4_tinker_shamir:temp/player/inventory Inventory
