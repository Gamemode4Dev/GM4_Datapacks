# swaps hotbars
# @s = player who has a hotswapper in their mainhand (and none in their offhand)
# at @s
# run from advancement "gm4_hotswap_hotbars:activate_hotswapper"

advancement revoke @s only gm4_hotswap_hotbars:activate_hotswapper

# restore mainhand
data remove block 29999998 1 7134 Items
item replace block 29999998 1 7134 container.0 from entity @s weapon.offhand
item replace entity @s weapon.offhand from entity @s weapon.mainhand
item replace entity @s weapon.mainhand from block 29999998 1 7134 container.0

# get shulker box items and current player inventory
data remove block 29999998 1 7134 Items
data modify storage gm4_hotswap_hotbars:temp Inventory set from entity @s Inventory
data modify storage gm4_hotswap_hotbars:temp Items set from storage gm4_hotswap_hotbars:temp Inventory[{Slot:-106b}].tag.BlockEntityTag.Items
data modify block 29999998 1 7134 Items set from storage gm4_hotswap_hotbars:temp Items

# prevent hotswappers and shulker boxes from being saved
data merge storage gm4_hotswap_hotbars:temp {invalid_items:[]}
data modify storage gm4_hotswap_hotbars:temp invalid_items append from storage gm4_hotswap_hotbars:temp Inventory[{id:"minecraft:shulker_box"}]
data modify storage gm4_hotswap_hotbars:temp invalid_items append from storage gm4_hotswap_hotbars:temp Inventory[{id:"minecraft:white_shulker_box"}]
data modify storage gm4_hotswap_hotbars:temp invalid_items append from storage gm4_hotswap_hotbars:temp Inventory[{id:"minecraft:light_gray_shulker_box"}]
data modify storage gm4_hotswap_hotbars:temp invalid_items append from storage gm4_hotswap_hotbars:temp Inventory[{id:"minecraft:gray_shulker_box"}]
data modify storage gm4_hotswap_hotbars:temp invalid_items append from storage gm4_hotswap_hotbars:temp Inventory[{id:"minecraft:black_shulker_box"}]
data modify storage gm4_hotswap_hotbars:temp invalid_items append from storage gm4_hotswap_hotbars:temp Inventory[{id:"minecraft:brown_shulker_box"}]
data modify storage gm4_hotswap_hotbars:temp invalid_items append from storage gm4_hotswap_hotbars:temp Inventory[{id:"minecraft:red_shulker_box"}]
data modify storage gm4_hotswap_hotbars:temp invalid_items append from storage gm4_hotswap_hotbars:temp Inventory[{id:"minecraft:orange_shulker_box"}]
data modify storage gm4_hotswap_hotbars:temp invalid_items append from storage gm4_hotswap_hotbars:temp Inventory[{id:"minecraft:yellow_shulker_box"}]
data modify storage gm4_hotswap_hotbars:temp invalid_items append from storage gm4_hotswap_hotbars:temp Inventory[{id:"minecraft:lime_shulker_box"}]
data modify storage gm4_hotswap_hotbars:temp invalid_items append from storage gm4_hotswap_hotbars:temp Inventory[{id:"minecraft:green_shulker_box"}]
data modify storage gm4_hotswap_hotbars:temp invalid_items append from storage gm4_hotswap_hotbars:temp Inventory[{id:"minecraft:cyan_shulker_box"}]
data modify storage gm4_hotswap_hotbars:temp invalid_items append from storage gm4_hotswap_hotbars:temp Inventory[{id:"minecraft:light_blueshulker_box"}]
data modify storage gm4_hotswap_hotbars:temp invalid_items append from storage gm4_hotswap_hotbars:temp Inventory[{id:"minecraft:blue_shulker_box"}]
data modify storage gm4_hotswap_hotbars:temp invalid_items append from storage gm4_hotswap_hotbars:temp Inventory[{id:"minecraft:purple_shulker_box"}]
data modify storage gm4_hotswap_hotbars:temp invalid_items append from storage gm4_hotswap_hotbars:temp Inventory[{id:"minecraft:magenta_shulker_box"}]
data modify storage gm4_hotswap_hotbars:temp invalid_items append from storage gm4_hotswap_hotbars:temp Inventory[{id:"minecraft:pink_shulker_box"}]
data modify storage gm4_hotswap_hotbars:temp invalid_items append from storage gm4_hotswap_hotbars:temp Inventory[{tag:{gm4_hotswap_hotbars:{item:"hotswapper_item"}}}]
data remove storage gm4_hotswap_hotbars:temp invalid_items[{Slot:-106b}]

