# replace enderman with a slime
# @s = enderman
# at @s
# run from mob/mob_type/enderman

summon slime ~ ~ ~ {Tags:["gm4_ce_extra_mob"]}
tp @s ~ ~-2050 ~
scoreboard players set $mob_extras gm4_ce_data 1
