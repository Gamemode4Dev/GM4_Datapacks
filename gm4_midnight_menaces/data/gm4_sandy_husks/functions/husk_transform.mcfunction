# @s = zombie to be converted into a husk
# called by convert

summon husk ~ ~ ~ {DeathLootTable:"gm4_sandy_husks:husk"}
tp @e[type=husk,limit=1,distance=0] @s
data merge entity @s {DeathTime:19s,Health:0f,DeathLootTable:"minecraft:empty"}
