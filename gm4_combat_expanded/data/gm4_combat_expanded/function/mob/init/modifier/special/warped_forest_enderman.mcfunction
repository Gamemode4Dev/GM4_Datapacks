# replace enderman with skeletons
# @s = enderman
# at @s
# run from mob/init/mob_type/enderman

summon enderman ~-0.05 ~ ~0.05 {Tags:["gm4_ce_extra_mob"]}
scoreboard players set $mob_extras gm4_ce_data 1
