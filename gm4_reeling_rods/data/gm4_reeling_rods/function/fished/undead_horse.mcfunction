# Action for reeled zombie horse or skele horse
# @s = zombie horse or skele horse
# at @s
# run from fished/select_type

data modify storage gm4_reeling_rods:temp item_data set value {}
data modify storage gm4_reeling_rods:temp item_data.Item set from entity @s SaddleItem
execute positioned ~ ~0.8 ~ run function gm4_reeling_rods:separate
execute if data storage gm4_reeling_rods:temp {item_data:{Item:{id:"minecraft:saddle"}}} run item replace entity @s horse.saddle with minecraft:air
