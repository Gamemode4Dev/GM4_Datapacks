# summon 3 extra cave spiders
# @s = spider
# at @s
# run from mob/mob_type/spider

summon cave_spider ~ ~ ~0.15 {Tags:["gm4_ce_extra_mob"],Attributes:[{Name:"generic.max_health",Base:10}]}
summon cave_spider ~0.15 ~ ~-0.15 {Tags:["gm4_ce_extra_mob"],Attributes:[{Name:"generic.max_health",Base:10}]}
summon cave_spider ~-0.15 ~ ~-0.15 {Tags:["gm4_ce_extra_mob"],Attributes:[{Name:"generic.max_health",Base:10}]}
scoreboard players set $mob_extras gm4_ce_data 1
