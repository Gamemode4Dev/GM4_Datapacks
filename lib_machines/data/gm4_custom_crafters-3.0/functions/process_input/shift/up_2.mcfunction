# virtually shifts the items up twice
# @s = crafters with two empty top rows
# located at @s
# run from gm4_custom_crafters-3.0:process_input/shift/shift_up

data modify storage gm4_custom_crafters:temp/crafter Items[{Slot:0b}] set from storage gm4_custom_crafters:temp/crafter Items[{Slot:6b}]
data modify storage gm4_custom_crafters:temp/crafter Items[{Slot:1b}] set from storage gm4_custom_crafters:temp/crafter Items[{Slot:7b}]
data modify storage gm4_custom_crafters:temp/crafter Items[{Slot:2b}] set from storage gm4_custom_crafters:temp/crafter Items[{Slot:8b}]

data remove storage gm4_custom_crafters:temp/crafter Items[{Slot:6b}]
data remove storage gm4_custom_crafters:temp/crafter Items[{Slot:7b}]
data remove storage gm4_custom_crafters:temp/crafter Items[{Slot:8b}]
