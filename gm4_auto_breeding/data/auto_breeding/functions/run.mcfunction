#@s = item dropped at animal's feet

#modify entity
effect give @e[sort=nearest,limit=1,tag=gm4_can_breed] minecraft:regeneration 5 0
data merge entity @e[sort=nearest,limit=1,tag=gm4_can_breed,nbt={InLove:0,Age:0}] {InLove:600}

#visuals
execute at @s[nbt={Item:{id:"minecraft:carrot"}}] run particle minecraft:item minecraft:carrot ~ ~.25 ~ .1 .1 .1 0 20
execute at @s[nbt={Item:{id:"minecraft:potato"}}] run particle minecraft:item minecraft:potato ~ ~.25 ~ .1 .1 .1 0 20
execute at @s[nbt={Item:{id:"minecraft:wheat_seeds"}}] run particle minecraft:item minecraft:wheat_seeds ~ ~.25 ~ .1 .1 .1 0 20
execute at @s[nbt={Item:{id:"minecraft:pumpkin_seeds"}}] run particle minecraft:item minecraft:pumpkin_seeds ~ ~.25 ~ .1 .1 .1 0 20
execute at @s[nbt={Item:{id:"minecraft:melon_seeds"}}] run particle minecraft:item minecraft:melon_seeds ~ ~.25 ~ .1 .1 .1 0 20
execute at @s[nbt={Item:{id:"minecraft:beetroot_seeds"}}] run particle minecraft:item minecraft:beetroot_seeds ~ ~.25 ~ .1 .1 .1 0 20
execute at @s[nbt={Item:{id:"minecraft:wheat"}}] run particle minecraft:item minecraft:wheat ~ ~.25 ~ .1 .1 .1 0 20
playsound minecraft:entity.generic.eat voice @a[distance=..5] ~ ~ ~ 100 .7 1

#kill item
kill @s