# check the modifier on the armor piece
# @s = player wearing modified armor
# at world spawn
# run from armor/modifier/check_modifier

execute if score $modifier gm4_ce_data matches 81 unless score @s gm4_ce_t_hurt matches 1.. run function gm4_combat_expanded:armor/modifier/type/overload/activate
execute if score $modifier gm4_ce_data matches 82 unless score @s gm4_ce_t_witch matches 1.. run function gm4_combat_expanded:armor/modifier/type/witch/check
execute if score $modifier gm4_ce_data matches 83 unless score @s gm4_ce_t_guard matches 1.. run function gm4_combat_expanded:armor/modifier/type/guardian/check
