#run from check_projectile
# @s = player using the crossbow

#copy motion of arrow to projectile and kill arrow
data modify entity @e[tag=gm4_cb_proj,distance=..2,limit=1,sort=nearest] Motion set from entity @e[type=minecraft:arrow,distance=..2,limit=1,sort=nearest] Motion
kill @e[type=minecraft:arrow,distance=..2,limit=1,sort=nearest]
