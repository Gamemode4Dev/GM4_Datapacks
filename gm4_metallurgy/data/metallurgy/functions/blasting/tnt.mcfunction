# @s = primed tnt with a fuse of 1
# run from main

scoreboard players set found_primed_tnt gm4_ml_data 0
scoreboard players set found_ore_radius gm4_ml_data 1
summon area_effect_cloud ~ ~ ~ {Duration:2,CustomName:"\"gm4_ore_radius\"",Tags:["gm4_ore_radius"]}
