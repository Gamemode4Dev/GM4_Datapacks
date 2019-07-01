# @s = tinkering compressor
# run from process

execute if data block ~ ~ ~ {Items:[{}]} unless data block ~ ~ ~ {Items:[{Count:1b}]} positioned ~ ~0.9 ~ run function tinkering_compressors:mode/compress
execute if block ~ ~ ~ dropper{Items:[{Count:1b}]} positioned ~ ~0.9 ~ run function tinkering_compressors:mode/decompress
