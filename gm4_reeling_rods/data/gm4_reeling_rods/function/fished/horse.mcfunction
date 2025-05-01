# Action for reeled horse
# @s = horse
# at @s
# run from fished/select_type

data modify storage gm4_reeling_rods:temp item_data set value {}
data modify storage gm4_reeling_rods:temp item_data.Item set from entity @s SaddleItem
execute store result score $armored gm4_reeling_rods.math if data entity @s body_armor_item run data modify storage gm4_reeling_rods:temp item_data.Item set from entity @s body_armor_item
execute positioned ~ ~0.8 ~ run function gm4_reeling_rods:separate
execute if data storage gm4_reeling_rods:temp {item_data:{Item:{id:"minecraft:saddle"}}} run item replace entity @s horse.saddle with minecraft:air
execute if score $armored gm4_reeling_rods.math matches 1 run item replace entity @s armor.body with minecraft:air
