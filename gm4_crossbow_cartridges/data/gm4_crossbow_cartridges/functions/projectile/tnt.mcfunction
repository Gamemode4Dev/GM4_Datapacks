#run from check_projectile
# @s = player using the crossbow

#summon tnt at player's location
summon minecraft:tnt ~ ~1 ~ {Tags:["gm4_cb_proj"],Fuse:80s}

#clear tnt from player
clear @s[gamemode=!creative] minecraft:tnt 1

#copy motion of arrow to tnt
function gm4_crossbow_cartridges:projectile/arrow_motion

#primed tnt sound
playsound minecraft:entity.tnt.primed block @a[distance=..15]
