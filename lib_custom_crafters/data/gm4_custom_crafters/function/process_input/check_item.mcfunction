# checks each slot for special item tags
# @s = crafters containing a potential recipe
# located at @s
# run from gm4_custom_crafters:process_input/attempt_craft

# update item
data modify storage gm4_custom_crafters:temp/crafter item set from storage gm4_custom_crafters:temp/crafter Items[-1]

data modify entity 344d47-4-4-4-f04ce104d equipment.mainhand set from storage gm4_custom_crafters:temp/crafter item
execute as 344d47-4-4-4-f04ce104d run function #gm4_custom_crafters:custom_item_checks
data remove entity 344d47-4-4-4-f04ce104d equipment.mainhand
data modify storage gm4_custom_crafters:temp/crafter new_items append from storage gm4_custom_crafters:temp/crafter item

# clean up storage
data remove storage gm4_custom_crafters:temp/crafter item
data remove storage gm4_custom_crafters:temp/crafter Items[-1]

# loop for all items
scoreboard players remove $loop gm4_crafting 1
execute if score $loop gm4_crafting matches 1.. run function gm4_custom_crafters:process_input/check_item
