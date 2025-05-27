#> gm4_player_motion:internal/technical/tick
# TICK FUNCTION
schedule function gm4_player_motion:internal/technical/tick 1t append

# LAUNCH PLAYERS
execute if score $function_called gm4_player_motion.internal.dummy matches 1 as @a[tag=gm4_player_motion.launch] at @s run function gm4_player_motion:internal/launch/main
