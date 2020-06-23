execute as @e[type=minecraft:enderman,distance=..45] run data merge entity @s {carriedBlockState:{Name:air}}
data merge entity @s {Health:0.0f,DeathTime:19s}
playsound block.conduit.attack.target block @a[distance=..16] ~ ~ ~ .8 1
playsound entity.blaze.death block @a[distance=..16] ~ ~ ~ .5 1
particle minecraft:spit ~ ~ ~ .5 1 .5 1 20 force
particle minecraft:poof ~ ~ ~ .5 1 .5 0 5 force