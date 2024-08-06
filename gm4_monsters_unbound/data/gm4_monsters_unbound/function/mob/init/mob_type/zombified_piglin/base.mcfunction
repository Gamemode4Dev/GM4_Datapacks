# calculate modifiers for newly spawned zombified piglin
# @s = zombified piglin
# at @s
# run from mob/init/mob_type

# set armor
loot replace entity @s[predicate=gm4_monsters_unbound:biome/nether/crimson_forest] armor.feet loot gm4_monsters_unbound:mob/equip_armor/piglin
