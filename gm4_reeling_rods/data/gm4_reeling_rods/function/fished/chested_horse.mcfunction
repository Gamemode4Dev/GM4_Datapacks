# Action for reeled #gm4_reeling_rods:chested_horse
# @s = #gm4_reeling_rods:chested_horse
# at bobber in @s
# run from fished/select_type

data modify storage gm4_reeling_rods:temp entity_data set from entity @s
data modify storage gm4_reeling_rods:temp item_data set value {}
data modify storage gm4_reeling_rods:temp item_data.Item set from entity @s equipment.saddle
execute if data entity @s {ChestedHorse:1b} run data modify storage gm4_reeling_rods:temp item_data.Item set value {id:"minecraft:chest",count:1}
function gm4_reeling_rods:pull_items
execute if data entity @s {ChestedHorse:1b} run return run data modify entity @s ChestedHorse set value 0b
item replace entity @s saddle with minecraft:air

execute if data storage gm4_reeling_rods:temp item_data.Item run \
  playsound minecraft:entity.item.pickup neutral @a[distance=..16] ~ ~ ~
