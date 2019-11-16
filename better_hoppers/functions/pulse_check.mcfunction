#compares assigned run tick to current tick and calls main
execute if score current_tick gm4_clock_tick = better_hoppers gm4_clock_tick as @e[type=#better_hoppers:projectile] run function better_hoppers:main
