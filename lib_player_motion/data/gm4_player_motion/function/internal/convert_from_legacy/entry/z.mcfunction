## Backup the sign of $z and store the absolute value of $z into the conversion & conversion index scores
execute store result score #bucket_index gm4_player_motion.internal.dummy run \
    scoreboard players operation #crystal gm4_player_motion.internal.dummy = $z gm4_player_motion.api.launch
scoreboard players set #sign gm4_player_motion.internal.dummy 1
execute if score #crystal gm4_player_motion.internal.dummy matches ..-1 run scoreboard players set #sign gm4_player_motion.internal.dummy -1
execute if score #crystal gm4_player_motion.internal.dummy matches ..-1 \
    store result score #bucket_index gm4_player_motion.internal.dummy run \
    scoreboard players operation #crystal gm4_player_motion.internal.dummy *= #sign gm4_player_motion.internal.dummy

## Calculate conversion index from z ((z - 1) / 2000)
scoreboard players operation #bucket_index gm4_player_motion.internal.dummy /= #constant.2000 gm4_player_motion.internal.const
execute store result storage gm4_player_motion:internal/temp convert.index int 1 run scoreboard players get #bucket_index gm4_player_motion.internal.dummy

## Run conversion of z input (crystal-tuned) to approximately equivalent `apply_impulse` method z component, bucket function restores sign, store in #z & matrix.z
execute store result score #z gm4_player_motion.internal.dummy store result storage gm4_player_motion:internal/temp matrix.z double 1 run \
    function gm4_player_motion:internal/convert_from_legacy/index with storage gm4_player_motion:internal/temp convert
