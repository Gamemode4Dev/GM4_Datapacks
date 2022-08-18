# code taken from Orb of Ankou - expeditious
# @s = player wearing vorpal armor being damaged
# at @s
# run from armor/type/vorpal/attempt

scoreboard players operation $randomZ gm4_ce_data = $randomX gm4_ce_data
scoreboard players operation $randomZ gm4_ce_data %= #64 gm4_ce_data

scoreboard players operation $randomX gm4_ce_data %= #17 gm4_ce_data
scoreboard players operation $randomZ gm4_ce_data %= #17 gm4_ce_data

execute as @e[type=marker,tag=gm4_ce_vorpal] at @s run function gm4_combat_expanded:armor/modifier/type/vorpal/tp_marker
