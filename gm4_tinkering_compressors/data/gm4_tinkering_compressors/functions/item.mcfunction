# @s = item above tinkering compressor
# at location of dropper (compressor)
# run from tinkering_compressors:process

data modify storage gm4_tinkering_compressors:temp/tinkering_compressor Items set from block ~ ~ ~ Items

execute if data storage gm4_tinkering_compressors:temp/tinkering_compressor {Items:[{Count:64b}]} positioned ~ ~0.9 ~ as @e[type=item,tag=!gm4_tc_locked,distance=..0.9,limit=1] run function gm4_tinkering_compressors:mode/compress
execute if data storage gm4_tinkering_compressors:temp/tinkering_compressor {Items:[{Count:1b}]} positioned ~ ~0.9 ~ as @e[type=item,tag=!gm4_tc_locked,distance=..0.9,limit=1] run function gm4_tinkering_compressors:mode/decompress

data remove storage gm4_tinkering_compressors:temp/tinkering_compressor Items
