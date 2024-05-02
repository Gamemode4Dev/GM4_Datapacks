# check the modifier on the armor piece
# @s = player wearing modified armor
# at unspecified
# run from armor/modifier/check_modifier

execute if score $modifier gm4_ce_data matches 32 if score @s gm4_ce_kill matches 1.. run function gm4_combat_expanded:armor/modifier/type/vamp/vamp
execute if score $modifier gm4_ce_data matches 34 if score @s gm4_ce_kill matches 1.. at @s run function gm4_combat_expanded:armor/modifier/type/totem/activate
execute if score $modifier gm4_ce_data matches 35 run function gm4_combat_expanded:armor/modifier/type/drain/check
execute if score $modifier gm4_ce_data matches 36 if score @s gm4_ce_kill matches 1.. run function gm4_combat_expanded:armor/modifier/type/burn/trigger_kill
execute if score $modifier gm4_ce_data matches 37 run function gm4_combat_expanded:armor/modifier/type/reckless/check
