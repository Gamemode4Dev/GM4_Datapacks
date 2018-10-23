#run from seasons:general/clock_second


scoreboard players remove @a[scores={gm4_szn_timer=1..}] gm4_szn_timer 1
tag @a[scores={gm4_szn_timer=1}] remove gm4_szn_in_biome
scoreboard players reset @a[scores={gm4_szn_timer=0}] gm4_szn_timer