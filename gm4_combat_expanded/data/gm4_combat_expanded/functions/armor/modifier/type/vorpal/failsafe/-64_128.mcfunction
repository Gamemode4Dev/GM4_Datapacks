# @s = vorpal marker
# at @s
# run from armor/type/vorpal/failsafe

execute if score $y_pos gm4_ce_data matches ..32 run function gm4_combat_expanded:armor/modifier/type/vorpal/failsafe/-64_32
execute if score $y_pos gm4_ce_data matches 33.. run function gm4_combat_expanded:armor/modifier/type/vorpal/failsafe/33_128
