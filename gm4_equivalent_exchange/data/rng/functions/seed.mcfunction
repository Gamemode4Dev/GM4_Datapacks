#run from rng:load


execute store result score #gm4_seed_val gm4_rng run data get entity @e[sort=random,limit=1] Pos[0]
execute if score #gm4_seed_val gm4_szn_rng matches ..0 run scoreboard players operation #seed_val gm4_rng *= #gm4_neg_one gm4_rng
scoreboard players operation #gm4_seed_val gm4_rng %= #gm4_mconst gm4_rng
scoreboard players operation #gm4_random gm4_rng = #gm4_seed_val gm4_rng
