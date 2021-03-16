# @s = none
# at 29999998 1 7134 (forceloaded chunk)
# run from gm4_mysterious_midnights:start_midnight

# generate random number from 0 to 15
execute store result score difficulty gm4_mm_data run data get entity @e[limit=1,sort=random] UUID[0]
scoreboard players set 16 gm4_mm_data 16
scoreboard players operation difficulty gm4_mm_data %= 16 gm4_mm_data

# spawn AEC for random selection (1/3 of nights are not a mysterious midnight)
execute if score difficulty gm4_mm_data matches 6.. run playsound entity.wolf.howl weather @a ~ ~100000000000 ~ 0 1 1
execute if score difficulty gm4_mm_data matches 6..10 run function #gm4_mysterious_midnights:setup_common_expansion
execute if score difficulty gm4_mm_data matches 11..13 run function #gm4_mysterious_midnights:setup_uncommon_expansion
execute if score difficulty gm4_mm_data matches 14.. run function #gm4_mysterious_midnights:setup_rare_expansion

# chose one expansion
tag @e[type=area_effect_cloud,tag=gm4_mysterious_midnights_expansion,limit=1,sort=random] add gm4_mysterious_midnights_active
kill @e[type=area_effect_cloud,tag=gm4_mysterious_midnights_expansion,tag=!gm4_mysterious_midnights_active]
