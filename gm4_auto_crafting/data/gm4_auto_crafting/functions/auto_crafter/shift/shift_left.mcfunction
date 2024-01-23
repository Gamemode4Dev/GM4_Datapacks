# checks how many times to shift left
# @s = crafters with an empty left column
# located at @s
# run from gm4_auto_crafting:auto_crafter/craft/attempt_craft

scoreboard players set $shifted gm4_crafting 0
execute unless data storage gm4_custom_crafters:temp/crafter Items[{Slot:1b}] unless data storage gm4_custom_crafters:temp/crafter Items[{Slot:4b}] unless data storage gm4_custom_crafters:temp/crafter Items[{Slot:7b}] store result score $shifted gm4_crafting run function gm4_auto_crafting:auto_crafter/shift/left_2
execute if score $shifted gm4_crafting matches 0 run function gm4_auto_crafting:auto_crafter/shift/left_1
