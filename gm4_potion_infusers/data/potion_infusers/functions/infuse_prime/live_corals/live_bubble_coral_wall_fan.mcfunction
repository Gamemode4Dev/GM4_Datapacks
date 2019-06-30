#@s = potion tank
#run from infuse_prime/live_corals/check

summon area_effect_cloud ~ ~ ~ {Duration:81,CustomName:'"gm4_infusing_block"',Tags:["gm4_infusing","gm4_infuse_live_bubble_coral_wall_fan","gm4_infuse_corals"]}
scoreboard players remove @s gm4_lt_buffer 1
tag @s add gm4_lt_fill
tag @s add gm4_pi_infuser
