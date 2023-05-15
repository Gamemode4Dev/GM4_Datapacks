# updates hoppers with invalid items
# @s = ender_hopper marker
# located at the hopper with an invalid item
# run from gm4_ender_hoppers:machine/destroy_cart/scan_hoppers

# replace correct slot with proper item
data modify storage gm4_machines:temp Items set from block ~ ~ ~ Items
execute if data storage gm4_machines:temp Items[{Slot:0b,tag:{display:{Name:'{"translate":"gm4.second","fallback":"%1$s","with":[{"translate":"container.gm4.ender_hopper_minecart","fallback":"Ender Hopper Minecart"},{"color":"white","font":"gm4:container_gui","extra":[{"color":"#404040","font":"gm4:default","translate":"container.gm4.ender_hopper_minecart","fallback":"Ender Hopper Minecart"}],"translate":"gui.gm4.ender_hopper_minecart","fallback":""}]}'}}}] run loot replace block ~ ~ ~ container.0 loot gm4_ender_hoppers:entities/ender_hopper_minecart
execute if data storage gm4_machines:temp Items[{Slot:1b,tag:{display:{Name:'{"translate":"gm4.second","fallback":"%1$s","with":[{"translate":"container.gm4.ender_hopper_minecart","fallback":"Ender Hopper Minecart"},{"color":"white","font":"gm4:container_gui","extra":[{"color":"#404040","font":"gm4:default","translate":"container.gm4.ender_hopper_minecart","fallback":"Ender Hopper Minecart"}],"translate":"gui.gm4.ender_hopper_minecart","fallback":""}]}'}}}] run loot replace block ~ ~ ~ container.1 loot gm4_ender_hoppers:entities/ender_hopper_minecart
execute if data storage gm4_machines:temp Items[{Slot:2b,tag:{display:{Name:'{"translate":"gm4.second","fallback":"%1$s","with":[{"translate":"container.gm4.ender_hopper_minecart","fallback":"Ender Hopper Minecart"},{"color":"white","font":"gm4:container_gui","extra":[{"color":"#404040","font":"gm4:default","translate":"container.gm4.ender_hopper_minecart","fallback":"Ender Hopper Minecart"}],"translate":"gui.gm4.ender_hopper_minecart","fallback":""}]}'}}}] run loot replace block ~ ~ ~ container.2 loot gm4_ender_hoppers:entities/ender_hopper_minecart
execute if data storage gm4_machines:temp Items[{Slot:3b,tag:{display:{Name:'{"translate":"gm4.second","fallback":"%1$s","with":[{"translate":"container.gm4.ender_hopper_minecart","fallback":"Ender Hopper Minecart"},{"color":"white","font":"gm4:container_gui","extra":[{"color":"#404040","font":"gm4:default","translate":"container.gm4.ender_hopper_minecart","fallback":"Ender Hopper Minecart"}],"translate":"gui.gm4.ender_hopper_minecart","fallback":""}]}'}}}] run loot replace block ~ ~ ~ container.3 loot gm4_ender_hoppers:entities/ender_hopper_minecart
execute if data storage gm4_machines:temp Items[{Slot:4b,tag:{display:{Name:'{"translate":"gm4.second","fallback":"%1$s","with":[{"translate":"container.gm4.ender_hopper_minecart","fallback":"Ender Hopper Minecart"},{"color":"white","font":"gm4:container_gui","extra":[{"color":"#404040","font":"gm4:default","translate":"container.gm4.ender_hopper_minecart","fallback":"Ender Hopper Minecart"}],"translate":"gui.gm4.ender_hopper_minecart","fallback":""}]}'}}}] run loot replace block ~ ~ ~ container.4 loot gm4_ender_hoppers:entities/ender_hopper_minecart

# clean up
data remove storage gm4_machines:temp Items
scoreboard players set $found_item gm4_machine_data 1
