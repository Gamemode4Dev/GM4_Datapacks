# virtually shifts the items left twice
# @s = crafters with two empty left columns
# located at @s
# run from gm4_auto_crafting:auto_crafter/shift/shift_left

scoreboard players set $shifted gm4_crafting 1

execute if data storage gm4_custom_crafters:temp/crafter Items[{Slot:2b}] run data modify storage gm4_custom_crafters:temp/crafter Items[{Slot:2b}].Slot set value 0b
execute if data storage gm4_custom_crafters:temp/crafter Items[{Slot:5b}] run data modify storage gm4_custom_crafters:temp/crafter Items[{Slot:5b}].Slot set value 3b
execute if data storage gm4_custom_crafters:temp/crafter Items[{Slot:8b}] run data modify storage gm4_custom_crafters:temp/crafter Items[{Slot:8b}].Slot set value 6b
