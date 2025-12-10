# replace with 2 melee skeletons
# @s = zombie
# at @s
# run from mob/init/mob_type/zombie/underground/pick

# gm4_sr_melee_skeleton tag is to avoid survival_refightalized treating this skeleton as holding a bow
summon skeleton ~.05 ~ ~ {Tags:["gm4_sr_extra_mob","gm4_sr_melee_skeleton"],equipment:{}}
summon skeleton ~ ~ ~ {Tags:["gm4_sr_extra_mob","gm4_sr_melee_skeleton"],equipment:{}}
tp @s ~ ~-2050 ~
kill @s
scoreboard players set $mob_extras gm4_sr_data 1
scoreboard players set $removed_mob gm4_sr_data 1
