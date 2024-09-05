

execute if score @s gm4_ce_kill matches 1.. run function gm4_combat_expanded:armor/modifier/type/reckless/activate
execute unless score @s gm4_ce_kill matches 1.. if score $active gm4_ce_data matches 1.. run function gm4_combat_expanded:armor/modifier/type/reckless/check_time
