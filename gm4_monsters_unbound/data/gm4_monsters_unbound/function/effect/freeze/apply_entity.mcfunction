# apply freeze to this non-player entity
# @s = non-player entity to freeze
# at @s
# run from effect/freeze/apply

# apply attributes
attribute @s generic.movement_speed modifier add gm4_monsters_unbound:frozen -1 add_multiplied_total
attribute @s generic.follow_range modifier add gm4_monsters_unbound:frozen -1 add_multiplied_total
attribute @s generic.jump_strength modifier add gm4_monsters_unbound:frozen -1 add_multiplied_total
attribute @s generic.attack_damage modifier add gm4_monsters_unbound:frozen -1 add_multiplied_total
attribute @s generic.knockback_resistance modifier add gm4_monsters_unbound:frozen 1 add_value