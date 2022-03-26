# run from armor/check_modifier
# @s = player wearing overload armour

# calculate health
function gm4_combat_evolved:player/calculate_hp

# give wither, or run custom death message if player will die
execute if score @s gm4_ce_health matches 1 run function gm4_combat_evolved:armor/modifiers/type/overload/death
execute if score @s gm4_ce_health matches 2.. run effect give @s wither 1 1
