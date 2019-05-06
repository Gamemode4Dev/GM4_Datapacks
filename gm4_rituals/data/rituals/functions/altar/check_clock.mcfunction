#runs every 4 ticks - checks clock tick
#@s - @e[type=minecraft:area_effect_cloud,tag=gm4_rituals_altar]
#called by rituals:main

#validity checks on 1.25Hz
execute if score current_tick gm4_clock_tick = rituals gm4_clock_tick run function rituals:altar/validity_checks
## else
execute unless score current_tick gm4_clock_tick = rituals gm4_clock_tick run function rituals:altar/processes
