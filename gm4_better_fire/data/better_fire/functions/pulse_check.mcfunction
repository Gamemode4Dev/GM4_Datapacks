#compares assigned run tick to current tick and calls main
execute if score gm4_currentTick gm4_clockTick = better_fire gm4_clockTick run function better_fire:main
