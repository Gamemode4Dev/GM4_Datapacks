# updates hopper minecarts with invalid items
# @s = hopper minecart with invalid item
# located at @s
# run from gm4_tunnel_bores:machine/destroy_cart/scan_hoppers

# replace correct slot with proper item
execute if items entity @s container.0 minecraft:furnace_minecart[custom_name={"translate":"item.gm4.minecart.bore","fallback":"Minecart with Piston"}] run loot replace entity @s container.0 loot gm4_tunnel_bores:entities/piston_minecart
execute if items entity @s container.1 minecraft:furnace_minecart[custom_name={"translate":"item.gm4.minecart.bore","fallback":"Minecart with Piston"}] run loot replace entity @s container.1 loot gm4_tunnel_bores:entities/piston_minecart
execute if items entity @s container.2 minecraft:furnace_minecart[custom_name={"translate":"item.gm4.minecart.bore","fallback":"Minecart with Piston"}] run loot replace entity @s container.2 loot gm4_tunnel_bores:entities/piston_minecart
execute if items entity @s container.3 minecraft:furnace_minecart[custom_name={"translate":"item.gm4.minecart.bore","fallback":"Minecart with Piston"}] run loot replace entity @s container.3 loot gm4_tunnel_bores:entities/piston_minecart
execute if items entity @s container.4 minecraft:furnace_minecart[custom_name={"translate":"item.gm4.minecart.bore","fallback":"Minecart with Piston"}] run loot replace entity @s container.4 loot gm4_tunnel_bores:entities/piston_minecart

scoreboard players set $found_item gm4_machine_data 1
