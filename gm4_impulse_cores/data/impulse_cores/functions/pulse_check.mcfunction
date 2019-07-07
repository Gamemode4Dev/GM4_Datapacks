#compares assigned run tick to current tick and calls main
execute if score current_tick gm4_clock_tick = impulse_cores gm4_clock_tick run function impulse_cores:main

#tick charge use
scoreboard players remove @a[scores={gm4_ic_chrg_use=1..}] gm4_ic_chrg_use 1

#impulse core charging
execute as @e[type=minecraft:armor_stand,tag=gm4_impulse_core_charging] at @s run function impulse_cores:item/charge/tick
execute at @e[type=minecraft:item,tag=gm4_ic_impulse_core_charged_success] run particle minecraft:happy_villager ~ ~.25 ~ .05 .1 .05 0 1 normal @a
execute at @e[type=minecraft:item,tag=gm4_ic_impulse_core_charged_fail] run particle minecraft:flame ~ ~.25 ~ .05 .1 .05 0 1 normal @a
