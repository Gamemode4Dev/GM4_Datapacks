execute if block ~ ~ ~ dropper{Items:[{Count:1b}]} if entity @s[nbt={Item:{Count:64b}},nbt=!{Item:{tag:{gm4_compressed:{}}}}] run function block_compressors:compress/64
execute if block ~ ~ ~ dropper{Items:[{Count:1b}]} if entity @s[nbt={Item:{Count:16b}},nbt=!{Item:{tag:{gm4_compressed:{}}}}] run function block_compressors:compress/16
execute if block ~ ~ ~ dropper{Items:[{Count:64b}]} if entity @s[nbt={Item:{Count:1b,tag:{gm4_compressed:{value:64}}}}] run function block_compressors:decompress/64
execute if block ~ ~ ~ dropper{Items:[{Count:16b}]} if entity @s[nbt={Item:{Count:1b,tag:{gm4_compressed:{value:16}}}}] run function block_compressors:decompress/16
