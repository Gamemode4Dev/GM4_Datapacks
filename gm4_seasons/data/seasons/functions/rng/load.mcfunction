#run from seasons:init


scoreboard objectives add gm4_szn_rng dummy

scoreboard players set #gm4_mconst gm4_szn_rng 134456
scoreboard players set #gm4_aconst gm4_szn_rng 8121
scoreboard players set #gm4_cconst gm4_szn_rng 28411

scoreboard players set #gm4_temp gm4_szn_rng 0
scoreboard players set #gm4_negone gm4_szn_rng -1
scoreboard players set #gm4_value gm4_szn_rng 0

scoreboard players set #gm4_maxrand 0
scoreboard players set #gm4_randval 0

# seed the generator, or just keep the last value in #random if already seeded
execute store result score #gm4_seeded gm4_szn_rng run scoreboard players get #gm4_random gm4_szn_rng
execute if score #gm4_seeded gm4_szn_rng matches 0 run function seasons:rng/seed
