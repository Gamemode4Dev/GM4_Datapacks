# @s = hologram AEC if empty item frame is nearby
# run from main

data merge entity @e[type=item_frame,limit=1,sort=nearest,distance=..0.1] {Tags:["gm4_hologram"],Item:{id:"minecraft:name_tag",Count:1b,tag:{RepairCost:0}}}
data modify entity @e[type=item_frame,limit=1,sort=nearest,distance=..0.1] Item.tag.display.Name set from entity @s CustomName

data merge entity @e[type=glow_item_frame,limit=1,sort=nearest,distance=..0.1] {Tags:["gm4_hologram"],Item:{id:"minecraft:name_tag",Count:1b,tag:{RepairCost:0}}}
data modify entity @e[type=glow_item_frame,limit=1,sort=nearest,distance=..0.1] Item.tag.display.Name set from entity @s CustomName
particle minecraft:block stripped_birch_log ~ ~ ~ .2 .2 .2 .1 10
kill @s
