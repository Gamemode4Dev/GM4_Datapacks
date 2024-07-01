# cap damage to this mobs cap
# @s = mobs that can be buffed
# at @s
# run from mob/init/modifier/stat/prep

$attribute @s generic.attack_damage modifier add gm4_combat_expanded:stat_change.damage_cap_reduction $(damage_capped) add_value
tag @s add gm4_ce_damage_capped
