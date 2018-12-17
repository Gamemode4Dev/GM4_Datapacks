#compares assigned run tick to current tick and calls main
execute if score current_tick gm4_clock_tick = dirty_food gm4_clock_tick run function dirty_food:main
