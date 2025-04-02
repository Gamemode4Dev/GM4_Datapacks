# replace skeleton with zombie
# @s = skeleton
# at @s
# run from mob/init/mob_type/skeleton/base

summon zombie ~.1 ~ ~ {Tags:["gm4_sr_extra_mob"]}
scoreboard players set $mob_extras gm4_sr_data 1
tp @s ~ ~-2050 ~
kill @s
scoreboard players set $removed_mob gm4_sr_data 1
