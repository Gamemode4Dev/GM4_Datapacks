#run from check_projectile
# @s = player using the crossbow

#summon fireball at player's location
summon minecraft:small_fireball ~ ~1 ~ {Tags:["gm4_cb_proj"],power:[0.0,0.0,0.0],Motion:[0.0,0.0,0.0]}

#copy motion of arrow to fireball
#data modify entity @e[tag=gm4_cb_proj,distance=..2,limit=1] Motion set from entity @e[type=minecraft:arrow,limit=1,distance=..2] Motion
data modify entity @e[tag=gm4_cb_proj,distance=..2,limit=1] power set from entity @e[type=minecraft:arrow,limit=1,distance=..2] Motion

#clear fire charge from player
execute unless entity @s[gamemode=creative] run clear @s minecraft:fire_charge 1

#move motion of arrow to potion
function gm4_crossbow_cartridges:projectile/arrow_motion

#firecharge sound
playsound minecraft:item.firecharge.use player @a[distance=..15]
