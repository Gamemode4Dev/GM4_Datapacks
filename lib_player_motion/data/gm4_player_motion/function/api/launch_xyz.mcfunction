#> gm4_player_motion-1.4:api/launch_xyz
# Launches the player in the input direction
execute if entity @s[type=!player] run return fail
execute on vehicle run return fail

scoreboard players set $function_called gm4_player_motion.internal.dummy 1
tag @s add gm4_player_motion.launch

scoreboard players operation @s gm4_player_motion.internal.motion.x += $x gm4_player_motion.api.launch
scoreboard players operation @s gm4_player_motion.internal.motion.y += $y gm4_player_motion.api.launch
scoreboard players operation @s gm4_player_motion.internal.motion.z += $z gm4_player_motion.api.launch