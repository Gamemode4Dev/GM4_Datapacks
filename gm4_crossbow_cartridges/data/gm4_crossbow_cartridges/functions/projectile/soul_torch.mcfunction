#run from check_projectile
# @s = player using the crossbow

tag @s add gm4_cb_use

#add tag to arrow
tag @e[tag=gm4_cb_arrow,distance=..2,sort=nearest,limit=1] add gm4_cb_storch

#add fire to arrow
data merge entity @e[tag=gm4_cb_storch,distance=..2,sort=nearest,limit=1] {Fire:2000s}

#take item from player
clear @s[gamemode=!creative] soul_torch 1

#start loop to check if arrow is in ground
function gm4_crossbow_cartridges:soul_torch/loop
