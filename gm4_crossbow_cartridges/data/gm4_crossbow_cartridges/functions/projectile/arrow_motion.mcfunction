#run from check_projectile
# @s = player using the crossbow

tag @s add gm4_cb_use

#copy motion of arrow to projectile and kill arrow
data modify entity @e[tag=gm4_cb_proj,distance=..2,sort=nearest,limit=1] Motion set from entity @e[tag=gm4_cb_arrow,distance=..2,sort=nearest,limit=1] Motion
kill @e[tag=gm4_cb_arrow,distance=..2,sort=nearest,limit=1]
