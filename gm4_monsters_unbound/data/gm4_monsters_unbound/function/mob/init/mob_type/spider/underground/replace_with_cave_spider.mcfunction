# replace with cave spider
# @s = spider
# at @s
# run from mob/init/mob_type/spider/underground/pick

summon cave_spider ~.1 ~ ~ {Tags:["gm4_sr_extra_mob"]}
scoreboard players set $mob_extras gm4_sr_data 1
tp @s ~ ~-2050 ~
kill @s
scoreboard players set $removed_mob gm4_sr_data 1
