# @s = tunnel bore storage aec that has a rail to place
# at tunnel bore minecart
# called by gm4_tunnel_bores:bore/item_consumption/rail/handle_rail

# remember that the bore tried to place a rail
scoreboard players set placed_rail gm4_bore_rail 0

# place a rail if there is a support block beneath
execute unless block ^ ^-1 ^1 #gm4_tunnel_bores:not_rail_solid run function gm4_tunnel_bores:bore/item_consumption/rail/place_rail
