#run from seasons:rng/load


execute store result score #gm4_seedval gm4_szn_rng run data get entity @r Pos[0]
execute if score #gm4_seedval gm4_szn_rng matches ..0 run scoreboard players operation #seedval gm4_szn_rng *= #gm4_negone gm4_szn_rng
scoreboard players operation #gm4_seedval gm4_szn_rng %= #gm4_mconst gm4_szn_rng
scoreboard players operation #gm4_random gm4_szn_rng = #gm4_seedval gm4_szn_rng
