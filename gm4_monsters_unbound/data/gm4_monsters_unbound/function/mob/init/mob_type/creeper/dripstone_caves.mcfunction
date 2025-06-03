# replace with spider
# @s = creeper
# at @s
# run from mob/init/mob_type/creeper/base

summon spider ~ ~ ~ {Tags:["gm4_sr_extra_mob"]}
tp @s ~ ~-2050 ~
kill @s
scoreboard players set $mob_extras gm4_sr_data 1
scoreboard players set $removed_mob gm4_sr_data 1
