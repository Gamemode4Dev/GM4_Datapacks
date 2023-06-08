# verifies that the placed down machine minecart was from this module
# @s = machine minecart
# located at the machine minecart
# run from #gm4_machines:place_cart

execute if score $placed_block gm4_machine_data matches 0 store success score $placed_block gm4_machine_data if data entity @s {CustomName:'{"italic":false,"color":"white","translate":"item.gm4.minecart.bore","fallback":"Minecart with Piston"}'} run function gm4_tunnel_bores:machine/create_cart
