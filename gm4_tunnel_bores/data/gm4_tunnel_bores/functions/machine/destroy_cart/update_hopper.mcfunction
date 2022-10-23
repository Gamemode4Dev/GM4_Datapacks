# updates hoppers with invalid items
# @s = tunnel_bore marker
# located at the hopper with an invalid item
# run from gm4_tunnel_bores:machine/destroy_cart/scan_hoppers

# replace correct slot with proper item
data modify storage gm4_machines:temp Items set from block ~ ~ ~ Items
execute if data storage gm4_machines:temp Items[{Slot:0b,tag:{display:{Name:'{"text":"Minecart with Piston"}'}}}] run loot replace block ~ ~ ~ container.0 loot gm4_tunnel_bores:entities/piston_minecart
execute if data storage gm4_machines:temp Items[{Slot:1b,tag:{display:{Name:'{"text":"Minecart with Piston"}'}}}] run loot replace block ~ ~ ~ container.1 loot gm4_tunnel_bores:entities/piston_minecart
execute if data storage gm4_machines:temp Items[{Slot:2b,tag:{display:{Name:'{"text":"Minecart with Piston"}'}}}] run loot replace block ~ ~ ~ container.2 loot gm4_tunnel_bores:entities/piston_minecart
execute if data storage gm4_machines:temp Items[{Slot:3b,tag:{display:{Name:'{"text":"Minecart with Piston"}'}}}] run loot replace block ~ ~ ~ container.3 loot gm4_tunnel_bores:entities/piston_minecart
execute if data storage gm4_machines:temp Items[{Slot:4b,tag:{display:{Name:'{"text":"Minecart with Piston"}'}}}] run loot replace block ~ ~ ~ container.4 loot gm4_tunnel_bores:entities/piston_minecart

# clean up
data remove storage gm4_machines:temp Items
scoreboard players set $found_item gm4_machine_data 1
