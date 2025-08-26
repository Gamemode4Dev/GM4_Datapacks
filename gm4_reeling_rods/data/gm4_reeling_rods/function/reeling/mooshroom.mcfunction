# Action for reeled mooshroom
# @s = mooshroom
# at bobber in @s
# run from hooked_entity/select_type

# fails
execute unless data entity @s {Age:0} run return fail
execute if data entity @s Passengers run return fail

# steal
data modify storage gm4_reeling_rods:temp item_data set value {}
execute if data entity @s {Type:"red"} run data modify storage gm4_reeling_rods:temp item_data.Item.id set value "minecraft:red_mushroom"
execute if data entity @s {Type:"brown"} run data modify storage gm4_reeling_rods:temp item_data.Item.id set value "minecraft:brown_mushroom"
data modify storage gm4_reeling_rods:temp item_data.Item.count set value 5
function gm4_reeling_rods:pull_items

# replace with cow
data modify storage gm4_reeling_rods:temp entity_data set from entity @s
data remove storage gm4_reeling_rods:temp entity_data.UUID
data modify storage gm4_reeling_rods:temp entity_type set value "minecraft:cow"
execute at @s run function gm4_reeling_rods:reeling/summon_entity with storage gm4_reeling_rods:temp
tp @s ~ -1000 ~

playsound entity.mooshroom.shear neutral @a[distance=..16] ~ ~ ~
