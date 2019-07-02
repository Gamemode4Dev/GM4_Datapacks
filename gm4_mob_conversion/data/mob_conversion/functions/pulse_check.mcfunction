#compares assigned run tick to current tick and calls main
execute if score current_tick gm4_clock_tick = mob_conversion gm4_clock_tick run function mob_conversion:main
