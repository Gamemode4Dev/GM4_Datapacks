# drops invalid items (hotswappers and shulker boxes)
# @s = player who swapped their hotbar
# at @s
# run from gm4_hotswap_hotbars:swap/next_hotbar
# run from here

# drop item
summon item ~ ~ ~ {PickupDelay:0s,Item:{id:"minecraft:stick",Count:1b,tag:{gm4_hh_invalid_item:1b}},Tags:["gm4_hh_item"]}
data modify entity @e[type=item,tag=gm4_hh_item,limit=1] Item set from storage gm4_hotswap_hotbars:temp invalid_items[-1]
kill @e[type=item,tag=gm4_hh_item,nbt={Item:{tag:{gm4_hh_invalid_item:1b}}},distance=..1]
tag @e[type=item,tag=gm4_hh_item] remove gm4_hh_item

# loop for all items
data remove storage gm4_hotswap_hotbars:temp invalid_items[-1]
scoreboard players remove $invalid_items gm4_hh_data 1
execute if score $invalid_items gm4_hh_data matches 1.. run function gm4_hotswap_hotbars:swap/drop_invalid_item
