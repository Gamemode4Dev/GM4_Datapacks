# get random teleport location
# @s = marker
# at @s
# run from clocks/elite/vorpal/warp/tp_marker

execute at @s run tp @s ~ ~-1 ~
scoreboard players add $set_y gm4_mu_data 1
scoreboard players set $warp_safe gm4_mu_data 0
execute at @s if predicate gm4_monsters_unbound:technical/valid_tp unless entity @a[gamemode=!creative,gamemode=!spectator,distance=..3] run scoreboard players set $warp_safe gm4_mu_data 1
execute if score $warp_safe gm4_mu_data matches 1 run scoreboard players set $warp_attempt gm4_mu_data 33
execute unless score $set_y gm4_mu_data matches 8.. at @s unless score $warp_safe gm4_mu_data matches 1 run function gm4_monsters_unbound:mob/process/elite/vorpal/warp/set_ypos