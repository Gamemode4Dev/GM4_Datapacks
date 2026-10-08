# Bucket 18: crystal 36001 to 38000
execute store result storage gm4_player_motion:tmp convert double 0.8696 run scoreboard players get #crystal gm4_player_motion.internal.dummy
execute store result score #crystal gm4_player_motion.internal.dummy store result score #temp gm4_player_motion.internal.dummy run data get storage gm4_player_motion:tmp convert 10
scoreboard players operation #temp gm4_player_motion.internal.dummy %= #constant.10 gm4_player_motion.internal.const
execute if score #temp gm4_player_motion.internal.dummy matches 5.. run scoreboard players add #crystal gm4_player_motion.internal.dummy 10
scoreboard players operation #crystal gm4_player_motion.internal.dummy /= #constant.10 gm4_player_motion.internal.const
scoreboard players operation #crystal gm4_player_motion.internal.dummy += #convert.18.adder gm4_player_motion.internal.const
