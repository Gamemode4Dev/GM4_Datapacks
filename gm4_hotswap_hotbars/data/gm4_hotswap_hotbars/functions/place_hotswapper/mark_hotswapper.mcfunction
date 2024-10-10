# marks the box with a hotswapper machine marker
# @s = player that placed a hotswapper
# at the box they placed
# run from gm4_hotswap_hotbars:place_hotswapper/verify_contents

# update box
scoreboard players set $found gm4_hh_data 1
data modify block ~ ~ ~ CustomName set value '{"italic":false,"translate":"gui.gm4.hotswapper","fallback":"Customize Hotbars"}'

# summon marker
summon marker ~ ~ ~ {CustomName:'"gm4_hotswapper"',Tags:["gm4_hotswapper","gm4_machine_marker","gm4_new_machine"]}
data remove storage gm4_hotswap_hotbars:temp item_data.BlockEntityTag
data modify entity @e[type=marker,tag=gm4_new_machine,distance=..0.1,limit=1] data.gm4_hotswap_hotbars.item_data set from storage gm4_hotswap_hotbars:temp item_data
scoreboard players set @e[type=marker,tag=gm4_new_machine,distance=..0.1,limit=1] gm4_entity_version 1
tag @e[type=marker,tag=gm4_new_machine,distance=..0.1] remove gm4_new_machine

# summon item display
execute if block ~ ~ ~ #minecraft:shulker_boxes[facing=up] positioned ~ ~-0.40625 ~ summon item_display run data merge entity @s {Rotation:[0.0f,0.0f],item:{id:"minecraft:piston",Count:1b,tag:{CustomModelData:3420008}},transformation:{scale:[0.999f, 0.0625f, 0.999f]},Tags:["gm4_hotswapper_display"],CustomName:'"gm4_hotswapper_display"'}
execute if block ~ ~ ~ #minecraft:shulker_boxes[facing=down] positioned ~ ~0.40625 ~ summon item_display run data merge entity @s {Rotation:[0.0f,180.0f],item:{id:"minecraft:piston",Count:1b,tag:{CustomModelData:3420008}},transformation:{scale:[0.999f, 0.0625f, 0.999f]},Tags:["gm4_hotswapper_display"],CustomName:'"gm4_hotswapper_display"'}
execute if block ~ ~ ~ #minecraft:shulker_boxes[facing=north] positioned ~ ~ ~0.40625 summon item_display run data merge entity @s {Rotation:[0.0f,-90.0f],item:{id:"minecraft:piston",Count:1b,tag:{CustomModelData:3420008}},transformation:{scale:[0.999f, 0.0625f, 0.999f]},Tags:["gm4_hotswapper_display"],CustomName:'"gm4_hotswapper_display"'}
execute if block ~ ~ ~ #minecraft:shulker_boxes[facing=south] positioned ~ ~ ~-0.40625 summon item_display run data merge entity @s {Rotation:[0.0f,90.0f],item:{id:"minecraft:piston",Count:1b,tag:{CustomModelData:3420008}},transformation:{scale:[-0.999f, 0.0625f, -0.999f]},Tags:["gm4_hotswapper_display"],CustomName:'"gm4_hotswapper_display"'}
execute if block ~ ~ ~ #minecraft:shulker_boxes[facing=east] positioned ~-0.40625 ~ ~ summon item_display run data merge entity @s {Rotation:[-90.0f,90.0f],item:{id:"minecraft:piston",Count:1b,tag:{CustomModelData:3420008}},transformation:{scale:[-0.999f, 0.0625f, -0.999f]},Tags:["gm4_hotswapper_display"],CustomName:'"gm4_hotswapper_display"'}
execute if block ~ ~ ~ #minecraft:shulker_boxes[facing=west] positioned ~0.40625 ~ ~ summon item_display run data merge entity @s {Rotation:[90.0f,90.0f],item:{id:"minecraft:piston",Count:1b,tag:{CustomModelData:3420008}},transformation:{scale:[-0.999f, 0.0625f, -0.999f]},Tags:["gm4_hotswapper_display"],CustomName:'"gm4_hotswapper_display"'}
