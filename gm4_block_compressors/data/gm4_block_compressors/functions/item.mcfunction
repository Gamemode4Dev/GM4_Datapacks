# @s = item above block compressor
# at location of dropper (compressor)
# run from process

data modify storage gm4_block_compressors:temp/compressor Items set from block ~ ~ ~ Items
data modify storage gm4_block_compressors:temp/item_stack Item set from entity @s Item

execute if data storage gm4_block_compressors:temp/compressor {Items:[{Count:64b}]} if data storage gm4_block_compressors:temp/item_stack Item{Count:64b} unless data storage gm4_block_compressors:temp/item_stack Item.tag.gm4_compressed run function gm4_block_compressors:compress/64
execute if data storage gm4_block_compressors:temp/compressor {Items:[{Count:16b}]} if data storage gm4_block_compressors:temp/item_stack Item{Count:16b} unless data storage gm4_block_compressors:temp/item_stack Item.tag.gm4_compressed run function gm4_block_compressors:compress/16
execute if data storage gm4_block_compressors:temp/compressor {Items:[{Count:1b}]} if data storage gm4_block_compressors:temp/item_stack Item{Count:1b,tag:{gm4_compressed:{value:64}}} run function gm4_block_compressors:decompress/64
execute if data storage gm4_block_compressors:temp/compressor {Items:[{Count:1b}]} if data storage gm4_block_compressors:temp/item_stack Item{Count:1b,tag:{gm4_compressed:{value:16}}} run function gm4_block_compressors:decompress/16

data remove storage gm4_block_compressors:temp/compressor Items
