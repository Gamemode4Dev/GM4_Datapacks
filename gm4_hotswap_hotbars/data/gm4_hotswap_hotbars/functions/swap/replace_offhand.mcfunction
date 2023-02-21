# converts the hotswapper shulker box to a firework star
# @s = player who has moved a hotswapper into their offhand
# at @s
# run from advancement "gm4_hotswap_hotbars:hotswapper_offhand"

advancement revoke @s only gm4_hotswap_hotbars:hotswapper_offhand

# get item data
data modify storage gm4_hotswap_hotbars:temp Item set from entity @s Inventory[{Slot:-106b}]
data modify storage gm4_hotswap_hotbars:temp Item.tag.gm4_hotswap_hotbars.item set value "hotswapper_item"

# set color
scoreboard players set $color gm4_hh_data -1
execute if score $color gm4_hh_data matches -1 if data storage gm4_hotswap_hotbars:temp {Item:{id:"minecraft:shulker_box"}} run scoreboard players set $color gm4_hh_data 0
execute if score $color gm4_hh_data matches -1 if data storage gm4_hotswap_hotbars:temp {Item:{id:"minecraft:white_shulker_box"}} run scoreboard players set $color gm4_hh_data 1
execute if score $color gm4_hh_data matches -1 if data storage gm4_hotswap_hotbars:temp {Item:{id:"minecraft:light_gray_shulker_box"}} run scoreboard players set $color gm4_hh_data 2
execute if score $color gm4_hh_data matches -1 if data storage gm4_hotswap_hotbars:temp {Item:{id:"minecraft:gray_shulker_box"}} run scoreboard players set $color gm4_hh_data 3
execute if score $color gm4_hh_data matches -1 if data storage gm4_hotswap_hotbars:temp {Item:{id:"minecraft:black_shulker_box"}} run scoreboard players set $color gm4_hh_data 4
execute if score $color gm4_hh_data matches -1 if data storage gm4_hotswap_hotbars:temp {Item:{id:"minecraft:brown_shulker_box"}} run scoreboard players set $color gm4_hh_data 5
execute if score $color gm4_hh_data matches -1 if data storage gm4_hotswap_hotbars:temp {Item:{id:"minecraft:red_shulker_box"}} run scoreboard players set $color gm4_hh_data 6
execute if score $color gm4_hh_data matches -1 if data storage gm4_hotswap_hotbars:temp {Item:{id:"minecraft:orange_shulker_box"}} run scoreboard players set $color gm4_hh_data 7
execute if score $color gm4_hh_data matches -1 if data storage gm4_hotswap_hotbars:temp {Item:{id:"minecraft:yellow_shulker_box"}} run scoreboard players set $color gm4_hh_data 8
execute if score $color gm4_hh_data matches -1 if data storage gm4_hotswap_hotbars:temp {Item:{id:"minecraft:lime_shulker_box"}} run scoreboard players set $color gm4_hh_data 9
execute if score $color gm4_hh_data matches -1 if data storage gm4_hotswap_hotbars:temp {Item:{id:"minecraft:green_shulker_box"}} run scoreboard players set $color gm4_hh_data 10
execute if score $color gm4_hh_data matches -1 if data storage gm4_hotswap_hotbars:temp {Item:{id:"minecraft:cyan_shulker_box"}} run scoreboard players set $color gm4_hh_data 11
execute if score $color gm4_hh_data matches -1 if data storage gm4_hotswap_hotbars:temp {Item:{id:"minecraft:light_blue_shulker_box"}} run scoreboard players set $color gm4_hh_data 12
execute if score $color gm4_hh_data matches -1 if data storage gm4_hotswap_hotbars:temp {Item:{id:"minecraft:blue_shulker_box"}} run scoreboard players set $color gm4_hh_data 13
execute if score $color gm4_hh_data matches -1 if data storage gm4_hotswap_hotbars:temp {Item:{id:"minecraft:purple_shulker_box"}} run scoreboard players set $color gm4_hh_data 14
execute if score $color gm4_hh_data matches -1 if data storage gm4_hotswap_hotbars:temp {Item:{id:"minecraft:magenta_shulker_box"}} run scoreboard players set $color gm4_hh_data 15
execute if score $color gm4_hh_data matches -1 if data storage gm4_hotswap_hotbars:temp {Item:{id:"minecraft:pink_shulker_box"}} run scoreboard players set $color gm4_hh_data 16

loot replace entity @s weapon.offhand loot gm4_hotswap_hotbars:technical/convert_offhand

data remove storage gm4_hotswap_hotbars:temp Item
