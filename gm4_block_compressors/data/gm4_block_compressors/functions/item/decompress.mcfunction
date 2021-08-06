# @s = item entity to be decompressed
# at location of dropper (compressor)
# run from block_compressors:item
# decompresses item by setting count and restoring old item tag

# code automatically handles archaic items, this newer old items
data modify storage gm4_block_compressors:temp/item_stack Item.tag.gm4_block_compressors.compression_level set from storage gm4_block_compressors:temp/item_stack Item.tag.gm4_compressed.value
data modify storage gm4_block_compressors:temp/item_stack Item.tag.gm4_block_compressors.old_tag set from storage gm4_block_compressors:temp/item_stack Item.tag.gm4_precompression_tag

# set item count
data modify storage gm4_block_compressors:temp/item_stack Item.Count set from storage gm4_block_compressors:temp/item_stack Item.tag.gm4_block_compressors.compression_level

# remove tag if it does not have gm4_block_compressors.old_tag
execute unless data storage gm4_block_compressors:temp/item_stack Item.tag.gm4_block_compressors.old_tag run data remove storage gm4_block_compressors:temp/item_stack Item.tag

# restore original item tag, overwriting tags from compression
data modify storage gm4_block_compressors:temp/item_stack Item.tag set from storage gm4_block_compressors:temp/item_stack Item.tag.gm4_block_compressors.old_tag
data modify entity @s Item set from storage gm4_block_compressors:temp/item_stack Item
data modify entity @s PickupDelay set value 4

playsound entity.firework_rocket.blast block @a ~ ~ ~ 1 .1
