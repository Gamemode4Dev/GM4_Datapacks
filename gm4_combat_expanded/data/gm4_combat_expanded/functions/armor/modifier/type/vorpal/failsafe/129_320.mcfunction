# @s = vorpal marker
# at @s
# run from armor/type/vorpal/failsafe

execute if score $y_pos gm4_ce_data matches ..224 run function gm4_combat_expanded:armor/modifier/type/vorpal/failsafe/129_224
execute if score $y_pos gm4_ce_data matches 225.. run function gm4_combat_expanded:armor/modifier/type/vorpal/failsafe/225_320
