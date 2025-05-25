# verifies that the placed down machine minecart was from this module
# @s = machine minecart
# located at the machine minecart
# run from #gm4_machines:place_cart

execute if score $placed_block gm4_machine_data matches 0 if data entity @s {CustomName:{"translate":"item.gm4.minecart.bore","fallback":"Minecart with Piston","italic":false,"color":"white"}} run function gm4_tunnel_bores:machine/create_cart
