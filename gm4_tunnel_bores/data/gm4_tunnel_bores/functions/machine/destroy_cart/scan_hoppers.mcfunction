# searches for hoppers with invalid items
# @s = tunnel_bore marker
# located at @s
# run from gm4_tunnel_bores:machine/destroy_cart

# find hopper with the invalid item
scoreboard players set $found_item gm4_machine_data 0
execute if score $found_item gm4_machine_data matches 0 positioned ~00 ~00 ~00 if block ~ ~ ~ hopper{Items:[{id:"minecraft:furnace_minecart",tag:{display:{Name:'{"text":"Minecart with Piston"}'}}}]} run function gm4_tunnel_bores:machine/destroy_cart/update_hopper
execute if score $found_item gm4_machine_data matches 0 positioned ~01 ~00 ~00 if block ~ ~ ~ hopper{Items:[{id:"minecraft:furnace_minecart",tag:{display:{Name:'{"text":"Minecart with Piston"}'}}}]} run function gm4_tunnel_bores:machine/destroy_cart/update_hopper
execute if score $found_item gm4_machine_data matches 0 positioned ~-1 ~00 ~00 if block ~ ~ ~ hopper{Items:[{id:"minecraft:furnace_minecart",tag:{display:{Name:'{"text":"Minecart with Piston"}'}}}]} run function gm4_tunnel_bores:machine/destroy_cart/update_hopper
execute if score $found_item gm4_machine_data matches 0 positioned ~00 ~00 ~01 if block ~ ~ ~ hopper{Items:[{id:"minecraft:furnace_minecart",tag:{display:{Name:'{"text":"Minecart with Piston"}'}}}]} run function gm4_tunnel_bores:machine/destroy_cart/update_hopper
execute if score $found_item gm4_machine_data matches 0 positioned ~01 ~00 ~01 if block ~ ~ ~ hopper{Items:[{id:"minecraft:furnace_minecart",tag:{display:{Name:'{"text":"Minecart with Piston"}'}}}]} run function gm4_tunnel_bores:machine/destroy_cart/update_hopper
execute if score $found_item gm4_machine_data matches 0 positioned ~-1 ~00 ~01 if block ~ ~ ~ hopper{Items:[{id:"minecraft:furnace_minecart",tag:{display:{Name:'{"text":"Minecart with Piston"}'}}}]} run function gm4_tunnel_bores:machine/destroy_cart/update_hopper
execute if score $found_item gm4_machine_data matches 0 positioned ~00 ~00 ~-1 if block ~ ~ ~ hopper{Items:[{id:"minecraft:furnace_minecart",tag:{display:{Name:'{"text":"Minecart with Piston"}'}}}]} run function gm4_tunnel_bores:machine/destroy_cart/update_hopper
execute if score $found_item gm4_machine_data matches 0 positioned ~01 ~00 ~-1 if block ~ ~ ~ hopper{Items:[{id:"minecraft:furnace_minecart",tag:{display:{Name:'{"text":"Minecart with Piston"}'}}}]} run function gm4_tunnel_bores:machine/destroy_cart/update_hopper
execute if score $found_item gm4_machine_data matches 0 positioned ~-1 ~00 ~-1 if block ~ ~ ~ hopper{Items:[{id:"minecraft:furnace_minecart",tag:{display:{Name:'{"text":"Minecart with Piston"}'}}}]} run function gm4_tunnel_bores:machine/destroy_cart/update_hopper

execute if score $found_item gm4_machine_data matches 0 positioned ~00 ~-1 ~00 if block ~ ~ ~ hopper{Items:[{id:"minecraft:furnace_minecart",tag:{display:{Name:'{"text":"Minecart with Piston"}'}}}]} run function gm4_tunnel_bores:machine/destroy_cart/update_hopper
execute if score $found_item gm4_machine_data matches 0 positioned ~01 ~-1 ~00 if block ~ ~ ~ hopper{Items:[{id:"minecraft:furnace_minecart",tag:{display:{Name:'{"text":"Minecart with Piston"}'}}}]} run function gm4_tunnel_bores:machine/destroy_cart/update_hopper
execute if score $found_item gm4_machine_data matches 0 positioned ~-1 ~-1 ~00 if block ~ ~ ~ hopper{Items:[{id:"minecraft:furnace_minecart",tag:{display:{Name:'{"text":"Minecart with Piston"}'}}}]} run function gm4_tunnel_bores:machine/destroy_cart/update_hopper
execute if score $found_item gm4_machine_data matches 0 positioned ~00 ~-1 ~01 if block ~ ~ ~ hopper{Items:[{id:"minecraft:furnace_minecart",tag:{display:{Name:'{"text":"Minecart with Piston"}'}}}]} run function gm4_tunnel_bores:machine/destroy_cart/update_hopper
execute if score $found_item gm4_machine_data matches 0 positioned ~01 ~-1 ~01 if block ~ ~ ~ hopper{Items:[{id:"minecraft:furnace_minecart",tag:{display:{Name:'{"text":"Minecart with Piston"}'}}}]} run function gm4_tunnel_bores:machine/destroy_cart/update_hopper
execute if score $found_item gm4_machine_data matches 0 positioned ~-1 ~-1 ~01 if block ~ ~ ~ hopper{Items:[{id:"minecraft:furnace_minecart",tag:{display:{Name:'{"text":"Minecart with Piston"}'}}}]} run function gm4_tunnel_bores:machine/destroy_cart/update_hopper
execute if score $found_item gm4_machine_data matches 0 positioned ~00 ~-1 ~-1 if block ~ ~ ~ hopper{Items:[{id:"minecraft:furnace_minecart",tag:{display:{Name:'{"text":"Minecart with Piston"}'}}}]} run function gm4_tunnel_bores:machine/destroy_cart/update_hopper
execute if score $found_item gm4_machine_data matches 0 positioned ~01 ~-1 ~-1 if block ~ ~ ~ hopper{Items:[{id:"minecraft:furnace_minecart",tag:{display:{Name:'{"text":"Minecart with Piston"}'}}}]} run function gm4_tunnel_bores:machine/destroy_cart/update_hopper
execute if score $found_item gm4_machine_data matches 0 positioned ~-1 ~-1 ~-1 if block ~ ~ ~ hopper{Items:[{id:"minecraft:furnace_minecart",tag:{display:{Name:'{"text":"Minecart with Piston"}'}}}]} run function gm4_tunnel_bores:machine/destroy_cart/update_hopper

