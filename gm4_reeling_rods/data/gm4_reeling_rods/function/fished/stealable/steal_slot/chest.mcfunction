# Steal Chest
# @s = #gm4_reeling_rods:steal_equipment
# at bobber in @s
# run from fished/stealable/order/equipment_*

data modify storage gm4_reeling_rods:temp item_data.Item set value {}
data modify storage gm4_reeling_rods:temp item_data.Item set from entity @s equipment.chest
item replace entity @s armor.chest with minecraft:air
data modify storage gm4_reeling_rods:temp item_data.PickupDelay set value 10s
function gm4_reeling_rods:pull_items
return 4
