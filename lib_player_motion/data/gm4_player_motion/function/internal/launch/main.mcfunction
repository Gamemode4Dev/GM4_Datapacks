#> gm4_player_motion:internal/launch/main
# Launches players in the input direction

execute \
    store result storage gm4_player_motion:math motion[0] double 0.0001 \
    store result storage gm4_player_motion:math motion_x double 0.0001 run \
    scoreboard players operation $motion_x gm4_player_motion.internal.math = @s gm4_player_motion.internal.motion.x
execute \
    store result storage gm4_player_motion:math motion[1] double 0.0001 \
    store result storage gm4_player_motion:math motion_y double 0.0001 run \
    scoreboard players operation $motion_y gm4_player_motion.internal.math = @s gm4_player_motion.internal.motion.y
execute \
    store result storage gm4_player_motion:math motion[2] double 0.0001 \
    store result storage gm4_player_motion:math motion_z double 0.0001 run \
    scoreboard players operation $motion_z gm4_player_motion.internal.math = @s gm4_player_motion.internal.motion.z

execute in minecraft:overworld run function gm4_player_motion:internal/math/main
attribute @s knockback_resistance modifier add gm4_player_motion:disable_knockback_resistance -1 add_multiplied_total
function gm4_player_motion:internal/launch/gamemode/get
gamemode creative
tp ~ ~10000 ~
execute rotated as @s positioned ~ ~10000 ~ run function gm4_player_motion:internal/summon/main with storage gm4_player_motion:math
tp ~ ~ ~
function gm4_player_motion:internal/launch/gamemode/restore
attribute @s knockback_resistance modifier remove gm4_player_motion:disable_knockback_resistance

scoreboard players set $function_called gm4_player_motion.internal.dummy 0
tag @s remove gm4_player_motion.launch

# Reset scoreboards
scoreboard players reset @s gm4_player_motion.internal.motion.x
scoreboard players reset @s gm4_player_motion.internal.motion.y
scoreboard players reset @s gm4_player_motion.internal.motion.z
