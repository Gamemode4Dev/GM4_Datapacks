# @s = player holding tinker sword
# at @s
# run from gm4_tinker_shamir:active

# pull inventory into storage
# this is technically slightly more laggy in this case, but more cases might be added in the future
data modify storage gm4_tinker_shamir:temp/player/inventory Inventory set from entity @s Inventory

# check for compacting operations
execute if data storage gm4_tinker_shamir:temp/player/inventory Inventory[{id:"minecraft:slime_ball",Count:64b}] run function gm4_tinker_shamir:compact/slime_ball

# clear storage
data remove storage gm4_tinker_shamir:temp/player/inventory Inventory
