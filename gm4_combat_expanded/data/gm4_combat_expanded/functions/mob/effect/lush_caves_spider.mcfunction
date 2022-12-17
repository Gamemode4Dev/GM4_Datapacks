# replace spider with 4 silverfish
# @s = spider
# at @s
# run from mob/mob_type/spider

summon silverfish ~0.15 ~ ~0.15
summon silverfish ~0.15 ~ ~-0.15
summon silverfish ~-0.15 ~ ~0.15
summon silverfish ~-0.15 ~ ~-0.15
tp @s ~ ~-2050 ~
kill @s
scoreboard players set $mob_extras gm4_ce_data 1
