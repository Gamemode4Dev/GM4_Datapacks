# evaluate stats
# @s = mobs that can be buffed
# at @s
# run from mob/init/modifier/stat/prep

$execute if score $mob_health gm4_ce_data matches 1.. run attribute @s generic.max_health modifier add e1d4262d-fa9d-47e7-a98e-e83ad748796e "gm4_ce_modifier_health" $(health) add_value
$execute if score $mob_damage gm4_ce_data matches 1.. run attribute @s generic.attack_damage modifier add 6d6d4eb0-a826-4697-9280-75cc603c68df "gm4_ce_modifier_damage" $(damage) add_value
$execute if score $mob_speed gm4_ce_data matches 1.. run attribute @s generic.movement_speed modifier add 873a5399-42e3-46b1-b5f8-12cf22caf6c6 "gm4_ce_modifier_speed" $(speed) add_multiplied_base
$execute if score $mob_armor gm4_ce_data matches 1.. run attribute @s generic.armor modifier add 71fb9281-7a7a-4dce-b1a3-b83cbb05dfe4 "gm4_ce_modifier_armor" $(armor) add_value
$execute if score $mob_toughness gm4_ce_data matches 1.. run attribute @s generic.armor_toughness modifier add 444fe678-a6d3-4909-9014-abfa49235594 "gm4_ce_modifier_toughness" $(toughness) add_value
