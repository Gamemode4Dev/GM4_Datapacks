# checks for recipes in a forming press
# @s = gm4_forming press unless block ~ ~ ~ dropper{Items:[]}
# located at @s
# run from gm4_forming_press:main

# store all block data into storage
data modify storage gm4_forming_press:temp/crafter Items set from block ~ ~ ~ Items

# get number of full slots
execute store result score $slot_count gm4_crafting run data get storage gm4_forming_press:temp/crafter Items

# get number of items from first array element
execute store result score $first_stack_size gm4_crafting run data get block ~ ~ ~ Items[0].Count

# check if each slot with an item in it has the same stack size
execute if score $slot_count gm4_crafting matches 2.. store result score $stack_size gm4_crafting run data get storage gm4_forming_press:temp/crafter Items[1].Count
execute if score $slot_count gm4_crafting matches 2.. unless score $stack_size gm4_crafting = $first_stack_size gm4_crafting run scoreboard players set $first_stack_size gm4_crafting 0

execute if score $slot_count gm4_crafting matches 3.. store result score $stack_size gm4_crafting run data get storage gm4_forming_press:temp/crafter Items[2].Count
execute if score $slot_count gm4_crafting matches 3.. unless score $stack_size gm4_crafting = $first_stack_size gm4_crafting run scoreboard players set $first_stack_size gm4_crafting 0

execute if score $slot_count gm4_crafting matches 4.. store result score $stack_size gm4_crafting run data get storage gm4_forming_press:temp/crafter Items[3].Count
execute if score $slot_count gm4_crafting matches 4.. unless score $stack_size gm4_crafting = $first_stack_size gm4_crafting run scoreboard players set $first_stack_size gm4_crafting 0

execute if score $slot_count gm4_crafting matches 5.. store result score $stack_size gm4_crafting run data get storage gm4_forming_press:temp/crafter Items[4].Count
execute if score $slot_count gm4_crafting matches 5.. unless score $stack_size gm4_crafting = $first_stack_size gm4_crafting run scoreboard players set $first_stack_size gm4_crafting 0

execute if score $slot_count gm4_crafting matches 6.. store result score $stack_size gm4_crafting run data get storage gm4_forming_press:temp/crafter Items[5].Count
execute if score $slot_count gm4_crafting matches 6.. unless score $stack_size gm4_crafting = $first_stack_size gm4_crafting run scoreboard players set $first_stack_size gm4_crafting 0

execute if score $slot_count gm4_crafting matches 7.. store result score $stack_size gm4_crafting run data get storage gm4_forming_press:temp/crafter Items[6].Count
execute if score $slot_count gm4_crafting matches 7.. unless score $stack_size gm4_crafting = $first_stack_size gm4_crafting run scoreboard players set $first_stack_size gm4_crafting 0

execute if score $slot_count gm4_crafting matches 8.. store result score $stack_size gm4_crafting run data get storage gm4_forming_press:temp/crafter Items[7].Count
execute if score $slot_count gm4_crafting matches 8.. unless score $stack_size gm4_crafting = $first_stack_size gm4_crafting run scoreboard players set $first_stack_size gm4_crafting 0

execute if score $slot_count gm4_crafting matches 9.. store result score $stack_size gm4_crafting run data get storage gm4_forming_press:temp/crafter Items[8].Count
execute if score $slot_count gm4_crafting matches 9.. unless score $stack_size gm4_crafting = $first_stack_size gm4_crafting run scoreboard players set $first_stack_size gm4_crafting 0

scoreboard players operation $stack_size gm4_crafting = $first_stack_size gm4_crafting

# attempt to craft items in crafters with valid contents
execute if score $stack_size gm4_crafting matches 1.. run function gm4_forming_press:attempt_craft

# storage cleanup
data remove storage gm4_forming_press:temp/crafter Items
data remove storage gm4_forming_press:temp/output Items
