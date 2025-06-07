# Steal Offhand
# @s = #gm4_reeling_rods:steal_hand or #gm4_reeling_rods:steal_equipment
# at bobber in @s
# run from fished/stealable/order/*

data modify storage gm4_reeling_rods:temp item_data.Item set value {}
data modify storage gm4_reeling_rods:temp item_data.Item set from entity @s equipment.offhand
item replace entity @s weapon.offhand with minecraft:air
data modify storage gm4_reeling_rods:temp item_data.PickupDelay set value 10s
function gm4_reeling_rods:pull_items
playsound minecraft:entity.item.pickup neutral @a[distance=..16] ~ ~ ~
return 2
