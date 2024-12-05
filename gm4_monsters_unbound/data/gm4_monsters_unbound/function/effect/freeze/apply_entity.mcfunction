# apply freeze to this non-player entity
# @s = non-player entity to freeze
# at @s
# run from effect/freeze/apply

# apply attributes
attribute @s movement_speed modifier add gm4_monsters_unbound:frozen -1 add_multiplied_total
attribute @s follow_range modifier add gm4_monsters_unbound:frozen -1 add_multiplied_total
attribute @s jump_strength modifier add gm4_monsters_unbound:frozen -1 add_multiplied_total
attribute @s attack_damage modifier add gm4_monsters_unbound:frozen -1 add_multiplied_total
attribute @s knockback_resistance modifier add gm4_monsters_unbound:frozen 1 add_value
