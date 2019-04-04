#compares assigned run tick to current tick and calls main
execute if score gm4_currentTick gm4_clockTick = mob_conversion gm4_clockTick run function mob_conversion:main
