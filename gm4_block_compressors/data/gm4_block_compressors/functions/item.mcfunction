# @s = item above block compressor
# at location of dropper (compressor)
# run from process

data modify storage gm4_block_compressors:temp/compressor Items set from block ~ ~ ~ Items
data modify storage gm4_block_compressors:temp/item_stack Item set from entity @s Item

execute store success score @s gm4_bc_data if data storage gm4_block_compressors:temp/compressor {Items:[{Count:1b}]} if data storage gm4_block_compressors:temp/item_stack Item{Count:1b,tag:{gm4_compressed:{}}} run function gm4_block_compressors:item/decompress
execute if data storage gm4_block_compressors:temp/item_stack Item{Count:1b} run scoreboard players set @s gm4_bc_data 2


execute unless score @s gm4_bc_data matches 2 if data storage gm4_block_compressors:temp/compressor Items[0] store success score @s gm4_bc_data run data modify storage gm4_block_compressors:temp/compressor Items[0].Count set from storage gm4_block_compressors:temp/item_stack Item.Count
execute if score @s gm4_bc_data matches 1 if data storage gm4_block_compressors:temp/compressor Items[1] store success score @s gm4_bc_data run data modify storage gm4_block_compressors:temp/compressor Items[1].Count set from storage gm4_block_compressors:temp/item_stack Item.Count
execute if score @s gm4_bc_data matches 1 if data storage gm4_block_compressors:temp/compressor Items[2] store success score @s gm4_bc_data run data modify storage gm4_block_compressors:temp/compressor Items[2].Count set from storage gm4_block_compressors:temp/item_stack Item.Count
execute if score @s gm4_bc_data matches 1 if data storage gm4_block_compressors:temp/compressor Items[3] store success score @s gm4_bc_data run data modify storage gm4_block_compressors:temp/compressor Items[3].Count set from storage gm4_block_compressors:temp/item_stack Item.Count
execute if score @s gm4_bc_data matches 1 if data storage gm4_block_compressors:temp/compressor Items[4] store success score @s gm4_bc_data run data modify storage gm4_block_compressors:temp/compressor Items[4].Count set from storage gm4_block_compressors:temp/item_stack Item.Count
execute if score @s gm4_bc_data matches 1 if data storage gm4_block_compressors:temp/compressor Items[5] store success score @s gm4_bc_data run data modify storage gm4_block_compressors:temp/compressor Items[5].Count set from storage gm4_block_compressors:temp/item_stack Item.Count
execute if score @s gm4_bc_data matches 1 if data storage gm4_block_compressors:temp/compressor Items[6] store success score @s gm4_bc_data run data modify storage gm4_block_compressors:temp/compressor Items[6].Count set from storage gm4_block_compressors:temp/item_stack Item.Count
execute if score @s gm4_bc_data matches 1 if data storage gm4_block_compressors:temp/compressor Items[7] store success score @s gm4_bc_data run data modify storage gm4_block_compressors:temp/compressor Items[7].Count set from storage gm4_block_compressors:temp/item_stack Item.Count
execute if score @s gm4_bc_data matches 1 if data storage gm4_block_compressors:temp/compressor Items[8] store success score @s gm4_bc_data run data modify storage gm4_block_compressors:temp/compressor Items[8].Count set from storage gm4_block_compressors:temp/item_stack Item.Count







execute if score @s gm4_bc_data matches 0 unless data storage gm4_block_compressors:temp/item_stack Item.tag.gm4_compressed run function gm4_block_compressors:item/compress




data remove storage gm4_block_compressors:temp/compressor Items
# data remove storage gm4_block_compressors:temp/item_stack Items
