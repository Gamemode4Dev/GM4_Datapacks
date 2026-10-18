# (GM4) moved from internal/technical/init

## Scores
scoreboard objectives add gm4_player_motion.api.launch dummy
scoreboard objectives add gm4_player_motion.internal.dummy dummy
scoreboard objectives add gm4_player_motion.internal.math dummy
scoreboard objectives add gm4_player_motion.internal.const dummy
    scoreboard players set #constant.-1 gm4_player_motion.internal.const -1
    scoreboard players set #constant.2 gm4_player_motion.internal.const 2
    scoreboard players set #constant.10 gm4_player_motion.internal.const 10
    scoreboard players set #constant.12 gm4_player_motion.internal.const 12
    scoreboard players set #constant.100 gm4_player_motion.internal.const 100
    scoreboard players set #constant.1000 gm4_player_motion.internal.const 1000
    scoreboard players set #constant.2000 gm4_player_motion.internal.const 2000
    scoreboard players set #constant.8000 gm4_player_motion.internal.const 8000
    scoreboard players set #constant.100000 gm4_player_motion.internal.const 100000
    scoreboard players set #constant.1000000 gm4_player_motion.internal.const 1000000
scoreboard objectives add gm4_player_motion.internal.gamemode dummy
scoreboard objectives add gm4_player_motion.internal.previous_vec_k dummy
scoreboard objectives add gm4_player_motion.internal.previous_x.in dummy
scoreboard objectives add gm4_player_motion.internal.previous_y.in dummy
scoreboard objectives add gm4_player_motion.internal.previous_z.in dummy
scoreboard objectives add gm4_player_motion.internal.previous_x dummy
scoreboard objectives add gm4_player_motion.internal.previous_y dummy
scoreboard objectives add gm4_player_motion.internal.previous_z dummy
scoreboard objectives add gm4_player_motion.internal.previous_method dummy
scoreboard objectives add gm4_player_motion.internal.store dummy
function gm4_player_motion:internal/convert_from_legacy/scoreboard_constants

## Marker
kill 9a347e6c-1ce5-434a-b717-6707d51f4299
#    ^ (GM4) changed UUID to prevent potential conflict
summon marker 29999998.0 0.0 7133.0 {UUID:[I; -1707835796, 484787018, -1223203065, -719371623], Tags:["smithed.strict", "smithed.entity"]}
#             ^ (GM4) changed position to GM4 forceloaded chunk and changed UUID to prevent potential conflict
