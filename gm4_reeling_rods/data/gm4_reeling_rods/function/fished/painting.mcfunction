# Action for reeled painting
# @s = painting
# at @s
# run from fished/select_type

data modify storage gm4_reeling_rods:temp item_data.Item set value {id:"minecraft:painting",count:1}
execute align xz positioned ~0.5 ~ ~0.5 run function gm4_reeling_rods:separate
kill @s
