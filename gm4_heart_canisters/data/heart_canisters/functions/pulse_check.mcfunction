#compares assigned run tick to current tick and calls main
execute if score current_tick gm4_clock_tick = heart_canisters gm4_clock_tick run function heart_canisters:main
