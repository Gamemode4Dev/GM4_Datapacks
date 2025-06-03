# apply freeze to this non-player entity
# @s = non-player entity to freeze
# at @s
# run from effect/freeze/apply

# apply attributes
attribute @s minecraft:movement_speed modifier add gm4_monsters_unbound:frozen -1 add_multiplied_total
attribute @s minecraft:follow_range modifier add gm4_monsters_unbound:frozen -1 add_multiplied_total
attribute @s minecraft:jump_strength modifier add gm4_monsters_unbound:frozen -1 add_multiplied_total
attribute @s minecraft:attack_damage modifier add gm4_monsters_unbound:frozen -1 add_multiplied_total
attribute @s minecraft:knockback_resistance modifier add gm4_monsters_unbound:frozen 1 add_value
