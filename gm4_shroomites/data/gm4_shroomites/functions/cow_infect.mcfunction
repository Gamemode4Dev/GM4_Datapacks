#@s = @e[type=cow,distance=..0.5,limit=1,sort=nearest] to a spore

#turn cow into mooshroom
summon mooshroom
teleport @e[type=mooshroom,limit=1,distance=0] @s
particle mycelium ~ ~.8 ~ .4 .4 .4 0 50
playsound block.chorus_flower.grow hostile @a[distance=..10] ~ ~ ~ 0.625
particle block red_mushroom_block ~ ~1 ~ .3 .3 .3 20 20

#kill the cow
data merge entity @s {DeathTime:19s,Health:0f}
