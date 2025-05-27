# @s = none
# at 29999998 1 7134 (forceloaded chunk)
# run from gm4_mysterious_midnights:start_midnight

# generate random number from 0 to 15
execute store result storage gm4_mysterious_midnights:temp day int 1 run time query day
function gm4_mysterious_midnights:roll_difficulty with storage gm4_mysterious_midnights:temp
scoreboard players set 16 gm4_mm_data 16
scoreboard players operation difficulty gm4_mm_data %= 16 gm4_mm_data

# spawn AEC for random selection (1/3 of nights are not a mysterious midnight)
execute if score difficulty gm4_mm_data matches 6.. run playsound event.mob_effect.raid_omen weather @a[x=0] ~ ~100000000000 ~ 0 .5 1
execute if score difficulty gm4_mm_data matches 6.. run playsound block.trial_spawner.ominous_activate weather @a[x=0] ~ ~100000000000 ~ 0 .6 1
execute if score difficulty gm4_mm_data matches 6..10 run function #gm4_mysterious_midnights:setup_common_expansion
execute if score difficulty gm4_mm_data matches 11..13 run function #gm4_mysterious_midnights:setup_uncommon_expansion
execute if score difficulty gm4_mm_data matches 14.. run function #gm4_mysterious_midnights:setup_rare_expansion

# chose one expansion
tag @e[type=area_effect_cloud,tag=gm4_mysterious_midnights_expansion,limit=1,sort=random] add gm4_mysterious_midnights_active
kill @e[type=area_effect_cloud,tag=gm4_mysterious_midnights_expansion,tag=!gm4_mysterious_midnights_active]
