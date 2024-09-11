# spawn silverfish at players hit with infesting attack
# @s = player that was hit
# at unspecified
advancement revoke @s only gm4_combat_expanded:damaged/mob/infesting

execute if predicate gm4_combat_expanded:technical/chance/infested_bite_spawn positioned ~ ~0.4 ~ summon silverfish run function gm4_combat_expanded:mob/init/modifier/special/lush_cave_silverfish
