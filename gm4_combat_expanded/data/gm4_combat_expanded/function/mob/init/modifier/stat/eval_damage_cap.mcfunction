# cap damage to this mobs cap
# @s = mobs that can be buffed
# at @s
# run from mob/init/modifier/stat/prep

$attribute @s generic.attack_damage modifier add 011bd0d9-7049-4d1d-bce8-28007ddbafa1 "gm4_ce_modifier_damage_capped" $(damage_capped) add_value
tag @s add gm4_ce_damage_capped
