# drops the correct item
# @s = invalid item entity
# located at @s
# run from gm4_tunnel_bores:machine/destroy_cart

# drop item, and set flag
execute store success score $dropped_item gm4_machine_data as @e[type=area_effect_cloud,limit=1,tag=gm4_destroyed_bore_storage] run loot spawn ~ ~ ~ loot gm4_tunnel_bores:entities/piston_minecart

# kill original (invalid) item
kill @s
