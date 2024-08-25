# summon 3 extra cave spiders
# @s = spider
# at @s
# run from mob/init/mob_type/spider/spider

summon cave_spider ~ ~ ~0.15 {Tags:["gm4_sr_extra_mob"],attributes:[{id:"minecraft:generic.max_health",base:9}]}
summon cave_spider ~0.15 ~ ~-0.15 {Tags:["gm4_sr_extra_mob"],attributes:[{id:"minecraft:generic.max_health",base:9}]}
summon cave_spider ~-0.15 ~ ~-0.15 {Tags:["gm4_sr_extra_mob"],attributes:[{id:"minecraft:generic.max_health",base:9}]}
scoreboard players set $mob_extras gm4_sr_data 1
