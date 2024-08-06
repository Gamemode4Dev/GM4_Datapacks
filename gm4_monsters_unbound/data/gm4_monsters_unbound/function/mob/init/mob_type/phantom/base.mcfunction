# calculate modifiers for newly spawned phantom
# @s = phantom
# at @s
# run from mob/init/mob_type

# | Biome Modifiers
# snowy
tag @s[predicate=gm4_monsters_unbound:biome/snowy] add gm4_mu_slowing_attack
# burned
effect give @s[predicate=gm4_monsters_unbound:biome/burned] fire_resistance infinite 0 true
data modify entity @s[predicate=gm4_monsters_unbound:biome/burned,predicate=gm4_monsters_unbound:chance/phantom/grow_slight] Size set value 1
# flowering
data modify entity @s[predicate=gm4_monsters_unbound:biome/flowering,predicate=gm4_monsters_unbound:chance/phantom/grow_slight] Size set value 1
data modify entity @s[predicate=gm4_monsters_unbound:biome/flowering,predicate=gm4_monsters_unbound:chance/phantom/grow_large] Size set value 2
