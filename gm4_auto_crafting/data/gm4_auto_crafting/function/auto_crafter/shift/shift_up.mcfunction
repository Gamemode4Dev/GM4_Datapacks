# checks how many times to shift up
# @s = crafters with an empty top row
# located at @s
# run from gm4_auto_crafting:auto_crafter/craft/attempt_craft

scoreboard players set $shifted gm4_crafting 0
execute unless data storage gm4_custom_crafters:temp/crafter Items[{Slot:3b}] unless data storage gm4_custom_crafters:temp/crafter Items[{Slot:4b}] unless data storage gm4_custom_crafters:temp/crafter Items[{Slot:5b}] run function gm4_auto_crafting:auto_crafter/shift/up_2
execute if score $shifted gm4_crafting matches 0 run function gm4_auto_crafting:auto_crafter/shift/up_1
