#run from seasons:weather/cycle


scoreboard players remove gm4_szn_duration gm4_szn_weather 1

execute if score gm4_szn_type gm4_szn_weather matches 0 run weather rain
execute if score gm4_szn_type gm4_szn_weather matches 1 run weather thunder
execute if score gm4_szn_duration gm4_szn_weather matches 1 run weather clear
execute if score gm4_szn_duration gm4_szn_weather matches 1 run scoreboard players reset gm4_szn_type gm4_szn_weather