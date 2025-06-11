# Steal Head
# @s = #gm4_reeling_rods:steal_equipment
# at bobber in @s
# run from reeling/stealable/order/equipment_*

scoreboard players set $drop_chance gm4_reeling_rods.math 85
execute if data entity @s drop_chances.head store result score $drop_chance gm4_reeling_rods.math run data get entity @s drop_chances.head 1000
execute unless entity @s[type=#gm4_reeling_rods:ignore_drop_chances] \
  unless score $drop_chance gm4_reeling_rods.math matches 1000.. \
  unless function gm4_reeling_rods:reeling/stealable/check_drop_chance \
  run return run function gm4_reeling_rods:reeling/stealable/break_slot/head

data modify storage gm4_reeling_rods:temp item_data.Item set value {}
data modify storage gm4_reeling_rods:temp item_data.Item set from entity @s equipment.head
item replace entity @s armor.head with minecraft:air
data modify storage gm4_reeling_rods:temp item_data.PickupDelay set value 10s
function gm4_reeling_rods:pull_items
playsound minecraft:entity.item.pickup neutral @a[distance=..16] ~ ~ ~
return 3
