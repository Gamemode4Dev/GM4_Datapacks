# Copy motion, effects, and owner from arrow to projectile
# @s = projectile shot from crossbow
# at @s
# run from functions in projectile/

# copy data from arrow to projectile
data modify entity @s Motion set from entity @e[tag=gm4_cb_arrow,distance=..0.1,sort=nearest,limit=1] Motion
data modify entity @s {} merge from storage gm4_crossbow_cartridges:temp projectile

# remove arrow
kill @e[tag=gm4_cb_arrow,distance=..0.1,sort=nearest,limit=1]

# remove tag
tag @s remove gm4_cb_projectile
