# replace enderman with skeletons
# @s = enderman
# at @s
# run from mob/init/mob_type/enderman

summon skeleton ~-0.05 ~ ~0.05 {Tags:["gm4_ce_extra_mob"]}
summon skeleton ~0.1 ~0.05 ~ {Tags:["gm4_ce_extra_mob"]}
summon skeleton ~0.1 ~0.05 ~ {Tags:["gm4_ce_extra_mob"]}
tp @s ~ ~-2050 ~
kill @s
scoreboard players set $mob_extras gm4_ce_data 1
scoreboard players set $replaced_mob gm4_ce_data 1
