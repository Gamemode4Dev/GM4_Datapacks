#compares assigned run tick to current tick and calls main
execute if score current_tick gm4_clock_tick = trapped_signs gm4_clock_tick run function trapped_signs:main
