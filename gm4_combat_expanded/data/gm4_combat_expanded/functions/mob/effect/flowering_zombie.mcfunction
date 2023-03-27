# set flowering zombie stats
# @s = zombie
# at @s
# run from mob/mob_type/zombie

tag @s add gm4_ce_spore_zombie
attribute @s generic.max_health modifier add 8650cbae-ca74-423f-96c6-eba2c1c8e80e "gm4_ce_modifier_flowering" -0.25 multiply
execute unless score @s gm4_ce_generation matches 10.. run data modify entity @s ArmorDropChances[3] set value 2F
