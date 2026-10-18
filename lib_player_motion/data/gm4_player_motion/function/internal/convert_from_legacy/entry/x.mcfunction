## Backup the sign of $x and store the absolute value of $x into the conversion & conversion index scores
execute store result score #bucket_index gm4_player_motion.internal.dummy run \
    scoreboard players operation #crystal gm4_player_motion.internal.dummy = $x gm4_player_motion.api.launch
scoreboard players set #sign gm4_player_motion.internal.dummy 1
execute if score #crystal gm4_player_motion.internal.dummy matches ..-1 run scoreboard players set #sign gm4_player_motion.internal.dummy -1
execute if score #crystal gm4_player_motion.internal.dummy matches ..-1 \
    store result score #bucket_index gm4_player_motion.internal.dummy run \
    scoreboard players operation #crystal gm4_player_motion.internal.dummy *= #sign gm4_player_motion.internal.dummy

## Calculate conversion index from x ((x - 1) / 2000)
scoreboard players operation #bucket_index gm4_player_motion.internal.dummy /= #constant.2000 gm4_player_motion.internal.const
execute store result storage gm4_player_motion:internal/temp convert.index int 1 run scoreboard players get #bucket_index gm4_player_motion.internal.dummy

## Run conversion of x input (crystal-tuned) to approximately equivalent `apply_impulse` method x component, bucket function restores sign, store in #x & matrix.x
execute store result score #x gm4_player_motion.internal.dummy store result storage gm4_player_motion:internal/temp matrix.x double 1 run \
    function gm4_player_motion:internal/convert_from_legacy/index with storage gm4_player_motion:internal/temp convert
