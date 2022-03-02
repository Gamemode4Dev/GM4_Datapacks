# run from advancement damaged/mob/toxic
# @s = player that was hit by a toxic bite

advancement revoke @s only gm4_combat_evolved:damaged/mob/toxic

execute store result score $worlddiff gm4_ce_data run difficulty

execute if score $worlddiff gm4_ce_data matches 2 run effect give @s poison 7 1
execute if score $worlddiff gm4_ce_data matches 3 run effect give @s poison 15 1

execute if score $worlddiff gm4_ce_data matches 2 run effect give @s hunger 7 0
execute if score $worlddiff gm4_ce_data matches 3 run effect give @s hunger 15 0
