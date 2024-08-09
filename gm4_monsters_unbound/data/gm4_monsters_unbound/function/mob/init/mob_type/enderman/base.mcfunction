# calculate modifiers for newly spawned enderman
# @s = enderman
# at @s
# run from mob/init/mob_type

# | Biome Modifiers
# flowering 
execute if predicate gm4_monsters_unbound:biome/flowering if predicate gm4_monsters_unbound:chance/enderman/replace_with_slime run function gm4_monsters_unbound:mob/init/mob_type/enderman/flowering
# the end
attribute @s[predicate=gm4_monsters_unbound:biome/the_end] generic.attack_damage modifier add gm4_monsters_unbound:stat_change.the_end 0.2 add_multiplied_base
attribute @s[predicate=gm4_monsters_unbound:biome/the_end] generic.movement_speed modifier add gm4_monsters_unbound:stat_change.the_end 0.15 add_multiplied_base
# warped forest
execute if predicate gm4_monsters_unbound:biome/nether/warped_forest if predicate gm4_monsters_unbound:chance/enderman/extra_spawn run function gm4_monsters_unbound:mob/init/mob_type/enderman/warped_forest
# nether wastes
execute if predicate gm4_monsters_unbound:biome/nether/nether_wastes if predicate gm4_monsters_unbound:chance/enderman/replace_enderman_blaze run function gm4_monsters_unbound:mob/init/mob_type/enderman/nether_wastes
# soul sand valley
execute if predicate gm4_monsters_unbound:biome/nether/soul_sand_valley if predicate gm4_monsters_unbound:chance/enderman/replace_enderman_wither_skeleton run function gm4_monsters_unbound:mob/init/mob_type/enderman/soul_sand_valley
