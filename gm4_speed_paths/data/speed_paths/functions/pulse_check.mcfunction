#compares assigned run tick to current tick and calls main
execute if score current_tick gm4_clock_tick = speed_paths gm4_clock_tick run function speed_paths:main
