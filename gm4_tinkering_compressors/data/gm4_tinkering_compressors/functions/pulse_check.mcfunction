#compares assigned run tick to current tick and calls main
execute if score current_tick gm4_clock_tick = tinkering_compressors gm4_clock_tick run function tinkering_compressors:main

#prepare for creation of a tinkering compressor
execute if score item_on_compressor gm4_tc_data matches 1 as @e[type=item,tag=gm4_tc_on_compressor] at @s align xyz positioned ~0.5 ~ ~0.5 if block ~ ~0.5 ~ minecraft:moving_piston positioned ~ ~-1 ~ as @e[type=armor_stand,tag=gm4_block_compressor,sort=nearest,limit=1,distance=..0.11] positioned ~ ~1 ~ run function tinkering_compressors:create