data remove storage gm4_hotswap_hotbars:temp Inventory[{id:"minecraft:shulker_box"}]
data remove storage gm4_hotswap_hotbars:temp Inventory[{id:"minecraft:white_shulker_box"}]
data remove storage gm4_hotswap_hotbars:temp Inventory[{id:"minecraft:light_gray_shulker_box"}]
data remove storage gm4_hotswap_hotbars:temp Inventory[{id:"minecraft:gray_shulker_box"}]
data remove storage gm4_hotswap_hotbars:temp Inventory[{id:"minecraft:black_shulker_box"}]
data remove storage gm4_hotswap_hotbars:temp Inventory[{id:"minecraft:brown_shulker_box"}]
data remove storage gm4_hotswap_hotbars:temp Inventory[{id:"minecraft:red_shulker_box"}]
data remove storage gm4_hotswap_hotbars:temp Inventory[{id:"minecraft:orange_shulker_box"}]
data remove storage gm4_hotswap_hotbars:temp Inventory[{id:"minecraft:yellow_shulker_box"}]
data remove storage gm4_hotswap_hotbars:temp Inventory[{id:"minecraft:lime_shulker_box"}]
data remove storage gm4_hotswap_hotbars:temp Inventory[{id:"minecraft:green_shulker_box"}]
data remove storage gm4_hotswap_hotbars:temp Inventory[{id:"minecraft:cyan_shulker_box"}]
data remove storage gm4_hotswap_hotbars:temp Inventory[{id:"minecraft:light_blue_shulker_box"}]
data remove storage gm4_hotswap_hotbars:temp Inventory[{id:"minecraft:blue_shulker_box"}]
data remove storage gm4_hotswap_hotbars:temp Inventory[{id:"minecraft:purple_shulker_box"}]
data remove storage gm4_hotswap_hotbars:temp Inventory[{id:"minecraft:magenta_shulker_box"}]
data remove storage gm4_hotswap_hotbars:temp Inventory[{id:"minecraft:pink_shulker_box"}]
data remove storage gm4_hotswap_hotbars:temp Inventory[{tag:{gm4_hotswap_hotbars:{item:"hotswapper_item"}}}]

# drop invalid items
scoreboard players set $invalid_items gm4_hh_data 0
execute store result score $invalid_items gm4_hh_data if data storage gm4_hotswap_hotbars:temp invalid_items[-1]
execute if score $invalid_items gm4_hh_data matches 1.. run function gm4_hotswap_hotbars:swap/drop_invalid_item

# change hotbar to last shulker box row
item replace entity @s hotbar.0 from block 29999998 1 7134 container.18
item replace entity @s hotbar.1 from block 29999998 1 7134 container.19
item replace entity @s hotbar.2 from block 29999998 1 7134 container.20
item replace entity @s hotbar.3 from block 29999998 1 7134 container.21
item replace entity @s hotbar.4 from block 29999998 1 7134 container.22
item replace entity @s hotbar.5 from block 29999998 1 7134 container.23
item replace entity @s hotbar.6 from block 29999998 1 7134 container.24
item replace entity @s hotbar.7 from block 29999998 1 7134 container.25
item replace entity @s hotbar.8 from block 29999998 1 7134 container.26

