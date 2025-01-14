# remove fear from this player
# @s = player with fear effect
# at @s
# run from effect/fear/tick

attribute @s minecraft:attack_damage modifier remove gm4_monsters_unbound:feared
attribute @s minecraft:attack_speed modifier remove gm4_monsters_unbound:feared
attribute @s minecraft:block_break_speed modifier remove gm4_monsters_unbound:feared

tag @s remove gm4_mu_feared
