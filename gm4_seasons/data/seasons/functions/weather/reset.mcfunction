#run from seasons:weather/cycle


scoreboard players set #gm4_maxrand gm4_szn_rng 8401
function seasons:rng/nextrand
scoreboard players operation gm4_szn_cycle gm4_szn_weather = #gm4_randval gm4_szn_rng
scoreboard players add gm4_szn_cycle gm4_szn_weather 600