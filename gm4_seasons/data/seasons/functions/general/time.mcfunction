#run from seasons:general/clock_tick


execute store result score gm4_szn_detect gm4_szn_daytime run time query daytime
execute if score gm4_szn_detect gm4_szn_daytime matches 0 run scoreboard players add gm4_szn_detect gm4_szn_day 1

execute if score gm4_szn_detect gm4_szn_daytime matches 0 if score gm4_szn_detect gm4_szn_day matches 25 run scoreboard players add gm4_szn_detect gm4_szn_season 1
execute if score gm4_szn_detect gm4_szn_daytime matches 0 if score gm4_szn_detect gm4_szn_day matches 25 run scoreboard players set gm4_szn_detect gm4_szn_day 1

execute if score gm4_szn_detect gm4_szn_daytime matches 0 if score gm4_szn_detect gm4_szn_season matches 5 run scoreboard players set gm4_szn_detect gm4_szn_season 1


execute if score gm4_szn_detect gm4_szn_season matches 1 if score gm4_szn_detect gm4_szn_day matches 1 if score gm4_szn_detect gm4_szn_daytime matches ..110 run gamerule doDaylightCycle true
execute if score gm4_szn_detect gm4_szn_season matches 3 if score gm4_szn_detect gm4_szn_day matches 1 if score gm4_szn_detect gm4_szn_daytime matches ..110 run gamerule doDaylightCycle true