#run from seasons:weather/cycle


###
# 0 = rain
# 1 = thunder
# 2 = snow
###

scoreboard players set #gm4_maxrand gm4_szn_rng 601
function seasons:rng/nextrand
scoreboard players operation gm4_szn_Duration gm4_szn_weather = #gm4_randval gm4_szn_rng
scoreboard players add gm4_szn_Duration gm4_szn_weather 600

scoreboard players set #gm4_maxrand gm4_szn_rng 100
function seasons:rng/nextrand
execute if score #gm4_randval gm4_szn_rng matches 0..79 run scoreboard players set gm4_szn_Type gm4_szn_weather 0
execute if score #gm4_randval gm4_szn_rng matches 80.. run scoreboard players set gm4_szn_Type gm4_szn_weather 1

execute if score gm4_szn_detect gm4_szn_season matches 2 if score gm4_szn_detect gm4_szn_day matches 4..21 if score #gm4_randval gm4_szn_rng matches 0..59 run scoreboard players set gm4_szn_Type gm4_szn_weather 1
execute if score gm4_szn_detect gm4_szn_season matches 2 if score gm4_szn_detect gm4_szn_day matches 4..21 if score #gm4_randval gm4_szn_rng matches 60.. run scoreboard players set gm4_szn_Type gm4_szn_weather 0

execute if score gm4_szn_detect gm4_szn_season matches 4 if score gm4_szn_detect gm4_szn_day matches 4..21 if score #gm4_randval gm4_szn_rng matches 0..59 run scoreboard players set gm4_szn_Type gm4_szn_weather 2
execute if score gm4_szn_detect gm4_szn_season matches 4 if score gm4_szn_detect gm4_szn_day matches 4..21  if score #gm4_randval gm4_szn_rng matches 60..94 run scoreboard players set gm4_szn_Type gm4_szn_weather 0
execute if score gm4_szn_detect gm4_szn_season matches 4 if score gm4_szn_detect gm4_szn_day matches 4..21  if score #gm4_randval gm4_szn_rng matches 95.. run scoreboard players set gm4_szn_Type gm4_szn_weather 1


execute if score gm4_szn_overwrite gm4_szn_weather matches 0 run scoreboard players set gm4_szn_Type gm4_szn_weather 0
execute if score gm4_szn_overwrite gm4_szn_weather matches 1 run scoreboard players set gm4_szn_Type gm4_szn_weather 1
execute if score gm4_szn_overwrite gm4_szn_weather matches 2 run scoreboard players set gm4_szn_Type gm4_szn_weather 2

execute if score gm4_szn_overwrite gm4_szn_weather matches 0..2 run scoreboard players reset gm4_szn_overwrite gm4_szn_weather