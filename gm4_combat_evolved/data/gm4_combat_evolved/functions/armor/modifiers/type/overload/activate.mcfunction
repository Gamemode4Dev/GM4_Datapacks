# damage undamaged player wearing overload armor
# @s = player wearing armour
# run from armor/check_modifier

# calculate health
function gm4_combat_evolved:player/calculate_hp

# give wither, or run custom death message if player will die
execute if score @s gm4_ce_health matches 1 run function gm4_combat_evolved:armor/modifiers/type/overload/death
execute if score @s gm4_ce_health matches 2.. run effect give @s wither 1 1
