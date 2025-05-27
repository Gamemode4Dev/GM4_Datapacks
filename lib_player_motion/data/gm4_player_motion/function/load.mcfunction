# (GM4) moved from internal/technical/load
# LOAD FUNCTION

# STORAGE
data modify storage gm4_player_motion:math unitvector set value [0.0d,0.0d,0.0d]
data modify storage gm4_player_motion:math motion set value [0.0d,0.0d,0.0d]
data modify storage gm4_player_motion:math pos set value [0.0d,0.0d,0.0d]

# TICK FUNCTION
schedule function gm4_player_motion:internal/technical/tick 1t append

# SCORES
scoreboard objectives add gm4_player_motion.api.launch dummy
scoreboard objectives add gm4_player_motion.internal.dummy dummy
scoreboard objectives add gm4_player_motion.internal.math dummy
    scoreboard objectives add gm4_player_motion.internal.math.sqrt dummy
scoreboard objectives add gm4_player_motion.internal.const dummy
    scoreboard players set #constant.-1 gm4_player_motion.internal.const -1
    scoreboard players set #constant.2 gm4_player_motion.internal.const 2
    scoreboard players set #constant.10 gm4_player_motion.internal.const 10
    scoreboard players set #constant.12 gm4_player_motion.internal.const 12
    scoreboard players set #constant.1000 gm4_player_motion.internal.const 1000
    scoreboard players set #constant.100 gm4_player_motion.internal.const 100
    scoreboard players set #constant.fpc gm4_player_motion.internal.const 8000
scoreboard objectives add gm4_player_motion.internal.motion.x dummy
scoreboard objectives add gm4_player_motion.internal.motion.y dummy
scoreboard objectives add gm4_player_motion.internal.motion.z dummy
scoreboard objectives add gm4_player_motion.internal.gamemode dummy

# MARKER
kill 9a347e6c-1ce5-434a-b717-6707d51f4299
#    ^ (GM4) changed UUID to prevent potential conflict
summon marker 29999998.0 0.0 7133.0 {UUID:[I; -1707835796, 484787018, -1223203065, -719371623], Tags:["smithed.strict", "smithed.entity"]}
#             ^ (GM4) changed position to GM4 forceloaded chunk and changed UUID to prevent potential conflict

# TRIG LOOKUP TABLE:
function gm4_player_motion:internal/technical/trig
