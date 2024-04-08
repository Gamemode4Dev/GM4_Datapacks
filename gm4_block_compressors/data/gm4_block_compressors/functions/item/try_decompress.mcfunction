# @s = item above block compressor
# at location of dropper (compressor)
# run from process
# checks if item is a compressed item, prevents further checks

scoreboard players set $decompressing gm4_bc_data 1

data modify storage gm4_block_compressors:temp/compressor Items set from block ~ ~ ~ Items

execute if data storage gm4_block_compressors:temp/compressor {Items:[{count:1}]} if data storage gm4_block_compressors:temp/item_stack Item.components."minecraft:custom_data".gm4_block_compressors run function gm4_block_compressors:item/decompress
# grandfather in older items
execute if data storage gm4_block_compressors:temp/compressor {Items:[{count:1}]} if data storage gm4_block_compressors:temp/item_stack Item.components."minecraft:custom_data".gm4_compressed run function gm4_block_compressors:item/decompress

data remove storage gm4_block_compressors:temp/compressor Items
