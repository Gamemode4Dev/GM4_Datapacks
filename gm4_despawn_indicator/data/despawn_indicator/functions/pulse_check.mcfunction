#compares assigned run tick to current tick and calls main
execute if score gm4_currentTick gm4_clockTick = despawn_indicator gm4_clockTick run function despawn_indicator:main