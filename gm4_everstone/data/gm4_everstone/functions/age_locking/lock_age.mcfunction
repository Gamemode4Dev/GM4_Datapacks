# run from check
# @s = mob that will be affected by everstone, at @s

data merge entity @s[type=!#gm4_everstone:aging_mob] {Age:-2147483647}
tag @s add gm4_everstone_locked

kill @e[type=item,tag=gm4_everstone_used,distance=..1,limit=1]
particle minecraft:flash ~ ~2 ~ 0 0 0 0 20
particle minecraft:explosion ~ ~ ~ 0 0 0 0 0
playsound minecraft:entity.illusioner.cast_spell master @a[distance=..8] ~ ~ ~ 0.3 0.6
advancement grant @a[distance=..4] only gm4:everstone
