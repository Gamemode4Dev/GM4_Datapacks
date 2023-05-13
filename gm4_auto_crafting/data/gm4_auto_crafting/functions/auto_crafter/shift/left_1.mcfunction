# virtually shifts the items left once
# @s = crafters with an empty left column
# located at @s
# run from gm4_auto_crafting:auto_crafter/shift/shift_left

execute if data storage gm4_custom_crafters:temp/crafter Items[{Slot:1b}] run data modify storage gm4_custom_crafters:temp/crafter Items[{Slot:1b}].Slot set value 0b
execute if data storage gm4_custom_crafters:temp/crafter Items[{Slot:4b}] run data modify storage gm4_custom_crafters:temp/crafter Items[{Slot:4b}].Slot set value 3b
execute if data storage gm4_custom_crafters:temp/crafter Items[{Slot:7b}] run data modify storage gm4_custom_crafters:temp/crafter Items[{Slot:7b}].Slot set value 6b

execute if data storage gm4_custom_crafters:temp/crafter Items[{Slot:2b}] run data modify storage gm4_custom_crafters:temp/crafter Items[{Slot:2b}].Slot set value 1b
execute if data storage gm4_custom_crafters:temp/crafter Items[{Slot:5b}] run data modify storage gm4_custom_crafters:temp/crafter Items[{Slot:5b}].Slot set value 4b
execute if data storage gm4_custom_crafters:temp/crafter Items[{Slot:8b}] run data modify storage gm4_custom_crafters:temp/crafter Items[{Slot:8b}].Slot set value 7b
