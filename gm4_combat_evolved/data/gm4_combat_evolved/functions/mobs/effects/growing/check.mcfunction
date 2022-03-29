# run from main
# @s = slime/magma cube

execute unless score @s gm4_ce_t_hurt matches 1.. run function gm4_combat_evolved:mobs/effects/growing/grow

# reduce timer (12s every time mob is hit)
execute if score @s gm4_ce_t_hurt matches 1..15 run scoreboard players remove @s gm4_ce_t_hurt 1
