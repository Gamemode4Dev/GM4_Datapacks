#run from seasons:general/clock_tick


function seasons:winter/time
execute if score gm4_szn_detect gm4_szn_day matches 1..3 run function seasons:winter/leaves_beg
execute if score gm4_szn_detect gm4_szn_day matches 4..21 run function seasons:winter/leaves_mid
execute if score gm4_szn_detect gm4_szn_day matches 22..24 run function seasons:winter/leaves_end