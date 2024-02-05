# check the modifier on the armor piece
# @s = player wearing modified armor
# at unspecified
# run from armor/modifier/check_modifier

function gm4_combat_expanded:player/calculate_hp

# low hp
execute if score $modifier gm4_ce_data matches 43 run function gm4_combat_expanded:armor/modifier/type/soothe/check
execute if score $modifier gm4_ce_data matches 44 run function gm4_combat_expanded:armor/modifier/type/berserk/check
execute if score $modifier gm4_ce_data matches 45 if score @s gm4_ce_health.current <= @s gm4_ce_health.max_half run function gm4_combat_expanded:armor/modifier/type/sustain/activate
execute if score $modifier gm4_ce_data matches 51 if score @s gm4_ce_health.current <= @s gm4_ce_health.max_half run function gm4_combat_expanded:armor/modifier/type/immune/get_immunities
# either
execute if score $modifier gm4_ce_data matches 49 run function gm4_combat_expanded:armor/modifier/type/poised/check
# high hp
execute if score $modifier gm4_ce_data matches 52 run function gm4_combat_expanded:armor/modifier/type/half/apply
