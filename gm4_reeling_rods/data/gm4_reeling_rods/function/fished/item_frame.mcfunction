# Action for reeled item frame or glow item frame
# @s = item frame or glow item frame
# at bobber in @s
# with {type}
# run from fished/select_type

$data modify storage gm4_reeling_rods:temp item_data.Item set value {id:"$(type)",count:1}
data modify storage gm4_reeling_rods:temp item_data.Item set from entity @s Item
execute at @s align xz positioned ~0.5 ~ ~0.5 run function gm4_reeling_rods:pull_items
execute unless data entity @s Item run return run kill @s
data remove entity @s Item
