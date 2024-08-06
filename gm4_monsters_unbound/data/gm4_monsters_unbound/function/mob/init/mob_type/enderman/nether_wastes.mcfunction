# replace enderman with blaze
# @s = enderman
# at @s
# run from mob/init/mob_type/enderman/base

summon blaze ~ ~0.3 ~ {Tags:["gm4_mu_extra_mob"]}
tp @s ~ ~-2050 ~
kill @s
scoreboard players set $mob_extras gm4_sr_data 1
scoreboard players set $replaced_mob gm4_sr_data 1
