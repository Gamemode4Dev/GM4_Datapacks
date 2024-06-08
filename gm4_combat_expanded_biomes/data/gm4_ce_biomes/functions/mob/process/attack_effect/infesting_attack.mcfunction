# spawn silverfish at players hit with infesting attack
# @s = player that was hit
# at unspecified
advancement revoke @s only gm4_ce_base:damaged/mob/infesting

execute if predicate gm4_ce_base:technical/chance/infested_bite_spawn positioned ~ ~0.4 ~ summon silverfish run function gm4_ce_base:mob/init/special/lush_cave_silverfish
