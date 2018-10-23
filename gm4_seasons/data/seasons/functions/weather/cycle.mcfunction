#run from seasons:general/clock_second


execute if score gm4_szn_cycle gm4_szn_weather matches 1.. run scoreboard players remove gm4_szn_cycle gm4_szn_weather 1

execute if score gm4_szn_cycle gm4_szn_weather matches 0 unless score gm4_szn_overwrite gm4_szn_weather matches 0..2 run function seasons:weather/set
execute if score gm4_szn_cycle gm4_szn_weather matches 0 if score gm4_szn_overwrite gm4_szn_weather matches 0..2 run function seasons:weather/special
execute if score gm4_szn_cycle gm4_szn_weather matches 0 run function seasons:weather/reset

execute if score gm4_szn_duration gm4_szn_weather matches 1.. run function seasons:weather/duration