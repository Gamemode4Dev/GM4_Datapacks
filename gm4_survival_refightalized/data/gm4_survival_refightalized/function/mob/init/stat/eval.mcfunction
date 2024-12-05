# evaluate stats
# @s = mobs that can be buffed
# at @s
# run from mob/init/modifier/stat/prep

$execute if score $mob_health gm4_sr_data matches 1.. run attribute @s max_health modifier add gm4_survival_refightalized:stat_change.difficulty_buff $(health) add_value
$execute if score $mob_damage gm4_sr_data matches 1.. run attribute @s attack_damage modifier add gm4_survival_refightalized:stat_change.difficulty_buff $(damage) add_value
$execute if score $mob_speed gm4_sr_data matches 1.. run attribute @s movement_speed modifier add gm4_survival_refightalized:stat_change.difficulty_buff $(speed) add_multiplied_base
