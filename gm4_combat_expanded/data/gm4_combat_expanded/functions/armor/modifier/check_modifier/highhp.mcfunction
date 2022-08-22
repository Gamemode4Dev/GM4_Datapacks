# check the modifier on the armor piece
# @s = player wearing modified armor
# at world spawn
# run from armor/modifier/check_modifier

execute if score $modifier gm4_ce_data matches 50 run function gm4_combat_expanded:armor/modifier/type/highhp
execute if score $modifier gm4_ce_data matches 51 run function gm4_combat_expanded:armor/modifier/type/immune/check
execute if score $modifier gm4_ce_data matches 52 run function gm4_combat_expanded:armor/modifier/type/husk/check
