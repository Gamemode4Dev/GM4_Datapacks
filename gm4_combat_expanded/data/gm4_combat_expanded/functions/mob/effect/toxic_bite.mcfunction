# weakness and hunger players hit with a toxic bite
# @s = player that was hit
# at world spawn
# run from advancement damaged/mob/toxic

advancement revoke @s only gm4_combat_expanded:damaged/mob/toxic

# scale effect with world difficulty (on easy no effect is applied)
execute store result score $worlddiff gm4_ce_data run difficulty

execute if score $worlddiff gm4_ce_data matches 2 run effect give @s[tag=!gm4_ce_immune_weakness] weakness 7 0
execute if score $worlddiff gm4_ce_data matches 3 run effect give @s[tag=!gm4_ce_immune_weakness] weakness 15 0

execute if score $worlddiff gm4_ce_data matches 2 run effect give @s hunger 7 1
execute if score $worlddiff gm4_ce_data matches 3 run effect give @s hunger 15 1
