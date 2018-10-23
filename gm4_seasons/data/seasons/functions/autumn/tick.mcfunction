#run from seasons:general/clock_tick


execute if score gm4_szn_detect gm4_szn_day matches 4..9 run function seasons:autumn/leaves_beg
execute if score gm4_szn_detect gm4_szn_day matches 10..21 run function seasons:autumn/leaves_mid
execute if score gm4_szn_detect gm4_szn_day matches 22..24 run function seasons:autumn/leaves_end