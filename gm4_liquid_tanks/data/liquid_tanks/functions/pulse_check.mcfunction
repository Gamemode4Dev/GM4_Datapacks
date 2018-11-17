#compares assigned run tick to current tick and calls main
function #liquid_tanks:tick
execute if score gm4_currentTick gm4_clockTick = liquid_tanks gm4_clockTick run function liquid_tanks:main
