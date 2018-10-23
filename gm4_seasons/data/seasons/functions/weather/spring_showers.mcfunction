#run from seasons:general/sleep/trigger


advancement grant @a only gm4:april_showers

scoreboard players set #gm4_maxrand gm4_szn_rng 60
function seasons:rng/nextrand

scoreboard players operation gm4_szn_duration gm4_szn_weather = #gm4_randval gm4_szn_rng
scoreboard players add gm4_szn_duration gm4_szn_weather 60

scoreboard players set gm4_szn_type gm4_szn_weather 0