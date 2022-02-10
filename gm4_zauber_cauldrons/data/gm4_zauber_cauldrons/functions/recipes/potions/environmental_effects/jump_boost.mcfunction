# @s = boiling zauber cauldron with recipe inside
# at center of block
# run from recipes/potions/ recipes
# applies environmental effects caused by recipes

particle minecraft:effect ~0.2 ~.7 ~ 0.2 0.2 0.2 0 30
summon rabbit ~0.2 ~.7 ~ {RabbitType:99,Tags:["gm4_zc_killer_rabbit"],Attributes:[{Name:"generic.max_health",Base:31.0}],Health:31,ActiveEffects:[{Id:10,Amplifier:0,Duration:2147483647,ShowParticles:0b},{Id:5,Amplifier:3,Duration:2147483647,ShowParticles:0b}]}
playsound minecraft:entity.illusioner.mirror_move block @a[distance=..16] ~0.2 ~.7 ~ 0.4 0.5
