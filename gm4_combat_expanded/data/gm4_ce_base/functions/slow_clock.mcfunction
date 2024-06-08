schedule function gm4_ce_base:slow_clock 30s

# calculate player difficulty score every 5 min
scoreboard players add $calc_diff_clock gm4_ce_data 1
execute if score $calc_diff_clock gm4_ce_data matches 10.. as @a[gamemode=!spectator] run function gm4_ce_base:player/calculate_difficulty
execute if score $calc_diff_clock gm4_ce_data matches 10.. run scoreboard players set $calc_diff_clock gm4_ce_data 0

# get moon cycle (0 = new moon, 4 = full moon)
execute store result score $moon gm4_ce_data run time query day
scoreboard players operation $moon gm4_ce_data %= #8 gm4_ce_data
scoreboard players set $8 gm4_ce_data 8
execute if score $moon gm4_ce_data matches ..3 store result score $moon gm4_ce_data run scoreboard players operation $8 gm4_ce_data -= $moon gm4_ce_data
scoreboard players remove $moon gm4_ce_data 4

# check bed markers
execute as @e[type=marker,tag=gm4_ce_bed] at @s unless block ~ ~ ~ #beds run kill @s
