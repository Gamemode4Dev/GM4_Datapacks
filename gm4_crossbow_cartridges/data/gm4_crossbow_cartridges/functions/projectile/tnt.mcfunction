#run from check_projectile
# @s = player using the crossbow

#add tag to arrow
tag @e[type=minecraft:arrow,distance=..2,limit=1,sort=nearest] add gm4_cb_tnt

#add fire to arrow
data merge entity @e[type=minecraft:arrow,tag=gm4_cb_tnt,distance=..2,limit=1,sort=nearest] {Fire:2000s}

#take item from player
clear @s[gamemode=!creative,gamemode=!spectator] tnt 1

#start loop to check if arrow is in ground
function gm4_crossbow_cartridges:tnt/tnt_loop

#tnt priming sound when fired
playsound minecraft:entity.tnt.primed player @a[distance=..15]

#plays explosion effect when fired

