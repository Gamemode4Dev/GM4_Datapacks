# run from mobs/spider
# @s = spider
# at @s

summon cave_spider ~ ~ ~0.15 {Tags:["gm4_ce_extra_mob"]}
summon cave_spider ~0.15 ~ ~-0.15 {Tags:["gm4_ce_extra_mob"]}
summon cave_spider ~-0.15 ~ ~-0.15 {Tags:["gm4_ce_extra_mob"]}
scoreboard players set $mob_extras gm4_ce_data 1
