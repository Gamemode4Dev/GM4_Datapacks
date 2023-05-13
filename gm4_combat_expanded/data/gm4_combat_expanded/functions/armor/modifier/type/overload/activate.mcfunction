# damage undamaged player wearing overload armor
# @s = player wearing armour
# at world spawn
# run from armor/check_modifier/epic

# calculate health
function gm4_combat_expanded:player/calculate_hp

# give wither, or run custom death message if player will die
execute if score @s[tag=!gm4_ce_immune_wither] gm4_ce_health matches 1 run function gm4_combat_expanded:armor/modifier/type/overload/death
effect give @s[scores={gm4_ce_health=2..},tag=!gm4_ce_immune_wither] wither 1 1
