# @s = vorpal marker
# at @s
# run from armor/type/vorpal/-64_128

execute if score $y_pos gm4_ce_data matches ..-16 run function gm4_combat_expanded:armor/modifier/type/vorpal/failsafe/-64_-16
execute if score $y_pos gm4_ce_data matches -15.. run function gm4_combat_expanded:armor/modifier/type/vorpal/failsafe/-15_32
