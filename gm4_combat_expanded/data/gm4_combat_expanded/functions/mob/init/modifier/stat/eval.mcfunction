# evaluate stats
# @s = mobs that can be buffed
# at @s
# run from mob/init/modifier/stat/prep

$attribute @s generic.max_health modifier add e1d4262d-fa9d-47e7-a98e-e83ad748796e "gm4_ce_modifier_health" $(health) add
$attribute @s generic.attack_damage modifier add 6d6d4eb0-a826-4697-9280-75cc603c68df "gm4_ce_modifier_damage" $(damage) add
$attribute @s generic.movement_speed modifier add 873a5399-42e3-46b1-b5f8-12cf22caf6c6 "gm4_ce_modifier_speed" $(speed) multiply_base
$attribute @s generic.armor modifier add 71fb9281-7a7a-4dce-b1a3-b83cbb05dfe4 "gm4_ce_modifier_armor" $(armor) add
$attribute @s generic.armor_toughness modifier add 444fe678-a6d3-4909-9014-abfa49235594 "gm4_ce_modifier_toughness" $(toughness) add
