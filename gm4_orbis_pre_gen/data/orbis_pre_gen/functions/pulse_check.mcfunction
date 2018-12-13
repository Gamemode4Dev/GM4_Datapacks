#compares assigned run tick to current tick and calls main
execute if score speed gm4_orbis_config matches 1.. if score current_tick gm4_clock_tick = orbis gm4_clock_tick run function orbis_pre_gen:main
execute if score speed gm4_orbis_config matches 3.. if score current_tick gm4_clock_tick = orbis_4 gm4_clock_tick run function orbis_pre_gen:main
execute if score speed gm4_orbis_config matches 2.. if score current_tick gm4_clock_tick = orbis_8 gm4_clock_tick run function orbis_pre_gen:main
execute if score speed gm4_orbis_config matches 3.. if score current_tick gm4_clock_tick = orbis_12 gm4_clock_tick run function orbis_pre_gen:main

tag @a add gm4_orbis_disabled
