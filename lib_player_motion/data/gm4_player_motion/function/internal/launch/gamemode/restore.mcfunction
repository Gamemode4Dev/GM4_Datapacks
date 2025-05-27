#> gm4_player_motion:internal/launch/gamemode/restore
execute if score $mode gm4_player_motion.internal.gamemode matches 0 run return run gamemode survival @s
execute if score $mode gm4_player_motion.internal.gamemode matches 1 run return run gamemode creative @s
execute if score $mode gm4_player_motion.internal.gamemode matches 2 run return run gamemode adventure @s
execute if score $mode gm4_player_motion.internal.gamemode matches 3 run gamemode spectator @s
