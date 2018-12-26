#compares assigned run tick to current tick and calls main
execute if score current_tick gm4_clock_tick = spawner_minecarts gm4_clock_tick run function spawner_minecarts:main

#kill spawner without health detector
execute as @e[type=spawner_minecart,tag=gm4_spawner_minecart] unless entity @s[nbt={Passengers:[{DeathTime:0s}]}] run kill @s
