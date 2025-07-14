# Steal Mainhand
# @s = #gm4_reeling_rods:steal_hand or #gm4_reeling_rods:steal_equipment
# at bobber in @s
# run from reeling/stealable/order/* and reeling/stealable/steal_hand

## drop chance fail conditions
# to use default drop chances, we'd use 85 here as 8.5%, but we're setting it to 11.5% to match looting 3 chances
scoreboard players set $drop_chance gm4_reeling_rods.math 115
execute if data entity @s drop_chances.mainhand store result score $drop_chance gm4_reeling_rods.math run data get entity @s drop_chances.mainhand 1000
# villager and vex should ignore 0% drop chance on mainhand, otherwise fail if 0%
execute if entity @s[type=!vex,type=!villager] if score $drop_chance gm4_reeling_rods.math matches 0 run return run function gm4_reeling_rods:reeling/stealable/zero_chance
# drowned holding trident needs to roll chance
execute if entity @s[type=drowned] if items entity @s weapon.mainhand trident \
  unless function gm4_reeling_rods:reeling/stealable/check_drop_chance \
  run return run function gm4_reeling_rods:reeling/stealable/break_slot/mainhand

## steal slot
data modify storage gm4_reeling_rods:temp item_data.Item set value {}
# need SelectedItem to work with players since players don't use equipment.mainhand
data modify storage gm4_reeling_rods:temp item_data.Item set from entity @s SelectedItem
data modify storage gm4_reeling_rods:temp item_data.Item set from entity @s equipment.mainhand
data modify storage gm4_reeling_rods:temp item_data.PickupDelay set value 10s
function gm4_reeling_rods:pull_items
item replace entity @s weapon.mainhand with minecraft:air

playsound minecraft:entity.item.pickup neutral @a[distance=..16] ~ ~ ~
return 1
