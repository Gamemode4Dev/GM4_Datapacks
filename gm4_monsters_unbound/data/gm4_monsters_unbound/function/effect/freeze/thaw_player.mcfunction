
attribute @s generic.movement_speed modifier remove gm4_monsters_unbound:frozen
attribute @s generic.attack_speed modifier remove gm4_monsters_unbound:frozen
attribute @s generic.jump_strength modifier remove gm4_monsters_unbound:frozen
attribute @s generic.knockback_resistance modifier remove gm4_monsters_unbound:frozen
attribute @s player.entity_interaction_range modifier remove gm4_monsters_unbound:frozen
attribute @s player.block_interaction_range modifier remove gm4_monsters_unbound:frozen

playsound minecraft:block.snow.break player @a ~ ~ ~ 1.5 1.25

tag @s remove gm4_mu_frozen
