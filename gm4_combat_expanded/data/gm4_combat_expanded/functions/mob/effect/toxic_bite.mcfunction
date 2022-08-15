# poison and hunger players hit with a toxic bite
# @s = player that was hit
# at world spawn
# run from advancement damaged/mob/toxic

advancement revoke @s only gm4_combat_expanded:damaged/mob/toxic

# scale poison with world difficulty (on easy no effect is applied)
execute store result score $worlddiff gm4_ce_data run difficulty

execute if score $worlddiff gm4_ce_data matches 2 run effect give @s poison 7 1
execute if score $worlddiff gm4_ce_data matches 3 run effect give @s poison 15 1

execute if score $worlddiff gm4_ce_data matches 2 run effect give @s hunger 7 0
execute if score $worlddiff gm4_ce_data matches 3 run effect give @s hunger 15 0
