# run from mobs/spider
# @s = spider
# at @s

summon silverfish ~0.15 ~ ~0.15
summon silverfish ~0.15 ~ ~-0.15
summon silverfish ~-0.15 ~ ~0.15
summon silverfish ~-0.15 ~ ~-0.15
tp @s ~ ~-1000 ~
scoreboard players set $mob_extras gm4_ai_data 1
