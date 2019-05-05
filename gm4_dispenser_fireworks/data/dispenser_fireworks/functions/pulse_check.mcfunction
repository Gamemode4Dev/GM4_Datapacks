#compares assigned run tick to current tick and calls main
execute if score current_tick gm4_clock_tick = dispenser_fireworks gm4_clock_tick run function dispenser_fireworks:main

#check fireworks
execute as @e[type=minecraft:firework_rocket,tag=!gm4_df_ignore] at @s run function dispenser_fireworks:direction/check_block
