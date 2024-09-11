# check the modifier on the armor piece
# @s = player wearing modified armor
# at unspecified
# run from armor/modifier/check_modifier

# safe
execute if score $modifier gm4_ce_data matches 10 run function gm4_combat_expanded:armor/modifier/type/scout/check
execute if score $modifier gm4_ce_data matches 11 unless score @s gm4_ce_natural_regen_damage matches 1.. unless score @s gm4_ce_t_shield matches 1.. run function gm4_combat_expanded:armor/modifier/type/shielded/add_level
execute if score $modifier gm4_ce_data matches 12 run function gm4_combat_expanded:armor/modifier/type/sneak/check
execute if score $modifier gm4_ce_data matches 13 run function gm4_combat_expanded:armor/modifier/type/focus/check
execute if score $modifier gm4_ce_data matches 14 run function gm4_combat_expanded:armor/modifier/type/acrobatic/check
# unsafe (most triggered from advancements)
execute if score $modifier gm4_ce_data matches 21 run function gm4_combat_expanded:armor/modifier/type/second_wind/check
