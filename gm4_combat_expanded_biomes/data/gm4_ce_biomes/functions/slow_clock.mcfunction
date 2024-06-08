schedule function gm4_ce_base:slow_clock 30s

# toxic creepers
execute as @e[type=creeper,tag=gm4_ce_toxic_creeper] run function gm4_ce_base:mob/process/toxic_creeper

# cloaked crepers
effect give @e[type=creeper,tag=gm4_ce_cloaked_creeper] invisibility 33 0
