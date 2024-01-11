# check if armor should activate
# @s = player being checked
# at unspecified
# run from armor/check_modifier/safety

# activate attributes if player is safe
execute unless score $active gm4_ce_data matches 1 unless score @s gm4_ce_t_hurt matches 1.. run function gm4_combat_expanded:armor/modifier/type/focus/safe

# activate attributes if player is unsafe
execute unless score $active gm4_ce_data matches -1 if score @s gm4_ce_t_hurt matches 1.. run function gm4_combat_expanded:armor/modifier/type/focus/unsafe