execute if score $found_item gm4_machine_data matches 0 positioned ~00 ~-2 ~00 if block ~ ~ ~ hopper{Items:[{id:"minecraft:furnace_minecart",tag:{display:{Name:'{"text":"Minecart with Piston"}'}}}]} run function gm4_tunnel_bores:machine/destroy_cart/update_hopper
execute if score $found_item gm4_machine_data matches 0 positioned ~01 ~-2 ~00 if block ~ ~ ~ hopper{Items:[{id:"minecraft:furnace_minecart",tag:{display:{Name:'{"text":"Minecart with Piston"}'}}}]} run function gm4_tunnel_bores:machine/destroy_cart/update_hopper
execute if score $found_item gm4_machine_data matches 0 positioned ~-1 ~-2 ~00 if block ~ ~ ~ hopper{Items:[{id:"minecraft:furnace_minecart",tag:{display:{Name:'{"text":"Minecart with Piston"}'}}}]} run function gm4_tunnel_bores:machine/destroy_cart/update_hopper
execute if score $found_item gm4_machine_data matches 0 positioned ~00 ~-2 ~01 if block ~ ~ ~ hopper{Items:[{id:"minecraft:furnace_minecart",tag:{display:{Name:'{"text":"Minecart with Piston"}'}}}]} run function gm4_tunnel_bores:machine/destroy_cart/update_hopper
execute if score $found_item gm4_machine_data matches 0 positioned ~01 ~-2 ~01 if block ~ ~ ~ hopper{Items:[{id:"minecraft:furnace_minecart",tag:{display:{Name:'{"text":"Minecart with Piston"}'}}}]} run function gm4_tunnel_bores:machine/destroy_cart/update_hopper
execute if score $found_item gm4_machine_data matches 0 positioned ~-1 ~-2 ~01 if block ~ ~ ~ hopper{Items:[{id:"minecraft:furnace_minecart",tag:{display:{Name:'{"text":"Minecart with Piston"}'}}}]} run function gm4_tunnel_bores:machine/destroy_cart/update_hopper
execute if score $found_item gm4_machine_data matches 0 positioned ~00 ~-2 ~-1 if block ~ ~ ~ hopper{Items:[{id:"minecraft:furnace_minecart",tag:{display:{Name:'{"text":"Minecart with Piston"}'}}}]} run function gm4_tunnel_bores:machine/destroy_cart/update_hopper
execute if score $found_item gm4_machine_data matches 0 positioned ~01 ~-2 ~-1 if block ~ ~ ~ hopper{Items:[{id:"minecraft:furnace_minecart",tag:{display:{Name:'{"text":"Minecart with Piston"}'}}}]} run function gm4_tunnel_bores:machine/destroy_cart/update_hopper
execute if score $found_item gm4_machine_data matches 0 positioned ~-1 ~-2 ~-1 if block ~ ~ ~ hopper{Items:[{id:"minecraft:furnace_minecart",tag:{display:{Name:'{"text":"Minecart with Piston"}'}}}]} run function gm4_tunnel_bores:machine/destroy_cart/update_hopper

# if no hoppers found, find hopper minecarts with the invalid item
execute if score $found_item gm4_machine_data matches 0 as @e[type=hopper_minecart,distance=..3,nbt={Items:[{id:"minecraft:furnace_minecart",tag:{display:{Name:'{"text":"Minecart with Piston"}'}}}]}] run function gm4_tunnel_bores:machine/destroy_cart/update_hopper_minecart
