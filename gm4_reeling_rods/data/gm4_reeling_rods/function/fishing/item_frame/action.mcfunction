# Action for reeled item frame
# @s = item frame
# at @s
# run from gm4_reeling_rods:fishing/item_frame/adv

data modify storage gm4_reeling_rods:temp item_data.Item set value {id:"minecraft:item_frame",count:1}
data modify storage gm4_reeling_rods:temp item_data.Item set from entity @s Item
execute align xz positioned ~0.5 ~ ~0.5 run function gm4_reeling_rods:separate
execute unless data entity @s Item run return run kill @s
data remove entity @s Item
