# @s = creeper/spider to be converted into a slime
# called by event

summon slime ~ ~ ~ {Size:0}
tp @e[type=slime,limit=1,distance=0] @s
data merge entity @s {DeathTime:19s,Health:0f,DeathLootTable:"minecraft:empty"}
