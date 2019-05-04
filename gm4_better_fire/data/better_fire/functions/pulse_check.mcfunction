#compares assigned run tick to current tick and calls main
execute if score current_tick gm4_clock_tick = better_fire gm4_clock_tick run function better_fire:main

#arrow piercing enchanted hit particle
execute at @e[type=minecraft:arrow,nbt=!{PierceLevel:0b}] run particle minecraft:enchanted_hit ~ ~ ~ 0 0 0 0 1 normal @a
