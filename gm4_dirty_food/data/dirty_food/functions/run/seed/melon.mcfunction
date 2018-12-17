#@s - @e[tag=gm4_eats_seeds] if entity @e[type=minecraft:item,nbt={Item:{id:"minecraft:melon_seeds"},OnGround:1b},sort=nearest,limit=1,distance=...5]
#called by dirty_food:run_checks

#audiovisuals
execute positioned ^ ^ ^1 run particle minecraft:item minecraft:melon_seeds ~ ~.25 ~ .1 .1 .1 0 20
playsound minecraft:entity.generic.eat neutral @a[distance=..15] ~ ~ ~ 100 1.2 1
#mechanics
effect give @s minecraft:regeneration 5 0
data merge entity @s[nbt={Age:0}] {InLove:600}
#kill item
kill @e[type=minecraft:item,nbt={Item:{id:"minecraft:melon_seeds"}},sort=nearest,limit=1,distance=...5]
