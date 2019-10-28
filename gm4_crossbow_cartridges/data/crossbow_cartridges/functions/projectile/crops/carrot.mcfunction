#run from check_projectile
# @s = player using the crossbow

#add tag to arrow
tag @e[type=minecraft:arrow,distance=..2,limit=1,sort=nearest] add gm4_cb_proj
tag @e[type=minecraft:arrow,distance=..2,limit=1,sort=nearest] add gm4_cb_crops
tag @e[type=minecraft:arrow,distance=..2,limit=1,sort=nearest] add gm4_cb_carrot

#take item from player
clear @s[gamemode=!creative] carrot 1
