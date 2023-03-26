# checks how many times to shift up
# @s = crafters with an empty top row
# located at @s
# run from gm4_custom_crafters:process_input/attempt_craft

scoreboard players set $shifted gm4_crafting 0
execute unless data storage gm4_custom_crafters:temp/crafter Items[{Slot:3b}] unless data storage gm4_custom_crafters:temp/crafter Items[{Slot:4b}] unless data storage gm4_custom_crafters:temp/crafter Items[{Slot:5b}] store result score $shifted gm4_crafting run function gm4_custom_crafters:process_input/shift/up_2
execute if score $shifted gm4_crafting matches 0 run function gm4_custom_crafters:process_input/shift/up_1
