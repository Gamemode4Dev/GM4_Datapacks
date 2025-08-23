#> gm4_player_motion:internal/math/eyelevel
# eyelevel=y(eyes)-y(player)
execute anchored eyes positioned ^ ^ ^ if entity @s[distance=...41] run \
    return run scoreboard players set $eyelevel gm4_player_motion.internal.math 40

execute anchored eyes positioned ^ ^ ^ if entity @s[distance=..1.27] run \
    return run scoreboard players set $eyelevel gm4_player_motion.internal.math 127

scoreboard players set $eyelevel gm4_player_motion.internal.math 162
