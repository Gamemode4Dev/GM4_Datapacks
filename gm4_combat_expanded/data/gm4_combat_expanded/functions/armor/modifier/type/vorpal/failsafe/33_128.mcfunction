# @s = vorpal marker
# at @s
# run from armor/type/vorpal/-64_128

execute if score $y_pos gm4_ce_data matches ..80 run function gm4_combat_expanded:armor/modifier/type/vorpal/failsafe/33_80
execute if score $y_pos gm4_ce_data matches 81.. run function gm4_combat_expanded:armor/modifier/type/vorpal/failsafe/81_128
