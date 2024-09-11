# @s = tunnel bores
# at world spawn
# called by gm4_tunnel_bores:update_direction

execute if entity @s[tag=!gm4_tunnel_bore_south] if score @s gm4_bore_data matches 0 at @s run function gm4_tunnel_bores:bore/direction/update_rotation_south
execute if entity @s[tag=!gm4_tunnel_bore_west] if score @s gm4_bore_data matches 90 at @s run function gm4_tunnel_bores:bore/direction/update_rotation_west
execute if entity @s[tag=!gm4_tunnel_bore_east] if score @s gm4_bore_data matches -90 at @s run function gm4_tunnel_bores:bore/direction/update_rotation_east
execute if entity @s[tag=!gm4_tunnel_bore_north] if score @s gm4_bore_data matches 180 at @s run function gm4_tunnel_bores:bore/direction/update_rotation_north

execute if score @s gm4_bore_data matches 0 at @s run tp @s ~ ~ ~ 0 ~
execute if score @s gm4_bore_data matches 90 at @s run tp @s ~ ~ ~ 90 ~
execute if score @s gm4_bore_data matches -90 at @s run tp @s ~ ~ ~ -90 ~
execute if score @s gm4_bore_data matches 180 at @s run tp @s ~ ~ ~ 180 ~
