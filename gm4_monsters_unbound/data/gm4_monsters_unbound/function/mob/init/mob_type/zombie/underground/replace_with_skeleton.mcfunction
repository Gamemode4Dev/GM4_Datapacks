# replace with 2 melee skeletons
# @s = zombie
# at @s
# run from mob/init/mob_type/zombie/underground/pick

summon skeleton ~.05 ~ ~ {Tags:["gm4_sr_extra_mob","gm4_sr_melee_skeleton"],HandItems:[{},{}]}
summon skeleton ~ ~ ~ {Tags:["gm4_sr_extra_mob","gm4_sr_melee_skeleton"],HandItems:[{},{}]}
tp @s ~ ~-2050 ~
kill @s
scoreboard players set $mob_extras gm4_sr_data 1
scoreboard players set $removed_mob gm4_sr_data 1
