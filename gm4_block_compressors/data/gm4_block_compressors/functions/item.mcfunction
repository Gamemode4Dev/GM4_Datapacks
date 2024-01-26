# @s = item above block compressor
# at location of dropper (compressor)
# run from process
# tries to compress/decompress the current item entity.
# $decompressing's states are 0:try compresss, 1:try decompress

data modify storage gm4_block_compressors:temp/item_stack Item set from entity @s Item

scoreboard players set $decompressing gm4_bc_data 0
execute if data storage gm4_block_compressors:temp/item_stack Item{Count:1b} run function gm4_block_compressors:item/try_decompress
execute unless score $decompressing gm4_bc_data matches 1 unless data storage gm4_block_compressors:temp/item_stack Item.tag.gm4_block_compressors unless data storage gm4_block_compressors:temp/item_stack gm4_compressed run function gm4_block_compressors:item/try_compress

scoreboard players reset $decompressing gm4_bc_data
data remove storage gm4_block_compressors:temp/item_stack Item
