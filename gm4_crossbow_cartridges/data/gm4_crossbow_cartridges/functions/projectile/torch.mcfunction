#run from check_projectile
# @s = player using the crossbow

#add tag to arrow
tag @e[type=minecraft:arrow,distance=..2,limit=1,sort=nearest] add gm4_cb_torch

#add fire to arrow
data merge entity @e[type=minecraft:arrow,distance=..2,limit=1,sort=nearest] {Fire:2000s}

#take item from player
clear @s[gamemode=!creative] torch 1

#start loop to check if arrow is in ground
function gm4_crossbow_cartridges:torch/torch_loop
