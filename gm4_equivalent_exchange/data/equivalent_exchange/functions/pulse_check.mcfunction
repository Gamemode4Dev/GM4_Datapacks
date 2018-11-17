#compares assigned run tick to current tick and calls main
execute if score current_tick gm4_clock_tick = equivalent_exchange gm4_clock_tick run function equivalent_exchange:main
