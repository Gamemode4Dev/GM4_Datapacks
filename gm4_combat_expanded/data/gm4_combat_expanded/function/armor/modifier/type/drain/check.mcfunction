# check drain armor
# @s = player wearing armor
# at unspecified
# run from armor/check_modifier/killing

execute if score @s gm4_ce_kill matches 1.. run function gm4_combat_expanded:armor/modifier/type/drain/increase
execute if score @s gm4_ce_hurt matches 1.. run function gm4_combat_expanded:armor/modifier/type/drain/reduce
