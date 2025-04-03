#@s = gm4_liquid_minecart_stand copying tank data to it's armor items, at location of tank
#run from init_liquid

data modify entity @s equipment.feet.components."minecraft:custom_data".gm4_liquid_minecarts.liquid_tag set from entity @e[type=marker,limit=1,tag=gm4_liquid_tank,sort=nearest] data.gm4_liquid_tanks.liquid_tag
data modify entity @s equipment.feet.components."minecraft:custom_data".gm4_liquid_minecarts.tank.texture set from entity @e[type=armor_stand,tag=gm4_liquid_tank_display,limit=1,sort=nearest] equipment.head
data modify entity @s equipment.feet.components."minecraft:custom_data".gm4_liquid_minecarts.tank.CustomName set from block ~ ~ ~ CustomName
