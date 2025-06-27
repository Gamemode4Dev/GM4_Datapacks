# Steal Head
# @s = #gm4_reeling_rods:steal_equipment
# at bobber in @s
# run from reeling/stealable/order/equipment_*

# fail if 0% drop chance
execute if data entity @s {drop_chances:{head:0.0f}} run return run function gm4_reeling_rods:reeling/stealable/zero_chance

# steal slot
data modify storage gm4_reeling_rods:temp item_data.Item set value {}
data modify storage gm4_reeling_rods:temp item_data.Item set from entity @s equipment.head
data modify storage gm4_reeling_rods:temp item_data.PickupDelay set value 10s
function gm4_reeling_rods:pull_items
item replace entity @s armor.head with minecraft:air

playsound minecraft:entity.item.pickup neutral @a[distance=..16] ~ ~ ~
return 3
