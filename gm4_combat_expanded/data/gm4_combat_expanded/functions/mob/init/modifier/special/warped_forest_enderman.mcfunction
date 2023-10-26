# replace enderman with warped spore zombie
# @s = enderman
# at @s
# run from mob/init/mob_type/enderman

summon zombie ~ ~ ~ {Tags:["gm4_ce_extra_mob","gm4_ce_spore_mob","gm4_ce_spore_zombie.warped"]}
tp @s ~ ~-2050 ~
kill @s
scoreboard players set $mob_extras gm4_ce_data 1
