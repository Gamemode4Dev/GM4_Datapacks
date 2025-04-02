# replace spider with 4 silverfish
# @s = spider
# at @s
# run from mob/init/mob_type/spider/spider

summon silverfish ~0.15 ~ ~0.15 {Tags:["gm4_sr_extra_mob"]}
summon silverfish ~0.15 ~ ~-0.15 {Tags:["gm4_sr_extra_mob"]}
summon silverfish ~-0.15 ~ ~0.15 {Tags:["gm4_sr_extra_mob"]}
summon silverfish ~-0.15 ~ ~-0.15 {Tags:["gm4_sr_extra_mob"]}
tp @s ~ ~-2050 ~
kill @s
scoreboard players set $mob_extras gm4_sr_data 1
scoreboard players set $removed_mob gm4_sr_data 1
