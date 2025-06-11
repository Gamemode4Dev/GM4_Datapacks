# Action for reeled mooshroom
# @s = mooshroom
# at bobber in @s
# run from hooked_entity/select_type

# fail if baby
execute unless data entity @s {Age:0} run return fail

data modify storage gm4_reeling_rods:temp item_data set value {}
# set item id to correct mushroom type
execute if data entity @s {Type:"red"} run data modify storage gm4_reeling_rods:temp item_data.Item.id set value "minecraft:red_mushroom"
execute if data entity @s {Type:"brown"} run data modify storage gm4_reeling_rods:temp item_data.Item.id set value "minecraft:brown_mushroom"
# set item count to 5
data modify storage gm4_reeling_rods:temp item_data.Item.count set value 5
# yoink
function gm4_reeling_rods:pull_items

# replace with cow
data modify storage gm4_reeling_rods:temp entity_data set from entity @s
data remove storage gm4_reeling_rods:temp entity_data.UUID
data remove storage gm4_reeling_rods:temp entity_data.Passengers
data modify storage gm4_reeling_rods:temp entity_type set value "minecraft:cow"
execute at @s run function gm4_reeling_rods:reeling/summon_entity with storage gm4_reeling_rods:temp
execute at @s on passengers run function gm4_reeling_rods:reeling/mooshroom/passenger_transfer

tp @s ~ -1000 ~

playsound entity.mooshroom.shear neutral @a[distance=..16] ~ ~ ~
