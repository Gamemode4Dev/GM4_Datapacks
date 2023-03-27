# multiplies items by their specific multiplier
# @s = crafters containing a recipe result
# located at @s
# run from gm4_custom_crafters:process_output/finish_crafting

# multiply items by their multiplier data
execute store result score $stack_multiplier gm4_crafting run data get storage gm4_custom_crafters:temp/output Items[-1].Count
scoreboard players operation $new_stack_size gm4_crafting = $stack_size gm4_crafting
scoreboard players operation $new_stack_size gm4_crafting *= $stack_multiplier gm4_crafting
execute store result storage gm4_custom_crafters:temp/output Items[-1].Count byte 1 run scoreboard players get $new_stack_size gm4_crafting

# move modified item into new storage
data modify storage gm4_custom_crafters:temp/output NewItems append from storage gm4_custom_crafters:temp/output Items[-1]

# loop for all items in the storage
data remove storage gm4_custom_crafters:temp/output Items[-1]
execute if data storage gm4_custom_crafters:temp/output Items[-1] run function gm4_custom_crafters:process_output/apply_multiplier
