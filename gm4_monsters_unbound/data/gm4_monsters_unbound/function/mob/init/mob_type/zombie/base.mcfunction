# calculate modifiers for newly spawned zombie / zombie villager
# @s = zombie types
# at @s
# run from mob/init/mob_type

# | Biome Modifiers
# snowy
execute if predicate gm4_monsters_unbound:biome/snowy run function gm4_monsters_unbound:mob/init/mob_type/zombie/snowy
tag @s[predicate=gm4_monsters_unbound:biome/snowy] add gm4_mu_slowing_attack
# mountainous
execute if predicate gm4_monsters_unbound:biome/mountainous run function gm4_monsters_unbound:mob/init/mob_type/zombie/mountainous
# burned
execute if entity @s[type=husk,predicate=gm4_monsters_unbound:biome/burned] run function gm4_monsters_unbound:mob/init/mob_type/zombie/burned_husk
# flowering
execute if predicate gm4_monsters_unbound:biome/flowering run tag @s[tag=!gm4_sr_was_leader_or_baby] add gm4_mu_spore_zombie
execute if entity @s[tag=gm4_mu_spore_zombie] run function gm4_monsters_unbound:mob/init/mob_type/zombie/flowering
# toxic
tag @s[predicate=gm4_monsters_unbound:biome/toxic] add gm4_mu_weakness_attack
effect give @s[predicate=gm4_monsters_unbound:biome/toxic] infested infinite 0
# reef
execute if entity @s[type=drowned,predicate=gm4_monsters_unbound:biome/reef] run function gm4_monsters_unbound:mob/init/mob_type/zombie/reef_drowned
# growth
execute if entity @s[type=!zombie_villager,tag=!gm4_mu_spore_zombie,predicate=gm4_monsters_unbound:biome/growth] run function gm4_monsters_unbound:mob/init/mob_type/zombie/growth
# dripstone caves
execute if entity @s[tag=!gm4_sr_extra_mob] if biome ~ ~ ~ dripstone_caves run function gm4_monsters_unbound:mob/init/mob_type/zombie/dripstone_caves/try
# underground (not dripstone caves)
execute if predicate {condition:"all_of",terms:[{condition:"reference",name:"gm4_survival_refightalized:mob/underground"},{condition:"inverted",term:{condition:"location_check",predicate:{"biomes":"dripstone_caves"}}},{condition:"random_chance",chance:0.5}]} run function gm4_monsters_unbound:mob/init/mob_type/zombie/underground/pick

# elites
execute if entity @s[tag=gm4_sr_was_leader_or_baby] run function gm4_monsters_unbound:mob/init/elite/pick
