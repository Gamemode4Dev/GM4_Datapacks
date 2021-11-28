# @s = block compressor
# run from main
tag @s add gm4_block_compressor_processing
execute positioned ~-0.5 ~0.5 ~-0.5 as @e[type=item,dx=0] positioned ~0.5 ~-0.9 ~0.5 run function gm4_block_compressors:item
tag @s remove gm4_block_compressor_processing

particle portal ~ ~0.7 ~ 0 0 0 0.1 20
