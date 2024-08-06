# calculate modifiers for newly spawned piglin
# @s = piglin
# at @s
# run from mob/init/mob_type

# | Modifiers
# crimson forest
attribute @s[predicate=gm4_monsters_unbound:biome/nether/crimson_forest] generic.max_health modifier add gm4_survival_refightalized:stat_change.crimson_forest 12 add_value
