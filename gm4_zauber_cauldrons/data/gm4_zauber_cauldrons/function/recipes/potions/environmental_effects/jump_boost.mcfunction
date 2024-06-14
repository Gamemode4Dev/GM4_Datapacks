# @s = boiling zauber cauldron with recipe inside
# at center of block
# run from recipes/potions/ recipes
# applies environmental effects caused by recipes

particle minecraft:effect ~0.2 ~.7 ~ 0.2 0.2 0.2 0 30
summon rabbit ~0.2 ~.7 ~ {RabbitType:99,Tags:["gm4_zc_killer_rabbit"],attributes:[{id:"generic.max_health",base:31.0}],Health:31,active_effects:[{id:"minecraft:regeneration",amplifier:0,duration:2147483647,show_particles:0b},{id:"minecraft:strength",amplifier:3,duration:2147483647,show_particles:0b}]}
playsound minecraft:entity.illusioner.mirror_move block @a[distance=..16] ~0.2 ~.7 ~ 0.4 0.5
