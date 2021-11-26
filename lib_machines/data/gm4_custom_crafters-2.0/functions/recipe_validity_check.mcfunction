# checks for recipes in a custom crafter
# @s = gm4_custom_crafter unless block ~ ~ ~ dropper{Items:[]}
# located at @s
# run from gm4_custom_crafters-2.0:process

# store all block data into storage
data modify storage gm4_custom_crafters:temp/crafter Items set from block ~ ~ ~ Items

# get number of full slots
execute store result score @s gm4_slot_count run data get storage gm4_custom_crafters:temp/crafter Items

# get number of items from first array element
execute store result score first_stack_count gm4_stack_size run data get block ~ ~ ~ Items[0].Count

# check if each slot with an item in it has the same stack size
execute if score @s gm4_slot_count matches 2.. store result score @s gm4_stack_size run data get storage gm4_custom_crafters:temp/crafter Items[1].Count
execute if score @s gm4_slot_count matches 2.. unless score @s gm4_stack_size = first_stack_count gm4_stack_size run scoreboard players set first_stack_count gm4_stack_size 0

execute if score @s gm4_slot_count matches 3.. store result score @s gm4_stack_size run data get storage gm4_custom_crafters:temp/crafter Items[2].Count
execute if score @s gm4_slot_count matches 3.. unless score @s gm4_stack_size = first_stack_count gm4_stack_size run scoreboard players set first_stack_count gm4_stack_size 0

execute if score @s gm4_slot_count matches 4.. store result score @s gm4_stack_size run data get storage gm4_custom_crafters:temp/crafter Items[3].Count
execute if score @s gm4_slot_count matches 4.. unless score @s gm4_stack_size = first_stack_count gm4_stack_size run scoreboard players set first_stack_count gm4_stack_size 0

execute if score @s gm4_slot_count matches 5.. store result score @s gm4_stack_size run data get storage gm4_custom_crafters:temp/crafter Items[4].Count
execute if score @s gm4_slot_count matches 5.. unless score @s gm4_stack_size = first_stack_count gm4_stack_size run scoreboard players set first_stack_count gm4_stack_size 0

execute if score @s gm4_slot_count matches 6.. store result score @s gm4_stack_size run data get storage gm4_custom_crafters:temp/crafter Items[5].Count
execute if score @s gm4_slot_count matches 6.. unless score @s gm4_stack_size = first_stack_count gm4_stack_size run scoreboard players set first_stack_count gm4_stack_size 0

execute if score @s gm4_slot_count matches 7.. store result score @s gm4_stack_size run data get storage gm4_custom_crafters:temp/crafter Items[6].Count
execute if score @s gm4_slot_count matches 7.. unless score @s gm4_stack_size = first_stack_count gm4_stack_size run scoreboard players set first_stack_count gm4_stack_size 0

execute if score @s gm4_slot_count matches 8.. store result score @s gm4_stack_size run data get storage gm4_custom_crafters:temp/crafter Items[7].Count
execute if score @s gm4_slot_count matches 8.. unless score @s gm4_stack_size = first_stack_count gm4_stack_size run scoreboard players set first_stack_count gm4_stack_size 0

execute if score @s gm4_slot_count matches 9.. store result score @s gm4_stack_size run data get storage gm4_custom_crafters:temp/crafter Items[8].Count
execute if score @s gm4_slot_count matches 9.. unless score @s gm4_stack_size = first_stack_count gm4_stack_size run scoreboard players set first_stack_count gm4_stack_size 0

scoreboard players operation @s gm4_stack_size = first_stack_count gm4_stack_size

# attempt to craft items in crafters with valid contents
execute if score @s gm4_stack_size matches 1.. run function gm4_custom_crafters-2.0:attempt_craft

# storage cleanup
data remove storage gm4_custom_crafters:temp/crafter Items
data remove storage gm4_custom_crafters:temp/output Items
