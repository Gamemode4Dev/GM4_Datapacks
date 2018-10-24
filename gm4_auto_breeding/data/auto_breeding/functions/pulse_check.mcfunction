#compares assigned run tick to current tick and calls main
execute if score gm4_currentTick gm4_clockTick = auto_breeding gm4_clockTick run function auto_breeding:main
