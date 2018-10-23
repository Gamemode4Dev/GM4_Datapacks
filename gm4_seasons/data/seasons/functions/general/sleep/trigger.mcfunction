#run from seasons:general/sleep/trigger


time set 100
scoreboard players add gm4_szn_detect gm4_szn_day 1
execute if score gm4_szn_detect gm4_szn_day matches 25 run scoreboard players add gm4_szn_detect gm4_szn_season 1
execute if score gm4_szn_detect gm4_szn_day matches 25 run scoreboard players set gm4_szn_detect gm4_szn_day 1
execute if score gm4_szn_detect gm4_szn_season matches 5 run scoreboard players set gm4_szn_detect gm4_szn_season 1


weather clear

scoreboard players set gm4_szn_duration gm4_szn_weather 2

scoreboard players set #maxrand gm4_szn_rng 8401
function seasons:rng/nextrand
scoreboard players operation gm4_szn_cycle gm4_szn_weather = #randval gm4_szn_rng
scoreboard players add gm4_szn_cycle gm4_szn_weather 600

#SPRING SHOWERS
execute if score gm4_szn_detect gm4_szn_season matches 1 if score gm4_szn_detect gm4_szn_day matches 4..21 run scoreboard players set #maxrand gm4_szn_rng 10
execute if score gm4_szn_detect gm4_szn_season matches 1 if score gm4_szn_detect gm4_szn_day matches 4..21 run function seasons:rng/nextrand

execute if score gm4_szn_detect gm4_szn_season matches 1 if score gm4_szn_detect gm4_szn_day matches 4..21 if score #randval gm4_szn_rng matches 0..6 run function seasons:weather/spring_showers

#WINTER - RAIN/SNOW STORMS
execute if score gm4_szn_detect gm4_szn_season matches 4 if score gm4_szn_detect gm4_szn_day matches 4..21 run scoreboard players set #maxrand gm4_szn_rng 10
execute if score gm4_szn_detect gm4_szn_season matches 4 if score gm4_szn_detect gm4_szn_day matches 4..21 run function seasons:rng/nextrand

execute if score gm4_szn_detect gm4_szn_season matches 4 if score gm4_szn_detect gm4_szn_day matches 4..21 if score #randval gm4_szn_rng matches 0..9 run function seasons:weather/winter_storms

#SUMMER - THUNDERSTORMS
execute if score gm4_szn_detect gm4_szn_season matches 2 if score gm4_szn_detect gm4_szn_day matches 4..21 run scoreboard players set #maxrand gm4_szn_rng 10
execute if score gm4_szn_detect gm4_szn_season matches 2 if score gm4_szn_detect gm4_szn_day matches 4..21 run function seasons:rng/nextrand

execute if score gm4_szn_detect gm4_szn_season matches 2 if score gm4_szn_detect gm4_szn_day matches 4..21 if score #randval gm4_szn_rng matches 0..3 run function seasons:weather/summer_thunder