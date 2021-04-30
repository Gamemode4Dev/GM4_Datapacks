# @s = tunnel bores that left their tracks
# at world spawn
# called by gm4_tunnel_bores:update_direction

data merge entity @s {DisplayState:{Properties:{facing:"up"}}}

tag @s remove gm4_tunnel_bore_south
tag @s remove gm4_tunnel_bore_north
tag @s remove gm4_tunnel_bore_east
tag @s remove gm4_tunnel_bore_west
