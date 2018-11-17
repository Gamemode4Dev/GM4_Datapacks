#run from equivalent_exchange:init


scoreboard objectives add gm4_rng dummy

scoreboard players set #gm4_mconst gm4_rng 134456
scoreboard players set #gm4_aconst gm4_rng 8121
scoreboard players set #gm4_cconst gm4_rng 28411

scoreboard players set #gm4_temp gm4_rng 0
scoreboard players set #gm4_neg_one gm4_rng -1
scoreboard players set #gm4_value gm4_rng 0

scoreboard players set #gm4_max_rand 0
scoreboard players set #gm4_rand_val 0

# seed the generator, or just keep the last value in #random if already seeded
execute store result score #gm4_seeded gm4_rng run scoreboard players get #gm4_random gm4_rng
execute if score #gm4_seeded gm4_rng matches 0 run function rng:seed
