#@s = item entity to be decompressed
#run from block_compressors:item

#set item count
data merge entity @s {Item:{Count:64b}}

#restore original item tag, overwriting tags from compression
data modify entity @s Item.tag set from entity @s Item.tag.gm4_precompression_tag

#if original had no data, remove tag entirely
execute if entity @s[nbt={Item:{tag:{gm4_precompression_tag:"no_tag_data_to_preserve"}}}] run data remove entity @s Item.tag

playsound entity.firework_rocket.blast block @a ~ ~ ~ 1 .1
