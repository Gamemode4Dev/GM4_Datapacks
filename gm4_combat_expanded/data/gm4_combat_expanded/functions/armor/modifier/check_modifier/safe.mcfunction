# check the modifier on the armor piece
# @s = player wearing modified armor
# at world spawn
# run from armor/modifier/check_modifier

execute if score $modifier gm4_ce_data matches 10 run function gm4_combat_expanded:armor/modifier/type/safe
execute if score $modifier gm4_ce_data matches 11 unless score @s gm4_ce_t_hurt matches 1.. unless score @s gm4_ce_t_shield matches 1.. run function gm4_combat_expanded:armor/modifier/type/shielded/add_level
execute if score $modifier gm4_ce_data matches 12 unless score @s gm4_ce_t_hurt matches 1.. run function gm4_combat_expanded:armor/modifier/type/sneak/sneak
