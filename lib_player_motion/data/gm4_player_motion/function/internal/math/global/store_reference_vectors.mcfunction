teleport @s ^1 ^ ^
data modify storage gm4_player_motion:internal/temp vec_i set from entity @s Pos
teleport @s ^ ^1 ^
data modify storage gm4_player_motion:internal/temp vec_j set from entity @s Pos
teleport @s ^ ^ ^1
data modify storage gm4_player_motion:internal/temp vec_k set from entity @s Pos
teleport @s 29999998.0 0.0 7133.0 0.0 0.0
# ^ (GM4) move entity back to GM4 forceloaded chunk
