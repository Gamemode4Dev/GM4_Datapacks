# virtually shifts the items up twice
# @s = crafters with two empty top rows
# located at @s
# run from gm4_auto_crafting:auto_crafter/shift/shift_up

execute if data storage gm4_custom_crafters:temp/crafter Items[{Slot:6b}] run data modify storage gm4_custom_crafters:temp/crafter Items[{Slot:6b}].Slot set value 0b
execute if data storage gm4_custom_crafters:temp/crafter Items[{Slot:7b}] run data modify storage gm4_custom_crafters:temp/crafter Items[{Slot:7b}].Slot set value 1b
execute if data storage gm4_custom_crafters:temp/crafter Items[{Slot:8b}] run data modify storage gm4_custom_crafters:temp/crafter Items[{Slot:8b}].Slot set value 2b
