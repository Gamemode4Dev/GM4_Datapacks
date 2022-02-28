# run from advancement damaged/mob/weakness
# @s = player that was hit by a weakness attack

advancement revoke @s only gm4_armor_identification:damaged/mob/weakness

execute if score @s gm4_ai_difficult matches ..3 run effect give @s weakness 15 0
execute if score @s gm4_ai_difficult matches 4..8 run effect give @s weakness 30 0
execute if score @s gm4_ai_difficult matches 9.. run effect give @s weakness 30 1
