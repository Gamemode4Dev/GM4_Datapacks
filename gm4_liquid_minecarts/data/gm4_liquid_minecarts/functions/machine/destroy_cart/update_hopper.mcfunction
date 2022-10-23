# updates hoppers with invalid items
# @s = liquid_minecart marker
# located at the hopper with an invalid item
# run from gm4_liquid_minecarts:machine/destroy_cart/scan_hoppers

# replace correct slot with proper item
data modify storage gm4_machines:temp Items set from block ~ ~ ~ Items
execute if data storage gm4_machines:temp Items[{Slot:0b,tag:{display:{Name:'{"italic":false,"text":"Liquid Minecart"}'}}}] run loot replace block ~ ~ ~ container.0 loot gm4_liquid_minecarts:entities/liquid_minecart
execute if data storage gm4_machines:temp Items[{Slot:1b,tag:{display:{Name:'{"italic":false,"text":"Liquid Minecart"}'}}}] run loot replace block ~ ~ ~ container.1 loot gm4_liquid_minecarts:entities/liquid_minecart
execute if data storage gm4_machines:temp Items[{Slot:2b,tag:{display:{Name:'{"italic":false,"text":"Liquid Minecart"}'}}}] run loot replace block ~ ~ ~ container.2 loot gm4_liquid_minecarts:entities/liquid_minecart
execute if data storage gm4_machines:temp Items[{Slot:3b,tag:{display:{Name:'{"italic":false,"text":"Liquid Minecart"}'}}}] run loot replace block ~ ~ ~ container.3 loot gm4_liquid_minecarts:entities/liquid_minecart
execute if data storage gm4_machines:temp Items[{Slot:4b,tag:{display:{Name:'{"italic":false,"text":"Liquid Minecart"}'}}}] run loot replace block ~ ~ ~ container.4 loot gm4_liquid_minecarts:entities/liquid_minecart

# clean up
data remove storage gm4_machines:temp Items
scoreboard players set $found_item gm4_machine_data 1
