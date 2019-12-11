# @s = tinkering compressor with (workable) item on top
# at @s
# run from tinkering_compressors:process

execute if data block ~ ~ ~ {Items:[{Count:64b}]} positioned ~ ~0.9 ~ as @e[type=item,tag=!gm4_tc_locked,distance=..0.9,limit=1] run function gm4_tinkering_compressors:mode/compress
execute if data block ~ ~ ~ {Items:[{Count:1b}]} positioned ~ ~0.9 ~ as @e[type=item,tag=!gm4_tc_locked,distance=..0.9,limit=1] run function gm4_tinkering_compressors:mode/decompress
