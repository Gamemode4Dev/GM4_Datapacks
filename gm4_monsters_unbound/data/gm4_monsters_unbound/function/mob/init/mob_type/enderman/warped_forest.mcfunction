# replace enderman with skeletons
# @s = enderman
# at @s
# run from mob/init/mob_type/enderman/base

summon enderman ~-0.05 ~ ~0.05 {Tags:["gm4_mu_extra_mob"]}
scoreboard players set $mob_extras gm4_sr_data 1
