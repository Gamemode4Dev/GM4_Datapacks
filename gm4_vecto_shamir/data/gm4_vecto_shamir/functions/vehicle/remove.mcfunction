#run from active
#@s = temporary minecart with no player
#at @p[tag=gm4_ml_invehicle] not in vehicle

tag @a[distance=..1] remove gm4_ml_invehicle

execute at @s run particle minecraft:cloud ~ ~ ~ .2 .2 .2 .05 20
execute at @s run playsound minecraft:entity.player.attack.nodamage neutral @a ~ ~ ~ 1 .6

kill @s
