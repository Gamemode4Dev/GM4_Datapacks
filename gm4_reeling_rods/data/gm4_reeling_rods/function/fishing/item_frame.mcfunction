# Action for reeled item frame or glow item frame
# @s = item frame or glow item frame
# at @s
# with {type}
# run from fishing/select_type

$data modify storage gm4_reeling_rods:temp item_data.Item set value {id:"$(type)",count:1}
data modify storage gm4_reeling_rods:temp item_data.Item set from entity @s Item
execute align xz positioned ~0.5 ~ ~0.5 run function gm4_reeling_rods:separate
execute unless data entity @s Item run return run kill @s
data remove entity @s Item
