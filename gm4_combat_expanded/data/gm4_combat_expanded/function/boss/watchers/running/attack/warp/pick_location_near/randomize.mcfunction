# code taken from Orb of Ankou - expeditious
# @s = vorpal marker
# at @s
# run from armor/type/vorpal/spawn_marker
# run from armor/type/vorpal/tp_marker

execute store result score $randomZ gm4_ce_boss run random value 0..2
execute store result score $randomZ gm4_ce_boss run random value 0..2

execute at @s run function gm4_combat_expanded:boss/watchers/running/attack/warp/pick_location_near/tp_marker
