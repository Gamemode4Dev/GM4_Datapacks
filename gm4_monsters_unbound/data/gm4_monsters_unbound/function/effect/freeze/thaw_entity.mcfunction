# thaw entity
# @s = entity with freeze effect
# at @s
# run from effect/freeze/tick

attribute @s movement_speed modifier remove gm4_monsters_unbound:frozen
attribute @s follow_range modifier remove gm4_monsters_unbound:frozen
attribute @s jump_strength modifier remove gm4_monsters_unbound:frozen
attribute @s attack_damage modifier remove gm4_monsters_unbound:frozen
attribute @s knockback_resistance modifier remove gm4_monsters_unbound:frozen

playsound minecraft:block.snow.break player @a ~ ~ ~ 1.5 1.25

tag @s remove gm4_mu_frozen
