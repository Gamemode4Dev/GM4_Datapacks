#compares assigned run tick to current tick and calls main
execute if score current_tick gm4_clock_tick = better_fire gm4_clock_tick run function better_fire:main
