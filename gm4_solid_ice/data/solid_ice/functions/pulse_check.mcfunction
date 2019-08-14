#compares assigned run tick to current tick and calls main
execute if score current_tick gm4_clock_tick = solid_ice gm4_clock_tick run function solid_ice:main

#replace still_water with ice
execute at @e[type=area_effect_cloud,tag=gm4_solid_ice] if block ~ ~ ~ water[level=0] run setblock ~ ~ ~ ice