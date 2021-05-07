#@s = item entity to be compressed
#run from block_compressors:item

#copy existing data for restoration at decompression
data modify entity @s Item.tag.gm4_precompression_tag set from entity @s Item.tag

#if no tag data to save, make a note
execute unless data entity @s Item.tag run data modify entity @s Item.tag.gm4_precompression_tag set value "no_tag_data_to_preserve"

#add new data to indicate store compression state
data merge entity @s {Item:{Count:1b,tag:{CustomModelData:64,gm4_compressed:{value:64},HideFlags:1,Enchantments:[{id:"minecraft:protection",lvl:0s}]}}}
data modify entity @s Item.tag.display.Lore append value '{"translate":"%1$s%3427655$s","with":["Compressed ×64",{"translate":"text.gm4.block_compressors.compressed","with":[" ×64"]}],"color":"gray","italic":false}'

playsound block.piston.extend block @a
