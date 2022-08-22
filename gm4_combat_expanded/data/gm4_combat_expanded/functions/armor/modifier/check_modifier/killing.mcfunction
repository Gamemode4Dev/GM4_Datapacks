# check the modifier on the armor piece
# @s = player wearing modified armor
# at world spawn
# run from armor/modifier/check_modifier

execute if score $modifier gm4_ce_data matches 30 run function gm4_combat_expanded:armor/modifier/type/killing
execute if score $modifier gm4_ce_data matches 31 if score @s gm4_ce_kill matches 1.. run function gm4_combat_expanded:armor/modifier/type/consume/grow
execute if score $modifier gm4_ce_data matches 32 if score @s gm4_ce_kill matches 1.. run function gm4_combat_expanded:armor/modifier/type/vamp/vamp
execute if score $modifier gm4_ce_data matches 33 if score @s gm4_ce_kill matches 1.. at @s as @e[type=!player,type=!#gm4_combat_expanded:effect_immune,team=!gm4_ce_team_check,distance=..8,tag=!smithed.strict] at @s run function gm4_combat_expanded:armor/modifier/type/fear/fear
