# run from advancement damaged/mob/slowing
# @s = player that was hit by a slowing attack

advancement revoke @s only gm4_combat_evolved:damaged/mob/slowing

execute if score @s gm4_ce_difficult matches ..3 run effect give @s slowness 15 0
execute if score @s gm4_ce_difficult matches 4..8 run effect give @s slowness 30 0
execute if score @s gm4_ce_difficult matches 9.. run effect give @s slowness 30 1
