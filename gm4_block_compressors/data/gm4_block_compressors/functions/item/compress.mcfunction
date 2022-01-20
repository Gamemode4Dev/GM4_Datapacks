# @s = item entity to be compressed
# at location of dropper (compressor)
# run from block_compressors:item
# compresses item by setting count, storing current item tag, and adding lore/enchantment glint

# copy existing data for restoration at decompression, second line fixes bug where gm4_block_compressors gets saved to old_tag
data modify storage gm4_block_compressors:temp/item_stack Item.tag.gm4_block_compressors.old_tag set from storage gm4_block_compressors:temp/item_stack Item.tag
data remove storage gm4_block_compressors:temp/item_stack Item.tag.gm4_block_compressors.old_tag.gm4_block_compressors

# add tag to indicate store compression size
execute store result storage gm4_block_compressors:temp/item_stack Item.tag.gm4_block_compressors.compression_level int 1 run data get storage gm4_block_compressors:temp/item_stack Item.Count

# set count to 1 and add compressed item visuals 
data merge storage gm4_block_compressors:temp/item_stack {Item:{Count:1b,tag:{HideFlags:1,Enchantments:[{id:"minecraft:protection",lvl:0s}]}}}
execute as @e[type=armor_stand,tag=gm4_block_compressor_processing,limit=1] run loot replace entity @s weapon.offhand loot gm4_block_compressors:technical/compressed_lore
execute as @e[type=armor_stand,tag=gm4_block_compressor_processing,limit=1] run data modify storage gm4_block_compressors:temp/item_stack Item.tag.display.Lore append from entity @s HandItems[1].tag.display.Name
data merge entity @e[type=armor_stand,tag=gm4_block_compressor_processing,limit=1] {HandItems:[{},{}]}

# clone data to original item entity
data modify entity @s Item set from storage gm4_block_compressors:temp/item_stack Item
data modify entity @s PickupDelay set value 4

playsound block.piston.extend block @a
