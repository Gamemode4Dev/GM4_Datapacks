# spawn the amount of arrows specified
# @s = arrow shot by player wearing armor
# at @s
# run from armor/modifier/type/archer/apply
# run from here

execute positioned ^ ^ ^ summon arrow run function gm4_combat_expanded:armor/modifier/type/archer/storm_arrow

scoreboard players add $storm_arrows_spawned gm4_ce_data 1
execute if score $storm_arrows_spawned gm4_ce_data >= $storm_arrow_target gm4_ce_data run scoreboard players set $storm_arrows_spawned gm4_ce_data 0
execute if score $storm_arrows_spawned gm4_ce_data matches 1.. run function gm4_combat_expanded:armor/modifier/type/archer/spawn_arrows
