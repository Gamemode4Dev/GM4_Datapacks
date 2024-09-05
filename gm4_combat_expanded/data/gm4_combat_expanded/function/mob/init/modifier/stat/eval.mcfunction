# evaluate stats
# @s = mobs that can be buffed
# at @s
# run from mob/init/modifier/stat/prep

$execute if score $mob_health gm4_ce_data matches 1.. run attribute @s generic.max_health modifier add gm4_combat_expanded:stat_change.difficulty_buff $(health) add_value
$execute if score $mob_damage gm4_ce_data matches 1.. run attribute @s generic.attack_damage modifier add gm4_combat_expanded:stat_change.difficulty_buff $(damage) add_value
$execute if score $mob_speed gm4_ce_data matches 1.. run attribute @s generic.movement_speed modifier add gm4_combat_expanded:stat_change.difficulty_buff $(speed) add_multiplied_base
$execute if score $mob_armor gm4_ce_data matches 1.. run attribute @s generic.armor modifier add gm4_combat_expanded:stat_change.difficulty_buff $(armor) add_value
$execute if score $mob_toughness gm4_ce_data matches 1.. run attribute @s generic.armor_toughness modifier add gm4_combat_expanded:stat_change.difficulty_buff $(toughness) add_value
