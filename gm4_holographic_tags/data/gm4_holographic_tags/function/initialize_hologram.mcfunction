# initializes data on the text display
# @s = newly spawned text display
# run from main

data merge entity @s {text:{color:"#FFFFFF",text:"test"},line_width:2147483647 ,billboard:"center",Tags:["gm4_hologram","smithed.entity","smithed.strict"],background:0}
data modify entity @s text.text set from storage gm4_holographic_tags:temp properties.raw_text
data modify entity @s Rotation set from storage gm4_holographic_tags:temp properties.rotation
execute if data storage gm4_holographic_tags:temp properties.glowing run data modify entity @s brightness set value {block:15,sky:15}

execute positioned as @s if block ^ ^ ^-0.75 #minecraft:wool run function gm4_holographic_tags:set_color

scoreboard players set @s gm4_entity_version 2
