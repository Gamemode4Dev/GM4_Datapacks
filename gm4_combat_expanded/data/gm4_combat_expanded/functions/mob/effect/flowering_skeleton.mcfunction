# replace skeleton/stray with 3 zombies
# @s = skeleton/stray
# at @s
# run from mob/mob_type/skeleton
# run from mob/mob_type/stray

summon zombie ~.1 ~ ~ {Tags:["gm4_ce_extra_mob"]}
summon zombie ~ ~ ~.1 {Tags:["gm4_ce_extra_mob"]}
summon zombie ~-.1 ~ ~-.1 {Tags:["gm4_ce_extra_mob"]}
scoreboard players set $mob_extras gm4_ce_data 1
tp @s ~ ~-2050 ~
kill @s
