# @s = primed tnt with a fuse of 1
# run from pulse_check

scoreboard players set found_primed_tnt gm4_ml_data 0
execute if entity @e[type=tnt,nbt=!{Fuse:0s}] run scoreboard players set found_primed_tnt gm4_ml_data 1
scoreboard players set found_ore_radius gm4_ml_data 1
summon area_effect_cloud ~ ~ ~ {Duration:2,CustomName:"\"gm4_ore_radius\"",Tags:["gm4_ore_radius"]}
