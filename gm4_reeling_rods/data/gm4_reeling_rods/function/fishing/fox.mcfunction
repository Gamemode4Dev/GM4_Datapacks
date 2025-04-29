# Action for reeled fox
# @s = fox
# at @s
# run from fishing/select_type

data modify storage gm4_reeling_rods:temp item_data.Item set from entity @s HandItems[0]
data modify storage gm4_reeling_rods:temp item_data.PickupDelay set value 10s
data modify entity @s HandItems[0] set value {}
function gm4_reeling_rods:separate
