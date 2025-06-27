# Action for hooked painting
# @s = painting
# at bobber in @s
# run from hooked_entity/select_type

data modify storage gm4_reeling_rods:temp item_data.Item set value {id:"minecraft:painting",count:1}
execute at @s align xz positioned ~0.5 ~ ~0.5 run function gm4_reeling_rods:pull_items

kill @s
playsound minecraft:entity.painting.break neutral @a[distance=..16] ~ ~ ~
