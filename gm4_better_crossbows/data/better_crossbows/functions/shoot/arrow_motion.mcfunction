# @s = player using the crossbow

# copy motion of arrow to projectile and kill arrow
data modify entity @e[tag=gm4_cb_proj,distance=..2,limit=1] Motion set from entity @e[type=minecraft:arrow,limit=1,distance=..2] Motion
kill @e[type=minecraft:arrow,limit=1,distance=..2]

# give player back the arrow (it is needed to use the crossbow)
execute unless entity @s[gamemode=creative] run give @s arrow
