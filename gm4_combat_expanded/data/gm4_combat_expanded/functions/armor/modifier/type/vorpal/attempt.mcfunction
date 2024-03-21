# code taken from Orb of Ankou - expeditious
# @s = player wearing vorpal armor being damaged
# at @s
# run from armor/type/vorpal/context

tag @s remove gm4_ce_vorpal_start

# effects where you leave
particle reverse_portal ~ ~0.8 ~ 0.2 0.4 0.2 0.1 16

# teleport up to 8 blocks away
execute summon marker run function gm4_combat_expanded:armor/modifier/type/vorpal/spawn_marker

execute if score $warp_safe gm4_ce_data matches 1 run function gm4_combat_expanded:armor/modifier/type/vorpal/tp_player
execute if score $warp_safe gm4_ce_data matches 0 run function gm4_combat_expanded:armor/modifier/type/vorpal/failsafe
