# drops the correct item
# @s = invalid item entity
# located at @s
# run from gm4_liquid_minecarts:machine/destroy_cart

# drop item, and set flag
execute store success score $dropped_item gm4_machine_data run loot spawn ~ ~ ~ loot gm4_liquid_minecarts:entities/liquid_minecart

# kill original (invalid) item
kill @s

