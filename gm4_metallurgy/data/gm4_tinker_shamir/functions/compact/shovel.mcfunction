data modify storage gm4_tinker_shamir:temp/compact Inventory set from entity @s Inventory

execute if data storage gm4_tinker_shamir:temp/compact Inventory[{id:"minecraft:snowball",Count:16b}] run function gm4_tinker_shamir:compact/snowball
execute if data storage gm4_tinker_shamir:temp/compact Inventory[{id:"minecraft:clay_ball",Count:64b}] run function gm4_tinker_shamir:compact/clay_ball
