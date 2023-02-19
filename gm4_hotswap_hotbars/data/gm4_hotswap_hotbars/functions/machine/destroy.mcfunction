# destroys the hotswapper marker
# @s = hotswapper marker
# located at @s
# run from gm4_hotswap_hotbars:machine/verify_destroy

# update item
scoreboard players set $dropped_item gm4_machine_data 0
data modify storage gm4_hotswap_hotbars:temp item_data set from entity @s data.gm4_hotswap_hotbars.item_data
execute store success score $dropped_item gm4_machine_data as @e[type=item,nbt={Item:{tag:{display:{Name:'{"italic":false,"translate":"%1$s%3427655$s","with":["Customize Hotbars",{"translate":"gui.gm4.hotswapper"}]}'}}}},distance=..2,limit=1,sort=nearest] run data modify entity @s Item.tag merge from storage gm4_hotswap_hotbars:temp item_data

# scan hoppers if no item was updated
execute if score $dropped_item gm4_machine_data matches 0 run function gm4_hotswap_hotbars:machine/destroy/scan_hoppers

# kill marker
kill @s
