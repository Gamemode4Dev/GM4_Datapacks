# @s = player taking damage while holding a soul in a lantern
# from player/damage_check

execute if predicate gm4_soul_fragments:soul_in_a_lantern/in_mainhand run function gm4_soul_fragments:player/spawn_fragment_mainhand
execute if predicate gm4_soul_fragments:soul_in_a_lantern/in_offhand run function gm4_soul_fragments:player/spawn_fragment_offhand
