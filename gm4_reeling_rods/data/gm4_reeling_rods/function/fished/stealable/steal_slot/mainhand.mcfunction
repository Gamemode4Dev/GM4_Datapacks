# Steal Mainhand
# @s = #gm4_reeling_rods:steal_hand or #gm4_reeling_rods:steal_equipment
# at bobber in @s
# run from fished/stealable/order/*

data modify storage gm4_reeling_rods:temp item_data.Item set value {}
# need SelectedItem to work with players
data modify storage gm4_reeling_rods:temp item_data.Item set from entity @s SelectedItem
data modify storage gm4_reeling_rods:temp item_data.Item set from entity @s equipment.mainhand
item replace entity @s weapon.mainhand with minecraft:air
data modify storage gm4_reeling_rods:temp item_data.PickupDelay set value 10s
function gm4_reeling_rods:pull_items
return 1
