schedule function gm4_survival_refightalized:slow_clock 30s

# get moon cycle (0 = new moon, 4 = full moon)
execute store result score $moon gm4_sr_data run time query day
scoreboard players operation $moon gm4_sr_data %= #8 gm4_sr_data
scoreboard players set $8 gm4_sr_data 8
execute if score $moon gm4_sr_data matches ..3 store result score $moon gm4_sr_data run scoreboard players operation $8 gm4_sr_data -= $moon gm4_sr_data
scoreboard players remove $moon gm4_sr_data 4
