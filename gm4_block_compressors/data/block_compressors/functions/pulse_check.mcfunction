#compares assigned run tick to current tick and calls main
execute if score gm4_currentTick gm4_clockTick = block_compressors gm4_clockTick run function block_compressors:main
