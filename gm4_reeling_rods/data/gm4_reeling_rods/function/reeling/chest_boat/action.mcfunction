# Action for reeled chest_boat
# @s = chest_boat type
# at bobber in @s
# with {boat_type}
# run from hooked_entity/select_type

# steal
data modify storage gm4_reeling_rods:temp item_data set value {}
data modify storage gm4_reeling_rods:temp item_data.Item set value {id:"minecraft:chest",count:1}
execute positioned ~ ~0.3 ~ run function gm4_reeling_rods:pull_items

# replace with boat
data modify storage gm4_reeling_rods:temp entity_data set from entity @s
data remove storage gm4_reeling_rods:temp entity_data.UUID
data remove storage gm4_reeling_rods:temp entity_data.Passengers
$data modify storage gm4_reeling_rods:temp entity_type set value "$(boat_type)"
execute at @s run function gm4_reeling_rods:reeling/summon_entity with storage gm4_reeling_rods:temp
execute at @s on passengers run function gm4_reeling_rods:reeling/chest_boat/passenger_transfer
tp @s ~ -1000 ~

playsound minecraft:entity.item.pickup neutral @a[distance=..16] ~ ~ ~
