# Action for reeled donkey
# @s = donkey
# at @s
# run from fishing/selec_type

data modify storage gm4_reeling_rods:temp entity_data set from entity @s
data modify storage gm4_reeling_rods:temp item_data set value {}
data modify storage gm4_reeling_rods:temp item_data.Item set from entity @s SaddleItem
execute if data entity @s {ChestedHorse:1b} run data modify storage gm4_reeling_rods:temp item_data.Item set value {id:"minecraft:chest",count:1}
execute positioned ~ ~0.7 ~ run function gm4_reeling_rods:separate
execute if data entity @s {ChestedHorse:1b} run return run data modify entity @s ChestedHorse set value 0b
item replace entity @s horse.saddle with minecraft:air
