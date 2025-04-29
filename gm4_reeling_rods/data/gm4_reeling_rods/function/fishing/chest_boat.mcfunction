# Action for reeled chest_boat
# @s = chest_boat type
# at @s
# with {boat_type}
# run from fishing/select_type

data modify storage gm4_reeling_rods:temp entity_data set from entity @s
data modify storage gm4_reeling_rods:temp item_data.Item set value {id:"minecraft:chest",count:1}
execute positioned ~ ~0.75 ~ run function gm4_reeling_rods:separate
data remove storage gm4_reeling_rods:temp entity_data.UUID
data remove storage gm4_reeling_rods:temp entity_data.Passengers
$data modify storage gm4_reeling_rods:temp entity_type set value "$(boat_type)"
function gm4_reeling_rods:summon_entity with storage gm4_reeling_rods:temp
execute on passengers run function gm4_reeling_rods:fishing/boat_passenger_transfer
tp @s ~ -1000 ~
