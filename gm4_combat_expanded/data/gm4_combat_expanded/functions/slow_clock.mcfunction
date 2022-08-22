schedule function gm4_combat_expanded:slow_clock 30s

# calculate player difficulty score
execute as @a[gamemode=!spectator] run function gm4_combat_expanded:player/calculate_difficulty

# toxic creepers
execute as @e[type=creeper,tag=gm4_ce_toxic_creeper] run function gm4_combat_expanded:mob/effect/toxic_creeper

# cloaked crepers
effect give @e[type=creeper,tag=gm4_ce_cloaked_creeper] invisibility 33 0
