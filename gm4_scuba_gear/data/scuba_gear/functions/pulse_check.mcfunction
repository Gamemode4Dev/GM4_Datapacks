#compares assigned run tick to current tick and calls main
execute if score current_tick gm4_clock_tick = scuba_gear gm4_clock_tick run function scuba_gear:main
