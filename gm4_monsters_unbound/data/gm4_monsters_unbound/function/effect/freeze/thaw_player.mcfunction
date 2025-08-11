# thaw player
# @s = player with freeze effect
# at @s
# run from effect/freeze/tick

attribute @s minecraft:movement_speed modifier remove gm4_monsters_unbound:frozen
attribute @s minecraft:attack_speed modifier remove gm4_monsters_unbound:frozen
attribute @s minecraft:jump_strength modifier remove gm4_monsters_unbound:frozen
attribute @s minecraft:knockback_resistance modifier remove gm4_monsters_unbound:frozen
attribute @s minecraft:entity_interaction_range modifier remove gm4_monsters_unbound:frozen
attribute @s minecraft:block_interaction_range modifier remove gm4_monsters_unbound:frozen

playsound minecraft:block.snow.break player @a ~ ~ ~ 1.5 1.25

tag @s remove gm4_mu_frozen
