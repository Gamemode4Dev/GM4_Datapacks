# Action for reeled pig
# @s = pig
# at @s
# run from fished/select_type

# fail if no saddle
execute unless data entity @s {Saddle:1b} run return fail

data modify entity @s Saddle set value 0b
data modify storage gm4_reeling_rods:temp item_data.Item set value {id:"minecraft:saddle",count:1}
execute positioned ~ ~0.5 ~ run function gm4_reeling_rods:separate
