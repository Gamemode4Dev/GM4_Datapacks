#> gm4_player_motion:api/launch_looking
# Launches the player in the input direction
execute if entity @s[type=!player] run return fail
execute on vehicle run return fail

scoreboard players set $function_called gm4_player_motion.internal.dummy 1
tag @s add gm4_player_motion.launch

execute store result storage gm4_player_motion:math strength double 0.0001 run scoreboard players get $strength gm4_player_motion.api.launch
execute as 9a347e6c-1ce5-434a-b717-6707d51f4299 in minecraft:overworld positioned 0.0 0.0 0.0 run function gm4_player_motion:internal/math/looking_to_xyz with storage gm4_player_motion:math
#          ^ changed UUID to prevent potential conflict
execute store result score $out gm4_player_motion.internal.motion.x run data get storage gm4_player_motion:math motion[0] 10000
execute store result score $out gm4_player_motion.internal.motion.y run data get storage gm4_player_motion:math motion[1] 10000
execute store result score $out gm4_player_motion.internal.motion.z run data get storage gm4_player_motion:math motion[2] 10000

scoreboard players operation @s gm4_player_motion.internal.motion.x += $out gm4_player_motion.internal.motion.x
scoreboard players operation @s gm4_player_motion.internal.motion.y += $out gm4_player_motion.internal.motion.y
scoreboard players operation @s gm4_player_motion.internal.motion.z += $out gm4_player_motion.internal.motion.z
