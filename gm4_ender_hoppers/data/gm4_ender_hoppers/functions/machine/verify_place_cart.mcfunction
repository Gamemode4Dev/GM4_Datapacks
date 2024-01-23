# verifies that the placed down machine minecart was from this module
# @s = machine minecart
# located at the machine minecart
# run from #gm4_machines:place_cart

execute if score $placed_block gm4_machine_data matches 0 store success score $placed_block gm4_machine_data if data entity @s {CustomName:'{"italic":false,"translate":"item.gm4.ender_hopper_minecart","fallback":"Minecart with Ender Hopper"}'} run function gm4_ender_hoppers:machine/create_cart
