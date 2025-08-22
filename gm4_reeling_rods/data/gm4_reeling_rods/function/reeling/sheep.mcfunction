# Action for reeled sheep
# @s = sheep
# at bobber in @s
# run from hooked_entity/select_type

# fail if sheared
execute if data entity @s {Sheared:1} run return fail

# steal
data modify entity @s Sheared set value true
data modify storage gm4_reeling_rods:temp item_data set value {}
execute if data entity @s {Color:0b} run data modify storage gm4_reeling_rods:temp item_data.Item set value {id:"minecraft:white_wool",count:1}
execute if data entity @s {Color:1b} run data modify storage gm4_reeling_rods:temp item_data.Item set value {id:"minecraft:orange_wool",count:1}
execute if data entity @s {Color:2b} run data modify storage gm4_reeling_rods:temp item_data.Item set value {id:"minecraft:magenta_wool",count:1}
execute if data entity @s {Color:3b} run data modify storage gm4_reeling_rods:temp item_data.Item set value {id:"minecraft:light_blue_wool",count:1}
execute if data entity @s {Color:4b} run data modify storage gm4_reeling_rods:temp item_data.Item set value {id:"minecraft:yellow_wool",count:1}
execute if data entity @s {Color:5b} run data modify storage gm4_reeling_rods:temp item_data.Item set value {id:"minecraft:lime_wool",count:1}
execute if data entity @s {Color:6b} run data modify storage gm4_reeling_rods:temp item_data.Item set value {id:"minecraft:pink_wool",count:1}
execute if data entity @s {Color:7b} run data modify storage gm4_reeling_rods:temp item_data.Item set value {id:"minecraft:gray_wool",count:1}
execute if data entity @s {Color:8b} run data modify storage gm4_reeling_rods:temp item_data.Item set value {id:"minecraft:light_gray_wool",count:1}
execute if data entity @s {Color:9b} run data modify storage gm4_reeling_rods:temp item_data.Item set value {id:"minecraft:cyan_wool",count:1}
execute if data entity @s {Color:10b} run data modify storage gm4_reeling_rods:temp item_data.Item set value {id:"minecraft:purple_wool",count:1}
execute if data entity @s {Color:11b} run data modify storage gm4_reeling_rods:temp item_data.Item set value {id:"minecraft:blue_wool",count:1}
execute if data entity @s {Color:12b} run data modify storage gm4_reeling_rods:temp item_data.Item set value {id:"minecraft:brown_wool",count:1}
execute if data entity @s {Color:13b} run data modify storage gm4_reeling_rods:temp item_data.Item set value {id:"minecraft:green_wool",count:1}
execute if data entity @s {Color:14b} run data modify storage gm4_reeling_rods:temp item_data.Item set value {id:"minecraft:red_wool",count:1}
execute if data entity @s {Color:15b} run data modify storage gm4_reeling_rods:temp item_data.Item set value {id:"minecraft:black_wool",count:1}
function gm4_reeling_rods:pull_items

playsound minecraft:entity.sheep.shear neutral @a[distance=..16] ~ ~ ~
