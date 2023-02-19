# updates hopper minecarts with invalid items
# @s = hopper minecart with invalid item
# located at @s
# run from gm4_hotswap_hotbars:machine/destroy/scan_hoppers

# replace correct slot with proper item
data modify storage gm4_machines:temp Items set from entity @s Items
execute if score $found_item gm4_machine_data matches 0 store result score $found_item gm4_machine_data if data storage gm4_machines:temp Items[{Slot:0b,tag:{display:{Name:'{"italic":false,"translate":"%1$s%3427655$s","with":["Customize Hotbars",{"translate":"gui.gm4.hotswapper"}]}'}}}] run data modify entity @s Items[{Slot:0b}].tag merge from storage gm4_hotswap_hotbars:temp item_data
execute if score $found_item gm4_machine_data matches 0 store result score $found_item gm4_machine_data if data storage gm4_machines:temp Items[{Slot:1b,tag:{display:{Name:'{"italic":false,"translate":"%1$s%3427655$s","with":["Customize Hotbars",{"translate":"gui.gm4.hotswapper"}]}'}}}] run data modify entity @s Items[{Slot:1b}].tag merge from storage gm4_hotswap_hotbars:temp item_data
execute if score $found_item gm4_machine_data matches 0 store result score $found_item gm4_machine_data if data storage gm4_machines:temp Items[{Slot:2b,tag:{display:{Name:'{"italic":false,"translate":"%1$s%3427655$s","with":["Customize Hotbars",{"translate":"gui.gm4.hotswapper"}]}'}}}] run data modify entity @s Items[{Slot:2b}].tag merge from storage gm4_hotswap_hotbars:temp item_data
execute if score $found_item gm4_machine_data matches 0 store result score $found_item gm4_machine_data if data storage gm4_machines:temp Items[{Slot:3b,tag:{display:{Name:'{"italic":false,"translate":"%1$s%3427655$s","with":["Customize Hotbars",{"translate":"gui.gm4.hotswapper"}]}'}}}] run data modify entity @s Items[{Slot:3b}].tag merge from storage gm4_hotswap_hotbars:temp item_data
execute if score $found_item gm4_machine_data matches 0 store result score $found_item gm4_machine_data if data storage gm4_machines:temp Items[{Slot:4b,tag:{display:{Name:'{"italic":false,"translate":"%1$s%3427655$s","with":["Customize Hotbars",{"translate":"gui.gm4.hotswapper"}]}'}}}] run data modify entity @s Items[{Slot:4b}].tag merge from storage gm4_hotswap_hotbars:temp item_data

# clean up
data remove storage gm4_machines:temp Items
scoreboard players set $found_item gm4_machine_data 1
