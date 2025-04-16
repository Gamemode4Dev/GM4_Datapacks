# init text display
# @s = text display
# at chiseled bookshelf, selected book slot
# run from process_display/locate_slot

# schedule tick function unless it's already active
execute unless entity @e[type=text_display,tag=gm4_bookshelf_inspector_display.extending] run schedule function gm4_bookshelf_inspector:process_display/spawn/tick 1t

# set data
data merge entity @s {Tags:["gm4_bookshelf_inspector_display","gm4_bookshelf_inspector_display.extending"],default_background:1b,view_range:0.05f,see_through:1b,line_width:130,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0f,0f,0f]},text:{"text":"???"}}

# build text storage
data modify storage gm4_bookshelf_inspector:temp text set value []
function gm4_bookshelf_inspector:process_display/spawn/decide_name
data modify entity @s text set value {"nbt":"text[]","storage":"gm4_bookshelf_inspector:temp","separator":"\n","interpret":true}
data remove storage gm4_bookshelf_inspector:temp text

# set rotation
execute if score $rotation gm4_bookshelf_inspector_data matches 1 run data modify entity @s Rotation set value [0.0F,0.0F]
execute if score $rotation gm4_bookshelf_inspector_data matches 2 run data modify entity @s Rotation set value [180.0F,0.0F]
execute if score $rotation gm4_bookshelf_inspector_data matches 3 run data modify entity @s Rotation set value [-90.0F,0.0F]
execute if score $rotation gm4_bookshelf_inspector_data matches 4 run data modify entity @s Rotation set value [90.0F,0.0F]

scoreboard players set @s gm4_bookshelf_inspector_keep 1