# shift shulker box down 1 row
item replace block 29999998 1 7134 container.18 from block 29999998 1 7134 container.9
item replace block 29999998 1 7134 container.19 from block 29999998 1 7134 container.10
item replace block 29999998 1 7134 container.20 from block 29999998 1 7134 container.11
item replace block 29999998 1 7134 container.21 from block 29999998 1 7134 container.12
item replace block 29999998 1 7134 container.22 from block 29999998 1 7134 container.13
item replace block 29999998 1 7134 container.23 from block 29999998 1 7134 container.14
item replace block 29999998 1 7134 container.24 from block 29999998 1 7134 container.15
item replace block 29999998 1 7134 container.25 from block 29999998 1 7134 container.16
item replace block 29999998 1 7134 container.26 from block 29999998 1 7134 container.17

item replace block 29999998 1 7134 container.9 from block 29999998 1 7134 container.0
item replace block 29999998 1 7134 container.10 from block 29999998 1 7134 container.1
item replace block 29999998 1 7134 container.11 from block 29999998 1 7134 container.2
item replace block 29999998 1 7134 container.12 from block 29999998 1 7134 container.3
item replace block 29999998 1 7134 container.13 from block 29999998 1 7134 container.4
item replace block 29999998 1 7134 container.14 from block 29999998 1 7134 container.5
item replace block 29999998 1 7134 container.15 from block 29999998 1 7134 container.6
item replace block 29999998 1 7134 container.16 from block 29999998 1 7134 container.7
item replace block 29999998 1 7134 container.17 from block 29999998 1 7134 container.8

# replace first row of shulker box with player's old hotbar
item replace block 29999998 1 7134 container.0 with air
item replace block 29999998 1 7134 container.1 with air
item replace block 29999998 1 7134 container.2 with air
item replace block 29999998 1 7134 container.3 with air
item replace block 29999998 1 7134 container.4 with air
item replace block 29999998 1 7134 container.5 with air
item replace block 29999998 1 7134 container.6 with air
item replace block 29999998 1 7134 container.7 with air
item replace block 29999998 1 7134 container.8 with air

data modify storage gm4_hotswap_hotbars:temp Items set value []
data modify storage gm4_hotswap_hotbars:temp Items append from storage gm4_hotswap_hotbars:temp Inventory[{Slot:0b}]
data modify storage gm4_hotswap_hotbars:temp Items append from storage gm4_hotswap_hotbars:temp Inventory[{Slot:1b}]
data modify storage gm4_hotswap_hotbars:temp Items append from storage gm4_hotswap_hotbars:temp Inventory[{Slot:2b}]
data modify storage gm4_hotswap_hotbars:temp Items append from storage gm4_hotswap_hotbars:temp Inventory[{Slot:3b}]
data modify storage gm4_hotswap_hotbars:temp Items append from storage gm4_hotswap_hotbars:temp Inventory[{Slot:4b}]
data modify storage gm4_hotswap_hotbars:temp Items append from storage gm4_hotswap_hotbars:temp Inventory[{Slot:5b}]
data modify storage gm4_hotswap_hotbars:temp Items append from storage gm4_hotswap_hotbars:temp Inventory[{Slot:6b}]
data modify storage gm4_hotswap_hotbars:temp Items append from storage gm4_hotswap_hotbars:temp Inventory[{Slot:7b}]
data modify storage gm4_hotswap_hotbars:temp Items append from storage gm4_hotswap_hotbars:temp Inventory[{Slot:8b}]
data modify block 29999998 1 7134 Items append from storage gm4_hotswap_hotbars:temp Items[]

# update hotswap item with new rows
data modify storage gm4_hotswap_hotbars:temp Items set from block 29999998 1 7134 Items
item modify entity @s weapon.offhand gm4_hotswap_hotbars:update_hotswapper
playsound minecraft:item.bundle.remove_one player @a[distance=..16] ~ ~ ~ 0.8 1.4

# clean up
data remove storage gm4_hotswap_hotbars:temp Inventory
data remove storage gm4_hotswap_hotbars:temp Items
data remove storage gm4_hotswap_hotbars:temp invalid_items
data remove block 29999998 1 7134 Items
