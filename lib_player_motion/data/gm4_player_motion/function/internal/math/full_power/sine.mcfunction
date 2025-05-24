# > gm4_player_motion:internal/math/full_power/sine
$execute store result score $n_full_exp gm4_player_motion.internal.math run data get storage gm4_player_motion:trig arr[$(angle)]
scoreboard players operation $n_full_exp gm4_player_motion.internal.math *= $motion_y gm4_player_motion.internal.math
execute store result score $sub_power gm4_player_motion.internal.math run scoreboard players operation $n_full_exp gm4_player_motion.internal.math /= #constant.1000 gm4_player_motion.internal.const
