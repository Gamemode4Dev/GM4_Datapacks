# spawn 3 additional slimes
# @s = slime
# at @s
# run from mob/mob_type/slime

summon slime ~ ~ ~0.15 {Tags:["gm4_ce_extra_mob","gm4_ce_set_slime_size"]}
summon slime ~0.15 ~ ~-0.15 {Tags:["gm4_ce_extra_mob","gm4_ce_set_slime_size"]}
summon slime ~-0.15 ~ ~-0.15 {Tags:["gm4_ce_extra_mob","gm4_ce_set_slime_size"]}
scoreboard players remove $size gm4_ce_data 1
execute as @e[type=slime,tag=gm4_ce_set_slime_size,distance=..1] store result entity @s Size int 1 run scoreboard players get $size gm4_ce_data
tag @e[type=slime,tag=gm4_ce_set_slime_size,distance=..1] remove gm4_ce_set_slime_size
scoreboard players set $mob_extras gm4_ce_data 1
