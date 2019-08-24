#compares assigned run tick to current tick and calls main
execute if score current_tick gm4_clock_tick = area_markers gm4_clock_tick run function area_markers:main
