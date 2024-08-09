# replace spider with 4 silverfish
# @s = spider
# at @s
# run from mob/init/mob_type/spider/spider
# run from mob/init/mob_type/spider/cave_spider

summon silverfish ~0.15 ~ ~0.15
summon silverfish ~0.15 ~ ~-0.15
summon silverfish ~-0.15 ~ ~0.15
summon silverfish ~-0.15 ~ ~-0.15
tp @s ~ ~-2050 ~
kill @s
scoreboard players set $mob_extras gm4_sr_data 1
scoreboard players set $replaced_mob gm4_sr_data 1
