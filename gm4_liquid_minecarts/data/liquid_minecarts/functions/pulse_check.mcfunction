#compares assigned run tick to current tick and calls main
function #liquid_minecarts:tick
execute if score current_tick gm4_clock_tick = liquid_minecarts gm4_clock_tick run function liquid_minecarts:main
