# Action for reeled llama or trader llama
# @s = llama or trader llama
# at @s
# run from fished/select_type

data modify storage gm4_reeling_rods:temp entity_data set from entity @s
data modify storage gm4_reeling_rods:temp item_data set value {}
data modify storage gm4_reeling_rods:temp item_data.Item set from entity @s body_armor_item
execute if data entity @s {ChestedHorse:1b} run data modify storage gm4_reeling_rods:temp item_data.Item set value {id:"minecraft:chest",count:1}
execute positioned ~ ~1 ~ run function gm4_reeling_rods:separate
execute if data entity @s {ChestedHorse:1b} run return run data modify entity @s ChestedHorse set value 0b
item replace entity @s armor.body with minecraft:air
