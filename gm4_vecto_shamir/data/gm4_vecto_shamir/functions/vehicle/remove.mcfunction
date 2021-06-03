#run from vehicle/check
#@s = temporary vehicle with no player
#at @p[tag=gm4_ml_vecto_active] not in vehicle

kill @s
tag @p[tag=gm4_ml_vecto_player,distance=..1] remove gm4_ml_vecto_active

execute at @s run particle minecraft:cloud ~ ~ ~ .2 .2 .2 .05 20
execute at @s run playsound minecraft:entity.player.attack.nodamage neutral @a[distance=..15] ~ ~ ~ 1 .6
