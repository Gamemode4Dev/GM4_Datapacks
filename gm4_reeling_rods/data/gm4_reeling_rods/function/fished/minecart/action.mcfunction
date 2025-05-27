# Action for reeled *_minecart
# @s = *_minecart
# at bobber in @s
# with {block}
# run from fished/select_type

data modify storage gm4_reeling_rods:temp entity_data set from entity @s
$data modify storage gm4_reeling_rods:temp item_data.Item set value {id:"$(block)",count:1}
function gm4_reeling_rods:pull_items
data remove storage gm4_reeling_rods:temp entity_data.UUID
data remove storage gm4_reeling_rods:temp entity_data.Passengers
data modify storage gm4_reeling_rods:temp entity_type set value "minecraft:minecart"
execute at @s run function gm4_reeling_rods:summon_entity with storage gm4_reeling_rods:temp
execute at @s on passengers run function gm4_reeling_rods:fished/minecart/passenger_transfer
tp @s ~ -1000 ~
