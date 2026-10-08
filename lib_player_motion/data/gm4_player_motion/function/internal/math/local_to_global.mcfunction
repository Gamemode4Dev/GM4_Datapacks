$execute positioned ^$(x) ^$(y) ^$(z) run function gm4_player_motion:internal/math/teleport_marker
data modify storage gm4_player_motion:internal/temp matrix.x set from entity @s Pos[0]
data modify storage gm4_player_motion:internal/temp matrix.y set from entity @s Pos[1]
data modify storage gm4_player_motion:internal/temp matrix.z set from entity @s Pos[2]

execute store result score #x gm4_player_motion.internal.dummy run data get storage gm4_player_motion:internal/temp matrix.x
execute store result score #y gm4_player_motion.internal.dummy run data get storage gm4_player_motion:internal/temp matrix.y
execute store result score #z gm4_player_motion.internal.dummy run data get storage gm4_player_motion:internal/temp matrix.z
teleport @s 29999998.0 0.0 7133.0 0.0 0.0
# ^ (GM4) move entity back to GM4 forceloaded chunk
