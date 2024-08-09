schedule function gm4_monsters_unbound:slow_clock 30s

# toxic creepers
execute as @e[type=creeper,tag=gm4_mu_toxic_creeper] run function gm4_monsters_unbound:mob/process/toxic_creeper

# cloaked crepers
effect give @e[type=creeper,tag=gm4_mu_cloaked_creeper] invisibility 33 0
