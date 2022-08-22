# code taken from Orb of Ankou - expeditious
# @s = player wearing vorpal armor being damaged
# at @s
# run from armor/type/vorpal/tp_marker

execute at @s run tp @s ~ ~-1 ~
scoreboard players add $set_y gm4_ce_data 1
scoreboard players set $warp_safe gm4_ce_data 0
execute at @s if block ~ ~ ~ #gm4:no_collision unless block ~ ~ ~ #gm4:water unless block ~ ~ ~ lava unless block ~ ~-1 ~ #gm4:no_collision run scoreboard players set $warp_safe gm4_ce_data 1
execute if score $warp_safe gm4_ce_data matches 1 run scoreboard players set $warp_attempt gm4_ce_data 33
execute unless score $set_y gm4_ce_data matches 17.. at @s unless score $warp_safe gm4_ce_data matches 1 run function gm4_combat_expanded:armor/modifier/type/vorpal/set_ypos
