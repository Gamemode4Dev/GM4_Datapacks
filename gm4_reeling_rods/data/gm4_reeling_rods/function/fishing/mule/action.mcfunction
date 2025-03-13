# Action for reeled mule
# @s = mule
# at @s
# run from fishing/mule/adv and fishing/mule/adv_baby

data modify storage gm4_reeling_rods:temp entity_data set from entity @s
data modify storage gm4_reeling_rods:temp item_data set value {}
data modify storage gm4_reeling_rods:temp item_data.Item set from entity @s SaddleItem
execute if data entity @s {ChestedHorse:1b} run data modify storage gm4_reeling_rods:temp item_data.Item set value {id:"minecraft:chest",count:1}
execute positioned ~ ~0.8 ~ run function gm4_reeling_rods:separate
data modify entity @s ChestedHorse set value 0b
execute if data storage gm4_reeling_rods:temp {item_data:{Item:{id:"minecraft:saddle"}}} run item replace entity @s horse.saddle with minecraft:air
