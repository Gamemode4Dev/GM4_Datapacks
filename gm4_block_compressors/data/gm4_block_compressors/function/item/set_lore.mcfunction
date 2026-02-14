# Uses a macro to append the compressed lore line to the item in storage
# @s = item entity to be compressed
# run from gm4_block_compressors:item/compress

$data modify storage gm4_block_compressors:temp/item_stack Item.components."minecraft:lore" append value {translate:"text.gm4.block_compressors.compressed",fallback:"Compressed ×%s",with:[$(compression_level)],color:"gray",italic:false}
