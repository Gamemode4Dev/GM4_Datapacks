# calculate modifiers for newly spawned guardian
# @s = guardian
# at @s
# run from mob/init/mob_type

# | Biome Modifiers
# reef
attribute @s[predicate=gm4_monsters_unbound:biome/reef] generic.attack_damage modifier add gm4_survival_refightalized:stat_change.reef 4 add_value
