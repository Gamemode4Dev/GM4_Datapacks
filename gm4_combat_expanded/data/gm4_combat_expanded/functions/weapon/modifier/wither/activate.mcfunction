# damage wielder when weapon is used
# @s = player wielding the weapon
# at world spawn
# run from weapon/check_modifier

# calculate health
function gm4_combat_expanded:player/calculate_hp

# give wither, or run custom death message if player will die
execute if score @s[tag=!gm4_ce_immune_wither] gm4_ce_health matches 1 run function gm4_combat_expanded:weapon/modifier/wither/death
execute if score @s gm4_ce_health matches 2.. run effect give @s[tag=!gm4_ce_immune_wither] wither 1 1
