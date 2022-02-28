# run from mobs/spider
# @s = spider
# at @s

summon cave_spider ~ ~ ~0.15 {Tags:["gm4_ai_extra_mob"]}
summon cave_spider ~0.15 ~ ~-0.15 {Tags:["gm4_ai_extra_mob"]}
summon cave_spider ~-0.15 ~ ~-0.15 {Tags:["gm4_ai_extra_mob"]}
kill @s
scoreboard players set $mob_extras gm4_ai_data 1
