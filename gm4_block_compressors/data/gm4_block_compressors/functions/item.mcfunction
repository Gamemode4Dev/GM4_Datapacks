# @s = item above block compressor
# at location of dropper (compressor)
# run from process
# tries to compress/decompress the current item entity.
# action's states are 0:compress, 1:nothing, 2:attempted decompress

data modify storage gm4_block_compressors:temp/item_stack Item set from entity @s Item

execute if data storage gm4_block_compressors:temp/item_stack Item{Count:1b} run function gm4_block_compressors:item/try_decompress
execute unless score action gm4_bc_data matches 2 unless data storage gm4_block_compressors:temp/item_stack Item.tag.gm4_block_compressors unless data storage gm4_block_compressors:temp/item_stack gm4_compressed run function gm4_block_compressors:item/try_compress

scoreboard players reset action gm4_bc_data
data remove storage gm4_block_compressors:temp/item_stack Item
