# apply growth effects to zombie
# @s = zombie
# at @s
# run from mob/init/mob_type/zombie/base

summon skeleton ~.05 ~ ~ {Tags:["gm4_mu_extra_mob"]}
summon skeleton ~ ~ ~ {Tags:["gm4_mu_extra_mob"]}
summon skeleton ~-.05 ~ ~.05 {Tags:["gm4_mu_extra_mob"]}
tp @s ~ ~-2050 ~
kill @s
scoreboard players set $mob_extras gm4_sr_data 1
scoreboard players set $replaced_mob gm4_sr_data 1
