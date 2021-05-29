#@s = item entity to be compressed
#run from block_compressors:item

#copy existing data for restoration at decompression
data modify storage gm4_block_compressors:temp/item_stack Item.tag.gm4_precompression_tag set from storage gm4_block_compressors:temp/item_stack Item.tag

#if no tag data to save, make a note
execute unless data storage gm4_block_compressors:temp/item_stack Item.tag run data modify storage gm4_block_compressors:temp/item_stack Item.tag.gm4_precompression_tag set value "no_tag_data_to_preserve"

#add new data to indicate store compression state
execute unless data storage gm4_block_compressors:temp/item_stack Item.tag.CustomModelData run data modify storage gm4_block_compressors:temp/item_stack Item.tag.CustomModelData set value 16
execute store result storage gm4_block_compressors:temp/item_stack Item.tag.gm4_compressed.value int 1 run data get storage gm4_block_compressors:temp/item_stack Item.Count
data merge storage gm4_block_compressors:temp/item_stack {Item:{Count:1b,tag:{HideFlags:1,Enchantments:[{id:"minecraft:protection",lvl:0s}]}}}

#lore
execute as @e[type=armor_stand,limit=1,tag=gm4_block_compressor_processing] run loot replace entity @s weapon.offhand loot gm4_block_compressors:compressed_lore
execute as @e[type=armor_stand,limit=1,tag=gm4_block_compressor_processing] run data modify storage gm4_block_compressors:temp/item_stack Item.tag.display.Lore append from entity @s HandItems[1].tag.display.Name

#clone data to original item entity
data modify entity @s Item set from storage gm4_block_compressors:temp/item_stack Item
data merge entity @s {PickupDelay:4}

playsound block.piston.extend block @a
