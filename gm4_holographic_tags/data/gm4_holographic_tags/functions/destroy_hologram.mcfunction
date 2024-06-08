# @s = hologram AEC if empty item frame is nearby
# run from main

data merge entity @e[type=item_frame,limit=1,sort=nearest,distance=..0.1] {Tags:["gm4_hologram"],Item:{id:"minecraft:name_tag",count:1,components:{"minecraft:repair_cost":0}}}
data modify entity @e[type=item_frame,limit=1,sort=nearest,distance=..0.1] Item.components."minecraft:custom_name" set from entity @s CustomName

data merge entity @e[type=glow_item_frame,limit=1,sort=nearest,distance=..0.1] {Tags:["gm4_hologram"],Item:{id:"minecraft:name_tag",count:1,components:{"minecraft:repair_cost":0}}}
data modify entity @e[type=glow_item_frame,limit=1,sort=nearest,distance=..0.1] Item.components."minecraft:custom_name" set from entity @s CustomName
particle minecraft:block{block_state:"minecraft:stripped_birch_log"} ~ ~ ~ .2 .2 .2 .1 10
kill @s
