# weakness and hunger players hit with a toxic attack
# @s = player that was hit
# at unspecified
advancement revoke @s only gm4_monsters_unbound:damaged/attack_effect/toxic

# scale effect with world difficulty (on easy no effect is applied)
execute store result score $worlddiff gm4_mu_data run difficulty

execute if score $worlddiff gm4_mu_data matches 2 run effect give @s[tag=!gm4_mu_immune_weakness] weakness 2 0
execute if score $worlddiff gm4_mu_data matches 3 run effect give @s[tag=!gm4_mu_immune_weakness] weakness 4 0

execute if score $worlddiff gm4_mu_data matches 2 run effect give @s[tag=!gm4_mu_immune_hunger] hunger 2 2
execute if score $worlddiff gm4_mu_data matches 3 run effect give @s[tag=!gm4_mu_immune_hunger] hunger 4 2
