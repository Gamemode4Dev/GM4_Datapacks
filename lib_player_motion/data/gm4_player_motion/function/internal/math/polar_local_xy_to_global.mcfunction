$execute positioned ^$(x) ^$(y) ^ run function gm4_player_motion:internal/math/teleport_marker
execute store result score #x gm4_player_motion.internal.dummy run data get entity @s Pos[0]
execute store result score #y gm4_player_motion.internal.dummy run data get entity @s Pos[2]
teleport @s 29999998.0 0.0 7133.0 0.0 0.0
# ^ (GM4) move entity back to GM4 forceloaded chunk
