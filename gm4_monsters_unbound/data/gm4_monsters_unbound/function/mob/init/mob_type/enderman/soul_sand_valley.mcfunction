# replace enderman with wither skeleton
# @s = enderman
# at @s
# run from mob/init/mob_type/enderman/base

summon wither_skeleton ~ ~ ~ {Tags:["gm4_sr_extra_mob"]}
tp @s ~ ~-2050 ~
kill @s
scoreboard players set $mob_extras gm4_sr_data 1
scoreboard players set $removed_mob gm4_sr_data 1
