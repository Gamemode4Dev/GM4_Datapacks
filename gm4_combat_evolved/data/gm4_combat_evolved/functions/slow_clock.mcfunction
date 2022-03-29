schedule function gm4_combat_evolved:slow_clock 60s

# calculate player difficulty score
execute as @a[gamemode=!spectator] run function gm4_combat_evolved:player/calculate_difficulty

# toxic creepers
execute as @e[type=creeper,tag=gm4_ce_toxic_creeper] run function gm4_combat_evolved:mobs/effects/toxic_creeper
