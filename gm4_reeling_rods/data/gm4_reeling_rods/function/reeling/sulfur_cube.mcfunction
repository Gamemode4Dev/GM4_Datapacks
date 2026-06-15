# Action for reeled sulfur cube
# @s = sulfur cube
# at bobber in @s
# run from hooked_entity/select_type

# fail if no block
execute unless items entity @s armor.body * run return fail

data modify storage gm4_reeling_rods:temp item_data set value {}
data modify storage gm4_reeling_rods:temp item_data.Item set from entity @s equipment.body
data modify storage gm4_reeling_rods:temp item_data.PickupDelay set value 10s

item replace entity @s armor.body with air

function gm4_reeling_rods:pull_items

playsound minecraft:entity.sulfur_cube.eject neutral @a[distance=..16] ~ ~ ~
