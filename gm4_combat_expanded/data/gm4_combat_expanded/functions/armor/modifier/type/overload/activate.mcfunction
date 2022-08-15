# damage undamaged player wearing overload armor
# @s = player wearing armour
# at world spawn
# run from armor/check_modifier/epic

# calculate health
function gm4_combat_expanded:player/calculate_hp

# give wither, or run custom death message if player will die
execute if score @s gm4_ce_health matches 1 run function gm4_combat_expanded:armor/modifier/type/overload/death
execute if score @s gm4_ce_health matches 2.. run effect give @s wither 1 1
