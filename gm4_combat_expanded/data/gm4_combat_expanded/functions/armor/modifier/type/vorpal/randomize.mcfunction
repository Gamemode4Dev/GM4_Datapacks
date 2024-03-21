# code taken from Orb of Ankou - expeditious
# @s = vorpal marker
# at @s
# run from armor/type/vorpal/spawn_marker
# run from armor/type/vorpal/tp_marker

execute store result score $randomZ gm4_ce_data run random value 0..16
execute store result score $randomZ gm4_ce_data run random value 0..16

execute at @s run function gm4_combat_expanded:armor/modifier/type/vorpal/tp_marker
