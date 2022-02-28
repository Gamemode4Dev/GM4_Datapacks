# run from main
# @s = slime/magma cube

execute unless score @s gm4_ai_t_hurt matches 1.. run function gm4_armor_identification:mobs/effects/growing/grow

# reduce timer (12s every time mob is hit)
execute if score @s gm4_ai_t_hurt matches 1..15 run scoreboard players remove @s gm4_ai_hurt 1
