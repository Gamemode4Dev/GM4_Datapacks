# drops the correct item
# @s = invalid item entity
# located at @s
# run from gm4_tunnel_bores:machine/destroy_cart

# drop item, and set flag
execute store success score $dropped_item gm4_machine_data run loot spawn ~ ~ ~ loot gm4_tunnel_bores:entities/piston_minecart

# kill original (invalid) item
kill @s
