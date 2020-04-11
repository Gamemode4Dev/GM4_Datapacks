# @s = tunnel bores
# at world spawn
# called by gm4_tunnel_bores:update_direction

execute if score @s gm4_bore_data matches 0 at @s run tp @s ~ ~ ~ 0 ~
execute if score @s gm4_bore_data matches 90 at @s run tp @s ~ ~ ~ 90 ~
execute if score @s gm4_bore_data matches -90 at @s run tp @s ~ ~ ~ -90 ~
execute if score @s gm4_bore_data matches 180 at @s run tp @s ~ ~ ~ 180 ~
