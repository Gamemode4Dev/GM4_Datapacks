# Action for reeled sheep
# @s = sheep
# at bobber in @s
# run from fished/select_type

execute if data entity @s {Sheared:1} run return fail

data modify entity @s Sheared set value true

execute if data entity @s {Color:0} run data modify storage gm4_reeling_rods:temp item_data set value {id:"minecraft:white_wool",count:1}
execute if data entity @s {Color:1} run data modify storage gm4_reeling_rods:temp item_data set value {id:"minecraft:orange_wool",count:1}
execute if data entity @s {Color:2} run data modify storage gm4_reeling_rods:temp item_data set value {id:"minecraft:magenta_wool",count:1}
execute if data entity @s {Color:3} run data modify storage gm4_reeling_rods:temp item_data set value {id:"minecraft:light_blue_wool",count:1}
execute if data entity @s {Color:4} run data modify storage gm4_reeling_rods:temp item_data set value {id:"minecraft:yellow_wool",count:1}
execute if data entity @s {Color:5} run data modify storage gm4_reeling_rods:temp item_data set value {id:"minecraft:lime_wool",count:1}
execute if data entity @s {Color:6} run data modify storage gm4_reeling_rods:temp item_data set value {id:"minecraft:pink_wool",count:1}
execute if data entity @s {Color:7} run data modify storage gm4_reeling_rods:temp item_data set value {id:"minecraft:gray_wool",count:1}
execute if data entity @s {Color:8} run data modify storage gm4_reeling_rods:temp item_data set value {id:"minecraft:light_gray_wool",count:1}
execute if data entity @s {Color:9} run data modify storage gm4_reeling_rods:temp item_data set value {id:"minecraft:cyan_wool",count:1}
execute if data entity @s {Color:10} run data modify storage gm4_reeling_rods:temp item_data set value {id:"minecraft:purple_wool",count:1}
execute if data entity @s {Color:11} run data modify storage gm4_reeling_rods:temp item_data set value {id:"minecraft:blue_wool",count:1}
execute if data entity @s {Color:12} run data modify storage gm4_reeling_rods:temp item_data set value {id:"minecraft:brown_wool",count:1}
execute if data entity @s {Color:13} run data modify storage gm4_reeling_rods:temp item_data set value {id:"minecraft:green_wool",count:1}
execute if data entity @s {Color:14} run data modify storage gm4_reeling_rods:temp item_data set value {id:"minecraft:red_wool",count:1}
execute if data entity @s {Color:15} run data modify storage gm4_reeling_rods:temp item_data set value {id:"minecraft:black_wool",count:1}

function gm4_reeling_rods:pull_items
