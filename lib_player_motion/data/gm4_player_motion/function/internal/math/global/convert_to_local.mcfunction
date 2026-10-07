scoreboard players operation #_x gm4_player_motion.internal.dummy = #x gm4_player_motion.internal.dummy
scoreboard players operation #_y gm4_player_motion.internal.dummy = #y gm4_player_motion.internal.dummy
scoreboard players operation #_z gm4_player_motion.internal.dummy = #z gm4_player_motion.internal.dummy

execute store result score #x gm4_player_motion.internal.dummy run data get storage gm4_player_motion:internal/temp vec_i[0] 100000
execute store result score #vec_i.z gm4_player_motion.internal.dummy run data get storage gm4_player_motion:internal/temp vec_i[2] 100000

execute store result score #y gm4_player_motion.internal.dummy run data get storage gm4_player_motion:internal/temp vec_j[0] 100000
execute store result score #vec_j.y gm4_player_motion.internal.dummy run data get storage gm4_player_motion:internal/temp vec_j[1] 100000
execute store result score #vec_j.z gm4_player_motion.internal.dummy run data get storage gm4_player_motion:internal/temp vec_j[2] 100000

execute store result score #z gm4_player_motion.internal.dummy run data get storage gm4_player_motion:internal/temp vec_k[0] 100000
execute store result score #vec_k.y gm4_player_motion.internal.dummy run data get storage gm4_player_motion:internal/temp vec_k[1] 100000
execute store result score #vec_k.z gm4_player_motion.internal.dummy run data get storage gm4_player_motion:internal/temp vec_k[2] 100000

scoreboard players operation #x gm4_player_motion.internal.dummy *= #_x gm4_player_motion.internal.dummy
scoreboard players operation #vec_i.z gm4_player_motion.internal.dummy *= #_z gm4_player_motion.internal.dummy

scoreboard players operation #y gm4_player_motion.internal.dummy *= #_x gm4_player_motion.internal.dummy
scoreboard players operation #vec_j.y gm4_player_motion.internal.dummy *= #_y gm4_player_motion.internal.dummy
scoreboard players operation #vec_j.z gm4_player_motion.internal.dummy *= #_z gm4_player_motion.internal.dummy

scoreboard players operation #z gm4_player_motion.internal.dummy *= #_x gm4_player_motion.internal.dummy
scoreboard players operation #vec_k.y gm4_player_motion.internal.dummy *= #_y gm4_player_motion.internal.dummy
scoreboard players operation #vec_k.z gm4_player_motion.internal.dummy *= #_z gm4_player_motion.internal.dummy

scoreboard players operation #x gm4_player_motion.internal.dummy += #vec_i.z gm4_player_motion.internal.dummy

scoreboard players operation #y gm4_player_motion.internal.dummy += #vec_j.y gm4_player_motion.internal.dummy
scoreboard players operation #y gm4_player_motion.internal.dummy += #vec_j.z gm4_player_motion.internal.dummy

scoreboard players operation #z gm4_player_motion.internal.dummy += #vec_k.y gm4_player_motion.internal.dummy
scoreboard players operation #z gm4_player_motion.internal.dummy += #vec_k.z gm4_player_motion.internal.dummy

scoreboard players operation #x gm4_player_motion.internal.dummy /= #constant.100000 gm4_player_motion.internal.const
scoreboard players operation #y gm4_player_motion.internal.dummy /= #constant.100000 gm4_player_motion.internal.const
scoreboard players operation #z gm4_player_motion.internal.dummy /= #constant.100000 gm4_player_motion.internal.const
