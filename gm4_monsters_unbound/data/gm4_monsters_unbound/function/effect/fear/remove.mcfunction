# remove fear from this player
# @s = player with fear effect
# at @s
# run from effect/fear/tick

attribute @s attack_damage modifier remove gm4_monsters_unbound:feared
attribute @s attack_speed modifier remove gm4_monsters_unbound:feared
attribute @s block_break_speed modifier remove gm4_monsters_unbound:feared

tag @s remove gm4_mu_feared
