#compares assigned run tick to current tick and calls main
execute if score gm4_currentTick gm4_clockTick = vertical_rails gm4_clockTick run function vertical_rails:main
