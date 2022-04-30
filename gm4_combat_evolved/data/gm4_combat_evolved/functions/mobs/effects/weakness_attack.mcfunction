# weaken players hit with weakness attack
# @s = player that was hit
# run from advancement damaged/mob/weakness

advancement revoke @s only gm4_combat_evolved:damaged/mob/weakness

execute if score @s gm4_ce_difficult matches ..3 run effect give @s weakness 15 0
execute if score @s gm4_ce_difficult matches 4..8 run effect give @s weakness 30 0
execute if score @s gm4_ce_difficult matches 9.. run effect give @s weakness 30 1
