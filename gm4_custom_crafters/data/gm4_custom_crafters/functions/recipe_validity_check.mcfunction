# @s = gm4_custom_crafter unless block ~ ~ ~ dropper{Items:[]}
# Run from crafter

# store
data modify storage gm4_custom_crafters:temp/crafter {} merge from block ~ ~ ~ {}

# store number of full slots
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

# tell crafters with valid contents to run recipe checks
execute if score @s gm4_stack_size matches 1.. run function #gm4_custom_crafters:recipe_check

# check if one of the recipes succeeded
execute if score @s gm4_stack_size matches 1.. if data storage gm4_custom_crafters:temp/crafter Items[0].tag.gm4_custom_crafters run function gm4_custom_crafters:apply_multiplier

# apply recipe and multiplier
data modify block ~ ~ ~ {} merge from storage gm4_custom_crafters:temp/crafter {}

# storage cleanup
data remove storage gm4_custom_crafters:temp/crafter {}
