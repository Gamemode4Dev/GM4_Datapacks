# @s = tunnel bores
# at world spawn
# called by gm4_tunnel_bores:bore/direction/store_push_east_west and gm4_tunnel_bores:bore/direction/store_push_north_south

# check cart fuel level
execute store result score Fuel gm4_bore_fuel run data get entity @s Fuel

# restore direction if cart still has fuel
execute if score Fuel gm4_bore_fuel matches 1.. run scoreboard players operation @s gm4_bore_data = previous_direction gm4_bore_data
