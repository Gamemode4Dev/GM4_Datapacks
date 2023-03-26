# checks each slot for special item tags
# @s = crafters containing a potential recipe
# located at @s
# run from gm4_custom_crafters:process_input/attempt_craft

# update item
data modify storage gm4_custom_crafters:temp/crafter item set from storage gm4_custom_crafters:temp/crafter Items[-1]

data modify entity @e[type=armor_stand,tag=gm4_custom_crafter_stand,distance=..0.5,limit=1] HandItems[0] set from storage gm4_custom_crafters:temp/crafter item
execute as @e[type=armor_stand,tag=gm4_custom_crafter_stand,distance=..0.5,limit=1] run function #gm4_custom_crafters:custom_item_checks
data remove entity @e[type=armor_stand,tag=gm4_custom_crafter_stand,distance=..0.5,limit=1] HandItems[0]
data modify storage gm4_custom_crafters:temp/crafter new_items append from storage gm4_custom_crafters:temp/crafter item

# clean up storage
data remove storage gm4_custom_crafters:temp/crafter item
data remove storage gm4_custom_crafters:temp/crafter Items[-1]

# loop for all items
scoreboard players remove $loop gm4_crafting 1
execute if score $loop gm4_crafting matches 1.. run function gm4_custom_crafters:process_input/check_item
