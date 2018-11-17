#@s = alchemical crafters containing a recipe results
#Run from post_effects/check_charge

#chance to curse
scoreboard players set #gm4_max_rand gm4_rng 101
function rng:set_rand
scoreboard players operation #gm4_rand_val gm4_rng *= @s gm4_stack_size
execute if score #gm4_rand_val gm4_rng matches 65.. run function equivalent_exchange:post_effects/curse

#chance to drain charge
scoreboard players set #gm4_max_rand gm4_rng 101
function rng:set_rand
scoreboard players operation #gm4_rand_val gm4_rng *= @s gm4_stack_size
execute if score #gm4_rand_val gm4_rng matches 84.. run function equivalent_exchange:post_effects/drain_charge