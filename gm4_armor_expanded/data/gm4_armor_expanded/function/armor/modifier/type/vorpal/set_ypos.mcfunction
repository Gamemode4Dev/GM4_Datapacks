# code taken from Orb of Ankou - expeditious
# @s = vorpal marker
# at @s
# run from armor/type/vorpal/tp_marker

execute at @s run tp @s ~ ~-1 ~
scoreboard players add $set_y gm4_ae_data 1
scoreboard players set $warp_safe gm4_ae_data 0
execute at @s if predicate gm4_armor_expanded:technical/valid_tp run scoreboard players set $warp_safe gm4_ae_data 1
execute if score $warp_safe gm4_ae_data matches 1 run scoreboard players set $warp_attempt gm4_ae_data 33
execute unless score $set_y gm4_ae_data matches 17.. at @s unless score $warp_safe gm4_ae_data matches 1 run function gm4_armor_expanded:armor/modifier/type/vorpal/set_ypos