# replace skeleton / stray with 3 zombies
# @s = skeleton / stray
# at @s
# run from mob/init/mob_type/skeleton

summon zombie ~.1 ~ ~ {Tags:["gm4_ce_extra_mob"]}
execute unless predicate gm4_combat_expanded:mob/modifier/lush_caves run summon zombie ~ ~ ~.1 {Tags:["gm4_ce_extra_mob"]}
execute unless predicate gm4_combat_expanded:mob/modifier/lush_caves run summon zombie ~-.1 ~ ~-.1 {Tags:["gm4_ce_extra_mob"]}
scoreboard players set $mob_extras gm4_ce_data 1
tp @s ~ ~-2050 ~
kill @s
scoreboard players set $replaced_mob gm4_ce_data 1
