# apply growth effects to zombie
# @s = zombie
# at @s
# run from mob/mob_type/zombie

summon skeleton ~.05 ~ ~ {Tags:["gm4_ce_extra_mob"]}
summon skeleton ~ ~ ~ {Tags:["gm4_ce_extra_mob"]}
summon skeleton ~-.05 ~ ~.05 {Tags:["gm4_ce_extra_mob"]}
tp @s ~ ~-2050 ~
kill @s
scoreboard players set $mob_extras gm4_ce_data 1
