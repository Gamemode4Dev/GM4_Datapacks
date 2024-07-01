# @s = item above block compressor
# at location of dropper (compressor)
# run from process
# checks if item's count is matched anywhere in dropper, then compresses

data modify storage gm4_block_compressors:temp/compressor Items set from block ~ ~ ~ Items

execute if data storage gm4_block_compressors:temp/compressor Items[0] store success score @s gm4_bc_data run data modify storage gm4_block_compressors:temp/compressor Items[0].count set from storage gm4_block_compressors:temp/item_stack Item.count
execute if score @s gm4_bc_data matches 1 if data storage gm4_block_compressors:temp/compressor Items[1] store success score @s gm4_bc_data run data modify storage gm4_block_compressors:temp/compressor Items[1].count set from storage gm4_block_compressors:temp/item_stack Item.count
execute if score @s gm4_bc_data matches 1 if data storage gm4_block_compressors:temp/compressor Items[2] store success score @s gm4_bc_data run data modify storage gm4_block_compressors:temp/compressor Items[2].count set from storage gm4_block_compressors:temp/item_stack Item.count
execute if score @s gm4_bc_data matches 1 if data storage gm4_block_compressors:temp/compressor Items[3] store success score @s gm4_bc_data run data modify storage gm4_block_compressors:temp/compressor Items[3].count set from storage gm4_block_compressors:temp/item_stack Item.count
execute if score @s gm4_bc_data matches 1 if data storage gm4_block_compressors:temp/compressor Items[4] store success score @s gm4_bc_data run data modify storage gm4_block_compressors:temp/compressor Items[4].count set from storage gm4_block_compressors:temp/item_stack Item.count
execute if score @s gm4_bc_data matches 1 if data storage gm4_block_compressors:temp/compressor Items[5] store success score @s gm4_bc_data run data modify storage gm4_block_compressors:temp/compressor Items[5].count set from storage gm4_block_compressors:temp/item_stack Item.count
execute if score @s gm4_bc_data matches 1 if data storage gm4_block_compressors:temp/compressor Items[6] store success score @s gm4_bc_data run data modify storage gm4_block_compressors:temp/compressor Items[6].count set from storage gm4_block_compressors:temp/item_stack Item.count
execute if score @s gm4_bc_data matches 1 if data storage gm4_block_compressors:temp/compressor Items[7] store success score @s gm4_bc_data run data modify storage gm4_block_compressors:temp/compressor Items[7].count set from storage gm4_block_compressors:temp/item_stack Item.count
execute if score @s gm4_bc_data matches 1 if data storage gm4_block_compressors:temp/compressor Items[8] store success score @s gm4_bc_data run data modify storage gm4_block_compressors:temp/compressor Items[8].count set from storage gm4_block_compressors:temp/item_stack Item.count

execute if score @s gm4_bc_data matches 0 run function gm4_block_compressors:item/compress
data remove storage gm4_block_compressors:temp/compressor Items
