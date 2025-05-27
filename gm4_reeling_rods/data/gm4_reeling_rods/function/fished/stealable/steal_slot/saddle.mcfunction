# Steal Saddle
# @s = #gm4_reeling_rods:steal_saddle
# at bobber in @s
# run from fished/select_type

data modify storage gm4_reeling_rods:temp item_data set value {}
data modify storage gm4_reeling_rods:temp item_data.Item set from entity @s equipment.saddle
function gm4_reeling_rods:pull_items
item replace entity @s saddle with minecraft:air
