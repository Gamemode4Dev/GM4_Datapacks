#compares assigned run tick to current tick and calls main
execute if score current_tick gm4_clock_tick = block_compressors gm4_clock_tick run function block_compressors:main
