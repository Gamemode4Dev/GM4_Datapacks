# process machine
execute as @e[type=marker,tag=gm4_block_compressor] at @s run function gm4_block_compressors:process

schedule function gm4_block_compressors:main 16t
