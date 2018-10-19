#compares assigned run tick to current tick and calls main
execute if score gm4_currentTick gm4_clockTick = dest_arrows gm4_clockTick run function dest_arrows:main
