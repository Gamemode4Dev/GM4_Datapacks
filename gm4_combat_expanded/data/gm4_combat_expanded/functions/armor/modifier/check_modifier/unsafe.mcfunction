# check the modifier on the armor piece
# @s = player wearing modified armor
# at unspecified
# run from armor/modifier/check_modifier

execute if score $modifier gm4_ce_data matches 20 run function gm4_combat_expanded:armor/modifier/type/retaliate/check
