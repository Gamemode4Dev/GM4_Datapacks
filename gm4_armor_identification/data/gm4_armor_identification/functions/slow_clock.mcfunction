schedule function gm4_armor_identification:slow_clock 60s

# calculate player difficulty score
execute as @a[gamemode=!spectator] run function gm4_armor_identification:player/calculate_difficulty
