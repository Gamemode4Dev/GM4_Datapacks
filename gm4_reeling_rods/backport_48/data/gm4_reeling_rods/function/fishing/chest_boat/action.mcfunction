# Action for reeled chest_boat
# @s = chest_boat
# at @s
# run from gm4_reeling_rods:fishing/chest_boat/adv

data modify storage gm4_reeling_rods:temp entity_data set from entity @s
data modify storage gm4_reeling_rods:temp item_data.Item set value {id:"minecraft:chest",count:1}
execute positioned ~ ~0.75 ~ run function gm4_reeling_rods:separate
tp @s ~ -1000 ~
data remove storage gm4_reeling_rods:temp entity_data.UUID
data modify storage gm4_reeling_rods:temp entity_type set value "minecraft:boat"
function gm4_reeling_rods:summon_entity with storage gm4_reeling_rods:temp
