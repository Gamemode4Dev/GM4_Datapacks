#run from vehicle/check
#@s = temporary vehicle with no player
#at @p[tag=gm4_vecto_active] not in vehicle

kill @e[tag=gm4_vecto_vehicle,distance=..1,sort=nearest,limit=1]
tag @s remove gm4_vecto_active

particle minecraft:cloud ~ ~ ~ .2 .2 .2 .05 20
playsound minecraft:entity.player.attack.nodamage neutral @a[distance=..15] ~ ~ ~ 1 .6
