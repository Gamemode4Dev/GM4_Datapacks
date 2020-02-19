#@s = item frame infused with invisibility
#run from infuse/persistent_item/check

summon item ~ ~ ~ {Tags:["gm4_pi_set_persistent_item"],Age:-32768,PickupDelay:32767s,Item:{id:"minecraft:stick",Count:1b,tag:{display:{Name:'"BUG"'}}}}
data modify entity @e[type=item,tag=gm4_pi_set_persistent_item,distance=..0.2,limit=1,sort=nearest] Item set from entity @s Item
data merge entity @e[type=item,tag=gm4_pi_set_persistent_item,distance=..0.2,limit=1,sort=nearest] {Tags:["gm4_pi_persistent_item"]}
summon item ~ ~ ~ {Age:-32768,PickupDelay:5s,Motion:[0.0,0.3,0.0],Item:{id:"minecraft:item_frame",Count:1b}}
kill @s

