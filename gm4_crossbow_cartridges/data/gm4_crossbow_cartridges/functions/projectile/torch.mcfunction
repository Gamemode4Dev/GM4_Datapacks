#run from check_projectile
# @s = player using the crossbow

#add tag to arrow
tag @e[type=minecraft:arrow,distance=..2,limit=1,sort=nearest] add gm4_cb_torch

#take item from player
clear @s[gamemode=!creative] torch 1
