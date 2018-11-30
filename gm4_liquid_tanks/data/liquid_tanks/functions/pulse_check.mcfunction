#compares assigned run tick to current tick and calls main
function #liquid_tanks:tick
execute if score current_tick gm4_clock_tick = liquid_tanks gm4_clock_tick run function liquid_tanks:main
