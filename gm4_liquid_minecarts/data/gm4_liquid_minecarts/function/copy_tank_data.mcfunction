#@s = gm4_liquid_minecart_display copying tank data to it's item, at location of tank
#run from init_liquid

data modify entity @s item.components."minecraft:custom_data".gm4_liquid_minecarts.liquid_tag set from entity @e[type=marker,limit=1,tag=gm4_liquid_tank,sort=nearest,distance=..2] data.gm4_liquid_tanks.liquid_tag
data modify entity @s item.components."minecraft:custom_data".gm4_liquid_minecarts.tank.texture set from entity @e[type=item_display,tag=gm4_liquid_tank_liquid_display,limit=1,sort=nearest,distance=..2] item
data modify entity @s item.components."minecraft:custom_data".gm4_liquid_minecarts.tank.CustomName set from block ~ ~ ~ CustomName
