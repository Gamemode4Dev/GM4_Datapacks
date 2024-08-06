# calculate modifiers for newly spawned zombie / zombie villager
# @s = zombie (villager)
# at @s
# run from mob/init/mob_type

# | Biome Modifiers
# snowy
tag @s[predicate=gm4_monsters_unbound:biome/snowy] add gm4_mu_slowing_attack
# mountainous
execute if predicate gm4_monsters_unbound:biome/mountainous run function gm4_monsters_unbound:mob/init/mob_type/zombie/mountainous
# burned
execute if entity @s[type=husk,predicate=gm4_monsters_unbound:biome/burned] run function gm4_monsters_unbound:mob/init/mob_type/zombie/burned_husk
# flowering
execute if predicate gm4_monsters_unbound:biome/flowering run tag @s add gm4_mu_spore_zombie
execute if entity @s[tag=gm4_mu_spore_zombie] run function gm4_monsters_unbound:mob/init/mob_type/zombie/flowering
# toxic
tag @s[predicate=gm4_monsters_unbound:biome/toxic] add gm4_mu_weakness_attack
# deep
attribute @s[type=drowned,predicate=gm4_monsters_unbound:biome/deep] generic.movement_speed modifier add gm4_monsters_unbound:stat_change.deep 0.2 add_multiplied_base
# reef
execute if entity @s[type=drowned,predicate=gm4_monsters_unbound:biome/reef] run function gm4_monsters_unbound:mob/init/mob_type/zombie/reef_drowned
# growth
execute if entity @s[type=!zombie_villager,tag=!gm4_mu_spore_zombie,predicate=gm4_monsters_unbound:biome/growth] run function gm4_monsters_unbound:mob/init/mob_type/zombie/growth

# elites
execute if entity @s[tag=gm4_sr_was_leader_or_baby] run function gm4_monsters_unbound:mob/init/elite/pick_type
