# calculate modifiers for newly spawned blaze
# @s = blaze
# at @s
# run from mob/init/mob_type

# | Biome Modifiers
# nether wastes
attribute @s[predicate=gm4_monsters_unbound:biome/nether/nether_wastes] generic.movement_speed modifier add gm4_monsters_unbound:stat_change.nether_wastes 1 add_multiplied_base
