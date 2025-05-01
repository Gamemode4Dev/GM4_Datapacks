# Steal Feet
# @s = #gm4_reeling_rods:steal_equipment
# at @s
# run from fished/stealable/order/equipment_*

data modify storage gm4_reeling_rods:temp item_data.Item set value {}
# NEEDS UPDATING FOR 1.21.5, USE EQUIPMENT TAG
data modify storage gm4_reeling_rods:temp item_data.Item set from entity @s Inventory[{Slot:100b}]
data modify storage gm4_reeling_rods:temp item_data.Item set from entity @s ArmorItems[0]
item replace entity @s armor.feet with minecraft:air
data remove storage gm4_reeling_rods:temp item_data.Item.Slot
data modify storage gm4_reeling_rods:temp item_data.PickupDelay set value 10s
execute positioned ~ ~.7 ~ run function gm4_reeling_rods:separate
return 6
