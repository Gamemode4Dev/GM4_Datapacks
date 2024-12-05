# apply freeze to this player
# @s = player to freeze
# at @s
# run from effect/freeze/apply

# apply attributes
attribute @s movement_speed modifier add gm4_monsters_unbound:frozen -1 add_multiplied_total
attribute @s attack_speed modifier add gm4_monsters_unbound:frozen -1 add_multiplied_total
attribute @s jump_strength modifier add gm4_monsters_unbound:frozen -1 add_multiplied_total
attribute @s knockback_resistance modifier add gm4_monsters_unbound:frozen 1 add_multiplied_total
attribute @s entity_interaction_range modifier add gm4_monsters_unbound:frozen -1 add_multiplied_total
attribute @s block_interaction_range modifier add gm4_monsters_unbound:frozen -1 add_multiplied_total
