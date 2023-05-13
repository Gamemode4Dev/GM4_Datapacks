# attempts to craft items
# @s = crafters containing a potential recipe
# located at @s
# run from gm4_auto_crafting:auto_crafter/process_output

# shift items to be top-left aligned
data modify storage gm4_custom_crafters:temp/crafter original_items set from storage gm4_custom_crafters:temp/crafter Items
execute unless data storage gm4_custom_crafters:temp/crafter Items[{Slot:0b}] unless data storage gm4_custom_crafters:temp/crafter Items[{Slot:1b}] unless data storage gm4_custom_crafters:temp/crafter Items[{Slot:2b}] run function gm4_auto_crafting:auto_crafter/shift/shift_up
execute unless data storage gm4_custom_crafters:temp/crafter Items[{Slot:0b}] unless data storage gm4_custom_crafters:temp/crafter Items[{Slot:3b}] unless data storage gm4_custom_crafters:temp/crafter Items[{Slot:6b}] run function gm4_auto_crafting:auto_crafter/shift/shift_left

# check if any items in the crafter fall under any item tags
scoreboard players operation $loop gm4_crafting = $slot_count gm4_crafting
execute positioned ~ ~-1.44 ~ run function gm4_auto_crafting:auto_crafter/craft/check_item
data modify storage gm4_custom_crafters:temp/crafter Items set from storage gm4_custom_crafters:temp/crafter new_items
data remove storage gm4_custom_crafters:temp/crafter new_items

# get total input id length
execute store result score $id_0 gm4_crafting run data get storage gm4_custom_crafters:temp/crafter Items[{Slot:0b}].id 
scoreboard players operation $id_total gm4_crafting = $id_0 gm4_crafting
execute store result score $id_1 gm4_crafting run data get storage gm4_custom_crafters:temp/crafter Items[{Slot:1b}].id 
scoreboard players operation $id_total gm4_crafting += $id_1 gm4_crafting
execute store result score $id_2 gm4_crafting run data get storage gm4_custom_crafters:temp/crafter Items[{Slot:2b}].id 
scoreboard players operation $id_total gm4_crafting += $id_2 gm4_crafting
execute store result score $id_3 gm4_crafting run data get storage gm4_custom_crafters:temp/crafter Items[{Slot:3b}].id 
scoreboard players operation $id_total gm4_crafting += $id_3 gm4_crafting
execute store result score $id_4 gm4_crafting run data get storage gm4_custom_crafters:temp/crafter Items[{Slot:4b}].id 
scoreboard players operation $id_total gm4_crafting += $id_4 gm4_crafting
execute store result score $id_5 gm4_crafting run data get storage gm4_custom_crafters:temp/crafter Items[{Slot:5b}].id 
scoreboard players operation $id_total gm4_crafting += $id_5 gm4_crafting
execute store result score $id_6 gm4_crafting run data get storage gm4_custom_crafters:temp/crafter Items[{Slot:6b}].id 
scoreboard players operation $id_total gm4_crafting += $id_6 gm4_crafting
execute store result score $id_7 gm4_crafting run data get storage gm4_custom_crafters:temp/crafter Items[{Slot:7b}].id 
scoreboard players operation $id_total gm4_crafting += $id_7 gm4_crafting
execute store result score $id_8 gm4_crafting run data get storage gm4_custom_crafters:temp/crafter Items[{Slot:8b}].id 
scoreboard players operation $id_total gm4_crafting += $id_8 gm4_crafting

# allow crafters with valid contents to run recipe checks
scoreboard players set $crafted gm4_crafting 0
data remove block 29999998 1 7134 Items
execute positioned 29999998 1 7134 run function #gm4_custom_crafters:check_recipes
