# replace spider with a slime
# @s = spider
# at @s
# run from mobs/spider

summon slime ~ ~ ~ {Tags:["gm4_ce_extra_mob"]}
tp @s ~ ~-1000 ~
scoreboard players set $mob_extras gm4_ce_data 1
