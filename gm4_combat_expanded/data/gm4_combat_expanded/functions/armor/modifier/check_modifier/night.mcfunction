# check the modifier on the armor piece
# @s = player wearing modified armor
# at world spawn
# run from armor/modifier/check_modifier

execute if score $modifier gm4_ce_data matches 60 run function gm4_combat_expanded:armor/modifier/type/night
execute if score $modifier gm4_ce_data matches 61 run function gm4_combat_expanded:armor/modifier/type/lunar/check
execute if score $modifier gm4_ce_data matches 62 if predicate gm4_combat_expanded:technical/night_time at @s run function gm4_combat_expanded:armor/modifier/type/gloom/gloom
execute if score $modifier gm4_ce_data matches 63 if predicate gm4_combat_expanded:technical/night_time run function gm4_combat_expanded:armor/modifier/type/shadow/shadow
