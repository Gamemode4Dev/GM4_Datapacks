# code taken from Orb of Ankou - expeditious
# @s = player wearing vorpal armor being damaged
# at @s
# run from armor/type/vorpal/attempt

execute store result score $randomZ gm4_ce_data run random value 0..16
execute store result score $randomZ gm4_ce_data run random value 0..16

execute as @e[type=marker,tag=gm4_ce_vorpal] at @s run function gm4_combat_expanded:armor/modifier/type/vorpal/tp_marker
