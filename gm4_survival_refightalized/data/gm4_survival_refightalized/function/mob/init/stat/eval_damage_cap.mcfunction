# cap damage to this mobs cap
# @s = mob with gm4_sr_check_damage_cap tag
# at unspecified
# run from mob/init/modifier/check_damage_cap

$attribute @s attack_damage modifier add gm4_survival_refightalized:stat_change.damage_cap_reduction $(damage_capped) add_value
tag @s add gm4_sr_mob.damage_capped
