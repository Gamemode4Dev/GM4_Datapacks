#run from several functions whenever a random number is needed


# (ax + c) % m

# calculate a * x
scoreboard players operation #gm4_temp gm4_szn_rng = #gm4_aconst gm4_szn_rng
scoreboard players operation #gm4_temp gm4_szn_rng *= #gm4_random gm4_szn_rng

# calculate ax + c
scoreboard players operation #gm4_temp gm4_szn_rng += #gm4_cconst gm4_szn_rng

# calculate (ax+c) % m
scoreboard players operation #gm4_temp gm4_szn_rng %= #gm4_mconst gm4_szn_rng
scoreboard players operation #gm4_random gm4_szn_rng = #gm4_temp gm4_szn_rng

# if user has specified a rand range, calculate the final result, stored in #randval
execute if score #gm4_maxrand gm4_szn_rng matches 1.. run function seasons:rng/calcval
