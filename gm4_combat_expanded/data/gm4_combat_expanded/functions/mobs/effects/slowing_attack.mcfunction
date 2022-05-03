# slow players hit with slowing attack
# @s = player that was hit
# run from advancement damaged/mob/slowing

advancement revoke @s only gm4_combat_expanded:damaged/mob/slowing

execute if score @s gm4_ce_difficult matches ..3 run effect give @s slowness 15 0
execute if score @s gm4_ce_difficult matches 4..8 run effect give @s slowness 30 0
execute if score @s gm4_ce_difficult matches 9.. run effect give @s slowness 30 1
