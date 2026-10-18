# Bucket 0: crystal 1 to 2000
execute store result storage gm4_player_motion:tmp convert double 1.012643 run scoreboard players get #crystal gm4_player_motion.internal.dummy
execute store result score #crystal gm4_player_motion.internal.dummy store result score #temp gm4_player_motion.internal.dummy run data get storage gm4_player_motion:tmp convert 10
scoreboard players operation #temp gm4_player_motion.internal.dummy %= #constant.10 gm4_player_motion.internal.const
execute if score #temp gm4_player_motion.internal.dummy matches 5.. run scoreboard players add #crystal gm4_player_motion.internal.dummy 10
scoreboard players operation #crystal gm4_player_motion.internal.dummy /= #constant.10 gm4_player_motion.internal.const
scoreboard players operation #crystal gm4_player_motion.internal.dummy += #convert.00.adder gm4_player_motion.internal.const
