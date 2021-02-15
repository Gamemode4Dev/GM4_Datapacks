data modify storage gm4_tinker_shamir:temp/compact Inventory set from entity @s Inventory

execute if data storage gm4_tinker_shamir:temp/compact Inventory[{id:"minecraft:slime_ball",Count:64b}] run function gm4_tinker_shamir:compact/slime_ball
