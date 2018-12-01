# @s = gm4_alchemical_crafter unless block ~ ~ ~ dropper{Items:[]}
#Run from main

#store number of full slots
execute store result score @s gm4_slot_count run data get block ~ ~ ~ Items

#get number of items from first array element
execute store result score first_stack_count gm4_stack_size run data get block ~ ~ ~ Items[0].Count

#check if each slot with an item in it has the same stack size
execute if score @s gm4_slot_count matches 2.. store result score @s gm4_stack_size run data get block ~ ~ ~ Items[1].Count
execute if score @s gm4_slot_count matches 2.. unless score @s gm4_stack_size = first_stack_count gm4_stack_size run scoreboard players set first_stack_count gm4_stack_size 0

execute if score @s gm4_slot_count matches 3.. store result score @s gm4_stack_size run data get block ~ ~ ~ Items[2].Count
execute if score @s gm4_slot_count matches 3.. unless score @s gm4_stack_size = first_stack_count gm4_stack_size run scoreboard players set first_stack_count gm4_stack_size 0

execute if score @s gm4_slot_count matches 4.. store result score @s gm4_stack_size run data get block ~ ~ ~ Items[3].Count
execute if score @s gm4_slot_count matches 4.. unless score @s gm4_stack_size = first_stack_count gm4_stack_size run scoreboard players set first_stack_count gm4_stack_size 0

execute if score @s gm4_slot_count matches 5.. store result score @s gm4_stack_size run data get block ~ ~ ~ Items[4].Count
execute if score @s gm4_slot_count matches 5.. unless score @s gm4_stack_size = first_stack_count gm4_stack_size run scoreboard players set first_stack_count gm4_stack_size 0

execute if score @s gm4_slot_count matches 6.. store result score @s gm4_stack_size run data get block ~ ~ ~ Items[5].Count
execute if score @s gm4_slot_count matches 6.. unless score @s gm4_stack_size = first_stack_count gm4_stack_size run scoreboard players set first_stack_count gm4_stack_size 0

execute if score @s gm4_slot_count matches 7.. store result score @s gm4_stack_size run data get block ~ ~ ~ Items[6].Count
execute if score @s gm4_slot_count matches 7.. unless score @s gm4_stack_size = first_stack_count gm4_stack_size run scoreboard players set first_stack_count gm4_stack_size 0

execute if score @s gm4_slot_count matches 8.. store result score @s gm4_stack_size run data get block ~ ~ ~ Items[7].Count
execute if score @s gm4_slot_count matches 8.. unless score @s gm4_stack_size = first_stack_count gm4_stack_size run scoreboard players set first_stack_count gm4_stack_size 0

execute if score @s gm4_slot_count matches 9.. store result score @s gm4_stack_size run data get block ~ ~ ~ Items[8].Count
execute if score @s gm4_slot_count matches 9.. unless score @s gm4_stack_size = first_stack_count gm4_stack_size run scoreboard players set first_stack_count gm4_stack_size 0

scoreboard players operation @s gm4_stack_size = first_stack_count gm4_stack_size

#Tell crafters with valid contents to run recipe checks
execute if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}}]} if score @s gm4_stack_size matches 1.. run function #equivalent_exchange:alchemical_crafting

#check recharge altar
execute if score @s gm4_slot_count matches 1 if score @s gm4_stack_size matches 1 if block ~ ~ ~ dropper{Items:[{Slot:4b,Count:1b,tag:{gm4_transmutation_stone:1b}}]} if block ~1 ~-1 ~ lapis_block if block ~-1 ~-1 ~ lapis_block if block ~ ~-1 ~1 lapis_block if block ~ ~-1 ~-1 lapis_block if block ~1 ~-1 ~1 lapis_block if block ~1 ~-1 ~-1 lapis_block if block ~-1 ~-1 ~1 lapis_block if block ~-1 ~-1 ~-1 lapis_block if block ~ ~-1 ~ lapis_block if block ~1 ~ ~ quartz_slab if block ~-1 ~ ~ quartz_slab if block ~ ~ ~1 quartz_slab if block ~ ~ ~-1 quartz_slab if block ~2 ~-1 ~ quartz_stairs[facing=west] if block ~-2 ~-1 ~ quartz_stairs[facing=east] if block ~ ~-1 ~2 quartz_stairs[facing=north] if block ~ ~-1 ~-2 quartz_stairs[facing=south] run function equivalent_exchange:block_handling/recharge_altar

#check supercharge
execute if score @s gm4_slot_count matches 5 if score @s gm4_stack_size matches 1 if block ~ ~ ~ dropper{Items:[{Slot:1b,id:"minecraft:nether_star"},{Slot:3b,id:"minecraft:nether_star"},{Slot:4b,tag:{gm4_transmutation_stone:1b,gm4_transmutation_charge:100s}},{Slot:5b,id:"minecraft:nether_star"},{Slot:7b,id:"minecraft:nether_star"}]} if block ~1 ~-1 ~ lapis_block if block ~-1 ~-1 ~ lapis_block if block ~ ~-1 ~1 lapis_block if block ~ ~-1 ~-1 lapis_block if block ~1 ~-1 ~1 lapis_block if block ~1 ~-1 ~-1 lapis_block if block ~-1 ~-1 ~1 lapis_block if block ~-1 ~-1 ~-1 lapis_block if block ~ ~-1 ~ lapis_block if block ~1 ~ ~ quartz_slab if block ~-1 ~ ~ quartz_slab if block ~ ~ ~1 quartz_slab if block ~ ~ ~-1 quartz_slab if block ~2 ~-1 ~ quartz_stairs[facing=west] if block ~-2 ~-1 ~ quartz_stairs[facing=east] if block ~ ~-1 ~2 quartz_stairs[facing=north] if block ~ ~-1 ~-2 quartz_stairs[facing=south] run function equivalent_exchange:recharge/supercharge

#check if one of the recipes succeeded
execute if score @s gm4_stack_size matches 1.. if block ~ ~ ~ dropper{Items:[{tag:{gm4_alchemical_crafters:{}}}]} unless block ~ ~ ~ dropper{Items:[{Slot:4b,tag:{gm4_transmutation_stone:1b}}]} run function equivalent_exchange:post_effects/drain_charge

execute if score @s gm4_stack_size matches 1.. if block ~ ~ ~ dropper{Items:[{tag:{gm4_alchemical_crafters:{}}}]} run function equivalent_exchange:post_effects/apply_multiplier
