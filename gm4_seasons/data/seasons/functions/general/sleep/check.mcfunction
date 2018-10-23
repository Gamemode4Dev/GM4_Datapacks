#run from seasons:general/clock_tick


execute if entity @p[nbt={Sleeping:1b}] run scoreboard players add gm4_szn_detect gm4_szn_sleep 1
execute if score gm4_szn_detect gm4_szn_sleep matches 1.. if entity @a[nbt={Sleeping:0b}] run scoreboard players set gm4_szn_detect gm4_szn_sleep 0

execute if score gm4_szn_detect gm4_szn_sleep matches 99 run function seasons:general/sleep/trigger

