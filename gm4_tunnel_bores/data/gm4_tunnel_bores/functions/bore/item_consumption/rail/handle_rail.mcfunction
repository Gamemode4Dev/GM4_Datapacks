# @s = tunnel bore storage aec that has a rail to place
# at tunnel bore minecart
# called by gm4_tunnel_bores:bore/mine/break block and gm4_tunnel_bores:bore/check_cart_environment

execute if score @s gm4_bore_rail matches 0 run function gm4_tunnel_bores:bore/item_consumption/rail/load_rail

execute if score @s gm4_bore_rail matches 1.. run function gm4_tunnel_bores:bore/item_consumption/rail/check_solidity
