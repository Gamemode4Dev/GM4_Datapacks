# spawn 5 more enderman
# @s = enderman
# at @s
# run from mob/init/mob_type/enderman/base

summon enderman ~0.15 ~ ~0.15 {Tags:["gm4_sr_extra_mob"]}
summon enderman ~0.15 ~ ~-0.15 {Tags:["gm4_sr_extra_mob"]}
summon enderman ~-0.15 ~ ~0.15 {Tags:["gm4_sr_extra_mob"]}
summon enderman ~0.15 ~ ~ {Tags:["gm4_sr_extra_mob"]}
summon enderman ~ ~ ~0.15 {Tags:["gm4_sr_extra_mob"]}
scoreboard players set $mob_extras gm4_sr_data 1
