# @s = tunnel bores
# at world spawn
# called by gm4_tunnel_bores:bore/tunnel_bore_5hz

# store previous direction for use in gm4_tunnel_bores:bore/direction/store_push_east_west and gm4_tunnel_bores:bore/direction/store_push_north_south
scoreboard players operation previous_direction gm4_bore_data = @s gm4_bore_data

# set direction to -1. This will stay if cart is not on a valid rail
scoreboard players set @s gm4_bore_data -1

# check rail facing to determine orientation
execute at @s if block ~ ~ ~ #rails[shape=east_west] run function gm4_tunnel_bores:bore/direction/store_push_east_west
execute at @s if block ~ ~ ~ #rails[shape=north_south] run function gm4_tunnel_bores:bore/direction/store_push_north_south


# update rotation vector
execute unless score @s gm4_bore_data matches -1 run function gm4_tunnel_bores:bore/direction/update_rotation
