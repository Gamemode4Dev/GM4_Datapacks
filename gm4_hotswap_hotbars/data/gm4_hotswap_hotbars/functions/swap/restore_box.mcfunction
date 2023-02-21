# restores the hotswapper shulker box
# @s = player who has moved a hotswapper item (firework star) into their inventory
# at @s
# run from advancement "gm4_hotswap_hotbars:hotswapper_inventory"

advancement revoke @s only gm4_hotswap_hotbars:hotswapper_inventory

# get item data
data modify storage gm4_hotswap_hotbars:temp Item set from entity @s Inventory[{tag:{gm4_hotswap_hotbars:{item:"hotswapper_item"}}}]
execute store result score $color gm4_hh_data run data get storage gm4_hotswap_hotbars:temp Item.tag.gm4_hotswap_hotbars.color
execute store result score $slot gm4_hh_data run data get storage gm4_hotswap_hotbars:temp Item.Slot

data remove storage gm4_hotswap_hotbars:temp Item.tag.Explosion
data remove storage gm4_hotswap_hotbars:temp Item.tag.gm4_hotswap_hotbars.color
data modify storage gm4_hotswap_hotbars:temp Item.tag.gm4_hotswap_hotbars.item set value "hotswapper"

# replace item
execute if score $slot gm4_hh_data matches 0..8 run function gm4_hotswap_hotbars:swap/restore_box/hotbar
execute if score $slot gm4_hh_data matches 9..17 run function gm4_hotswap_hotbars:swap/restore_box/inv_1
execute if score $slot gm4_hh_data matches 18..26 run function gm4_hotswap_hotbars:swap/restore_box/inv_2
execute if score $slot gm4_hh_data matches 27..35 run function gm4_hotswap_hotbars:swap/restore_box/inv_3

# clean up
data remove storage gm4_hotswap_hotbars:temp Item
