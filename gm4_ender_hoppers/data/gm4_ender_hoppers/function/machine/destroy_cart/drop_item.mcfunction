# drops the correct item
# @s = invalid item entity
# located at @s
# run from gm4_ender_hoppers:machine/destroy_cart

# drop item, and set flag
execute store success score $dropped_item gm4_machine_data run loot spawn ~ ~ ~ loot gm4_ender_hoppers:entities/ender_hopper_minecart
particle explosion ~ ~ ~

# kill original (invalid) item
kill @s

