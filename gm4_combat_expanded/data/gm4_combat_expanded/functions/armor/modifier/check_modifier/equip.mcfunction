# check the modifier on the armor piece
# @s = player wearing modified armor
# at world spawn
# run from armor/modifier/check_modifier

execute if score $modifier gm4_ce_data matches 71 run function gm4_combat_expanded:armor/modifier/type/canine/check
execute if score $modifier gm4_ce_data matches 72 at @s run function gm4_combat_expanded:armor/modifier/type/link/link
execute if score $modifier gm4_ce_data matches 73 at @s run function gm4_combat_expanded:armor/modifier/type/beacon/check
execute if score $modifier gm4_ce_data matches 74 unless predicate gm4_combat_expanded:technical/night_time run function gm4_combat_expanded:armor/modifier/type/trade/check
