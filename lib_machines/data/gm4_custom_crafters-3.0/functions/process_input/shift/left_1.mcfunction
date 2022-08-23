# virtually shifts the items left once
# @s = crafters with an empty left column
# located at @s
# run from gm4_custom_crafters-3.0:process_input/shift/shift_left

data modify storage gm4_custom_crafters:temp/crafter Items[{Slot:0b}] set from storage gm4_custom_crafters:temp/crafter Items[{Slot:1b}]
data modify storage gm4_custom_crafters:temp/crafter Items[{Slot:3b}] set from storage gm4_custom_crafters:temp/crafter Items[{Slot:4b}]
data modify storage gm4_custom_crafters:temp/crafter Items[{Slot:6b}] set from storage gm4_custom_crafters:temp/crafter Items[{Slot:7b}]

data modify storage gm4_custom_crafters:temp/crafter Items[{Slot:1b}] set from storage gm4_custom_crafters:temp/crafter Items[{Slot:2b}]
data modify storage gm4_custom_crafters:temp/crafter Items[{Slot:4b}] set from storage gm4_custom_crafters:temp/crafter Items[{Slot:5b}]
data modify storage gm4_custom_crafters:temp/crafter Items[{Slot:7b}] set from storage gm4_custom_crafters:temp/crafter Items[{Slot:8b}]

data remove storage gm4_custom_crafters:temp/crafter Items[{Slot:2b}]
data remove storage gm4_custom_crafters:temp/crafter Items[{Slot:5b}]
data remove storage gm4_custom_crafters:temp/crafter Items[{Slot:8b}]
