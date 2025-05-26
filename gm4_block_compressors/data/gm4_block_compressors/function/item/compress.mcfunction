# @s = item entity to be compressed
# at location of dropper (compressor)
# run from block_compressors:item
# compresses item by setting count, storing current item tag, and adding lore/enchantment glint

# copy existing data for restoration at decompression, second line fixes bug where gm4_block_compressors gets saved to old_components
data modify storage gm4_block_compressors:temp/item_stack Item.components."minecraft:custom_data".gm4_block_compressors.old_components set from storage gm4_block_compressors:temp/item_stack Item.components
data remove storage gm4_block_compressors:temp/item_stack Item.components."minecraft:custom_data".gm4_block_compressors.old_components."minecraft:custom_data".gm4_block_compressors

# add tag to indicate store compression size
execute store result storage gm4_block_compressors:temp/item_stack Item.components."minecraft:custom_data".gm4_block_compressors.compression_level int 1 run data get storage gm4_block_compressors:temp/item_stack Item.count

# set count to 1 and add compressed item visuals 
data merge storage gm4_block_compressors:temp/item_stack {Item:{count:1,components:{"minecraft:enchantment_glint_override":true}}}
execute as 344d47-4-4-4-f04ce104d run loot replace entity @s weapon.offhand loot gm4_block_compressors:technical/compressed_lore
execute as 344d47-4-4-4-f04ce104d run data modify storage gm4_block_compressors:temp/item_stack Item.components."minecraft:lore" append from entity @s equipment.offhand.components."minecraft:custom_name"
data remove entity 344d47-4-4-4-f04ce104d equipment.mainhand
data remove entity 344d47-4-4-4-f04ce104d equipment.offhand

# clone data to original item entity
data modify entity @s Item set from storage gm4_block_compressors:temp/item_stack Item
data modify entity @s PickupDelay set value 4

playsound block.piston.extend block @a
