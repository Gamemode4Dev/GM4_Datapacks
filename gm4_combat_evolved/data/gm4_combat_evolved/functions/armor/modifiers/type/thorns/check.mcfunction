# run from armor/check_modifier
# @s = player wearing thorned armour

function gm4_combat_evolved:player/calculate_hp

# activate armor if hp below half
execute if score $active gm4_ce_data matches 0 if score @s gm4_ce_health < $half_health gm4_ce_data run function gm4_combat_evolved:armor/modifiers/type/thorns/activate

# otherwise deactivate armor
execute if score $active gm4_ce_data matches 1 unless score @s gm4_ce_health < $half_health gm4_ce_data run function gm4_combat_evolved:armor/modifiers/type/thorns/deactivate
