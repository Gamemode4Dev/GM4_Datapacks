# updates hopper minecarts with invalid items
# @s = hopper minecart with invalid item
# located at @s
# run from gm4_liquid_minecarts:machine/destroy_cart/scan_hoppers

# replace correct slot with proper item
data modify storage gm4_machines:temp Items set from entity @s Items
execute if data storage gm4_machines:temp Items[{Slot:0b,tag:{display:{Name:'{"text":"Liquid Minecart","italic":false}'}}}] run loot replace entity @s container.0 loot gm4_liquid_minecarts:entities/liquid_minecart
execute if data storage gm4_machines:temp Items[{Slot:1b,tag:{display:{Name:'{"text":"Liquid Minecart","italic":false}'}}}] run loot replace entity @s container.1 loot gm4_liquid_minecarts:entities/liquid_minecart
execute if data storage gm4_machines:temp Items[{Slot:2b,tag:{display:{Name:'{"text":"Liquid Minecart","italic":false}'}}}] run loot replace entity @s container.2 loot gm4_liquid_minecarts:entities/liquid_minecart
execute if data storage gm4_machines:temp Items[{Slot:3b,tag:{display:{Name:'{"text":"Liquid Minecart","italic":false}'}}}] run loot replace entity @s container.3 loot gm4_liquid_minecarts:entities/liquid_minecart
execute if data storage gm4_machines:temp Items[{Slot:4b,tag:{display:{Name:'{"text":"Liquid Minecart","italic":false}'}}}] run loot replace entity @s container.4 loot gm4_liquid_minecarts:entities/liquid_minecart

# clean up
data remove storage gm4_machines:temp Items
scoreboard players set $found_item gm4_machine_data 1
