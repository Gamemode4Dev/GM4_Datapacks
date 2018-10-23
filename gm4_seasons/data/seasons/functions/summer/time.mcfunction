#run from seasons:summer/tick


execute if score gm4_szn_gm4_gm4_szn_ gm4_szn_daytime matches 0..110 run gamerule doDaylightCycle false
execute if score gm4_szn_gm4_gm4_szn_ gm4_szn_daytime matches 12000..12004 run gamerule doDaylightCycle true

execute if score gm4_szn_gm4_gm4_szn_ gm4_szn_daytime matches 12000..23998 run time add 1
execute if score gm4_szn_gm4_gm4_szn_ gm4_szn_daytime matches 0..11998 run scoreboard players add gm4_szn_summer gm4_szn_timer 1
execute if score gm4_szn_summer gm4_szn_timer matches 3 run time add 2
execute if score gm4_szn_summer gm4_szn_timer matches 3 run scoreboard players set gm4_szn_summer gm4_szn_timer 0