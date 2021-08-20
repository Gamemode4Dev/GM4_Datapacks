# Set projectile motion
# @s = player using the crossbow
# at @s
# run from functions in projectile/

tag @s add gm4_cb_use

# copy motion of arrow to projectile and kill arrow
data modify entity @e[tag=gm4_cb_proj,distance=..2,sort=nearest,limit=1] Motion set from entity @e[type=minecraft:arrow,tag=gm4_cb_arrow,distance=..2,sort=nearest,limit=1] Motion
kill @e[type=minecraft:arrow,tag=gm4_cb_arrow,distance=..2,sort=nearest,limit=1]

# remove tag
tag @e[tag=gm4_cb_proj,distance=..2,limit=1,sort=nearest] remove gm4_cb_proj
