#run from seasons:weather/cycle


execute if score szn_overwrite szn_weather matches 0 run scoreboard players set szn_type szn_weather 0
execute if score szn_overwrite szn_weather matches 1 run scoreboard players set szn_type szn_weather 1
execute if score szn_overwrite szn_weather matches 2 run scoreboard players set szn_type szn_weather 2

scoreboard players reset szn_overwrite szn_weather