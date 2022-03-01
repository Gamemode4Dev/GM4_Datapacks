# @s = temporary vehicle with no player
# at @p[tag=gm4_vecto_active] not in vehicle
# run from vehicle/check

execute at @s run particle minecraft:cloud ~ ~ ~ .2 .2 .2 .05 20
execute at @s run playsound minecraft:entity.player.attack.nodamage neutral @a[distance=..15] ~ ~ ~ 1 .6

kill @s
tag @p[tag=gm4_vecto_active] remove gm4_vecto_active
