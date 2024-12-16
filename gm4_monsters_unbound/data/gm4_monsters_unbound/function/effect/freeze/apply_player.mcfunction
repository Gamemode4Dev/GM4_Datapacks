# apply freeze to this player
# @s = player to freeze
# at @s
# run from effect/freeze/apply

# apply attributes
attribute @s minecraft:movement_speed modifier add gm4_monsters_unbound:frozen -1 add_multiplied_total
attribute @s minecraft:attack_speed modifier add gm4_monsters_unbound:frozen -1 add_multiplied_total
attribute @s minecraft:jump_strength modifier add gm4_monsters_unbound:frozen -1 add_multiplied_total
attribute @s minecraft:knockback_resistance modifier add gm4_monsters_unbound:frozen 1 add_multiplied_total
attribute @s minecraft:entity_interaction_range modifier add gm4_monsters_unbound:frozen -1 add_multiplied_total
attribute @s minecraft:block_interaction_range modifier add gm4_monsters_unbound:frozen -1 add_multiplied_total
