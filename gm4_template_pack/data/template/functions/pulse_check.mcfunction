#compares assigned run tick to current tick and calls main
execute if score gm4_currentTick gm4_clockTick = MODULE_ID gm4_clockTick run function MODULE_ID:main
