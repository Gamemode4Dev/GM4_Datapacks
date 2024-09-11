# @s = slime to be merged with another
# at @s
# called by merge_slimes

data merge entity @s {Size:0,DeathTime:19s,Health:0f,DeathLootTable:"minecraft:empty"}
playsound minecraft:entity.slime.squish hostile @a[distance=..15] ~ ~ ~ .5 .8
