# virtually shifts the items up once
# @s = crafters with an empty top row
# located at @s
# run from gm4_custom_crafters:process_input/shift/shift_up

execute if data storage gm4_custom_crafters:temp/crafter Items[{Slot:3b}] run data modify storage gm4_custom_crafters:temp/crafter Items[{Slot:3b}].Slot set value 0b
execute if data storage gm4_custom_crafters:temp/crafter Items[{Slot:4b}] run data modify storage gm4_custom_crafters:temp/crafter Items[{Slot:4b}].Slot set value 1b
execute if data storage gm4_custom_crafters:temp/crafter Items[{Slot:5b}] run data modify storage gm4_custom_crafters:temp/crafter Items[{Slot:5b}].Slot set value 2b

execute if data storage gm4_custom_crafters:temp/crafter Items[{Slot:6b}] run data modify storage gm4_custom_crafters:temp/crafter Items[{Slot:6b}].Slot set value 3b
execute if data storage gm4_custom_crafters:temp/crafter Items[{Slot:7b}] run data modify storage gm4_custom_crafters:temp/crafter Items[{Slot:7b}].Slot set value 4b
execute if data storage gm4_custom_crafters:temp/crafter Items[{Slot:8b}] run data modify storage gm4_custom_crafters:temp/crafter Items[{Slot:8b}].Slot set value 5b
